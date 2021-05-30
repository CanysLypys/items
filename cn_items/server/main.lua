ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterUsableItem("wuerfel", function(source)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem("wuerfel", 1)

	TriggerClientEvent("cn:wuerfeln", source)
end)

ESX.RegisterUsableItem("lappen", function(source)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem("lappen", 1)

	TriggerClientEvent("cn:lappen", source)
end)
