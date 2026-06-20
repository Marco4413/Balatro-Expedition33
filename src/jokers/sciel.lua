local Utils = assert(SMODS.load_file("src/utils.lua"))()

--[[ exp33_j_sciel ]] SMODS.Atlas {
  key  = "j_sciel",
  path = "jokers/sciel.png",
  px = 71, py = 95,
}

---@alias ScielChargeId "sun"|"moon"

---@class ScielCharge
---@field id ScielChargeId
---@field sprite_pos table
---@field colour table
---@field suits Suits[]

---@type ScielCharge[]|table<ScielChargeId, ScielCharge>
local SCIEL_CHARGE_ = {
  {
    id         = "sun",
    sprite_pos = { x = 1, y = 0 },
    colour     = HEX("EAC139"),
    suits      = { "Hearts", "Diamonds" },
  },
  {
    id         = "moon",
    sprite_pos = { x = 2, y = 0 },
    colour     = HEX("56A6CB"),
    suits      = { "Clubs", "Spades" },
  },
}

local CARD_SUIT_TO_CHARGE = {}

for i=1, #SCIEL_CHARGE_ do
  local charge = SCIEL_CHARGE_[i]

  assert(not SCIEL_CHARGE_[charge.id])
  SCIEL_CHARGE_[charge.id] = charge

  for _, suit in next, charge.suits do
    assert(not CARD_SUIT_TO_CHARGE[suit])
    CARD_SUIT_TO_CHARGE[suit] = charge
  end
end


local SCIEL_BASE_SPRITE_POS         = { x = 0, y = 0 }
local SCIEL_BOTH_CHARGES_SPRITE_POS = { x = 3, y = 0 }
local SCIEL_TWILIGHT = {
  sprite_pos = { x = 4, y = 0 },
  add_xmult  = 0.2,
  colour     = HEX("983ECB"),
  turns      = 2,
}

--[[ exp33_sciel ]] SMODS.JimboQuip {
  key = "sciel",
  extra = {
    center = "j_exp33_sciel",
  },
  filter = function (self, quip_type)
    if not self.mod.config.enable_quips then return false; end
    if not next(SMODS.find_card(self.extra.center)) then return false; end
    self.extra.text_key = table.concat({self.key, quip_type}, "_")
    self.extra.particle_colours = Utils.pick_unique_random(
        SCIEL_CHARGE_, 3,
        function (damage) return damage.colour; end
      )
    return true, { weight = 10 }
  end,
}

