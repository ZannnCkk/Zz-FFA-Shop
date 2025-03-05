

local function openShopNUI()
    SendNUIMessage({
        action = 'setVisible',
        data = true
      })
      SetNuiFocus(true, true)
end

function ShowHelpNotification(msg, duration)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, duration or -1)
end


local ox_target = exports.ox_target


CreateThread(function ()
    if Config.Interact.interactType == 'target' then
        ox_target:addBoxZone({
            coords = Config.Interact.coords,
            size = vector3(1, 1, 1),
            rotation = 1,
            options = {{
                label = 'Open SHop',
                icon = 'fa fa-shop',
                onSelect = function ()
                    openShopNUI()
                end
            }}
        })
    elseif Config.Interact.interactType == 'E' then
        Citizen.CreateThread(function ()
            while true do
                Citizen.Wait(0)
                local ped = PlayerPedId()
                local pedCoords = GetEntityCoords(ped)

                local sleep = 1000

                local dist = #(pedCoords - Config.Interact.coords)

                if dist < Config.Interact.Radius then
                    sleep = 0
                    ShowHelpNotification("Tekan ~INPUT_CONTEXT~ Membuka Toko.", 5000)
                    if IsControlJustReleased(0, 38) then
                        openShopNUI()
                    end
                end
                Wait(sleep)
            end
        end)
    end
end)


RegisterNetEvent('ZzOpenShop')
AddEventHandler('ZzOpenShop', function ()
    SendNUIMessage({
        action = 'setVisible',
        data = true
      })
      SetNuiFocus(true, true)
end)

 
exports('shopOpen', function ()
    SendNUIMessage({
        action = 'setVisible',
        data = true
      })
      SetNuiFocus(true, true)
      return 'Export'
end)