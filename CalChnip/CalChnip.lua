-- mapping from gregorian to republican calendar
-- réf: <https://fr.wikipedia.org/wiki/Calendrier_r%C3%A9publicain>
-- TODO: complete the mapping
local calMap = {
  [2] = { -- February
    [13] = { ["month"] = "Pluviôse", ["day"] = "25", ["flavour"] = "lièvre" },
    [14] = { ["month"] = "Pluviôse", ["day"] = "26", ["flavour"] = "guède" },
    [15] = { ["month"] = "Pluviôse", ["day"] = "27", ["flavour"] = "noisetier" }
  },
  [3] = { -- March
    [1] = { ["month"] = "Ventôse", ["day"] = "11", ["flavour"] = "narcisse" },
    [2] = { ["month"] = "Ventôse", ["day"] = "12", ["flavour"] = "orme" },
    [3] = { ["month"] = "Ventôse", ["day"] = "13", ["flavour"] = "fumeterre" }
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
  return string.format("Bonjour, nous sommes le %s %s %s, jour du %s.", day, month, year, flavour)
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
