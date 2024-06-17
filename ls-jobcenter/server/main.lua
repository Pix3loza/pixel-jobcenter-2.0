if Config.framework == 'QB' then 
    local QBCore = exports['qb-core']:GetCoreObject()
    
    RegisterNetEvent('ls-jobcenter:SetJob', function(data)
        if data.job == Config.Unemployed.name or Config.Jobs[data.job] then
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player then
                Player.Functions.SetJob(data.job, data.grade)
            end
        end
    end)
elseif Config.framework == 'ESX' then
    ESX = exports["es_extended"]:getSharedObject()
    
   RegisterNetEvent('ls-jobcenter:SetJob', function(data)
        if data.job == Config.Unemployed.name or Config.Jobs[data.job] then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.setJob(data.job, data.grade)
        end
    end) 
end
