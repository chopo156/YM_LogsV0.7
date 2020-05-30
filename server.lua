----------------------------
-- Coded By Yrahmial#7579 --
----------------------------

local YM_WebHook = 'https://discordapp.com/api/webhooks/713970556629811230/zIB5n9G66leV-AWSJQLqfSFoSBPOKe8Etjl-dlenXSFPfl5p-A7mkutmj5QznCHp2QWb'
local YM_image = 'https://cdn.discordapp.com/attachments/713810142654627920/714112730285736027/fdg.png'
--local LogsName = 'YM_Logs | By Yrahmial'
local ym = message
local YM = playername
local time = os.date("%Y/%m/%d %X")



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
        sendToDiscord ('[Server Status] \n\n On \n\n')
        PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'YM_Logs | By Yrahmial', embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
    end
end)



AddEventHandler('onServerResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        sendToDiscord ('[Server Status] \n\n off \n\n')
        PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'YM_Logs | By Yrahmial', embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
    end
end)



function sendToDiscord(YM, ym, color)
  local connect = {
        {
            ['color'] = 0255196,
            ['title'] = '**'.. YM ..'**',
            ['description'] = ym,
            ['footer'] = {
            --['text'] = LogsName,
            ['text'] = '**'.. time ..'**',
            },
        }
    }
  PerformHttpRequest(YM_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'YM_Logs | By Yrahmial', embeds = connect, avatar_url = YM_image}), { ['Content-Type'] = 'application/json' })
end
