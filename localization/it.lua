return {
  descriptions = {
    Joker = {
      j_exp33_gustave = {
        name = "Sovraccarico",
        text = {
          "{C:red}+1{} Carica per ogni carta",
          "giocata quando assegna",
          "punti. Le Cariche si",
          "{C:attention}azzerano{} alla fine di",
          "ogni Buio.",

          "Soglia del danno:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Molt",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Molt",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Molt",
          "{V:4}#13# #14#{} {X:mult,C:white} X#16# {} Molt",

          "{C:inactive}(Cariche attuali: {V:5}#18#{C:inactive}){}",
          "{C:inactive}(Molt attuale: {X:mult,C:white} X#19# {C:inactive}){}"
        }
      },
      j_exp33_lune = {
        name = "Macchie Elementali",
        text = {
          "Le Macchie si ottengono giocando",
          "carte quando fanno punto. Ogni",
          "Macchia corrisponde ad un Seme.",
          "Se una carta che fa punto e una",
          "Macchia hanno lo stesso Seme, le",
          "Fiche di quella carta sono potenziate.",
          "La Macchia di {V:9}#13#{} viene creata",
          "giocando una carta quando fa punto",
          "mentre le Macchie di {V:2}#2#{}, {V:4}#5#{},",
          "{V:6}#8#{} e {V:8}#11#{} sono attive. La Macchia",
          "di {V:9}#13#{} potenzia tutti i Semi. Le Macchie",
          "si {C:attention}azzerano{} alla fine di ogni Buio.",

          "{V:1}#1#{} - {V:2}#2#{} {X:chips,C:white} +X#3# {} Fiche",
          "{V:3}#4#{} - {V:4}#5#{} {X:chips,C:white} +X#6# {} Fiche",
          "{V:5}#7#{} - {V:6}#8#{} {X:chips,C:white} +X#9# {} Fiche",
          "{V:7}#10#{} - {V:8}#11#{} {X:chips,C:white} +X#12# {} Fiche",
          "{V:9}#13#{} {X:chips,C:white} +X#14# {} Fiche"
        }
      },
      j_exp33_maelle = {
        name = "Posa di Battaglia",
        text = {
          "Il Jolly inizia in modalità {V:1}#1#{}.",
          "Le Pose cambiano giocando certi tipi di",
          "mani. Apri la {C:attention}tabella Mani di poker{} per",
          "vedere quale Posa si ottiene da ogni mano.",
          "Giocare una mano che cambierebbe la Posa",
          "attuale in una uguale riporta alla modalità",
          "{V:1}#1#{}. La Posa si {C:attention}ripristina{} alla fine",
          "di ogni Buio.",

          "Pose:",
          "{V:2}#2#{} {X:chips,C:white} X#3# {} Fiche",
          "{V:3}#4#{} {X:mult,C:white} X#5# {} Molt, {V:4}#6#$#7#{} per {C:attention}scarto{}",
          "{V:5}#8#{} {X:mult,C:white} X#9# {} Molt",

          "{C:inactive}(Posa attuale: {V:6}#10#{C:inactive}){}"
        }
      },
      j_exp33_monoco = {
        name = "Ruota Bestiale",
        text = {
          "Ogni Maschera dà {X:mult,C:white} X#7# {} Molt a",
          "certi tipi di mani. La Maschera",
          "{V:5}#5#{} dà {X:mult,C:white} X#7# {} Molt a",
          "tutte le mani e {X:mult,C:white} X#8# {} Mult ad altri",
          "tipi specifici di mani. Apri la",
          "{C:attention}tabella Mani di Poker{} per vedere",
          "quale Maschera potenzia ogni mano.",

          "La ruota gira in base al valore",
          "della prima carta a sinistra",
          "giocata quando fa punto {C:attention}dopo{}",
          "che la Maschera è stata applicata.",
          "Sequenza delle Maschere",
          "{V:1}#1#{}, {V:2}#2#{}, {V:3}#3#{},",
          "{V:4}#4#{}, {V:5}#5#{}",

          "{C:inactive}(Maschera attuale: {V:6}#6#{}{C:inactive}){}"
        }
      },
      j_exp33_sciel = {
        name = "Sole e Luna",
        text = {
          "Crea Cariche {V:1}#1#{} e {V:5}#5#{} per",
          "ogni carta giocata quando fa punto",
          "con Semi {C:attention}chiari{} e {C:attention}scuri{}, rispettivamente.",
          "Se sia le Cariche {V:1}#1#{} che {V:5}#5#{}",
          "sono attive all'inizio del turno,",
          "vengono consumate e inizia il",
          "{V:9}#9#{}, che dura #11# turni.",
          "Il {V:9}#9#{} dà {X:mult,C:white} +X#10# {} Molt per",
          "ogni Carica consumata. Non si",
          "possono creare Cariche mentre si",
          "è in {V:9}#9#{} e tornano a zero",
          "quando finisce. Il Jolly si",
          "{C:attention}ripristina{} alla fine di ogni Buio.",

          "{V:2}#2#{} e {V:3}#3#{} - {V:1}#1#{} {X:mult,C:white}",
          "{V:6}#6#{} e {V:7}#7#{} - {V:5}#5#{} {X:mult,C:white}",

          "Molt di {V:10}#9#{} attuale: {X:mult,C:white} X#13# {}",

          "{C:inactive}(Cariche Solari: {V:4}#4#{C:inactive}){}",
          "{C:inactive}(Cariche Lunari: {V:8}#8#{C:inactive}){}",

          "{C:inactive}(Crepuscolo rimanente: {V:10}#12#{C:inactive}){}"
        }
      },
      j_exp33_verso = {
        name = "Perfezione",
        text = {
          "{C:red}+1{} Perfezione per ogni carta",
          "giocata quando assegna punti.",
          "{C:red}-1{} Perfezione per ogni carta",
          "scartata. La Perfezione si",
          "{C:attention}azzera{} ad ogni Ante.",

          "Soglia del grado:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} Molt",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} Molt",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} Molt",
          "{V:4}#13# #14#{}-{V:4}#15#{} {X:mult,C:white} X#16# {} Molt",
          "{V:5}#17# #18#{} {X:mult,C:white} X#20# {} Molt",

          "{C:inactive}(Perfezione attuale: {V:6}#22#{C:inactive}){}",
          "{C:inactive}(Molt attuale: {X:mult,C:white} X#23# {C:inactive}){}"
        }
      }
    },
    Mod = {
      Expedition33 = {
        name = "Expedition 33",
        text = {
          "Aggiunge Jolly ispirati ai personaggi",
          "di {V:2}Clair Obscur: Expedition 33{}.",

          "Assets: {V:1}#1#{}",
          "Scripting: {V:1}#2#{}"
        }
      }
    }
  },
  misc = {
    quips = {
      exp33_gustave_loss = { "Per chi verrà dopo." }, -- 01_Overcharge4_Gustave
      exp33_gustave_win  = { "La spedizione continua." }, -- 03_BattleWon_Gustave
      exp33_lune_loss = { "Quando uno cade, noi continuiamo." }, -- ST_CS_1_3_06_LuneArrives, 10_Lune
      exp33_lune_win  = { "Abbiamo ancora molta strada da fare." }, -- 10_BattleWon_Lune
      exp33_maelle_loss = { "Non promette bene." }, -- 07_TurnStartLowLife_Maelle
      exp33_maelle_win  = { "Per un futuro migliore." }, -- 07_BattleWon_Maelle
      exp33_monoco_loss = { "Ugh, sono lento come Verso." }, -- 04_FailsAQTE_Monoco
      exp33_monoco_win  = { "Che scontro meraviglioso." }, -- 01_BattleWon_Monoco
      exp33_sciel_loss = { "La morte è un'amica." }, -- 04_Skill_Deathisafriend_Sciel
      exp33_sciel_win  = { "Era scritto nelle stelle." }, -- 10_BattleWon_Sciel
      exp33_verso_loss = { "Tornerò sempre e comunque." }, -- 64_Skill_Illalwayscomeback_Verso
      exp33_verso_win  = { "Un altro giorno, un'altra battaglia vinta." } -- 04_BattleWon_Verso
    },
    dictionary = {
      exp33_gustave_charge_reset = "Ripristino",
      exp33_gustave_damage_low     = "Basso",
      exp33_gustave_damage_medium  = "Medio",
      exp33_gustave_damage_high    = "Alto",
      exp33_gustave_damage_extreme = "Estremo",

      exp33_lune_stain_reset = "Ripristino",
      exp33_lune_stain_ice       = "Ghiaccio",
      exp33_lune_stain_fire      = "Fuoco",
      exp33_lune_stain_lightning = "Fulmine",
      exp33_lune_stain_earth     = "Terra",
      exp33_lune_stain_light     = "Luce",

      exp33_maelle_stance_reset = "Ripristino",
      exp33_maelle_stance_stanceless = "Senza Posa",
      exp33_maelle_stance_defensive  = "Difensiva",
      exp33_maelle_stance_offensive  = "Offensiva",
      exp33_maelle_stance_virtuose   = "Virtuosa",

      exp33_monoco_mask_almighty = "Onnipotente",
      exp33_monoco_mask_caster   = "Incantatore",
      exp33_monoco_mask_agile    = "Agile",
      exp33_monoco_mask_balanced = "Bilanciata",
      exp33_monoco_mask_heavy    = "Pesante",

      exp33_sciel_reset = "Ripristino",
      exp33_sciel_twilight_started = "Crepuscolo",
      exp33_sciel_twilight         = "Crepuscolo",
      exp33_sciel_charge_sun  = "Solari",
      exp33_sciel_charge_moon = "Lunari",

      exp33_verso_perfection_reset = "Ripristino",
      exp33_verso_rank_up   = "Grado Aumentato",
      exp33_verso_rank_down = "Grado Ridotto",
      exp33_verso_rank_d = "D",
      exp33_verso_rank_c = "C",
      exp33_verso_rank_b = "B",
      exp33_verso_rank_a = "A",
      exp33_verso_rank_s = "S",

      exp33_ui_config_enable_quips = "Attiva Battute"
    },
    v_dictionary = {
      exp33_gustave_charge_increase = "+#1# Carica",
      exp33_lune_got_stain = "+1 Macchia di #1#",
      exp33_monoco_wheel_spin = "#1# Giri",
      exp33_sciel_charge_increase = "+#1# Carica di #2#",
      exp33_verso_perfection_up   = "+#1# Perfezione",
      exp33_verso_perfection_down = "-#1# Perfezione"
    }
  }
}
