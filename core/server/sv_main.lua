---------------------------
    -- ESX --
---------------------------
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
---------------------------
    -- Event Handlers --
---------------------------
NPCData = NPCData or {}
RegisterServerEvent('GetNPCData')
AddEventHandler('GetNPCData', function()
    local src = source
    TriggerClientEvent('SendNPCData', src, NPCData)
end)

AddEventHandler('onResourceStart', function(resource)
    Wait(2000)
    if GetCurrentResourceName() == resource then
        TriggerClientEvent('SendNPCData', -1, NPCData)
    end
end)