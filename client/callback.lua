

RegisterNUICallback('hideFrame', function(_, cb)
  SendNUIMessage({
    action = 'setVisible',
    data = false
  })
  SetNuiFocus(false, false)
end)

RegisterNUICallback('ZzBuy', function (data, cb)
  TriggerServerEvent('ZzbuyItem', data)
end)

RegisterNUICallback('ZzUangMerah', function (data, cb)
  TriggerServerEvent('ZzLelah', data)
end)


RegisterNUICallback('ZzVIPBuy', function (data, cb)
  TriggerServerEvent('ZzVIPPBuy', data)
end)

RegisterNUICallback('ZzBoostBuy', function (data, cb)
  TriggerServerEvent('ZzBostBuy', data)
end)

 
RegisterNUICallback('dataFREE', function (_, cb)
  local data = {}

  for k, v in pairs(Config.Free) do
    table.insert(data, {
      item = v.items,
      label = v.label,
    })
  end
  cb(data)
end)

RegisterNUICallback('getMoney', function(_, cb)
  local Money = exports.ox_inventory:GetItemCount('black_money')
  if Money then
    cb(Money)
  else
    cb(0)
  end
end)


RegisterNUICallback('dataVIP', function (_, cb)
  local data = {}
  for k, v in pairs(Config.VIP) do
    table.insert(data, {
      item = v.items,
      label = v.label,
    })
  end
  cb(data)
end)

RegisterNUICallback('dataBOOST', function (_, cb)
  local data = {}
  for k, v in pairs(Config.Boost) do
    table.insert(data, {
      item = v.items,
      label = v.label,
    })
  end
  cb(data)
end)

RegisterNUICallback('dataMerah', function (_, cb)
  local data = {}
  for k, v in pairs(Config.uangMerah) do
    table.insert(data, {
      item = v.items,
      label = v.label,
      harga = v.Harga
    })
  end
  cb(data)
end)
