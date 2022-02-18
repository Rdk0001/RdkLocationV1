ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-------------- Position ----------------- 

ConfHs0              = {}
ConfHs0.DrawDistance = 100
ConfHs0.Size         = {x = 1.0, y = 1.0, z = 1.0}
ConfHs0.Color        = {r = 255, g = 255, b = 255}
ConfHs0.Type         = 29

local position = {
        {x = -1034.95,   y = -2733.55,  z = 20.17 },       
}  

------------------ Menu --------------------

RMenu.Add('rlocation', 'main', RageUI.CreateMenu("karting", "Menu Course"))
RMenu.Add('rlocation', 'vehicule', RageUI.CreateSubMenu(RMenu:Get('rlocation', 'main'), "Location", "Menu Location"))
RMenu.Add('rlocation', 'rvehicule', RageUI.CreateSubMenu(RMenu:Get('rlocation', 'main'), "Location", "Menu Location"))
RMenu.Add('rlocation', 'rvehiculev', RageUI.CreateSubMenu(RMenu:Get('rlocation', 'main'), "Location", "Menu Location"))

Citizen.CreateThread(function()
    while true do 

        RageUI.IsVisible(RMenu:Get('rlocation', 'main'), true, true, true, function()

            RageUI.Button("~r~Menu ~b~Vehicule", nil, {RightLabel = ">>>"},true, function() 
            end, RMenu:Get('rlocation', 'vehicule'))
        
                RageUI.Button("~b~Menu ~r~Moto", nil, {RightLabel = ">>>"},true, function() 
                end, RMenu:Get('rlocation', 'rvehicule'))

                RageUI.Button("~r~Menu ~b~Velo", nil, {RightLabel = ">>>"},true, function() 
                end, RMenu:Get('rlocation', 'rvehiculev'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('rlocation', 'vehicule'), true, true, true, function()

        RageUI.Button("~r~Panto", nil, {RightLabel = "500$"},true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('rdk:location', 500)
                SpawnCar('panto')
                RageUI.CloseAll()
            end
        end)

        RageUI.Button("~r~Blista", nil, {RightLabel = "1000$"},true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('rdk:location', 1000)
                SpawnCar('blista')
                RageUI.CloseAll()
            end
        end)

        RageUI.Button("~r~Kurama", nil, {RightLabel = "2500$"},true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('rdk:location', 2500)
                SpawnCar('kuruma')
                RageUI.CloseAll()
            end
        end)
        
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('rlocation', 'rvehicule'), true, true, true, function()

    RageUI.Button("~r~Sanchez", nil, {RightLabel = "650$"},true, function(Hovered, Active, Selected)
        if (Selected) then
            TriggerServerEvent('rdk:location', 650)
            SpawnCar('sanchez')
            RageUI.CloseAll()
        end
    end)

    RageUI.Button("~r~Faggio", nil, {RightLabel = "250$"},true, function(Hovered, Active, Selected)
        if (Selected) then
            TriggerServerEvent('rdk:location', 250)
            SpawnCar('faggio')
            RageUI.CloseAll()
        end
    end)

    RageUI.Button("~r~Faggio Custom", nil, {RightLabel = "350$"},true, function(Hovered, Active, Selected)
        if (Selected) then
            TriggerServerEvent('rdk:location', 350)
            SpawnCar('faggio2')
            RageUI.CloseAll()
        end
    end)
    
    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('rlocation', 'rvehiculev'), true, true, true, function()

    RageUI.Button("~r~Bmx", nil, {RightLabel = "150$"},true, function(Hovered, Active, Selected)
        if (Selected) then
            TriggerServerEvent('rdk:location', 150)
            SpawnCar('bmx')
            RageUI.CloseAll()
        end
    end)

    RageUI.Button("~r~Velo de ville", nil, {RightLabel = "50$"},true, function(Hovered, Active, Selected)
        if (Selected) then
            TriggerServerEvent('rdk:location', 50)
            SpawnCar('cruiser')
            RageUI.CloseAll()
        end
    end)

    end, function()
    end)

        Citizen.Wait(0)
     end
end) 



------------------------ Sous Menu --------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 1.0 then
                ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour accÃƒ@der la location de voiture.")
                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('rlocation', 'main'), not RageUI.Visible(RMenu:Get('rlocation', 'main')))
                end   
            end
        end
    end
end)



SpawnCar = function(Value)
    local model = GetHashKey(Value)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end
    local pos = GetEntityCoords(PlayerPedId())
    local vehicle = CreateVehicle(model, pos, -1023.59, -2734.4, 20.15, true, true)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
end
-- -1034.95, -2733.55, 20.17

DecorRegister("Yay", 4)
pedHash = "a_m_y_hasjew_01"
zone = vector3(-1034.95, -2733.55, 20.1-0.99)
Heading = 145.64
Ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_m_security_01", -1034.95, -2733.55, 20.17, false, true) 
HeadingSpawn = 145.64

Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Yay", 5431)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "a_m_y_hasjew_01", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
    end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end