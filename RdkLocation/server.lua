ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('rdk:location')
AddEventHandler('rdk:location', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(prix)
	TriggerClientEvent('esx:showNotification', source, "~r~RDK~b~ : ~y~Bonne route ! ")

end)