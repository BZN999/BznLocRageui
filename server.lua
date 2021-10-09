ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{bzn}::bzn:payments')
AddEventHandler('::{bzn}::bzn:payments', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local Prix = 2500
    local _source = source
    if xPlayer.getMoney() >= Prix then
        xPlayer.removeMoney(2500)
	elseif xPlayer.getMoney() <= 2500 then
        xPlayer.removeMoney(2500)
    end
end)

RegisterServerEvent('::{bzn}::bzn:paymentshelico')
AddEventHandler('::{bzn}::bzn:paymentshelico', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local Prix = 32550
    local _source = source
    if xPlayer.getMoney() >= Prix then
        xPlayer.removeMoney(32550)
	elseif xPlayer.getMoney() <= 32550 then
        xPlayer.removeMoney(32550)
    end
end)