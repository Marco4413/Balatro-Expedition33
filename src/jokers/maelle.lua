local Utils = assert(SMODS.load_file("src/utils.lua"))()

--[[ exp33_j_maelle ]] SMODS.Atlas {
  key  = "j_maelle",
  path = "jokers/maelle.png",
  px = 71, py = 95,
}

--[[ exp33_j_maelle_icons ]] SMODS.Atlas {
  key  = "j_maelle_icons",
  path = "jokers/maelle/icons.png",
  px = 84, py = 84,
}

---@alias MaelleStanceId "defensive"|"offensive"|"virtuose"

---@class MaelleStance
---@field id MaelleStanceId
---@field sprite_pos table
---@field colour table
---@field required_stance MaelleStanceId|nil
---@field hands PokerHands[]
---@field xmult number|nil
---@field xchips number|nil
---@field dollars_on_discard number|nil

---@type MaelleStance[]|table<MaelleStanceId, MaelleStance>
local MAELLE_STANCE_ = {
  {
    id         = "defensive",
    sprite_pos = { x = 0, y = 0 },
    colour     = HEX("61A4EC"),
    hands      = { "Pair", "Two Pair", "Flush" },
    xchips     = 1.25,
  },
  {
    id         = "offensive",
    sprite_pos = { x = 1, y = 0 },
    colour     = HEX("EA3835"),
    hands      = { "Three of a Kind", "Four of a Kind", "Five of a Kind" },
    xmult      = 1.75,
    dollars_on_discard = -3,
  },
  {
    id         = "virtuose",
    sprite_pos = { x = 2, y = 0 },
    colour     = HEX("C43CB8"),
    hands      = { "Straight", "Full House", "Straight Flush", "Flush House", "Flush Five" },
    xmult      = 2,
  },
}

---@type table<PokerHands, MaelleStance>
local POKER_HAND_TO_STANCE = {}

for i=1, #MAELLE_STANCE_ do
  local stance = MAELLE_STANCE_[i]

  assert(not MAELLE_STANCE_[stance.id])
  MAELLE_STANCE_[stance.id] = stance

  for _, poker_hand in next, stance.hands do
    assert(not POKER_HAND_TO_STANCE[poker_hand])
    POKER_HAND_TO_STANCE[poker_hand] = stance
  end
end

local MAELLE_STANCELESS_SPRITE_POS = { x = 3, y = 0 }
local MAELLE_STANCELESS_COLOUR = HEX("858585")

local ui_def_create_UIBox_current_hand_row = create_UIBox_current_hand_row
---@param hand_name PokerHands
---@param ... any
---@return table|nil
function create_UIBox_current_hand_row(hand_name, ...)
  local hand_row = ui_def_create_UIBox_current_hand_row(hand_name, ...)
  if not hand_row then return nil; end

  local PADDING = 0.1
  local SPRITE_SCALE = 0.4
  local stance = POKER_HAND_TO_STANCE[hand_name]
  local stance_sprite_pos = stance and stance.sprite_pos or MAELLE_STANCELESS_SPRITE_POS
  local stance_icon = SMODS.create_sprite(0, 0, SPRITE_SCALE, SPRITE_SCALE, "exp33_j_maelle_icons", stance_sprite_pos)
  table.insert(hand_row.nodes, 1, {n=G.UIT.C, config={align = "cm", padding = PADDING, colour = G.C.CLEAR}, nodes={
    {n=G.UIT.O, config={object = stance_icon}}
  }})

  return hand_row
end

local function get_sign(n)
  return (n < 0 and -1) or (n > 0 and 1) or (0)
end

--[[ exp33_maelle ]] SMODS.JimboQuip {
  key = "maelle",
  extra = {
    center = "j_exp33_maelle",
  },
  filter = function (self, quip_type)
    if not self.mod.config.enable_quips then return false; end
    if not next(SMODS.find_card(self.extra.center)) then return false; end
    self.extra.text_key = table.concat({self.key, quip_type}, "_")
    self.extra.particle_colours = Utils.pick_unique_random(
        MAELLE_STANCE_, 3,
        function (damage) return damage.colour; end
      )
    return true, { weight = 10 }
  end,
}

