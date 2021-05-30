ESX = nil

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
    end
)

RegisterNetEvent("cn:wuerfeln")
AddEventHandler(
    "cn:wuerfeln",
    function()
        RequestAnimDict("mp_player_int_upperwank")
        local myPed = PlayerPedId(-1)
        local animation = "mp_player_int_wank_01_enter"
        local animation2 = "mp_player_int_wank_01_exit"
        local flags = 8
        TaskPlayAnim(myPed, "mp_player_int_upperwank", animation, 8.0, -8, -1, flags, 0, 0, 0, 0)
        Wait(650)
        TaskPlayAnim(myPed, "mp_player_int_upperwank", animation2, 8.0, -8, -1, flags, 0, 0, 0, 0)
        Citizen.Wait(700)
        num = math.random(1, 6)
        local text = "Gewürfelt: \n" .. num .. ""
        ESX.ShowNotification(text)
    end
)

RegisterNetEvent("cn:lappen")
AddEventHandler(
    "cn:lappen",
    function()
        local myPed = PlayerPedId()
        local coords = GetEntityCoords(myPed)

        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 6.0) then
            local vehicle = nil

            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

            if DoesEntityExist(vehicle) then
                TaskStartScenarioInPlace(myPed, "WORLD_HUMAN_BUM_WASH", 0, true)

                Citizen.CreateThread(
                    function()
                        while true do
                            Wait(0)
                            AktiveAktion = "waschen"

                            Citizen.Wait(30 * 1000) -- 30 Sekunden

                            if AktiveAktion ~= nil then
                                WashDecalsFromVehicle(vehicle, myPed, 1.0)
                                SetVehicleDirtLevel(vehicle, myPed)
                            end
                        end
                        break
                    end
                )
            else
                -- Notification: Du stehst nicht neben ein Fahrzeug.
            end
        end
    end
)
