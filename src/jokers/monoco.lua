--[[ exp33_j_monoco ]] SMODS.Atlas {
  key  = "j_monoco",
  path = "jokers/monoco.png",
  px = 71, py = 95,
}

--[[ exp33_j_monoco_icons ]] SMODS.Atlas {
  key  = "j_monoco_icons",
  path = "jokers/monoco/icons.png",
  px = 31, py = 31,
}

---@alias MonocoMaskId
---| "almighty"
---| "caster"
---| "agile"
---| "balanced"
---| "heavy"

---@alias MonocoMaskCalculateFn fun(self: MonocoMask, context: CalcContext, calc: table)

---@class MonocoMask
---@field id MonocoMaskId
---@field sprite_pos table
---@field colour table
---@field next MonocoMaskId
---@field boosts PokerHands[]
---@field calculate MonocoMaskCalculateFn

---@type MonocoMaskId
local MONOCO_MASK_INIT = "caster"

---@param self MonocoMask
---@param context CalcContext
---@return boolean
local function monoco_mask_applies_boost(self, context)
  for _, poker_hand in next, self.boosts do
    if context.scoring_name == poker_hand then
      return true
    end
  end
  return false
end

---@param xmult number
---@return MonocoMaskCalculateFn
local function create_default_monoco_mask_calculate(xmult)
  return function (self, context, calc)
    if monoco_mask_applies_boost(self, context) then
      calc.effect = true
      calc.xmult  = xmult
    end
  end
end

local MONOCO_MASK_DEFAULT_XMULT  = 1.5
local MONOCO_MASK_ALMIGHTY_XMULT = 2.0
local MONOCO_MASK_CALCULATE_DEFAULT = create_default_monoco_mask_calculate(MONOCO_MASK_DEFAULT_XMULT)

---@type table<MonocoMaskId, MonocoMask>
local MONOCO_MASK_ = {
  ["almighty"] = {
    id         = "almighty",
    sprite_pos = { x = 0, y = 0 },
    colour     = HEX("DDCC13"),
    next       = "caster",
    boosts     = { "Flush Five", "Flush House" },
    calculate  = function (self, context, calc)
      calc.effect = true
      calc.xmult  = (monoco_mask_applies_boost(self, context)
          and MONOCO_MASK_ALMIGHTY_XMULT or MONOCO_MASK_DEFAULT_XMULT)
    end,
  },
  ["caster"] = {
    id         = "caster",
    sprite_pos = { x = 1, y = 0 },
    colour     = HEX("4157F6"),
    next       = "agile",
    boosts     = { "Three of a Kind", "Four of a Kind", "Straight" },
    calculate  = MONOCO_MASK_CALCULATE_DEFAULT,
  },
  ["agile"] = {
    id         = "agile",
    sprite_pos = { x = 2, y = 0 },
    colour     = HEX("C61FDE"),
    next       = "balanced",
    boosts     = { "High Card", "Flush" },
    calculate  = MONOCO_MASK_CALCULATE_DEFAULT,
  },
  ["balanced"] = {
    id         = "balanced",
    sprite_pos = { x = 3, y = 0 },
    colour     = HEX("B60202"),
    next       = "heavy",
    boosts     = { "Pair", "Two Pair" },
    calculate  = MONOCO_MASK_CALCULATE_DEFAULT,
  },
  ["heavy"] = {
    id         = "heavy",
    sprite_pos = { x = 4, y = 0 },
    colour     = HEX("6FF134"),
    next       = "almighty",
    boosts     = { "Full House", "Straight Flush", "Five of a Kind" },
    calculate  = MONOCO_MASK_CALCULATE_DEFAULT,
  },
}

---@type table<PokerHands, MonocoMask>
local POKER_HAND_TO_MASK = {}

local MONOCO_MASKS_COUNT = 0
for mask_id, mask in next, MONOCO_MASK_ do
  assert(mask_id == mask.id)
  for _, boosted in next, mask.boosts do
    assert(POKER_HAND_TO_MASK[boosted] == nil)
    POKER_HAND_TO_MASK[boosted] = mask
  end

  MONOCO_MASKS_COUNT = MONOCO_MASKS_COUNT + 1
end

