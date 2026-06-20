return {
  descriptions = {
    Joker = {
      j_exp33_gustave = {
        name = "Sobrecarga",
        text = {
          "{C:red}+1{} Carga por cada carta",
          "jugada cuando anota. Las",
          "Cargas se {C:attention}restablecen{} al",
          "final de cada Ciega.",

          "Umbral de daño:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} multi",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} multi",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} multi",
          "{V:4}#13# #14#{} {X:mult,C:white} X#16# {} multi",

          "{C:inactive}(Cargas actuales: {V:5}#18#{C:inactive}){}",
          "{C:inactive}(Multi actual: {X:mult,C:white} X#19# {C:inactive}){}"
        }
      },
      j_exp33_lune = {
        name = "Borrones Elementales",
        text = {
          "Los Borrones se obtienen jugando",
          "cartas que anotan. Cada Borrón",
          "corresponde a un palo. Si una",
          "carta que anota y un Borrón tienen",
          "el mismo palo, las fichas de la",
          "carta son potenciadas. El Borrón",
          "de {V:9}#13#{} se crea jugando cualquier",
          "carta que anota mientras los",
          "Borrones de {V:2}#2#{}, {V:4}#5#{}, {V:6}#8#{}",
          "y {V:8}#11#{} están activos. El Borrón",
          "de {V:9}#13#{} potencia todos los palos.",
          "Los Borrones se {C:attention}restablecen{} al",
          "final de cada Ciega.",

          "{V:1}#1#{} - {V:2}#2#{} {X:chips,C:white} +X#3# {} fichas",
          "{V:3}#4#{} - {V:4}#5#{} {X:chips,C:white} +X#6# {} fichas",
          "{V:5}#7#{} - {V:6}#8#{} {X:chips,C:white} +X#9# {} fichas",
          "{V:7}#10#{} - {V:8}#11#{} {X:chips,C:white} +X#12# {} fichas",
          "{V:9}#13#{} {X:chips,C:white} +X#14# {} fichas"
        }
      },
      j_exp33_maelle = {
        name = "Pose de Batalla",
        text = {
          "El Comodín empieza en modalidad",
          "{V:1}#1#{}. Las Poses cambian cuando",
          "se juegan ciertos tipos de manos.",
          "Abre la {C:attention}tabla Manos de poker{} para",
          "ver cual Pose se obtiene de cada",
          "mano. Jugar una mano que cambia la",
          "Pose actual en una misma devuelve a",
          "la modalidad {V:1}#1#{}. La Pose se",
          "{C:attention}restablece{} al final de cada Ciega.",

          "Poses:",
          "{V:2}#2#{} {X:chips,C:white} X#3# {} fichas",
          "{V:3}#4#{} {X:mult,C:white} X#5# {} multi, {V:4}#6#$#7#{} por {C:attention}descarte{}",
          "{V:5}#8#{} {X:mult,C:white} X#9# {} multi",

          "{C:inactive}(Pose actual: {V:6}#10#{C:inactive}){}"
        }
      },
      j_exp33_monoco = {
        name = "Rueda Salvaje",
        text = {
          "Cada Máscara da {X:mult,C:white} X#7# {} multi",
          "a ciertos tipos de manos.",
          "La Máscara {V:5}#5#{} da",
          "{X:mult,C:white} X#7# {} multi a todas las",
          "manos y {X:mult,C:white} X#8# {} multi a otras",
          "manos específicas. Abre la",
          "{C:attention}tabla Manos de póker{} para",
          "ver cual Máscara potencia",
          "cada mano.",

          "La Rueda gira según la",
          "categoría de la primera",
          "carta a la izquierda que",
          "anota {C:attention}después{} que la",
          "Máscara ha sido aplicada.",
          "Secuencia de las Máscaras:",
          "{V:1}#1#{}, {V:2}#2#{}, {V:3}#3#{},",
          "{V:4}#4#{}, {V:5}#5#{}",

          "{C:inactive}(Máscara actual: {V:6}#6#{}{C:inactive}){}"
        }
      },
      j_exp33_sciel = {
        name = "Sol y Luna",
        text = {
          "Crea Cargas de {V:1}#1#{} y {V:5}#5#{}",
          "por cada carta jugada que",
          "anota con palos {C:attention}claros{} y",
          "{C:attention}oscuros{}, respectivamente.",
          "Si tanto las Cargas de {V:1}#1#{}",
          "como las Cargas de {V:5}#5#{} están",
          "activas, ellas son consumidas",
          "y el {V:9}#9#{} empieza, que",
          "dura #11# turnos. El {V:9}#9#{} da",
          "{X:mult,C:white} +X#10# {} multi por cada Carga",
          "consumida. No se pueden crear",
          "Cargas mientras en {V:9}#9#{}",
          "y vuelven a cero cuando termine.",
          "El Comodín se {C:attention}restablece{} al final",
          "de cada Ciega.",

          "{V:2}#2#{} y {V:3}#3#{} - {V:1}#1#{} {X:mult,C:white}",
          "{V:6}#6#{} y {V:7}#7#{} - {V:5}#5#{} {X:mult,C:white}",

          "Multi de {V:10}#9#{} actual: {X:mult,C:white} X#13# {}",

          "{C:inactive}(Cargas de Sol: {V:4}#4#{C:inactive}){}",
          "{C:inactive}(Cargas de Luna: {V:8}#8#{C:inactive}){}",

          "{C:inactive}(Crepúsculo restante: {V:10}#12#{C:inactive}){}"
        }
      },
      j_exp33_verso = {
        name = "Perfección",
        text = {
          "{C:red}+1{} Perfección por cada",
          "carta jugada cuando anota.",
          "{C:red}-1{} Perfección por cada",
          "{C:attention}carta descartada{}.",
          "La Perfección se {C:attention}restablece{}",
          "al final de cada Apuesta",
          "Inicial.",

          "Umbral de rango:",
          "{V:1}#1# #2#{}-{V:1}#3#{} {X:mult,C:white} X#4# {} multi",
          "{V:2}#5# #6#{}-{V:2}#7#{} {X:mult,C:white} X#8# {} multi",
          "{V:3}#9# #10#{}-{V:3}#11#{} {X:mult,C:white} X#12# {} multi",
          "{V:4}#13# #14#{}-{V:4}#15#{} {X:mult,C:white} X#16# {} multi",
          "{V:5}#17# #18#{} {X:mult,C:white} X#20# {} multi",

          "{C:inactive}(Perfección actual: {V:6}#22#{C:inactive}){}",
          "{C:inactive}(Multi actual: {X:mult,C:white} X#23# {C:inactive}){}"
        }
      }
    },
    Mod = {
      Expedition33 = {
        name = "Expedition 33",
        text = {
          "Añade Comodines inspirados en personajes",
          "de {V:2}Clair Obscur: Expedition 33{}.",

          "Assets: {V:1}#1#{}",
          "Scripting: {V:1}#2#{}"
        }
      }
    }
  },
  misc = {
    quips = {
      exp33_gustave_loss = { "Por los que vendrán después." }, -- 01_Overcharge4_Gustave
      exp33_gustave_win  = { "La expedición continúa." }, -- 03_BattleWon_Gustave
      exp33_lune_loss = { "Cuando uno cae, seguimos." }, -- ST_CS_1_3_06_LuneArrives, 10_Lune
      exp33_lune_win  = { "Este viaje está lejos de terminar." }, -- 10_BattleWon_Lune
      exp33_maelle_loss = { "Esto no tiene buena pinta." }, -- 07_TurnStartLowLife_Maelle
      exp33_maelle_win  = { "Por un futuro más brillante." }, -- 07_BattleWon_Maelle
      exp33_monoco_loss = { "Arg. Soy tan lento como Verso." }, -- 04_FailsAQTE_Monoco
      exp33_monoco_win  = { "Qué combate tan maravilloso." }, -- 01_BattleWon_Monoco
      exp33_sciel_loss = { "La muerte es una amiga."}, -- 04_Skill_Deathisafriend_Sciel
      exp33_sciel_win  = { "Estaba escrito en las estrellas." }, -- 10_BattleWon_Sciel
      exp33_verso_loss = { "Siempre volveré." }, -- 64_Skill_Illalwayscomeback_Verso
      exp33_verso_win  = { "Otro día más sumando victorias en combate." } -- 04_BattleWon_Verso
    },
    dictionary = {
      exp33_gustave_charge_reset = "Restablece",
      exp33_gustave_damage_low     = "Bajo",
      exp33_gustave_damage_medium  = "Medio",
      exp33_gustave_damage_high    = "Elevado",
      exp33_gustave_damage_extreme = "Extremo",

      exp33_lune_stain_reset = "Restablece",
      exp33_lune_stain_ice       = "Hielo",
      exp33_lune_stain_fire      = "Fuego",
      exp33_lune_stain_lightning = "Rayo",
      exp33_lune_stain_earth     = "Tierra",
      exp33_lune_stain_light     = "Luz",

      exp33_maelle_stance_reset = "Restablece",
      exp33_maelle_stance_stanceless = "Sin Pose",
      exp33_maelle_stance_defensive  = "Defensiva",
      exp33_maelle_stance_offensive  = "Ofensiva",
      exp33_maelle_stance_virtuose   = "Virtuosa",

      exp33_monoco_mask_almighty = "Todopoderosa",
      exp33_monoco_mask_caster   = "Lanzamiento",
      exp33_monoco_mask_agile    = "Ágil",
      exp33_monoco_mask_balanced = "Equilibrada",
      exp33_monoco_mask_heavy    = "Pesada",

      exp33_sciel_reset = "Restablece",
      exp33_sciel_twilight_started = "Crepúsculo",
      exp33_sciel_twilight         = "Crepúsculo",
      exp33_sciel_charge_sun  = "Sol",
      exp33_sciel_charge_moon = "Luna",

      exp33_verso_perfection_reset = "Restablece",
      exp33_verso_rank_up   = "Aumento de Rango",
      exp33_verso_rank_down = "Rango Reducido",
      exp33_verso_rank_d = "D",
      exp33_verso_rank_c = "C",
      exp33_verso_rank_b = "B",
      exp33_verso_rank_a = "A",
      exp33_verso_rank_s = "S",

      exp33_ui_config_enable_quips = "Activa Bromas"
    },
    v_dictionary = {
      exp33_gustave_charge_increase = "+#1# Carga",
      exp33_lune_got_stain = "+1 Borrón de #1#",
      exp33_monoco_wheel_spin = "#1# Giros",
      exp33_sciel_charge_increase = "+#1# Carga de #2#",
      exp33_verso_perfection_up   = "+#1# Perfección",
      exp33_verso_perfection_down = "-#1# Perfección"
    }
  }
}
