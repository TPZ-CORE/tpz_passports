local TPZ = exports.tpz_core:getCoreAPI()

-----------------------------------------------------------
--[[ Callbacks  ]]--
-----------------------------------------------------------

TPZ.addNewCallBack("tpz_passports:callbacks:isRegistered", function(source, cb)
    local _source        = source
	local xPlayer        = TPZ.GetPlayer(_source)
	local charIdentifier = xPlayer.getCharacterIdentifier()

	local finished, isRegistered, identityData = false, false, {}

    exports["ghmattimysql"]:execute("SELECT * FROM `passports` WHERE `charidentifier` = @charidentifier", { ['charidentifier'] = charIdentifier }, function(result)
		
		if result and result[1] then
			identityData = result[1]
			isRegistered = true
		end

		finished = true

	end)

	while not finished do
		Wait(500)
	end

	return cb( { registered = isRegistered, data = identityData })

end)
