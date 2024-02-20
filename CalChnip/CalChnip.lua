-- mapping from gregorian to republican calendar
-- réf: <https://fr.wikipedia.org/wiki/Calendrier_r%C3%A9publicain>
-- TODO: complete the mapping
local calMap = {
  [2] = { -- February
    [1] = { ["month"] = "Pluviôse", ["day"] = "13", ["flavour"] = "du laurier" },
    [2] = { ["month"] = "Pluviôse", ["day"] = "14", ["flavour"] = "de l'avelinier" },
    [3] = { ["month"] = "Pluviôse", ["day"] = "15", ["flavour"] = "de la vache" },
    [4] = { ["month"] = "Pluviôse", ["day"] = "16", ["flavour"] = "du buis" },
    [5] = { ["month"] = "Pluviôse", ["day"] = "17", ["flavour"] = "du lichen" },
    [6] = { ["month"] = "Pluviôse", ["day"] = "18", ["flavour"] = "de l'if" },
    [7] = { ["month"] = "Pluviôse", ["day"] = "19", ["flavour"] = "de la pulmonaire" },
    [8] = { ["month"] = "Pluviôse", ["day"] = "20", ["flavour"] = "de la serpette" },
    [9] = { ["month"] = "Pluviôse", ["day"] = "21", ["flavour"] = "de la thlaspi" },
    [10] = { ["month"] = "Pluviôse", ["day"] = "22", ["flavour"] = "de la thymèle" },
    [11] = { ["month"] = "Pluviôse", ["day"] = "23", ["flavour"] = "du chiendent" },
    [12] = { ["month"] = "Pluviôse", ["day"] = "24", ["flavour"] = "de la trainasse" },
    [13] = { ["month"] = "Pluviôse", ["day"] = "25", ["flavour"] = "du lièvre" },
    [14] = { ["month"] = "Pluviôse", ["day"] = "26", ["flavour"] = "du guède" },
    [15] = { ["month"] = "Pluviôse", ["day"] = "27", ["flavour"] = "du noisetier" },
    [16] = { ["month"] = "Pluviôse", ["day"] = "28", ["flavour"] = "de la cyclamens" },
    [17] = { ["month"] = "Pluviôse", ["day"] = "29", ["flavour"] = "de la chélidoine" },
    [18] = { ["month"] = "Pluviôse", ["day"] = "30", ["flavour"] = "du traîneau" },
    [19] = { ["month"] = "Ventôse", ["day"] = "1", ["flavour"] = "du tussilage" },
    [20] = { ["month"] = "Ventôse", ["day"] = "2", ["flavour"] = "du cornouiller" },
    [21] = { ["month"] = "Ventôse", ["day"] = "3", ["flavour"] = "du violier" },
    [22] = { ["month"] = "Ventôse", ["day"] = "4", ["flavour"] = "de la troène" },
    [23] = { ["month"] = "Ventôse", ["day"] = "5", ["flavour"] = "du bouc" },
    [24] = { ["month"] = "Ventôse", ["day"] = "6", ["flavour"] = "de l'asaret" },
    [25] = { ["month"] = "Ventôse", ["day"] = "7", ["flavour"] = "de l'alaterne" },
    [26] = { ["month"] = "Ventôse", ["day"] = "8", ["flavour"] = "de la violette" },
    [27] = { ["month"] = "Ventôse", ["day"] = "9", ["flavour"] = "du marceau" },
    [28] = { ["month"] = "Ventôse", ["day"] = "10", ["flavour"] = "de la bêche" }
  },
  [3] = { -- March
    [1] = { ["month"] = "Ventôse", ["day"] = "11", ["flavour"] = "de la narcisse" },
    [2] = { ["month"] = "Ventôse", ["day"] = "12", ["flavour"] = "de l'orme" },
    [3] = { ["month"] = "Ventôse", ["day"] = "13", ["flavour"] = "du fumeterre" },
    [4] = { ["month"] = "Ventôse", ["day"] = "14", ["flavour"] = "du vélar" },
    [5] = { ["month"] = "Ventôse", ["day"] = "15", ["flavour"] = "du chèvre" },
    [6] = { ["month"] = "Ventôse", ["day"] = "16", ["flavour"] = "de l'épinard" },
    [7] = { ["month"] = "Ventôse", ["day"] = "17", ["flavour"] = "de la doronic" },
    [8] = { ["month"] = "Ventôse", ["day"] = "18", ["flavour"] = "du mouron" },
    [9] = { ["month"] = "Ventôse", ["day"] = "19", ["flavour"] = "du cerfeuil" },
    [10] = { ["month"] = "Ventôse", ["day"] = "20", ["flavour"] = "du cordeau" },
    [11] = { ["month"] = "Ventôse", ["day"] = "21", ["flavour"] = "de la mandragore" },
    [12] = { ["month"] = "Ventôse", ["day"] = "22", ["flavour"] = "du persil" },
    [13] = { ["month"] = "Ventôse", ["day"] = "23", ["flavour"] = "de la cochléaria" },
    [14] = { ["month"] = "Ventôse", ["day"] = "24", ["flavour"] = "de la pâquerette" },
    [15] = { ["month"] = "Ventôse", ["day"] = "25", ["flavour"] = "du thon" },
    [16] = { ["month"] = "Ventôse", ["day"] = "26", ["flavour"] = "du pissenlit" },
    [17] = { ["month"] = "Ventôse", ["day"] = "27", ["flavour"] = "de la sylvie" },
    [18] = { ["month"] = "Ventôse", ["day"] = "28", ["flavour"] = "du capillaire" },
    [19] = { ["month"] = "Ventôse", ["day"] = "29", ["flavour"] = "du frêne" },
    [20] = { ["month"] = "Ventôse", ["day"] = "30", ["flavour"] = "du plantoir" },
    [21] = { ["month"] = "Germinal", ["day"] = "1", ["flavour"] = "de la primevère" },
    [22] = { ["month"] = "Germinal", ["day"] = "2", ["flavour"] = "du platane" },
    [23] = { ["month"] = "Germinal", ["day"] = "3", ["flavour"] = "de l'asperge" },
    [24] = { ["month"] = "Germinal", ["day"] = "4", ["flavour"] = "de la tulipe" },
    [25] = { ["month"] = "Germinal", ["day"] = "5", ["flavour"] = "de la poule" },
    [26] = { ["month"] = "Germinal", ["day"] = "6", ["flavour"] = "de la bette" },
    [27] = { ["month"] = "Germinal", ["day"] = "7", ["flavour"] = "du bouleau" },
    [28] = { ["month"] = "Germinal", ["day"] = "8", ["flavour"] = "de la joncquille" },
    [29] = { ["month"] = "Germinal", ["day"] = "9", ["flavour"] = "de l'aulne" },
    [30] = { ["month"] = "Germinal", ["day"] = "10", ["flavour"] = "du couvoir" },
    [31] = { ["month"] = "Germinal", ["day"] = "11", ["flavour"] = "de la pervenche" }
  },
  [4] = { -- April
    [1] = { ["month"] = "Germinal", ["day"] = "12", ["flavour"] = "du charme" },
    [2] = { ["month"] = "Germinal", ["day"] = "13", ["flavour"] = "de la morille" },
    [3] = { ["month"] = "Germinal", ["day"] = "14", ["flavour"] = "de l'hêtre" },
    [4] = { ["month"] = "Germinal", ["day"] = "15", ["flavour"] = "de l'abeille" },
    [5] = { ["month"] = "Germinal", ["day"] = "16", ["flavour"] = "de la laitue" },
    [6] = { ["month"] = "Germinal", ["day"] = "17", ["flavour"] = "de la mélèze" },
    [7] = { ["month"] = "Germinal", ["day"] = "18", ["flavour"] = "de la ciguë" },
    [8] = { ["month"] = "Germinal", ["day"] = "19", ["flavour"] = "du radis" },
    [9] = { ["month"] = "Germinal", ["day"] = "20", ["flavour"] = "de la ruche" },
    [10] = { ["month"] = "Germinal", ["day"] = "21", ["flavour"] = "du gainier" },
    [11] = { ["month"] = "Germinal", ["day"] = "22", ["flavour"] = "de la romaine" },
    [12] = { ["month"] = "Germinal", ["day"] = "23", ["flavour"] = "du marronier" },
    [13] = { ["month"] = "Germinal", ["day"] = "24", ["flavour"] = "de la roquette" },
    [14] = { ["month"] = "Germinal", ["day"] = "25", ["flavour"] = "du pigeon" },
    [15] = { ["month"] = "Germinal", ["day"] = "26", ["flavour"] = "du lilas" },
    [16] = { ["month"] = "Germinal", ["day"] = "27", ["flavour"] = "de l'anémone" },
    [17] = { ["month"] = "Germinal", ["day"] = "28", ["flavour"] = "de la pensée" },
    [18] = { ["month"] = "Germinal", ["day"] = "29", ["flavour"] = "de la myrtille" },
    [19] = { ["month"] = "Germinal", ["day"] = "30", ["flavour"] = "du greffoir" },
    [20] = { ["month"] = "Floréal", ["day"] = "1", ["flavour"] = "de la rose" },
    [21] = { ["month"] = "Floréal", ["day"] = "2", ["flavour"] = "du chène" },
    [22] = { ["month"] = "Floréal", ["day"] = "3", ["flavour"] = "de la fougère" },
    [23] = { ["month"] = "Floréal", ["day"] = "4", ["flavour"] = "de l'aubépine" },
    [24] = { ["month"] = "Floréal", ["day"] = "5", ["flavour"] = "du rossignol" },
    [25] = { ["month"] = "Floréal", ["day"] = "6", ["flavour"] = "de l'ancolie" },
    [26] = { ["month"] = "Floréal", ["day"] = "7", ["flavour"] = "du muguet" },
    [27] = { ["month"] = "Floréal", ["day"] = "8", ["flavour"] = "du champignon" },
    [28] = { ["month"] = "Floréal", ["day"] = "9", ["flavour"] = "de la hyacinthe" },
    [29] = { ["month"] = "Floréal", ["day"] = "10", ["flavour"] = "du râteau" },
    [30] = { ["month"] = "Floréal", ["day"] = "11", ["flavour"] = "de la rhubarbe" },
  },
  [5] = { -- Mai
    [1] = { ["month"] = "Floréal", ["day"] = "12", ["flavour"] = "du saintfoin" },
    [2] = { ["month"] = "Floréal", ["day"] = "13", ["flavour"] = "du bâton-d'or" },
    [3] = { ["month"] = "Floréal", ["day"] = "14", ["flavour"] = "du chamérisier" },
    [4] = { ["month"] = "Floréal", ["day"] = "15", ["flavour"] = "du ver à soie" },
    [5] = { ["month"] = "Floréal", ["day"] = "16", ["flavour"] = "de la consoude" },
    [6] = { ["month"] = "Floréal", ["day"] = "17", ["flavour"] = "de la pimprenelle" },
    [7] = { ["month"] = "Floréal", ["day"] = "18", ["flavour"] = "de la corbeille d'or" },
    [8] = { ["month"] = "Floréal", ["day"] = "19", ["flavour"] = "de l'arroche" },
    [9] = { ["month"] = "Floréal", ["day"] = "20", ["flavour"] = "du sarcloir" },
    [10] = { ["month"] = "Floréal", ["day"] = "21", ["flavour"] = "de ma statice" },
    [11] = { ["month"] = "Floréal", ["day"] = "22", ["flavour"] = "du fritillaire" },
    [12] = { ["month"] = "Floréal", ["day"] = "23", ["flavour"] = "de la bourrache" },
    [13] = { ["month"] = "Floréal", ["day"] = "24", ["flavour"] = "de la valériane" },
    [14] = { ["month"] = "Floréal", ["day"] = "25", ["flavour"] = "de la carpe" },
    [15] = { ["month"] = "Floréal", ["day"] = "26", ["flavour"] = "du fusain" },
    [16] = { ["month"] = "Floréal", ["day"] = "27", ["flavour"] = "de la civette" },
    [17] = { ["month"] = "Floréal", ["day"] = "28", ["flavour"] = "du buglosse" },
    [18] = { ["month"] = "Floréal", ["day"] = "29", ["flavour"] = "du sénevé" },
    [19] = { ["month"] = "Floréal", ["day"] = "30", ["flavour"] = "de la houlette" },
    [20] = { ["month"] = "Prairial", ["day"] = "1", ["flavour"] = "de la luzerne" },
    [21] = { ["month"] = "Prairial", ["day"] = "2", ["flavour"] = "de l'hémérocalle" },
    [22] = { ["month"] = "Prairial", ["day"] = "3", ["flavour"] = "du trèfle" },
    [23] = { ["month"] = "Prairial", ["day"] = "4", ["flavour"] = "de l'angélique" },
    [24] = { ["month"] = "Prairial", ["day"] = "5", ["flavour"] = "du canard" },
    [25] = { ["month"] = "Prairial", ["day"] = "6", ["flavour"] = "de la mélisse" },
    [26] = { ["month"] = "Prairial", ["day"] = "7", ["flavour"] = "du fromental" },
    [27] = { ["month"] = "Prairial", ["day"] = "8", ["flavour"] = "du martagon" },
    [28] = { ["month"] = "Prairial", ["day"] = "9", ["flavour"] = "du serpolet" },
    [29] = { ["month"] = "Prairial", ["day"] = "10", ["flavour"] = "du faux" },
    [30] = { ["month"] = "Prairial", ["day"] = "11", ["flavour"] = "de la fraise" },
    [31] = { ["month"] = "Prairial", ["day"] = "12", ["flavour"] = "de la bétoine" },
 },
 [6] = { -- June
   [1] = { ["month"] = "Prairial", ["day"] = "13", ["flavour"] = "du pois" },
   [2] = { ["month"] = "Prairial", ["day"] = "14", ["flavour"] = "de l'acacia" },
   [3] = { ["month"] = "Prairial", ["day"] = "15", ["flavour"] = "de la caille" },
   [4] = { ["month"] = "Prairial", ["day"] = "16", ["flavour"] = "de l'oeillet" },
   [5] = { ["month"] = "Prairial", ["day"] = "17", ["flavour"] = "du sureau" },
   [6] = { ["month"] = "Prairial", ["day"] = "18", ["flavour"] = "du pavot" },
   [7] = { ["month"] = "Prairial", ["day"] = "19", ["flavour"] = "du tilleul" },
   [8] = { ["month"] = "Prairial", ["day"] = "20", ["flavour"] = "de la fourche" },
   [9] = { ["month"] = "Prairial", ["day"] = "21", ["flavour"] = "du barbeau" },
   [10] = { ["month"] = "Prairial", ["day"] = "22", ["flavour"] = "de la camomille" },
   [11] = { ["month"] = "Prairial", ["day"] = "23", ["flavour"] = "du chèvrefeuille" },
   [12] = { ["month"] = "Prairial", ["day"] = "24", ["flavour"] = "du caille-lait" },
   [13] = { ["month"] = "Prairial", ["day"] = "25", ["flavour"] = "de la tanche" },
   [14] = { ["month"] = "Prairial", ["day"] = "26", ["flavour"] = "du jasmin" },
   [15] = { ["month"] = "Prairial", ["day"] = "27", ["flavour"] = "de la verveine" },
   [16] = { ["month"] = "Prairial", ["day"] = "28", ["flavour"] = "du thym" },
   [17] = { ["month"] = "Prairial", ["day"] = "29", ["flavour"] = "de la pivoine" },
   [18] = { ["month"] = "Prairial", ["day"] = "30", ["flavour"] = "du chariot" },
   [19] = { ["month"] = "Messidor", ["day"] = "1", ["flavour"] = "du seigle" },
   [20] = { ["month"] = "Messidor", ["day"] = "2", ["flavour"] = "de l'avoine" },
   [21] = { ["month"] = "Messidor", ["day"] = "3", ["flavour"] = "de l'oignon" },
   [22] = { ["month"] = "Messidor", ["day"] = "4", ["flavour"] = "de la véronique" },
   [23] = { ["month"] = "Messidor", ["day"] = "5", ["flavour"] = "du mulet" },
   [24] = { ["month"] = "Messidor", ["day"] = "6", ["flavour"] = "du romarin" },
   [25] = { ["month"] = "Messidor", ["day"] = "7", ["flavour"] = "du concombre" },
   [26] = { ["month"] = "Messidor", ["day"] = "8", ["flavour"] = "de l'échalotte" },
   [27] = { ["month"] = "Messidor", ["day"] = "9", ["flavour"] = "de l'absinthe" },
   [28] = { ["month"] = "Messidor", ["day"] = "10", ["flavour"] = "de la faucille" },
   [29] = { ["month"] = "Messidor", ["day"] = "11", ["flavour"] = "du coriandre" },
   [30] = { ["month"] = "Messidor", ["day"] = "12", ["flavour"] = "de l'artichaut" },
},
[7] = { -- July
  [1] = { ["month"] = "Messidor", ["day"] = "13", ["flavour"] = "de la giroflée" },
  [2] = { ["month"] = "Messidor", ["day"] = "14", ["flavour"] = "de la lavande" },
  [3] = { ["month"] = "Messidor", ["day"] = "15", ["flavour"] = "du chamois" },
  [4] = { ["month"] = "Messidor", ["day"] = "16", ["flavour"] = "du tabac" },
  [5] = { ["month"] = "Messidor", ["day"] = "17", ["flavour"] = "de la groseille" },
  [6] = { ["month"] = "Messidor", ["day"] = "18", ["flavour"] = "de la gesse" },
  [7] = { ["month"] = "Messidor", ["day"] = "19", ["flavour"] = "de la cerise" },
  [8] = { ["month"] = "Messidor", ["day"] = "20", ["flavour"] = "du parc" },
  [9] = { ["month"] = "Messidor", ["day"] = "21", ["flavour"] = "de la menthe" },
  [10] = { ["month"] = "Messidor", ["day"] = "22", ["flavour"] = "du cumin" },
  [11] = { ["month"] = "Messidor", ["day"] = "23", ["flavour"] = "de l'haricot" },
  [12] = { ["month"] = "Messidor", ["day"] = "24", ["flavour"] = "de l'orcanète" },
  [13] = { ["month"] = "Messidor", ["day"] = "25", ["flavour"] = "de la pintade" },
  [14] = { ["month"] = "Messidor", ["day"] = "26", ["flavour"] = "de la sauge" },
  [15] = { ["month"] = "Messidor", ["day"] = "27", ["flavour"] = "de l'ail" },
  [16] = { ["month"] = "Messidor", ["day"] = "28", ["flavour"] = "de la vesce" },
  [17] = { ["month"] = "Messidor", ["day"] = "29", ["flavour"] = "du blé" },
  [18] = { ["month"] = "Messidor", ["day"] = "30", ["flavour"] = "de la chalemie" },
  [19] = { ["month"] = "Thermidor", ["day"] = "1", ["flavour"] = "de l'épeautre" },
  [20] = { ["month"] = "Thermidor", ["day"] = "2", ["flavour"] = "du bouillon-blanc" },
  [21] = { ["month"] = "Thermidor", ["day"] = "3", ["flavour"] = "du melon" },
  [22] = { ["month"] = "Thermidor", ["day"] = "4", ["flavour"] = "de l'ivraie" },
  [23] = { ["month"] = "Thermidor", ["day"] = "5", ["flavour"] = "du bélier" },
  [24] = { ["month"] = "Thermidor", ["day"] = "6", ["flavour"] = "des prêles" },
  [25] = { ["month"] = "Thermidor", ["day"] = "7", ["flavour"] = "de l'armoise" },
  [26] = { ["month"] = "Thermidor", ["day"] = "8", ["flavour"] = "de la carthame" },
  [27] = { ["month"] = "Thermidor", ["day"] = "9", ["flavour"] = "de la mûre" },
  [28] = { ["month"] = "Thermidor", ["day"] = "10", ["flavour"] = "de l'arrosoir" },
  [29] = { ["month"] = "Thermidor", ["day"] = "11", ["flavour"] = "des panic" },
  [30] = { ["month"] = "Thermidor", ["day"] = "12", ["flavour"] = "de la salicorne" },
  [31] = { ["month"] = "Thermidor", ["day"] = "13", ["flavour"] = "de l'abricot" },
}
  -- and so on
}

