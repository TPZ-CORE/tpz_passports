
-----------------------------------------------------------
--[[ Local Functions ]]--
-----------------------------------------------------------

ToggleUI = function(display)

	SetNuiFocus(false,false)

    if not display then
        DisplayingNUI = false

        GetPlayerData().HasNUIActive = false
    end

    SendNUIMessage({ type = "enable", enable = display })
end

-----------------------------------------------------------
--[[ Functions ]]--
-----------------------------------------------------------

function CloseNUI()
    SendNUIMessage({action = 'close'})
end

-----------------------------------------------------------
--[[ General Events ]]--
-----------------------------------------------------------

RegisterNetEvent("tpz_passports:client:onPassportItemUse")
AddEventHandler("tpz_passports:client:onPassportItemUse", function(data)
    local PlayerData   = GetPlayerData()
    local PassportData = data

    -- Player has already a passport nui display active, we return it.s
    if PlayerData.HasNUIActive then
        return
    end

    PlayerData.HasNUIActive = true

    SendNUIMessage({ 
        action = 'updateInformation',

        info = {
            firstname    = PassportData.firstname, 
            lastname     = PassportData.lastname,
            dob          = PassportData.dob,
            sex          = Locales['SEX_' .. tostring(PassportData.sex)],
            identity_id  = PassportData.identityId,
            avatar_url   = PassportData.avatar_url,
            expiration   = string.format(Locales['PASSPORT_DISPLAY_EXPIRATION_TITLE'], PassportData.expiration_date),
        },

        locales = {
            fullname     = Locales['PASSPORT_DISPLAY_FULL_NAME_TITLE'], 
            dob          = Locales['PASSPORT_DISPLAY_DOB_TITLE'],
            sex          = Locales['PASSPORT_DISPLAY_SEX_TITLE'],
            signature    = Locales['PASSPORT_DISPLAY_SIGNATURE_TITLE'],
        },

    })

    ToggleUI(true)

    Wait(1000 * Config.AutomaticallyClosePassportDelayDuration)
    CloseNUI()
end)

-----------------------------------------------------------
--[[ NUI Callbacks  ]]--
-----------------------------------------------------------

RegisterNUICallback('close', function()
	ToggleUI(false)
end)
