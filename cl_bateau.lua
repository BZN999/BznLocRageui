_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

BznTesjs, BlipActif, Logo = false, false, "~g~$"

ESX = nil

local GarageIsActive = false

local BZN1 = {coords = vector3(1305.85, -3348.48, 1.02)}
local BZN2 = {coords = vector3(1336.84, 4213.01, 29.67)}
local BZN3 = {coords = vector3(-1798.84, -1243.08, 0.1)}
local BZN4 = {coords = vector3(-715.86, -1343.13, -0.52)}
local BZN5 = {coords = vector3(4934.24, -5154.63, 0.09)}
local BZN6 = {coords = vector3(-309.58, 6647.4, -0.02)}

ActiverBlip = true
ActiverMarker = true
ActiverPNJB = true

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
	
	RMenu.Add('main', 'locbateaux', RageUI.CreateMenu("Location Bateau", ""))
	RMenu.Add('main', 'plage', RageUI.CreateSubMenu(RMenu:Get('main', 'locbateaux'), "Location Bateau", ""))
    RMenu:Get('main', 'locbateaux'):SetSubtitle("~w~")
	RMenu:Get('main', 'plage'):SetSubtitle("~w~")
    RMenu:Get('main', 'locbateaux').EnableMouse = false
    RMenu:Get('main', 'locbateaux').Closed = function()

		GarageIsActive = false

    end
end)

PNJB = {
    [1] = {
        ["Emplacement"] = {
            ["x"] = 1297.27, ['y'] = -3348.8, ['z'] = 4.9, ['h'] = 36.34,
            ["modelHash"] = "a_m_m_bevhills_02"
        }
    },
    [2] = {
        ["Emplacement"] = {
            ["x"] = 4931.41, ['y'] = -5146.35, ['z'] = 1.47, ['h'] = 246.89,
            ["modelHash"] = "a_m_m_bevhills_02"
        },
    },
    [3] = {
        ["Emplacement"] = {
            ["x"] = -1805.56, ['y'] = -1232.51, ['z'] = 0.6, ['h'] = 145.27,
            ["modelHash"] = "a_m_m_bevhills_02"
        },
	},
	[4] = {
		["Emplacement"] = {
			["x"] = 1338.84, ['y'] = 4225.69, ['z'] = 32.92, ['h'] = 82.83,
			["modelHash"] = "a_m_m_bevhills_02"
		},
    },
	[5] = {
		["Emplacement"] = {
			["x"] = -263.39, ['y'] = 6640.76, ['z'] = 6.53, ['h'] = 129.29,
			["modelHash"] = "a_m_m_bevhills_02"
		},
    },
}

PosLocation = { 
	{x = 1296.77 , y = -3348.17, z = 5.9, },
	{x = 1337.76 , y = 4225.82, z = 33.92, },
	{x = -1806.34 , y = -1233.54, z = 1.55, },
	{x = 4932.27 , y = -5146.75, z = 2.46, },
	{x = -263.83, y = 6640.21, z = 7.51}
}