local function currentRepublicanDate(month, day)
  local d = calMap[month][day]
  return d.month, d.day, d.flavour
end

local function computeMotd()
  local date = C_DateAndTime.GetCurrentCalendarTime()
  local month, day, flavour = currentRepublicanDate(date.month, date.monthDay)
  -- hardcoded year for now
  local year = "232"
  return string.format("Bonjour, nous sommes le %s %s %s, jour %s.", day, month, year, flavour)
end

local function checkMotd()
  if not CalChnipDB.enabled then return end
  local currentMotd = GetGuildRosterMOTD()
  local computedMotd = computeMotd()
  if currentMotd ~= computedMotd then
    if CanEditMOTD() then GuildSetMOTD(computedMotd) end
  end
  local date = C_DateAndTime.GetCurrentCalendarTime()
  local secondsToNextDay =
    86400 - date.hour * 3600 - date.minute * 60 + 60
  -- should check again right after midnight
  C_Timer.After(secondsToNextDay, checkMotd)
end

local function onEvent(self, event, addOnName)
  if addOnName == "CalChnip" then
    CalChnipDB = CalChnipDB or {}
    if CalChnipDB.enabled == nil then
      CalChnipDB.enabled = true
    end
    if CalChnipDB.enabled then
      print("CalChnip is enabled")
    end
    checkMotd()
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", onEvent)

SLASH_CALCHNIP1 = "/calchnip"

SlashCmdList.CALCHNIP = function(arg)
  if (arg == "on" and not CalChnipDB.enabled) then
    CalChnipDB.enabled = true
    print("CalChnip enabled!")
    checkMotd()
  elseif (arg == "off" and CalChnipDB.enabled) then
    CalChnipDB.enabled = false
    print("You disabled CalChnip :(")
  end
end
