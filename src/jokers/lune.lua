--[[ exp33_j_lune ]] SMODS.Atlas {
  key  = "j_lune",
  path = "jokers/lune.png",
  px = 71, py = 95,
}

---@alias LuneStainId "ice"|"fire"|"lightning"|"earth"|"light"

---@class LuneStain
---@field id LuneStainId
---@field sprite_pos table
---@field add_xchips number
---@field colour table
---@field suit Suit|nil

local LUNE_MAX_STAINS = 4

---@type table<LuneStainId, LuneStain>
local LUNE_STAIN_ = {
  ["ice"] = {
    id         = "ice",
    sprite_pos = {
      left   = { x = 0, y = 1 },
      top    = { x = 1, y = 1 },
      right  = { x = 2, y = 1 },
      bottom = { x = 3, y = 1 },
    },
    add_xchips = 1 / LUNE_MAX_STAINS,
    colour     = HEX("27B5E0"),
    suit       = "Diamonds",
  },
  ["fire"] = {
    id         = "fire",
    sprite_pos = {
      left   = { x = 0, y = 2 },
      top    = { x = 1, y = 2 },
      right  = { x = 2, y = 2 },
      bottom = { x = 3, y = 2 },
    },
    add_xchips = 1 / LUNE_MAX_STAINS,
    colour     = HEX("E02727"),
    suit       = "Hearts",
  },
  ["lightning"] = {
    id         = "lightning",
    sprite_pos = {
      left   = { x = 0, y = 3 },
      top    = { x = 1, y = 3 },
      right  = { x = 2, y = 3 },
      bottom = { x = 3, y = 3 },
    },
    add_xchips = 1 / LUNE_MAX_STAINS,
    colour     = HEX("E0D727"),
    suit       = "Spades",
  },
  ["earth"] = {
    id         = "earth",
    sprite_pos = {
      left   = { x = 0, y = 4 },
      top    = { x = 1, y = 4 },
      right  = { x = 2, y = 4 },
      bottom = { x = 3, y = 4 },
    },
    add_xchips = 1 / LUNE_MAX_STAINS,
    colour     = HEX("27E031"),
    suit       = "Clubs",
  },
  ["light"] = {
    id         = "light",
    sprite_pos = {
      left   = { x = 0, y = 5 },
      top    = { x = 1, y = 5 },
      right  = { x = 2, y = 5 },
      bottom = { x = 3, y = 5 },
    },
    add_xchips = (1 / LUNE_MAX_STAINS) * 2,
    colour     = HEX("969B97"),
  },
}

---@type table<Suit, LuneStain>
local CARD_SUIT_TO_STAIN = {}

for stain_id, stain in next, LUNE_STAIN_ do
  assert(stain_id == stain.id)
  if stain.suit then
    assert(CARD_SUIT_TO_STAIN[stain.suit] == nil)
    CARD_SUIT_TO_STAIN[stain.suit] = stain
  end
end

---@param stains LuneStainId[]
---@param new_stain_id LuneStainId
---@return LuneStainId|nil out_stain_id
local function lune_cycle_stains(stains, new_stain_id)
  table.insert(stains, 1, new_stain_id)
  local out_stain_id = nil
  while #stains > LUNE_MAX_STAINS do
    out_stain_id = table.remove(stains)
  end
  return out_stain_id
end

---@param stains LuneStainId[]
---@return table<LuneStainId, number>
local function lune_count_stains(stains)
  local stains_count = {}

  for _, stain in next, LUNE_STAIN_ do
    stains_count[stain.id] = 0
  end

  for _, stain_id in next, stains do
    stains_count[stain_id] = stains_count[stain_id] + 1
  end

  return stains_count
end

---@param stains LuneStainId[]
---@param stains_count table<LuneStainId, number>|nil will be updated depending on what stains are consumed
---@return LuneStain|nil
local function lune_try_generate_light_stain(stains, stains_count)
  stains_count = stains_count or lune_count_stains(stains)

  ---@type table<LuneStainId, any>
  local light_stain_requirements = {
    ["ice"]       = true,
    ["fire"]      = true,
    ["lightning"] = true,
    ["earth"]     = true,
  }

  for stain_id, is_required in next, light_stain_requirements do
    if is_required then
      local stain_count = stains_count[stain_id] or 0
      if stain_count < 1 then
        return nil
      end
    end
  end

  for i=#stains, 1, -1 do
    local stain_id = stains[i]
    if light_stain_requirements[stain_id] then
      table.remove(stains, i)
      light_stain_requirements[stain_id] = false
      stains_count[stain_id] = stains_count[stain_id] - 1
    end
  end

  return LUNE_STAIN_["light"]
