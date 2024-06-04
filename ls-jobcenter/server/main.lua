RegisterNetEvent('ls-jobcenter:SetJob', function(data)
    if data.job == Config.Unemployed.name or Config.Jobs[data.job] then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.setJob(data.job, data.grade)
    end
end)

