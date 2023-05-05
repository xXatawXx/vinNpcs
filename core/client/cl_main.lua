ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(250)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(250)
    end

    PlayerData = ESX.GetPlayerData()
end)
---------------------------
    -- Variables --
---------------------------
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(newJob)
    PlayerData.job = newJob
end)
---------------------------
    -- Event Handlers --
---------------------------
RegisterNetEvent('SendNPCData')
AddEventHandler('SendNPCData', function(npc_data)
    NPCData = npc_data
    EnableNPCs(NPCData)
end)
---------------------------
    -- Functions --
---------------------------
GenerateNPCs = function(npcData)
    while npcData == nil do
        Wait(1000)
    end
    Utils.loadModel(GetHashKey(npcData.modelHash))
    npc = CreatePed(4, npcData.modelHash, npcData.coords.x, npcData.coords.y, npcData.coords.z, npcData.coords.h, true, true)
    SetEntityAsMissionEntity(npc, true, true)
    NetworkRegisterEntityAsNetworked(npc)

    local netID = PedToNet(npc)
    NetworkSetNetworkIdDynamic(netID, false) 
    SetNetworkIdCanMigrate(netID, true)
    SetNetworkIdExistsOnAllMachines(netID, true)
    SetEntityHeading(npc, npcData.coords.h)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    TaskStartScenarioAtPosition(npc, npcData.scenario,  npcData.coords.x, npcData.coords.y, npcData.coords.z, npcData.coords.h, -1, false, true)
end

EnableNPCs = function(data)
    if Config.useTargetTracking then

        CreateThread(function()
            for k,v in pairs(data) do
                local value = NPC:createData({modelHash = v.modelHash, coords = v.coords, scenario = v.scenario})
                value:enableThread()
                Wait(550)
                value:disableThread()
            end
        end)
        
        CreateThread(function()
            for k,v in pairs(data) do
                if k then
                    exports['srp_tracking']:AddTargetModel(v.polygonHash, v[1])
                end
            end
        end)

    else
        -- if not using target tracking then you can put whatever you want here.
        CreateThread(function()
            for k,v in pairs(data) do
                local value = NPC:createData({modelHash = v.modelHash, coords = v.coords, scenario = v.scenario})
                value:enableThread()
                Wait(550)
                value:disableThread()
            end
        end)

    end
end

RegisterNetEvent('testthisevent')
AddEventHandler('testthisevent', function()
    print('cop lady')
end)