end

local SHARED_STAIN_SPRITE
---@return Sprite
local function get_or_create_shared_stain_sprite()
  if SHARED_STAIN_SPRITE then return SHARED_STAIN_SPRITE; end
  SHARED_STAIN_SPRITE = SMODS.create_sprite(0, 0, 0, 0, "exp33_j_lune", { x = 1, y = 0 })
  return SHARED_STAIN_SPRITE
end

--[[ j_exp33_lune ]] SMODS.Joker {
  key   = "lune",
  atlas = "j_lune",
  pos   = { x = 0, y = 0 },

  discovered    = true,
  unlocked      = true,
  no_collection = false,
  config = {
    extra = {
      stains = {},
      display_stains = {},
    },
  },

  loc_vars = function (self, info_queue, card)
    local loc = {
      vars = {
        colours = {}
      }
    }

    local STAIN_IDS = { "ice", "fire", "lightning", "earth", "light" }
    for i=1, #STAIN_IDS do
      local stain = LUNE_STAIN_[STAIN_IDS[i]]
      if stain.suit then
        table.insert(loc.vars.colours, G.C.SUITS[stain.suit])
        table.insert(loc.vars, localize(stain.suit, "suits_plural"))
      end

      table.insert(loc.vars.colours, stain.colour)
      table.insert(loc.vars, localize("exp33_lune_stain_" .. stain.id))
      table.insert(loc.vars, stain.add_xchips)
    end

    return loc
  end,

  load = function (self, card, card_table, other_card)
    -- sync display with current values
    local stains = card_table.ability.extra.stains
    local display_stains = {}
    for i=1, #stains do
      table.insert(display_stains, stains[i])
    end
    card_table.ability.extra.display_stains = display_stains
  end,

  calculate = function (self, card, context)
    if context.blind_defeated then
      return self:calculate_reset_stains(card)
    end

    if context.individual and context.cardarea == G.play then
      return self:calculate_stain(card, context.other_card.base.suit)
    end
  end,

  draw = function (self, card, layer)
    if layer ~= "card" and layer ~= "both" then return; end

    if card.facing == "front" then
      local stain_sprite_directions = { "left", "top", "right", "bottom" }

      local shared_stain_sprite = get_or_create_shared_stain_sprite()
      shared_stain_sprite:set_role{ major = card, role_type = "Glued", draw_major = card }
      shared_stain_sprite:glue_to_major(card)

      for i=1, #stain_sprite_directions do
        local display_stain_id = card.ability.extra.display_stains[i]
        if display_stain_id then
          local display_stain = LUNE_STAIN_[display_stain_id]
          local stain_sprite_direction = stain_sprite_directions[i]
          shared_stain_sprite:set_sprite_pos(display_stain.sprite_pos[stain_sprite_direction])
          shared_stain_sprite:draw_shader(
              "dissolve",
              nil, shared_stain_sprite.ARGS.send_to_shader, nil,
              card.children.center
            )
        end
      end
    end
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table calc
  calculate_reset_stains = function (self, card)
    card.ability.extra.stains = {}
    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_stains = {}
            card:flip()
            card:flip()
            return true
          end
        })
      end,
      message = localize("exp33_lune_stain_reset"),
      effect  = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param suit Suit
  ---@return table|nil calc
  calculate_stain = function (self, card, suit)
    local stains       = card.ability.extra.stains
    local stains_count = lune_count_stains(stains)

    local add_xchips = 1
    for stain_id, stain_count in next, stains_count do
      local stain = LUNE_STAIN_[stain_id]
      if stain_count >= 1 and (not stain.suit or stain.suit == suit) then
        add_xchips = add_xchips + (stain_count * stain.add_xchips)
      end
    end

    local calc = nil
    local stain = lune_try_generate_light_stain(stains, stains_count) or CARD_SUIT_TO_STAIN[suit]
    if stain then
      lune_cycle_stains(stains, stain.id)

      calc = {
        func = function ()
          G.E_MANAGER:add_event(Event{
            func = function ()
              local display_stains = card.ability.extra.display_stains
              lune_try_generate_light_stain(display_stains)
              lune_cycle_stains(display_stains, stain.id)
              return true
            end
          })
        end,
        effect = true,
      }

      if add_xchips <= 1 then
        calc.message = localize{
          type = "variable",
          key  = "exp33_lune_got_stain",
          vars = { localize("exp33_lune_stain_" .. stain.id) },
        }
      end
    end

    if add_xchips > 1 then
      calc = calc or {}
      calc.xchips = add_xchips
    end

    return calc
  end,
}