--[[ j_exp33_sciel ]] SMODS.Joker {
  key   = "sciel",
  atlas = "j_sciel",
  pos   = SCIEL_BASE_SPRITE_POS,

  rarity = 2,
  cost   = 6,

  blueprint_compat = true,

  discovered    = true,
  unlocked      = true,
  no_collection = false,
  config = {
    extra = {
      sun_charges  = 0,
      moon_charges = 0,
      twilight_remaining = 0,

      display_sun_charges  = 0,
      display_moon_charges = 0,
      display_twilight_remaining = 0,
    },
  },

  loc_vars = function (self, info_queue, card)
    local loc = {
      vars = {
        colours = {}
      }
    }

    local display_twilight_remaining = card.ability.extra.display_twilight_remaining
    local twilight_xmult = 1

    for i=1, #SCIEL_CHARGE_ do
      local charge = SCIEL_CHARGE_[i]
      table.insert(loc.vars.colours, charge.colour)
      table.insert(loc.vars, localize("exp33_sciel_charge_" .. charge.id))

      for j=1, #charge.suits do
        local suit = charge.suits[j]
        table.insert(loc.vars.colours, G.C.SUITS[suit])
        table.insert(loc.vars, localize(suit, "suits_plural"))
      end

      local display_charge_count = card.ability.extra["display_" .. charge.id .. "_charges"]
      twilight_xmult = twilight_xmult + SCIEL_TWILIGHT.add_xmult * display_charge_count
      if display_twilight_remaining > 0 then
        table.insert(loc.vars.colours, SCIEL_TWILIGHT.colour)
      elseif display_charge_count > 0 then
        table.insert(loc.vars.colours, charge.colour)
      else
        table.insert(loc.vars.colours, G.C.UI.TEXT_INACTIVE)
      end
      table.insert(loc.vars, display_charge_count)
    end

    table.insert(loc.vars.colours, SCIEL_TWILIGHT.colour)
    table.insert(loc.vars, localize("exp33_sciel_twilight"))
    table.insert(loc.vars, SCIEL_TWILIGHT.add_xmult)
    table.insert(loc.vars, SCIEL_TWILIGHT.turns)

    if display_twilight_remaining > 0 then
      table.insert(loc.vars.colours, SCIEL_TWILIGHT.colour)
    else
      table.insert(loc.vars.colours, G.C.UI.TEXT_INACTIVE)
    end
    table.insert(loc.vars, display_twilight_remaining)
    table.insert(loc.vars, twilight_xmult)

    return loc
  end,

  load = function (self, card, card_table, other_card)
    -- sync display with current values
    card_table.ability.extra.display_sun_charges        = card_table.ability.extra.sun_charges
    card_table.ability.extra.display_moon_charges       = card_table.ability.extra.moon_charges
    card_table.ability.extra.display_twilight_remaining = card_table.ability.extra.twilight_remaining
  end,

  calculate = function (self, card, context)
    if context.joker_main then
      local calc = self:calculate_twilight_boost(card)
      if context.blueprint then return calc; end

      local calc_turn = self:calculate_twilight_turn(card)
      if not calc then return calc_turn; end

      calc.func = calc_turn and calc_turn.func or nil
      return calc
    end

    if context.blueprint then return nil; end

    if context.blind_defeated then
      return self:calculate_reset(card)
    end

    if context.individual and context.cardarea == G.play then
      local charge = CARD_SUIT_TO_CHARGE[context.other_card.base.suit]
      if not charge then return nil; end
      return self:calculate_increase_charges(card, charge.id)
    end

    if context.after then
      return self:calculate_twilight_activation(card)
    end
  end,

  draw = function (self, card, layer)
    if layer ~= "card" and layer ~= "both" then return; end
    self:update_sprite(card)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  update_sprite = function (self, card)
    if card.ability.extra.display_twilight_remaining > 0 then
      card.children.center:set_sprite_pos(SCIEL_TWILIGHT.sprite_pos)
    elseif card.ability.extra.display_sun_charges > 0 and card.ability.extra.display_moon_charges > 0 then
      card.children.center:set_sprite_pos(SCIEL_BOTH_CHARGES_SPRITE_POS)
    elseif card.ability.extra.display_moon_charges > 0 then
      card.children.center:set_sprite_pos(SCIEL_CHARGE_["moon"].sprite_pos)
    elseif card.ability.extra.display_sun_charges > 0 then
      card.children.center:set_sprite_pos(SCIEL_CHARGE_["sun"].sprite_pos)
    else
      card.children.center:set_sprite_pos(SCIEL_BASE_SPRITE_POS)
    end
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table calc
  calculate_reset = function (self, card)
    card.ability.extra.sun_charges  = 0
    card.ability.extra.moon_charges = 0
    card.ability.extra.twilight_remaining = 0
    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_sun_charges  = 0
            card.ability.extra.display_moon_charges = 0
            card.ability.extra.display_twilight_remaining = 0
            card:flip()
            card:flip()
            return true
          end
        })
      end,
      message = localize("exp33_sciel_reset"),
      effect  = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param charge_id ScielChargeId
  ---@return table|nil calc
  calculate_increase_charges = function (self, card, charge_id)
    -- cannot generate charges
    if card.ability.extra.twilight_remaining > 0 then
      return nil
    end

    local charge_key  = charge_id .. "_charges"
    local old_charges = card.ability.extra[charge_key]
    local new_charges = old_charges + 1
    card.ability.extra[charge_key] = new_charges

    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra["display_" .. charge_key] = new_charges
            if old_charges <= 0 and new_charges > 0 then
              card:flip()
              card:flip()
            end
            return true
          end
        })
      end,
      message = localize{
        type = "variable",
        key  = "exp33_sciel_charge_increase",
        vars = { 1, localize("exp33_sciel_charge_" .. charge_id) }
      },
      effect  = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_twilight_turn = function (self, card)
    if card.ability.extra.twilight_remaining <= 0 then
      return nil
    end

    local new_twilight_remaining = card.ability.extra.twilight_remaining - 1
    card.ability.extra.twilight_remaining = new_twilight_remaining
    if new_twilight_remaining <= 0 then
      card.ability.extra.sun_charges  = 0
      card.ability.extra.moon_charges = 0
    end

    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_twilight_remaining = new_twilight_remaining
            if new_twilight_remaining <= 0 then
              card.ability.extra.display_sun_charges  = 0
              card.ability.extra.display_moon_charges = 0
              card:flip()
              card:flip()
            end
            return true
          end
        })
      end,
      effect = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_twilight_boost = function (self, card)
    if card.ability.extra.twilight_remaining <= 0 then
      return nil
    end

    local twilight_xmult = 1
    for i=1, #SCIEL_CHARGE_ do
      local charge = SCIEL_CHARGE_[i]
      local charge_count = card.ability.extra[charge.id .. "_charges"]
      twilight_xmult = twilight_xmult + SCIEL_TWILIGHT.add_xmult * charge_count
    end

    return { xmult = twilight_xmult }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_twilight_activation = function (self, card)
    -- Twilight still active
    if card.ability.extra.twilight_remaining > 0 then return nil; end
    if card.ability.extra.sun_charges  <= 0 then return nil; end
    if card.ability.extra.moon_charges <= 0 then return nil; end

    local twilight_remaining = SCIEL_TWILIGHT.turns
    card.ability.extra.twilight_remaining = twilight_remaining

    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_twilight_remaining = twilight_remaining
            card:flip()
            card:flip()
            return true
          end
        })
      end,
      message = localize("exp33_sciel_twilight_started"),
      effect  = true,
    }
  end,
}