local ui_def_create_UIBox_current_hand_row = create_UIBox_current_hand_row
---@param hand_name PokerHands
---@param ... any
---@return table|nil
function create_UIBox_current_hand_row(hand_name, ...)
  local hand_row = ui_def_create_UIBox_current_hand_row(hand_name, ...)
  if not hand_row then return nil; end

  local mask = POKER_HAND_TO_MASK[hand_name]
  if mask then
    local mask_icon = SMODS.create_sprite(0, 0, 0.4, 0.4, "exp33_j_monoco_icons", mask.sprite_pos)
    table.insert(hand_row.nodes, 1, {n=G.UIT.C, config={align = "cm", padding = 0.1, colour = G.C.CLEAR}, nodes={
      {n=G.UIT.O, config={object = mask_icon}}
    }})
  end

  return hand_row
end

--[[ j_exp33_monoco ]] SMODS.Joker {
  key   = "monoco",
  atlas = "j_monoco",
  pos   = MONOCO_MASK_[MONOCO_MASK_INIT].sprite_pos,

  discovered    = true,
  unlocked      = true,
  no_collection = false,
  config = {
    extra = {
      ---@type MonocoMaskId
      mask_id = MONOCO_MASK_INIT,
      ---@type MonocoMaskId
      display_mask_id = MONOCO_MASK_INIT,
    },
  },

  loc_vars = function (self, info_queue, card)
    local loc = {
      vars = {
        colours = {}
      }
    }

    do
      local mask = MONOCO_MASK_[MONOCO_MASK_INIT]
      repeat
        table.insert(loc.vars, localize("exp33_monoco_mask_" .. mask.id))
        table.insert(loc.vars.colours, mask.colour)
        mask = MONOCO_MASK_[mask.next]
      until mask.id == MONOCO_MASK_INIT
    end

    local display_mask = MONOCO_MASK_[card.ability.extra.display_mask_id]
    table.insert(loc.vars, localize("exp33_monoco_mask_" .. display_mask.id))
    table.insert(loc.vars.colours, display_mask.colour)

    table.insert(loc.vars, MONOCO_MASK_DEFAULT_XMULT)
    table.insert(loc.vars, MONOCO_MASK_ALMIGHTY_XMULT)

    return loc
  end,

  load = function (self, card, card_table, other_card)
    -- sync display with current values
    card_table.ability.extra.display_mask_id = card_table.ability.extra.mask_id
  end,

  calculate = function (self, card, context)
    if context.final_scoring_step then
      if #context.scoring_hand <= 0 then return nil; end

      local left_most_card = context.scoring_hand[1]
      local card_value = left_most_card.base.nominal
      return self:calculate_wheel_spin(card, card_value)
    end

    if context.joker_main then
      return self:calculate_mask(card, context)
    end

    --[[ if context.individual and context.cardarea == G.play then
      if #context.scoring_hand <= 0 then return nil; end

      local left_most_card = context.scoring_hand[1]
      if context.other_card ~= left_most_card then return nil; end

      local card_value = left_most_card.base.nominal
      return self:calculate_wheel_spin(card, card_value)
    end ]]
  end,

  draw = function (self, card, layer)
    if layer ~= "card" and layer ~= "both" then return; end
    self:update_sprite(card)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  update_sprite = function (self, card)
    ---@type MonocoMaskId
    local display_mask_id = card.ability.extra.display_mask_id
    card.children.center:set_sprite_pos(MONOCO_MASK_[display_mask_id].sprite_pos)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param context CalcContext
  ---@return table|nil calc
  calculate_mask = function (self, card, context)
    ---@type MonocoMaskId
    local mask_id = card.ability.extra.mask_id
    local calc = { effect = false }

    local mask = MONOCO_MASK_[mask_id]
    mask:calculate(context, calc)

    if not calc.effect then return nil; end
    calc.message = localize("exp33_monoco_mask_" .. mask_id)

    return calc
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param spin_amount number
  ---@return table calc
  calculate_wheel_spin = function (self, card, spin_amount)
    -- apparently the modulus operator handles negative numbers as
    --   (b - math.abs(a) % b)
    -- which is exactly what we want
    local actual_spin_amount = spin_amount % MONOCO_MASKS_COUNT
    ---@type MonocoMaskId
    local mask_id = card.ability.extra.mask_id
    for i=1, actual_spin_amount do
      mask_id = MONOCO_MASK_[mask_id].next
    end
    card.ability.extra.mask_id = mask_id

    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_mask_id = mask_id
            card:flip()
            card:flip()
            return true
          end
        })
      end,
      message = localize{
        type = "variable",
        key  = "exp33_monoco_wheel_spin",
        vars = { spin_amount }
      },
      effect = true,
    }
  end,
}
