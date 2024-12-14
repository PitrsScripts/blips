Citizen.CreateThread(function()
    if not Config.Blips then
        print("Error: Config.Blips is nil or undefined")
        return
    end

    for _, blip in pairs(Config.Blips) do
        if not blip.coords then
            print("Error: Blip coords are missing or invalid")
            return
        end

        print(string.format("Coords for Blip '%s': x=%.2f, y=%.2f, z=%.2f", blip.title, blip.coords.x, blip.coords.y, blip.coords.z))

        local blipHandle = AddBlipForCoord(blip.coords.x, blip.coords.y, blip.coords.z)
        
        print(string.format("Creating Blip: %s", blip.title))

        SetBlipSprite(blipHandle, blip.id)
        SetBlipDisplay(blipHandle, 4)

        local scale = blip.scale or 1.0
        SetBlipScale(blipHandle, scale)
        
        local color = blip.color or 3
        SetBlipColour(blipHandle, color)
        print(string.format("Blip Scale: %.2f, Blip Color: %d", scale, color))

        SetBlipAsShortRange(blipHandle, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blip.title)
        EndTextCommandSetBlipName(blipHandle)

        print(string.format("Blip '%s' has been created with title '%s'", blipHandle, blip.title))
    end
end)
