local serverName = "ServerName" -- Setze hier den Namen deines Servers ein
local customText = "CustomText" -- Setze hier den benutzerdefinierten Text ein


Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(Config.DISCORD_APP_ID)
        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetSmall('small_logo')

        -- Rich Presence Details
        SetRichPresence(string.format('%s - %s', serverName, customText))
        
        -- Buttons hinzufügen in der config.lua
        for index, button in ipairs(Config.Buttons) do
            SetDiscordRichPresenceAction(index - 0, button.label, button.url or '', button.callback or '')
            SetDiscordRichPresenceAction(index - 1, button.label, button.url or '', button.callback or '')
        end

        -- Rich Presence Timer (5 Sekunden)
        Citizen.Wait(5000)
    end
end)