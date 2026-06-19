return {
  descriptions = {
    Joker = {
      j_exp33_lune = {
        name = "Elemental Stains",
        text = {
          "Stains are acquired by playing",
          "scoring cards. Each Stain",
          "corresponds to a Suit. If a",
          "scoring card and a Stain have",
          "the same Suit, Chips are boosted",
          "for that card. {V:9}#13#{} Stain is",
          "created by playing any scoring",
          "card while {V:2}#2#{}, {V:4}#5#{}, {V:6}#8#{}",
          "and {V:8}#11#{} Stains are active.",
          "{V:9}#13#{} Stain boosts all Suits.",
          "Stains are {C:attention}reset{} at the end of the",
          "round.",

          "{V:1}#1#{} - {V:2}#2#{} {X:chips,C:white} +X#3# {} Chips",
          "{V:3}#4#{} - {V:4}#5#{} {X:chips,C:white} +X#6# {} Chips",
          "{V:5}#7#{} - {V:6}#8#{} {X:chips,C:white} +X#9# {} Chips",
          "{V:7}#10#{} - {V:8}#11#{} {X:chips,C:white} +X#12# {} Chips",
          "{V:9}#13#{} {X:chips,C:white} +X#14# {} Chips"
        }
      },
      j_exp33_gustave = {
        name = "Overcharge",
        text = {
          "{C:red}+1{} Charge for each played",
          "scoring card. Charges",
          "{C:attention}reset{} at the end of the",
          "round.",

          "Damage thresholds:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Mult",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Mult",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Mult",
          "{V:4}#13# #14#{} {X:mult,C:white} X#16# {} Mult",

          "{C:inactive}(Current Charges: {V:5}#18#{C:inactive}){}",
          "{C:inactive}(Current Mult: {X:mult,C:white} X#19# {C:inactive}){}"
        }
      },
      j_exp33_maelle = {
        name = "Combat Stance",
        text = {
          "The Joker begins in",
          "{V:1}#1#{} mode. Stances",
          "change when playing",
          "certain types of hands.",
          "Open the {C:attention}Poker Hands tab{}",
          "to see which Stance is",
          "obtained from each hand.",
          "Playing an hand that",
          "changes to the same Stance",
          "as the current one changes",
          "back to {V:1}#1#{} mode.",
          "Stance {C:attention}resets{} at the end",
          "of the blind.",

          "Stances:",
          "{V:2}#2#{} - {X:chips,C:white} X#3# {} Chips",
          "{V:3}#4#{} - {X:mult,C:white} X#5# {} Mult, {V:4}#6#$#7#{} on {C:attention}discard{}",
          "{V:5}#8#{} - {X:mult,C:white} X#9# {} Mult",

          "{C:inactive}(Current Stance: {V:6}#10#{C:inactive}){}"
        }
      },
      j_exp33_monoco = {
        name = "Bestial Wheel",
        text = {
          "Each Mask gives {X:mult,C:white} X#7# {} Mult",
          "to certain types of hands.",
          "{V:5}#5#{} gives {X:mult,C:white} X#7# {} Mult",
          "to all hands and {X:mult,C:white} X#8# {} Mult to",
          "other specific hand types.",
          "Open the {C:attention}Poker Hands tab{}",
          "to see which Mask boosts",
          "each hand.",

          "Wheel spins by the rank",
          "of the left-most scoring",
          "card {C:attention}after{} the Mask was",
          "applied. Mask sequence:",
          "{V:1}#1#{}, {V:2}#2#{}, {V:3}#3#{},",
          "{V:4}#4#{}, {V:5}#5#{}",

          "{C:inactive}(Current Mask: {V:6}#6#{}{C:inactive}){}"
        }
      },
      j_exp33_sciel = {
        name = "Sun and Moon",
        text = {
          "Creates {V:1}#1#{} and {V:5}#5#{} Charges",
          "for each played scoring card",
          "with {C:attention}light{} and {C:attention}dark{} Suits",
          "respectively. If both {V:1}#1#{}",
          "and {V:5}#5#{} Charges are active at",
          "the start of the turn, they",
          "are consumed and {V:9}#9#{}",
          "begins, lasting #11# turns.",
          "{V:9}#9#{} gives {X:mult,C:white} +X#10# {} Mult for",
          "each consumed Charge. You",
          "cannot create Charges while",
          "in {V:9}#9#{} and they go",
          "back to zero when it ends.",
          "The Joker {C:attention}resets{} at the end",
          "of the Blind.",

          "{V:2}#2#{} and {V:3}#3#{} - {V:1}#1#{} {X:mult,C:white}",
          "{V:6}#6#{} and {V:7}#7#{} - {V:5}#5#{} {X:mult,C:white}",

          "Current {V:10}#9#{} Mult: {X:mult,C:white} X#13# {}",

          "{C:inactive}(Sun Charges: {V:4}#4#{C:inactive}){}",
          "{C:inactive}(Moon Charges: {V:8}#8#{C:inactive}){}",

          "{C:inactive}(Twilight Remaining: {V:10}#12#{C:inactive}){}"
        }
      },
      j_exp33_verso = {
        name = "Perfection",
        text = {
          "{C:red}+1{} Perfection for each",
          "played scoring card.",
          "{C:red}-1{} Perfection for each",
          "{C:attention}discarded card{}. Perfection",
          "{C:attention}resets{} each ante.",

          "Rank thresholds:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Mult",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Mult",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Mult",
          "{V:4}#13# #14#{}-{V:4}#15#{} {X:mult,C:white} X#16# {} Mult",
          "{V:5}#17# #18#{} {X:mult,C:white} X#20# {} Mult",

          "{C:inactive}(Current Perfection: {V:6}#22#{C:inactive}){}",
          "{C:inactive}(Current Mult: {X:mult,C:white} X#23# {C:inactive}){}"
        }
      }
    },
    Mod = {
      Expedition33 = {
        name = "Expedition 33",
        text = {
          "Adds jokers inspired by",
          "{V:2}Clair Obscur: Expedition 33{}",
          "characters.",

          "Assets by {V:1}#1#{}",
          "Scripting by {V:1}#2#{}"
        }
      }
    }
  },
  misc = {
    -- https://www.reddit.com/r/expedition33/comments/1nek3i4/the_list_of_all_the_battle_voice_lines/
    quips = {
      exp33_gustave_loss = { "For those who come after." },
      exp33_gustave_win  = { "The Expedition continues." },
      exp33_lune_loss = { "When one falls, we continue." },
      exp33_lune_win  = { "The journey is far from over." },
      exp33_maelle_loss = { "Not looking good." },
      exp33_maelle_win  = { "For a brighter future." },
      exp33_monoco_loss = { "Ugh, slow as Verso." },
      exp33_monoco_win  = { "What a lovely fight." },
      exp33_sciel_loss = { "Death is a friend." },
      exp33_sciel_win  = { "It was written in the stars." },
      exp33_verso_loss = { "I'll always come back." },
      exp33_verso_win  = { "One more day, one more battle won." }
    },
    dictionary = {
      exp33_lune_stain_reset = "Reset",
      exp33_lune_stain_ice       = "Ice",
      exp33_lune_stain_fire      = "Fire",
      exp33_lune_stain_lightning = "Lightning",
      exp33_lune_stain_earth     = "Earth",
      exp33_lune_stain_light     = "Light",

      exp33_gustave_charge_reset = "Reset",
      exp33_gustave_damage_low     = "Low",
      exp33_gustave_damage_medium  = "Medium",
      exp33_gustave_damage_high    = "High",
      exp33_gustave_damage_extreme = "Extreme",

      exp33_maelle_stance_reset = "Reset",
      exp33_maelle_stance_stanceless = "Stanceless",
      exp33_maelle_stance_defensive  = "Defensive",
      exp33_maelle_stance_offensive  = "Offensive",
      exp33_maelle_stance_virtuose   = "Virtuose",

      exp33_monoco_mask_almighty = "Almighty",
      exp33_monoco_mask_caster   = "Caster",
      exp33_monoco_mask_agile    = "Agile",
      exp33_monoco_mask_balanced = "Balanced",
      exp33_monoco_mask_heavy    = "Heavy",

      exp33_sciel_reset = "Reset",
      exp33_sciel_twilight_started = "Twilight",
      exp33_sciel_twilight         = "Twilight",
      exp33_sciel_charge_sun  = "Sun",
      exp33_sciel_charge_moon = "Moon",

      exp33_verso_perfection_reset = "Reset",
      exp33_verso_rank_up   = "Rank Up",
      exp33_verso_rank_down = "Rank Down",
      exp33_verso_rank_d = "D",
      exp33_verso_rank_c = "C",
      exp33_verso_rank_b = "B",
      exp33_verso_rank_a = "A",
      exp33_verso_rank_s = "S",

      exp33_ui_config_enable_quips = "Enable Quips"
    },
    v_dictionary = {
      exp33_lune_got_stain = "+1 #1# Stain",
      exp33_gustave_charge_increase = "+#1# Charge",
      exp33_monoco_wheel_spin = "#1# Spins",
      exp33_sciel_charge_increase = "+#1# #2# Charge",
      exp33_verso_perfection_up   = "+#1# Perfection",
      exp33_verso_perfection_down = "-#1# Perfection"
    }
  }
}
