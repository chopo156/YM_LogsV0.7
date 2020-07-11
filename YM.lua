local ym = message

local YM_System = "https://discordapp.com/api/webhooks/716206916476338176/UZun8U1_wX18NsuBB0qZwgsL2SxP6GxN-1U10lKJHNMtV0KS3u85nPnCRhtuoUnwIyst"
local systemtime = os.date("%Y/%m/%d %X")
AddEventHandler("onServerResourceStart", function(resource)
    if GetCurrentResourceName() == resource then
        local ServerName = GetConvar("sv_hostname")
        local client = GetConvar("sv_maxclients")
        sendToDiscord('**\n\nServer Name : ** ```' .. ServerName .. ' is using YM_Logs ```  ** \n\n** **[Private Server Info]** \n ** Max Players :** ```' ..client.. '```\n\n  **time :  **\n```'.. systemtime ..  '```\n\n**Resource File :  ** ```\n'  ..GetResourcePath(GetCurrentResourceName()).. '``` \n\n ```System By Yrahmial```\n ``` [Resources]: '..GetNumResources().. '```')
    end
end)

function sendToDiscord(ym, color)
    local connect = {
          {
              ['color'] = 9312783, -- here you can change the color!!
              ['title'] = '**YM_Logs is in use**',
              ['description'] = ym,
              ['footer'] = {
              ['text'] = os.date("%Y/%m/%d %X"),
              },
          }
      }
      PerformHttpRequest(YM_System, function(err, text, headers) end, 'POST', json.encode({username = "YM_Logs | System", embeds = connect}), { ['Content-Type'] = 'application/json' })
end
