return {
  descriptions = {
    Joker = {
      j_exp33_gustave = {
        name = "Surcharge",
        text = {
          "{C:red}+1{} Charge pour chaque",
          "carte jouée en marquant",
          "des points. Les Charges",
          "se {C:attention}réinitialisent{} à la",
          "fin de chaque Blinde.",

          "Seuil de dommage:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Multi",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Multi",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Multi",
          "{V:4}#13# #14#{} {X:mult,C:white} X#16# {} Multi",

          "{C:inactive}(Charges actuelles: {V:5}#18#{C:inactive}){}",
          "{C:inactive}(Multi. actuel: {X:mult,C:white} X#19# {C:inactive}){}"
        }
      },
      j_exp33_lune = {
        name = "Pigments Élémentaires",
        text = {
          "Pigments sont obtenus en jouant",
          "cartes qui marquent points. Chaque",
          "Pigment correspond à une Couleur.",
          "Si une carte qui marque et un",
          "Pigment ont le même Couleur, les",
          "Jetons de cette carte sont renforcées.",
          "Le Pigment {V:9}#13#{} est cré en jouant",
          "n'importe quelle carte qui marque points",
          "pendant que les Pigments de {V:2}#2#{}, {V:4}#5#{},",
          "{V:6}#8#{} et {V:8}#11#{} sont activs. Le",
          "Pigment {V:9}#13#{} renforce toutes les",
          "Couleurs. Les Pigments sont {C:attention}réinitialisés{}",
          "à la fin de chaque Blinde.",

          "{V:1}#1#{} - {V:2}#2#{} {X:chips,C:white} +X#3# {} Jetons",
          "{V:3}#4#{} - {V:4}#5#{} {X:chips,C:white} +X#6# {} Jetons",
          "{V:5}#7#{} - {V:6}#8#{} {X:chips,C:white} +X#9# {} Jetons",
          "{V:7}#10#{} - {V:8}#11#{} {X:chips,C:white} +X#12# {} Jetons",
          "{V:9}#13#{} {X:chips,C:white} +X#14# {} Jetons"
        }
      },
      j_exp33_maelle = {
        name = "Posture de Combat",
        text = {
          "Le Joker commence en mode",
          "{V:1}#1#{}. La Posture change en jouant",
          "certains types de mains. Ouvre le {C:attention}tableau{}",
          "{C:attention}Mains de poker{} pour voire quelle Posture",
          "est obtenue par chaque main. Jouer la",
          "main qui change la Posture actuelle en",
          "une égale ramène en mode {V:1}#1#{}.",
          "La Posture se {C:attention}réinitialise{} à la fin de",
          "chaque Blinde.",

          "Postures:",
          "{V:2}#2#{} {X:chips,C:white} X#3# {} Jetons",
          "{V:3}#4#{} {X:mult,C:white} X#5# {} Multi., {V:4}#6#$#7#{} par {C:attention}défausse{}",
          "{V:5}#8#{} {X:mult,C:white} X#9# {} Multi.",

          "{C:inactive}(Posture actuelle: {V:6}#10#{C:inactive}){}"
        }
      },
      j_exp33_monoco = {
        name = "Roue Bestiale",
        text = {
          "Chaque Masque donne {X:mult,C:white} X#7# {}",
          "Multi. à certaines types des",
          "mains. Le Masque {V:5}#5#{}",
          "donne {X:mult,C:white} X#7# {} Multi à toutes",
          "les mains et {X:mult,C:white} X#8# {} à autres",
          "specifiques types des main.",
          "Ouvre le {C:attention}tableau Mains de{}",
          "{C:attention}poker{} pour voire quel",
          "Masque renforce chaque main.",

          "La roue tourne selon la valeur",
          "de la première carte à gauche",
          "qui marque {C:attention}après{} que le",
          "Masque a été appliqué. Masque",
          "séquence:",
          "{V:1}#1#{}, {V:2}#2#{}, {V:3}#3#{},",
          "{V:4}#4#{}, {V:5}#5#{}",

          "{C:inactive}(Masque actuel: {V:6}#6#{}{C:inactive}){}"
        }
      },
      j_exp33_sciel = {
        name = "Soleil et Lune",
        text = {
          "Crée Charges de {V:1}#1#{} et de {V:5}#5#{}",
          "pour chaque carte jouée qui marque",
          "avec Couleurs {C:attention}claires{} et {C:attention}obscures{},",
          "respectivement. Si les Charges de",
          "{V:1}#1#{} et de {V:5}#5#{} sont tous les",
          "deux actifs, elles sont consommées",
          "et le {V:9}#9#{} commence, qui dure",
          "#11# tours. Le {V:9}#9#{} donne {X:mult,C:white} +X#10# {} Multi.",
          "pour chaque Charge consommée. On ne",
          "peut pas créer Charges pendant que",
          "le {V:9}#9#{} est actif et elles se",
          "remettent à zéro quand il se termine.",
          "Le Joker se {C:attention}reinitialise{} à la fin de",
          "Blinde.",

          "{V:2}#2#{} et {V:3}#3#{} - {V:1}#1#{} {X:mult,C:white}",
          "{V:6}#6#{} et {V:7}#7#{} - {V:5}#5#{} {X:mult,C:white}",

          "Multi. de {V:10}#9#{} actuel: {X:mult,C:white} X#13# {}",

          "{C:inactive}(Charges de Soleil: {V:4}#4#{C:inactive}){}",
          "{C:inactive}(Charges de Lune: {V:8}#8#{C:inactive}){}",

          "{C:inactive}(Crépuscule restant: {V:10}#12#{C:inactive}){}"
        }
      },
      j_exp33_verso = {
        name = "Perfection",
        text = {
          "{C:red}+1{} Perfection pour chaque",
          "carte jouée en marquant des",
          "points. {C:red}-1{} Perfection pour",
          "chaque carte défaussée. La",
          "Perfection se {C:attention}réinitialise{}",
          "chaque Mise Initiale.",

          "Seuil de rang:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Multi",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Multi",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Multi",
          "{V:4}#13# #14#{}-{V:4}#15#{} {X:mult,C:white} X#16# {} Multi",
          "{V:5}#17# #18#{} {X:mult,C:white} X#20# {} Multi",

          "{C:inactive}(Perfection actuelle: {V:6}#22#{C:inactive}){}",
          "{C:inactive}(Multi. actual: {X:mult,C:white} X#23# {C:inactive}){}"
        }
      }
    },
    Mod = {
      Expedition33 = {
        name = "Expedition 33",
        text = {
          "Ajoute jokers inspirés de personnages",
          "de {V:2}Clair Obscur: Expedition 33{}.",

          "Assets: {V:1}#1#{}",
          "Scripting: {V:1}#2#{}"
        }
      }
    }
  },
  misc = {
    quips = {
      exp33_gustave_loss = { "Pour ceux qui viendront après !" }, -- 01_Overcharge4_Gustave
      exp33_gustave_win  = { "L'expédition continue..." }, -- 03_BattleWon_Gustave
      exp33_lune_loss = { "Quand l'un de nous tombe, on continue." }, -- ST_CS_1_3_06_LuneArrives, 10_Lune
      exp33_lune_win  = { "Le voyage est encore loin d'être terminé." }, -- 10_BattleWon_Lune
      exp33_maelle_loss = { "C'est pas bon..." }, -- 07_TurnStartLowLife_Maelle
      exp33_maelle_win  = { "Pour un futur radieux." }, -- 07_BattleWon_Maelle
      exp33_monoco_loss = { "Argh ! Aussi lent que Verso." }, -- 04_FailsAQTE_Monoco
      exp33_monoco_win  = { "Quel merveilleux combat !" }, -- 01_BattleWon_Monoco
      exp33_sciel_loss = { "La mort est mon amie..." }, -- 04_Skill_Deathisafriend_Sciel
      exp33_sciel_win  = { "C'était écrit dans les étoiles." }, -- 10_BattleWon_Sciel
      exp33_verso_loss = { "Je reviendrai toujours !" }, -- 64_Skill_Illalwayscomeback_Verso
      exp33_verso_win  = { "Un jour de plus, un nouveau combat de gagné." } -- 04_BattleWon_Verso
    },
    dictionary = {
      exp33_gustave_charge_reset = "Réinitialisé",
      exp33_gustave_damage_low     = "Bas",
      exp33_gustave_damage_medium  = "Moyen",
      exp33_gustave_damage_high    = "Haut",
      exp33_gustave_damage_extreme = "Extrême",

      exp33_lune_stain_reset = "Réinitialisé",
      exp33_lune_stain_ice       = "Glace",
      exp33_lune_stain_fire      = "Feu",
      exp33_lune_stain_lightning = "Foudre",
      exp33_lune_stain_earth     = "Terre",
      exp33_lune_stain_light     = "Clair",

      exp33_maelle_stance_reset = "Réinitialisé",
      exp33_maelle_stance_stanceless = "Sans Posture",
      exp33_maelle_stance_defensive  = "Défensive",
      exp33_maelle_stance_offensive  = "Offensive",
      exp33_maelle_stance_virtuose   = "Virtuose",

      exp33_monoco_mask_almighty = "Omnipotent",
      exp33_monoco_mask_caster   = "Occulte",
      exp33_monoco_mask_agile    = "Agile",
      exp33_monoco_mask_balanced = "Équilibré",
      exp33_monoco_mask_heavy    = "Brutal",

      exp33_sciel_reset = "Réinitialisé",
      exp33_sciel_twilight_started = "Crépuscule",
      exp33_sciel_twilight         = "Crépuscule",
      exp33_sciel_charge_sun  = "Soleil",
      exp33_sciel_charge_moon = "Lune",

      exp33_verso_perfection_reset = "Réinitialisé",
      exp33_verso_rank_up   = "Rang Augmenté",
      exp33_verso_rank_down = "Rang Réduit",
      exp33_verso_rank_d = "D",
      exp33_verso_rank_c = "C",
      exp33_verso_rank_b = "B",
      exp33_verso_rank_a = "A",
      exp33_verso_rank_s = "S",

      exp33_ui_config_enable_quips = "Active Butades"
    },
    v_dictionary = {
      exp33_gustave_charge_increase = "+#1# Charge",
      exp33_lune_got_stain = "+1 Pigment #1#",
      exp33_monoco_wheel_spin = "#1# Tours",
      exp33_sciel_charge_increase = "+#1# Charge de #2#",
      exp33_verso_perfection_up   = "+#1# Perfection",
      exp33_verso_perfection_down = "-#1# Perfection"
    }
  }
}
