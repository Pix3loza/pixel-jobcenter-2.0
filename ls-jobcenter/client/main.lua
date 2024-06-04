local inMenu = false

RegisterCommand('job_center', function()
    OpenJobCenter()
end)

function OpenJobCenter()
    if inMenu then
        return
    end

    inMenu = true
    SendNUIMessage({
        action = 'OpenUI',
        jobs = Config.Jobs,
        unemployed = Config.Unemployed
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback('SetJob', function(data)
    TriggerServerEvent('ls-jobcenter:SetJob', data)
end)

RegisterNUICallback('CloseUI', function()
    inMenu = false
    SetNuiFocus(false, false)
end)