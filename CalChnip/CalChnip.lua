local addonName, ns = ...
local YEAR_ONE = 1792

local function cutePrint(s)
  print(string.format("\124cff008080%s\124r", s))
end

local function isEmpty(s)
  return s == nil or s == ''
end

local function fallEquinoxDate(year)
  if year % 4 <= 1 then
    return date("*t", time({year=year, month=9, day=22}))
  else
    return date("*t", time({year=year, month=9, day=23}))
  end
end

local function lastFallEquinox(d)
  local curDate = fallEquinoxDate(d.year)
  if d.yday < curDate.yday then
    return fallEquinoxDate(d.year - 1)
  else
    return curDate
  end
end

local function dayAndYearOfRepublicanYear(d)
  local equinox = lastFallEquinox(d)
  if d.year == equinox.year and d.yday >= equinox.yday then
    return d.yday - equinox.yday + 1, d.year - YEAR_ONE + 1
  else
    return date("*t", time({year=equinox.year, month=12, day=31})).yday - equinox.yday + d.yday + 1, d.year - YEAR_ONE
  end
end

local function computeMotd(date)
  local day, year = dayAndYearOfRepublicanYear(date)
  local dayData = ns.calMap[day]
  if day <= 360 then
    return string.format("Bonjour, nous sommes le %s %s %s, jour %s.", dayData.day, dayData.month, year, dayData.flavour)
  else
    return string.format("Bonjour, nous sommes le %s de l'an %s.", dayData.name, year)
  end
end

local function checkMotd()
  if not CalChnipDB.enabled then return end
  local date = date("*t")
  local currentMotd = GetGuildRosterMOTD()
  local computedMotd = computeMotd(date)
  if isEmpty(currentMotd) or currentMotd ~= computedMotd then
    if CanEditMOTD() then GuildSetMOTD(computedMotd) end
  end
  local secondsToNextDay =
    86400 - date.hour * 3600 - date.min * 60 - date.sec + 1
  -- should check again right after midnight
  C_Timer.After(secondsToNextDay, checkMotd)
end

local function onEnteringWorldEvent(self, event, isLogin, isReload)
  if isLogin then
    CalChnipDB = CalChnipDB or {}
    if CalChnipDB.enabled == nil then
      CalChnipDB.enabled = true
    end
    if CalChnipDB.enabled then
      cutePrint("CalChnip is enabled")
    end
    checkMotd()
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", onEnteringWorldEvent)

SLASH_CALCHNIP1 = "/calchnip"

SlashCmdList.CALCHNIP = function(arg)
  if (arg == "on" and not CalChnipDB.enabled) then
    CalChnipDB.enabled = true
    cutePrint("CalChnip enabled!")
    checkMotd()
  elseif (arg == "off" and CalChnipDB.enabled) then
    CalChnipDB.enabled = false
    cutePrint("You disabled CalChnip :(")
  elseif (arg == "check" and CalChnipDB.enabled) then
    cutePrint("Checking motd")
    checkMotd()
  elseif arg:sub(1, 4) == "show" then
    local y = tonumber(arg:sub(6, 9))
    local m = tonumber(arg:sub(11, 12))
    local d = tonumber(arg:sub(14, 15))
    local ref = date("*t", time({year=y, month=m, day=d}))
    cutePrint(computeMotd(ref))
  end
end
