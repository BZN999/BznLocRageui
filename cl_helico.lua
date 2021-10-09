_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

BznTesjs, BlipActifHH, Logo = false, false, "~g~$"

ESX = nil

local GarageIsActiveH = false

local BZNH1 = {coords = vector3(1672.41, 3243.06, 40.7)}
local BZNH2 = {coords = vector3(4420.84, -4520.05, 4.19)}


ActiverBlipH = true
ActiverMarkerH = true
ActiverPNJH = true

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) 
	PlayerData.job = job
    Citizen.Wait(5000) 
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	
	RMenu.Add('main', 'lochelico', RageUI.CreateMenu("Location Hélicoptère", ""))
	RMenu.Add('main', 'bznheli', RageUI.CreateSubMenu(RMenu:Get('main', 'lochelico'), "Location Hélicoptère", ""))
    RMenu:Get('main', 'lochelico'):SetSubtitle("~w~")
	RMenu:Get('main', 'bznheli'):SetSubtitle("~w~")
    RMenu:Get('main', 'lochelico').EnableMouse = false
    RMenu:Get('main', 'lochelico').Closed = function()

		GarageIsActiveH = false

    end
end)

PNJH = {
    [1] = {
        ["Emplacement"] = {
            ["x"] = 1736.65, ['y'] = 3293.36, ['z'] = 40.16, ['h'] = 190.99,
            ["modelHash"] = "a_m_m_bevhills_02"
        }
    },
    [2] = {
        ["Emplacement"] = {
            ["x"] = 4446.21, ['y'] = -4478.65, ['z'] = 3.33, ['h'] = 201.83,
            ["modelHash"] = "a_m_m_bevhills_02"
        }
    },
}

LocHeli = { 
	{x = 1737.04 , y = 3292.12, z = 41.16 },
    {x = 4446.6 , y = -4479.6, z = 4.3 },
}

function openBZNHeli()
    if GarageIsActiveH then
        GarageIsActiveH = false
        return
    else
        GarageIsActiveH = true
        RageUI.Visible(RMenu:Get('main', 'lochelico'), true)

        Citizen.CreateThread(function()
            while GarageIsActiveH do
                RageUI.IsVisible(RMenu:Get('main', 'lochelico'), true, true, true, function()     
                    RageUI.Button("Hélicoptère", "Choix des hélicoptères disponibles à la location", {},true, function()
                    end, RMenu:Get('main', 'bznheli'))
                end, function()
                end)
                
                RageUI.IsVisible(RMenu:Get('main', 'bznheli'), true, true, true, function()                   

					RageUI.Button("Frogger", nil, {RightLabel = "Prix: ~g~32550 ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1672.41, 3243.06, 40.7, true) <= 100 then
								local vehi = ESX.Game.SpawnVehicle("frogger", BZNH1.coords, 112.67, function(vehi)
            					TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehi, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Frogger~s~ \n~g~pour 32550 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:paymentshelico')
                            elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4420.84, -4520.05, 4.19, true) <= 100 then
								local vehi = ESX.Game.SpawnVehicle("frogger", BZNH2.coords, 110.21, function(vehi)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehi, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Frogger~s~ \n~g~pour 32550 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:paymentshelico')
							else
								ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location d'hélicoptère")
							end
                            RageUI.CloseAll()
                        	GarageActive = false
                        end
                    end)
                    RageUI.Button("Hélicoptère LSPD", nil, {RightLabel = "Prix: ~g~Service ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'bcso' or ESX.PlayerData.job.name == 'police' then
								if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1672.41, 3243.06, 40.7, true) <= 100 then
									local vehi = ESX.Game.SpawnVehicle("as350", BZNH1.coords, 112.67, function(vehi)
            						TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehi, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~Hélicoptère~s~ \n~r~de police !')
									end)
								elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4420.84, -4520.05, 4.19, true) <= 100 then
									local vehi = ESX.Game.SpawnVehicle("as350", BZNH2.coords, 110.21, function(vehi)
									TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehi, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~Hélicoptère~s~ \n~r~de police !')
									end)
								else
									ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location de Hélicoptère")
								end
							else
								ESX.ShowNotification("~r~Vous n'êtes pas policier !")
							end
                            RageUI.CloseAll()
                        	GarageActive = false
                        end
                    end)
                end, function()
				end)
                Wait(0)
            end
        end, function()
        end, 1)
    end
end


Citizen.CreateThread(function()
	while true do
           Citizen.Wait(0)
         if ActiverBlipH then
           if not BlipActifH then
		for _, PosBlipsH in pairs(LocHeli) do
		  InfosBlips = AddBlipForCoord(PosBlipsH.x, PosBlipsH.y, PosBlipsH.z)
      		  SetBlipSprite(InfosBlips, 602)
      		  SetBlipDisplay(InfosBlips, 2)
      		  SetBlipScale(InfosBlips, 0.6)
      		  SetBlipColour(InfosBlips, 1)
      		  SetBlipAsShortRange(InfosBlips, true)
	  	      BeginTextCommandSetBlipName("STRING")
      		  AddTextComponentString("Location Hélicoptère")
                  EndTextCommandSetBlipName(InfosBlips)
                  BlipActifH = true         
                end
           else
           end
         end
	end
end)

Citizen.CreateThread(function()
   while true do
        Citizen.Wait(0)
      if ActiverMarkerH then
	for _, PositionHelico in pairs(LocHeli) do
	       DrawMarker(21, PositionHelico.x, PositionHelico.y, PositionHelico.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, false, false, false, false)
        end
      end
   end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(LocHeli) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, LocHeli[k].x, LocHeli[k].y, LocHeli[k].z)

            if dist <= 1.0 then

               RageUI.Text({
                    message = "Appuyez sur [~r~E~w~] pour parler au ~r~Loueur",
                    time_display = 1
                })
                if IsControlJustPressed(1,51) then
                    openBZNHeli()
                end
            end
        end
    end
end)

RecupModelPNJH = function(modelHash)
    if type(modelHash) == "string" then modelHash = GetHashKey(modelHash) end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0)
    end
end

Citizen.CreateThread(function()
    for i=1, #PNJH do
        local pnj = PNJH[i]["Emplacement"]
        if ActiverPNJH then
            pnj["modelHash"] = pnj["modelHash"]
            RecupModelPNJH(pnj["modelHash"])
            if not DoesEntityExist(pnj["entity"]) then
                pnj["entity"] = CreatePed(4, pnj["modelHash"], pnj["x"], pnj["y"], pnj["z"], pnj["h"])
                SetEntityAsMissionEntity(pnj["entity"])
                SetBlockingOfNonTemporaryEvents(pnj["entity"], true)
                FreezeEntityPosition(pnj["entity"], true)
                SetEntityInvincible(pnj["entity"], true)
            end
            SetModelAsNoLongerNeeded(pnj["modelHash"])
        end
    end
end)