function openBZNbateau()
    if GarageIsActive then
        GarageIsActive = false
        return
    else
        GarageIsActive = true
        RageUI.Visible(RMenu:Get('main', 'locbateaux'), true)

        Citizen.CreateThread(function()
            while GarageIsActive do
                RageUI.IsVisible(RMenu:Get('main', 'locbateaux'), true, true, true, function()     
                    RageUI.Button("Bateaux", "Choix des bateaux disponibles à la location", {},true, function()
                    end, RMenu:Get('main', 'plage'))
                end, function()
                end)
                
                RageUI.IsVisible(RMenu:Get('main', 'plage'), true, true, true, function()                   

					RageUI.Button("Seashark", nil, {RightLabel = "Prix: ~g~2500 ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1296.77, -3348.17, 5.9, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("seashark", BZN1.coords, 254.51, function(veh)
            					TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Jetski~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1336.84, 4213.01, 29.67, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("seashark", BZN2.coords, 185.03, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Jetski~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1798.84, -1243.08, 0.1, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("seashark", BZN3.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Jetski~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -720.02, -1325.73, 0.6, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("seashark", BZN4.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Jetski~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4932.27, -5146.75, 2.46, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("seashark", BZN5.coords, 63.41, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Jetski~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -263.83, 6640.21, 7.51, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("seashark", BZN6.coords, 36.18, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Jetski~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							else
								ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location de bateaux")
							end
                            RageUI.CloseAll()
                        	GarageActive = false
                        end
                    end)
					RageUI.Button("Dinghy", nil, {RightLabel = "Prix: ~g~2500 ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1296.77, -3348.17, 5.9, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("dinghy", BZN1.coords, 254.51, function(veh)
            					TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Dinghy~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1336.84, 4213.01, 29.67, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("dinghy", BZN2.coords, 185.03, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Dinghy~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1798.84, -1243.08, 0.1, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("dinghy", BZN3.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Dinghy~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -720.02, -1325.73, 0.6, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("dinghy", BZN4.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Dinghy~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4932.27, -5146.75, 2.46, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("dinghy", BZN5.coords, 63.41, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Dinghy~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -263.83, 6640.21, 7.51, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("dinghy", BZN6.coords, 36.18, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Dinghy~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							else
								ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location de bateaux")
							end
                            RageUI.CloseAll()
                        	GarageActive = false
                        end
                    end)
					RageUI.Button("Speeder", nil, {RightLabel = "Prix: ~g~2500 ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1296.77, -3348.17, 5.9, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("speeder", BZN1.coords, 254.51, function(veh)
            					TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Speeder~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1336.84, 4213.01, 29.67, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("speeder", BZN2.coords, 185.03, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Speeder~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1798.84, -1243.08, 0.1, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("speeder", BZN3.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Speeder~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -720.02, -1325.73, 0.6, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("speeder", BZN4.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Speeder~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4932.27, -5146.75, 2.46, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("speeder", BZN5.coords, 63.41, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Speeder~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -263.83, 6640.21, 7.51, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("speeder", BZN6.coords, 36.18, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Speeder~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							else
								ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location de bateaux")
							end
                            RageUI.CloseAll()
                        	GarageActive = false
                        end
                    end)
					RageUI.Button("Tropic", nil, {RightLabel = "Prix: ~g~2500 ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1296.77, -3348.17, 5.9, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("tropic", BZN1.coords, 254.51, function(veh)
            					TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Tropic~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1336.84, 4213.01, 29.67, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("tropic", BZN2.coords, 185.03, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Tropic~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1798.84, -1243.08, 0.1, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("tropic", BZN3.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Tropic~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -720.02, -1325.73, 0.6, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("tropic", BZN4.coords, 209.28, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Tropic~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4932.27, -5146.75, 2.46, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("tropic", BZN5.coords, 63.41, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Tropic~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -263.83, 6640.21, 7.51, true) <= 100 then
								local veh = ESX.Game.SpawnVehicle("tropic", BZN6.coords, 36.18, function(veh)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								ESX.ShowNotification('Vous avez loué un ~b~Tropic~s~ \n~g~pour 2500 $ !')
								end)
								TriggerServerEvent('::{bzn}::bzn:payments')
							else
								ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location de bateaux")
							end
                            RageUI.CloseAll()
                        	GarageActive = false
                        end
                    end)
					RageUI.Button("Predator LSPD", nil, {RightLabel = "Prix: ~g~Service ~w~→"}, true, function(Hovered, Active, Selected)
						if (Selected) then
							if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'bcso' or ESX.PlayerData.job.name == 'police' then
								if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1296.77, -3348.17, 5.9, true) <= 100 then
									local veh = ESX.Game.SpawnVehicle("predator", BZN1.coords, 254.51, function(veh)
            						TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~bateau~s~ \n~r~de police !')
									end)
								elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1336.84, 4213.01, 29.67, true) <= 100 then
									local veh = ESX.Game.SpawnVehicle("predator", BZN2.coords, 185.03, function(veh)
									TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~bateau~s~ \n~r~de police !')
									end)
								elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1798.84, -1243.08, 0.1, true) <= 100 then
									local veh = ESX.Game.SpawnVehicle("predator", BZN3.coords, 209.28, function(veh)
									TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~bateau~s~ \n~r~de police !')
									end)
								elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -720.02, -1325.73, 0.6, true) <= 100 then
									local veh = ESX.Game.SpawnVehicle("predator", BZN4.coords, 209.28, function(veh)
									TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~bateau~s~ \n~r~de police !')
									end)
								elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 4932.27, -5146.75, 2.46, true) <= 100 then
									local veh = ESX.Game.SpawnVehicle("predator", BZN5.coords, 63.41, function(veh)
									TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~bateau~s~ \n~r~de police !')
									end)
								elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -263.83, 6640.21, 7.51, true) <= 100 then
									local veh = ESX.Game.SpawnVehicle("predator", BZN6.coords, 36.18, function(veh)
									TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
									ESX.ShowNotification('Vous avez sorti un ~b~bateau~s~ \n~r~de police !')
									end)
									TriggerServerEvent('::{bzn}::bzn:payments')
								else
									ESX.ShowNotification("Vous n'êtes pas assez proche d'un lieu de location de bateaux")
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
         if ActiverBlip then
           if not BlipActif then
		for _, PosBlips in pairs(PosLocation) do
		  InfosBlips = AddBlipForCoord(PosBlips.x, PosBlips.y, PosBlips.z)
      		  SetBlipSprite(InfosBlips, 410)
      		  SetBlipDisplay(InfosBlips, 2)
      		  SetBlipScale(InfosBlips, 0.6)
      		  SetBlipColour(InfosBlips, 60)
      		  SetBlipAsShortRange(InfosBlips, true)
	  	  BeginTextCommandSetBlipName("STRING")
      		  AddTextComponentString("Location Bateau")
                  EndTextCommandSetBlipName(InfosBlips)
                  BlipActif = true         
                end
           else
           end
         end
	end
end)

Citizen.CreateThread(function()
   while true do
        Citizen.Wait(0)
      if ActiverMarker then
	for _, PositionLocation in pairs(PosLocation) do
	       DrawMarker(21, PositionLocation.x, PositionLocation.y, PositionLocation.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 220, 255, 0, 100, false, true, 2, false, false, false, false)
        end
      end
   end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(PosLocation) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, PosLocation[k].x, PosLocation[k].y, PosLocation[k].z)

            if dist <= 1.0 then

               RageUI.Text({
                    message = "Appuyez sur [~y~E~w~] pour parler au ~y~Loueur",
                    time_display = 1
                })
               -- ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour acceder au ~b~Shop")
                if IsControlJustPressed(1,51) then
                    openBZNbateau()
                end
            end
        end
    end
end)

RecupModelPNJB = function(modelHash)
    if type(modelHash) == "string" then modelHash = GetHashKey(modelHash) end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0)
    end
end

Citizen.CreateThread(function()
    for i=1, #PNJB do
        local pnj = PNJB[i]["Emplacement"]
        if ActiverPNJB then
            pnj["modelHash"] = pnj["modelHash"]
            RecupModelPNJB(pnj["modelHash"])
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