local MOD = SMODS.current_mod
MOD.DEBUG = { enabled = false }

function MOD.DEBUG.log(...)
  if not MOD.DEBUG.enabled then return; end

  local values = {...}
  for i=1, #values do
    values[i] = tostring(values[i])
  end

  sendDebugMessage(table.concat(values), MOD.id)
end

MOD.ui_config = { author_colour = MOD.badge_text_colour }
MOD.description_loc_vars = function (self)
  local loc = {
    vars = {
      colours = {
        MOD.ui_config.author_colour,
        MOD.badge_text_colour,
      },
    },
    scale = 1.25,
    text_colour       = G.C.UI.TEXT_LIGHT,
    background_colour = G.C.CLEAR,
  }

  for i=1, #MOD.author do
    table.insert(loc.vars, MOD.author[i])
  end

  return loc
end

MOD.config_tab = function ()
  return {n=G.UIT.ROOT, config={align = "cm", r = 0.1, padding = 0.5, colour = G.C.BLACK}, nodes={
    {n=G.UIT.R, config={align = "tm"}, nodes={
      create_toggle{label=localize("exp33_ui_config_enable_quips"), ref_table=MOD.config, ref_value="enable_quips"},
    }}
  }}
end

-- fallback to the old method of adding icons
if not SMODS.get_atlas("exp33_modicon") then
  SMODS.Atlas {
    key  = "modicon",
    path = "modicon.png",
    px = 35, py = 35,
  }
end

assert(SMODS.load_file("src/jokers/gustave.lua"))()
assert(SMODS.load_file("src/jokers/lune.lua"))()
assert(SMODS.load_file("src/jokers/maelle.lua"))()
assert(SMODS.load_file("src/jokers/monoco.lua"))()
assert(SMODS.load_file("src/jokers/sciel.lua"))()
assert(SMODS.load_file("src/jokers/verso.lua"))()

if MOD.DEBUG.enabled then
  MOD.DEBUG.log("debug mode active")

  for atlas_key in next, SMODS.Atlases do
    if atlas_key:find("^exp33") then
      MOD.DEBUG.log("found atlas: ", atlas_key)
    end
  end

  for draw_step_key in next, SMODS.DrawSteps do
    if draw_step_key:find("^exp33") then
      MOD.DEBUG.log("found draw step: ", draw_step_key)
    end
  end
end

local game_start_run = Game.start_run
function Game:start_run(args, ...)
  local is_starting_new_run = (args or {}).savetext == nil
  game_start_run(self, args, ...)

  if not is_starting_new_run then return; end
  if MOD.DEBUG.enabled then
    local joker_keys = {
      "j_blueprint",
      "j_exp33_gustave",
      "j_exp33_lune",
      "j_exp33_maelle",
      "j_exp33_monoco",
      "j_exp33_sciel",
      "j_exp33_verso",
    }

    MOD.DEBUG.log("spawning jokers")
    for i=1, #joker_keys do
      SMODS.add_card {
        no_edition = true,
        set  = "Joker",
        area = G.jokers,
        key  = joker_keys[i],
      }
    end
  end
end
