----------------------------
-- Coded By Yrahmial#7579 --
----------------------------

local YM_WebHook = 'https://discordapp.com/api/webhooks/713970556629811230/zIB5n9G66leV-AWSJQLqfSFoSBPOKe8Etjl-dlenXSFPfl5p-A7mkutmj5QznCHp2QWb'
local YM_image = 'https://cdn.discordapp.com/attachments/713810142654627920/714112730285736027/fdg.png'
--local LogsName = 'YM_Logs | By Yrahmial'
local ym = message
local YM = name
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
    local playerIP = GetPlayerEndpoint(source)
    local playerPing = GetPlayerPing(source)
    sendToDiscord('[Player Connecting] \n\n Player Name  ```' .. GetPlayerName(source) .. '``` \n\n Player IP   ```' .. playerPing .. '``` \n\n', 'Player Ping ```' .. playerPing .. '```')
end)



AddEventHandler('playerDropped', function(reason) 
    local playerIP = GetPlayerEndpoint(source)
    local playerPing = GetPlayerPing(source)
    sendToDiscord('[Player Disconnect] \n\n Player Name   ```' .. GetPlayerName(source) .. '``` \n\n Player IP  ```' .. playerIP .. '```\n\n Reason    ```' .. reason .. '```')
end)



AddEventHandler('chatMessage', function(source, YM, ym)
    local name = GetPlayerName(source)
    sendToDiscord(YM, ym)
    PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username =  name .. " | " .. GetPlayerIdentifier(source), embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
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
              ['color'] = 255, 0, 0, -- here you can change the color!!
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
