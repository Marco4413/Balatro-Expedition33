local Utils = assert(SMODS.load_file("src/utils.lua"))()

--[[ exp33_j_verso ]] SMODS.Atlas {
  key  = "j_verso",
  path = "jokers/verso.png",
  px = 71, py = 95,
}

local VERSO_RANK_ = {
  { id = "d", sprite_pos = { x = 0, y = 0 }, xmult = 1.0, colour = HEX("989898"), low = 0,  high = 2  },
  { id = "c", sprite_pos = { x = 1, y = 0 }, xmult = 1.1, colour = HEX("E0D664"), low = 3,  high = 7  },
  { id = "b", sprite_pos = { x = 2, y = 0 }, xmult = 1.3, colour = HEX("60CADF"), low = 8,  high = 14 },
  { id = "a", sprite_pos = { x = 3, y = 0 }, xmult = 1.6, colour = HEX("A02EF1"), low = 15, high = 29 },
  { id = "s", sprite_pos = { x = 4, y = 0 }, xmult = 2.0, colour = HEX("CF1323"), low = 30, high = 30 },
}

VERSO_RANK_.LOWEST  = VERSO_RANK_[1]
VERSO_RANK_.HIGHEST = VERSO_RANK_[#VERSO_RANK_]

for i=2, #VERSO_RANK_ do
  local prev_rank = VERSO_RANK_[i-1]
  local curr_rank = VERSO_RANK_[i]
  -- ensure no gaps
  assert(prev_rank.high+1 == curr_rank.low)
end

local function get_verso_perfection_rank(perfection)
  local rank = VERSO_RANK_[1]
  for i=1, #VERSO_RANK_ do
    if perfection < VERSO_RANK_[i].low then
      break
    end
    rank = VERSO_RANK_[i]
  end
  return rank
end

--[[ exp33_verso ]] SMODS.JimboQuip {
  key = "verso",
  extra = {
    center = "j_exp33_verso",
  },
  filter = function (self, quip_type)
    if not self.mod.config.enable_quips then return false; end
    if not next(SMODS.find_card(self.extra.center)) then return false; end
    self.extra.text_key = table.concat({self.key, quip_type}, "_")
    self.extra.particle_colours = Utils.pick_unique_random(
        VERSO_RANK_, 3,
        function (damage) return damage.colour; end
      )
    return true, { weight = 10 }
  end,
}

--[[ j_exp33_verso ]] SMODS.Joker {
  key   = "verso",
  atlas = "j_verso",
  pos   = VERSO_RANK_.LOWEST.sprite_pos,

  rarity = 2,
  cost   = 6,

  blueprint_compat = true,

  discovered    = true,
  unlocked      = true,
  no_collection = false,
  config = {
    extra = {
      perfection = VERSO_RANK_.LOWEST.low,
      display_perfection = VERSO_RANK_.LOWEST.low,
    },
  },

  loc_vars = function (self, info_queue, card)
    local loc = {
      vars = {
        colours = {}
      }
    }

    for i=1, #VERSO_RANK_ do
      local rank = VERSO_RANK_[i]
      table.insert(loc.vars.colours, rank.colour)
      table.insert(loc.vars, localize("exp33_verso_rank_" .. rank.id))
      table.insert(loc.vars, rank.low)
      table.insert(loc.vars, rank.high)
      table.insert(loc.vars, rank.xmult)
    end

    local display_perfection = card.ability.extra.display_perfection
    local display_rank       = get_verso_perfection_rank(display_perfection)
    table.insert(loc.vars.colours, display_rank.colour)
    table.insert(loc.vars, localize("exp33_verso_rank_" .. display_rank.id))
    table.insert(loc.vars, display_perfection)
    table.insert(loc.vars, display_rank.xmult)

    return loc
  end,

  load = function (self, card, card_table, other_card)
    -- sync display with current values
    card_table.ability.extra.display_perfection = card_table.ability.extra.perfection
  end,

  calculate = function (self, card, context)
    if context.joker_main then
      return self:calculate_perfection(card)
    end

    if context.blueprint then return nil; end

    if context.ante_change then
      return self:calculate_perfection_reset(card)
    end

    if context.individual and context.cardarea == G.play then
      return self:calculate_perfection_up(card)
    end

    if context.discard then
      return self:calculate_perfection_down(card)
    end
  end,

  draw = function (self, card, layer)
    if layer ~= "card" and layer ~= "both" then return; end
    self:update_sprite(card)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  update_sprite = function (self, card)
    local display_perfection = card.ability.extra.display_perfection
    local display_rank       = get_verso_perfection_rank(display_perfection)
    card.children.center:set_sprite_pos(display_rank.sprite_pos)
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_perfection = function (self, card)
    local perfection = card.ability.extra.perfection
    local rank       = get_verso_perfection_rank(perfection)
    return { xmult = rank.xmult }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@param new_perfection number
  ---@return table|nil calc
  calculate_perfection_set = function (self, card, new_perfection)
    new_perfection = math.max(VERSO_RANK_.LOWEST.low, math.min(VERSO_RANK_.HIGHEST.high, new_perfection))
    if new_perfection == card.ability.extra.perfection then return nil; end

    local current_rank = get_verso_perfection_rank(card.ability.extra.perfection)
    local next_rank    = get_verso_perfection_rank(new_perfection)

    card.ability.extra.perfection = new_perfection

    local message = nil
    if next_rank ~= current_rank then
      if next_rank.low > current_rank.low then
        message = localize("exp33_verso_rank_up")
      else
        message = localize("exp33_verso_rank_down")
      end
    end

    return {
      func = function ()
        G.E_MANAGER:add_event(Event{
          func = function ()
            card.ability.extra.display_perfection = new_perfection
            if next_rank ~= current_rank then
              card:flip()
              card:flip()
            end

            return true
          end
        })
      end,
      message = message,
      effect  = true,
    }
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_perfection_up = function (self, card)
    local calc = self:calculate_perfection_set(card, card.ability.extra.perfection + 1)
    if not calc then return nil; end
    if not calc.message then
      calc.message = localize{
        type = "variable",
        key  = "exp33_verso_perfection_up",
        vars = { 1 }
      }
    end
    return calc
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table|nil calc
  calculate_perfection_down = function (self, card, amount)
    local calc = self:calculate_perfection_set(card, card.ability.extra.perfection - 1)
    if not calc then return nil; end
    if not calc.message then
      calc.message = localize{
        type = "variable",
        key  = "exp33_verso_perfection_down",
        vars = { 1 }
      }
    end
    return calc
  end,

  ---@param self SMODS.Joker
  ---@param card Card
  ---@return table calc
  calculate_perfection_reset = function (self, card, amount)
    local calc = self:calculate_perfection_set(card, VERSO_RANK_.LOWEST.low) or {}
    calc.message = localize("exp33_verso_perfection_reset")
    calc.effect  = true
    return calc
  end,
}
