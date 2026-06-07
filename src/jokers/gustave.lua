--[[ exp33_j_gustave ]] SMODS.Atlas {
  key  = "j_gustave",
  path = "jokers/gustave.png",
  px = 71, py = 95,
}

local GUSTAVE_DAMAGE_ = {
  { id = "low",     sprite_pos = { x = 0, y = 0 }, xmult = 1.1, colour = HEX("CAAF38"), low = 0,  high = 3  },
  { id = "medium",  sprite_pos = { x = 1, y = 0 }, xmult = 1.3, colour = HEX("5DCDCD"), low = 4,  high = 6  },
  { id = "high",    sprite_pos = { x = 2, y = 0 }, xmult = 1.6, colour = HEX("7B27A1"), low = 7,  high = 9  },
  { id = "extreme", sprite_pos = { x = 3, y = 0 }, xmult = 2.0, colour = HEX("D2205C"), low = 10, high = 10 },
}

GUSTAVE_DAMAGE_.LOWEST  = GUSTAVE_DAMAGE_[1]
GUSTAVE_DAMAGE_.HIGHEST = GUSTAVE_DAMAGE_[#GUSTAVE_DAMAGE_]

for i=2, #GUSTAVE_DAMAGE_ do
  local prev_damage = GUSTAVE_DAMAGE_[i-1]
  local curr_damage = GUSTAVE_DAMAGE_[i]
  -- ensure no gaps
  assert(prev_damage.high+1 == curr_damage.low)
end

local function get_gustave_charges_damage(charges)
  local damage = GUSTAVE_DAMAGE_[1]
  for i=1, #GUSTAVE_DAMAGE_ do
    if charges < GUSTAVE_DAMAGE_[i].low then
      break
    end
    damage = GUSTAVE_DAMAGE_[i]
  end
  return damage
end

--[[ j_exp33_gustave ]] SMODS.Joker {
  key   = "gustave",
  atlas = "j_gustave",
  pos   = GUSTAVE_DAMAGE_.LOWEST.sprite_pos,

  discovered    = true,
  unlocked      = true,
  no_collection = false,
  config = {
    extra = {
      charges = GUSTAVE_DAMAGE_.LOWEST.low,
      display_charges = GUSTAVE_DAMAGE_.LOWEST.low,
    },
  },

  loc_vars = function (self, info_queue, card)
    local loc = {
      vars = {
        colours = {}
      }
    }

    for i=1, #GUSTAVE_DAMAGE_ do
      local damage = GUSTAVE_DAMAGE_[i]
      table.insert(loc.vars.colours, damage.colour)
      table.insert(loc.vars, localize("exp33_gustave_damage_" .. damage.id))
      table.insert(loc.vars, damage.low)
      table.insert(loc.vars, damage.high)
      table.insert(loc.vars, damage.xmult)
    end

    local display_charges = card.ability.extra.display_charges
    local damage          = get_gustave_charges_damage(display_charges)
    table.insert(loc.vars.colours, damage.colour)
    table.insert(loc.vars, localize("exp33_gustave_damage_" .. damage.id))
    table.insert(loc.vars, display_charges)
    table.insert(loc.vars, damage.xmult)

    return loc
  end,

  load = function (self, card, card_table, other_card)
    -- sync display with current values
    card_table.ability.extra.display_charges = card_table.ability.extra.charges
  end,

  calculate = function (self, card, context)
    if context.blind_defeated then
      return self:calculate_reset_charges(card)
    end

    if context.joker_main then
      return self:calculate_charges(card)
    end

    if context.individual and context.cardarea == G.play then
      return self:calculate_increase_charges(card)
    end
  end,

  draw = function (self, card, layer)
    if layer ~= "card" and layer ~= "both" then return; end
    self:update_sprite(card)

    --[[ if not card.children.monoco then
      local monoco = SMODS.create_sprite(10, 10, 1, 1, "exp33_j_monoco", { x = 0, y = 0 })
      card.children.monoco = monoco
    end ]]
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  update_sprite = function (self, card)
    local charges = card.ability.extra.display_charges
    local damage  = get_gustave_charges_damage(charges)
    card.children.center:set_sprite_pos(damage.sprite_pos)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param new_charges number
  ---@return table calc
  calculate_set_charges = function (self, card, new_charges)
    new_charges = math.max(GUSTAVE_DAMAGE_.LOWEST.low, math.min(GUSTAVE_DAMAGE_.HIGHEST.high, new_charges))

    local current_damage = get_gustave_charges_damage(card.ability.extra.charges)
    local next_damage    = get_gustave_charges_damage(new_charges)

    card.ability.extra.charges = new_charges

    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_charges = new_charges
            if next_damage ~= current_damage then
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
  calculate_increase_charges = function (self, card)
    if card.ability.extra.charges >= GUSTAVE_DAMAGE_.HIGHEST.high then return nil; end

    local new_charges = card.ability.extra.charges + 1
    local calc = self:calculate_set_charges(card, new_charges)
    calc.message = localize{
      type = "variable",
      key  = "exp33_gustave_charge_increase",
      vars = { 1 }
    }

    return calc
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table calc
  calculate_reset_charges = function (self, card)
    local calc = self:calculate_set_charges(card, GUSTAVE_DAMAGE_.LOWEST.low)
    calc.message = localize("exp33_gustave_charge_reset")
    return calc
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table calc
  calculate_charges = function (self, card)
    local damage = get_gustave_charges_damage(card.ability.extra.charges)
    return { xmult = damage.xmult }
  end,
}
