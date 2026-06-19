local MOD = SMODS.current_mod
function MOD.log_debug(...)
  if not MOD.config.debug then return; end

  local values = {...}
  for i=1, #values do
    values[i] = tostring(values[i])
  end

  sendDebugMessage(table.concat(values), MOD.id)
end

MOD.config_tab = function ()
  return {n=G.UIT.ROOT, config={align = "cm", r = 0.1, padding = 0.5, colour = G.C.BLACK}, nodes={
    {n=G.UIT.R, config={align = "tm"}, nodes={
      create_toggle{ label="Debug", ref_table=MOD.config, ref_value="debug", callback=function (value)
        MOD.log_debug("debug: ", value)
      end }
    }}
  }}
end

-- fallback to the old method of adding icons
if not SMODS.get_atlas("exp33_modicon") then
  SMODS.Atlas {
    key  = "modicon",
    path = "modicon.png",
    px = 128, py = 128,
  }
end

assert(SMODS.load_file("src/jokers/gustave.lua"))()
assert(SMODS.load_file("src/jokers/lune.lua"))()
assert(SMODS.load_file("src/jokers/maelle.lua"))()
assert(SMODS.load_file("src/jokers/monoco.lua"))()
assert(SMODS.load_file("src/jokers/sciel.lua"))()
assert(SMODS.load_file("src/jokers/verso.lua"))()

if MOD.config.debug then
  MOD.log_debug("debug mode active")

  for atlas_key in next, SMODS.Atlases do
    if atlas_key:find("^exp33") then
      MOD.log_debug("found atlas: ", atlas_key)
    end
  end
end

local game_start_run = Game.start_run
function Game:start_run(args, ...)
  local is_starting_new_run = (args or {}).savetext == nil
  game_start_run(self, args, ...)

  if not is_starting_new_run then return; end
  if MOD.config.debug then
    local joker_keys = {
      "j_exp33_gustave",
      "j_exp33_lune",
      "j_exp33_maelle",
      "j_exp33_monoco",
      "j_exp33_sciel",
      "j_exp33_verso",
    }

    MOD.log_debug("spawning jokers")
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
