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
          "{C:red}+1{} Charge for each scored",
          "card. Charges {C:attention}reset{} at",
          "the end of the round.",

          "Damage thresholds:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Mult",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Mult",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Mult",
          "{V:4}#13# #14#{} {X:mult,C:white} X#16# {} Mult",

          "{C:inactive}(Current Charges: {V:5}#18#{C:inactive}){}",
          "{C:inactive}(Current Mult: {X:mult,C:white} X#19# {C:inactive}){}"
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

          "Wheel spins by the value",
          "of the left-most scoring",
          "card {C:attention}after{} the Mask was",
          "applied. Mask sequence:",
          "{V:1}#1#{}, {V:2}#2#{}, {V:3}#3#{},",
          "{V:4}#4#{}, {V:5}#5#{}",

          "{C:inactive}(Current Mask: {V:6}#6#{}{C:inactive}){}"
        }
      },
      j_exp33_verso = {
        name = "Perfection",
        text = {
          "{C:red}+1{} Perfection for each",
          "scoring card. {C:red}-1{} perfection",
          "for each discarded card.",
          "Perfection {C:attention}resets{} each",
          "ante.",

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
    }
  },
  misc = {
    dictionary = {
      exp33_lune_stain_ice       = "Ice",
      exp33_lune_stain_fire      = "Fire",
      exp33_lune_stain_lightning = "Lightning",
      exp33_lune_stain_earth     = "Earth",
      exp33_lune_stain_light     = "Light",

      exp33_gustave_charge_reset = "Charges Reset",
      exp33_gustave_damage_low     = "Low",
      exp33_gustave_damage_medium  = "Medium",
      exp33_gustave_damage_high    = "High",
      exp33_gustave_damage_extreme = "Extreme",

      exp33_monoco_mask_almighty = "Almighty",
      exp33_monoco_mask_caster   = "Caster",
      exp33_monoco_mask_agile    = "Agile",
      exp33_monoco_mask_balanced = "Balanced",
      exp33_monoco_mask_heavy    = "Heavy",

      exp33_verso_perfection_reset = "Perfection Reset",
      exp33_verso_rank_up   = "Rank Up",
      exp33_verso_rank_down = "Rank Down",
      exp33_verso_rank_d = "D",
      exp33_verso_rank_c = "C",
      exp33_verso_rank_b = "B",
      exp33_verso_rank_a = "A",
      exp33_verso_rank_s = "S"
    },
    v_dictionary = {
      exp33_lune_got_stain = "+1 #1# Stain",
      exp33_gustave_charge_increase = "+#1# Charge",
      exp33_monoco_wheel_spin = "#1# Spins",
      exp33_verso_perfection_up   = "+#1# Perfection",
      exp33_verso_perfection_down = "-#1# Perfection"
    }
  }
}
