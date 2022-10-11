local config = {
    pedFrequency = 2.0,
    trafficFrequency = 2.0
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.pedFrequency)

        SetScenarioPedDensityMultiplierThisFrame(config.pedFrequency, config.pedFrequency)

        SetRandomVehicleDensityMultiplierThisFrame(config.trafficFrequency)
        SetParkedVehicleDensityMultiplierThisFrame(config.trafficFrequency)
        SetVehicleDensityMultiplierThisFrame(config.trafficFrequency)
    end
end)