--[[ j_exp33_maelle ]] SMODS.Joker {
  key   = "maelle",
  atlas = "j_maelle",
  pos   = MAELLE_STANCELESS_SPRITE_POS,

  rarity = 2,
  cost   = 6,

  discovered    = true,
  unlocked      = true,
  no_collection = false,
  config = {
    extra = {
      stance_id = nil,
      display_stance_id = nil,
    },
  },

  loc_vars = function (self, info_queue, card)
    local loc = {
      vars = {
        colours = {}
      }
    }

    table.insert(loc.vars.colours, MAELLE_STANCELESS_COLOUR)
    table.insert(loc.vars, localize("exp33_maelle_stance_stanceless"))

    for i=1, #MAELLE_STANCE_ do
      local stance = MAELLE_STANCE_[i]
      table.insert(loc.vars.colours, stance.colour)
      table.insert(loc.vars, localize("exp33_maelle_stance_" .. stance.id))
      if stance.required_stance then
        local required_stance = MAELLE_STANCE_[stance.required_stance]
        table.insert(loc.vars.colours, required_stance.colour)
        table.insert(loc.vars, localize("exp33_maelle_stance_" .. required_stance.id))
      end
      table.insert(loc.vars, stance.xmult)
      table.insert(loc.vars, stance.xchips)
      local dollars_on_discard = stance.dollars_on_discard
      if dollars_on_discard then
        if dollars_on_discard < 0 then
          table.insert(loc.vars.colours, G.C.RED)
          table.insert(loc.vars, "-")
        else
          table.insert(loc.vars.colours, G.C.MONEY)
          table.insert(loc.vars, "+")
        end
        table.insert(loc.vars, math.abs(dollars_on_discard))
      end
    end

    local display_stance_id = card.ability.extra.display_stance_id
    if not display_stance_id then
      table.insert(loc.vars.colours, MAELLE_STANCELESS_COLOUR)
      table.insert(loc.vars, localize("exp33_maelle_stance_stanceless"))
    else
      local stance = MAELLE_STANCE_[display_stance_id]
      table.insert(loc.vars.colours, stance.colour)
      table.insert(loc.vars, localize("exp33_maelle_stance_" .. stance.id))
    end

    return loc
  end,

  load = function (self, card, card_table, other_card)
    -- sync display with current values
    card_table.ability.extra.display_stance_id = card_table.ability.extra.stance_id
  end,

  calculate = function (self, card, context)
    if context.blind_defeated then
      return self:calculate_stance_reset(card)
    end

    if context.joker_main then
      return self:calculate_stance_main(card)
    end

    if context.pre_discard then
      return self:calculate_stance_discard(card)
    end

    if context.after then
      return self:calculate_next_stance(card, context.scoring_name)
    end
  end,

  draw = function (self, card, layer)
    if layer ~= "card" and layer ~= "both" then return; end
    self:update_sprite(card)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  update_sprite = function (self, card)
    local display_stance_id = card.ability.extra.display_stance_id
    if not display_stance_id then
      card.children.center:set_sprite_pos(MAELLE_STANCELESS_SPRITE_POS)
    else
      local display_stance = MAELLE_STANCE_[display_stance_id]
      card.children.center:set_sprite_pos(display_stance.sprite_pos)
    end
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table calc
  calculate_stance_reset = function (self, card)
    card.ability.extra.stance_id = nil
    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_stance_id = nil
            card:flip()
            card:flip()
            return true
          end
        })
      end,
      message = localize("exp33_maelle_stance_reset"),
      effect  = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param poker_hand PokerHands
  ---@return table|nil calc
  calculate_next_stance = function (self, card, poker_hand)
    local next_stance = POKER_HAND_TO_STANCE[poker_hand]
    local curr_stance_id = card.ability.extra.stance_id
    if not next_stance or curr_stance_id == next_stance.id or (next_stance.required_stance and curr_stance_id ~= next_stance.required_stance) then
      -- already stanceless
      if not curr_stance_id then return nil; end
      -- set stanceless
      card.ability.extra.stance_id = nil
      return {
        func = function ()
          G.E_MANAGER:add_event(Event{
            func = function ()
              card.ability.extra.display_stance_id = nil
              card:flip()
              card:flip()
              return true
            end
          })
        end,
        message = localize("exp33_maelle_stance_stanceless"),
        effect  = true,
      }
    end

    card.ability.extra.stance_id = next_stance.id
    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_stance_id = next_stance.id
            card:flip()
            card:flip()
            return true
          end
        })
      end,
      message = localize("exp33_maelle_stance_" .. next_stance.id),
      effect  = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_stance_main = function (self, card)
    local stance_id = card.ability.extra.stance_id
    if not stance_id then return nil; end

    local stance = MAELLE_STANCE_[stance_id]
    return {
      xmult  = stance.xmult,
      xchips = stance.xchips,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_stance_discard = function (self, card)
    local stance_id = card.ability.extra.stance_id
    if not stance_id then return nil; end

    local stance = MAELLE_STANCE_[stance_id]
    local dollars_on_discard = stance.dollars_on_discard
    if not dollars_on_discard then return nil; end

    local new_dollars = math.max(G.GAME.bankrupt_at, G.GAME.dollars + dollars_on_discard)
    local dollars_diff = new_dollars - G.GAME.dollars
    if dollars_diff == 0 or get_sign(dollars_diff) ~= get_sign(dollars_on_discard) then return nil; end

    return { dollars = dollars_diff }
  end,
}
