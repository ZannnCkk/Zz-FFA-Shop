RegisterNetEvent('ZzbuyItem')
AddEventHandler('ZzbuyItem', function (data)
    local src = source
    local itemName = data.text
    if type(itemName) ~= 'string' then
        print(('Player %s mengirim item tidak valid.'):format(src))
        return
    end
    if exports.ox_inventory:CanCarryItem(src, itemName, Config.CountItem) then
        local success = exports.ox_inventory:AddItem(src, itemName, Config.CountItem)
        
        if success then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Pembelian Berhasil',
                description = ('Kamu mendapatkan %s'):format(itemName),
                type = 'success',
                duration = 5000
            })
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Gagal',
                description = ('Gagal menambahkan %s'):format(itemName),
                type = 'error',
                duration = 5000
            })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Kantong Penuh',
            description = ('Tidak cukup ruang untuk %s'):format(itemName),
            type = 'error',
            duration = 5000
        })
    end
end)
RegisterNetEvent('ZzLelah')
AddEventHandler('ZzLelah', function (data)
    local src = source
    local itemName = data.text
    local harga = data.harga
    
    if type(itemName) ~= 'string' or type(harga) ~= 'number' or harga <= 0 then
        return
    end

    local playerMoney = exports.ox_inventory:Search(src, 'count', Config.TypeMoney)

    if playerMoney < harga then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Uang Kamu Kurang',
            description = ('Kamu nggak punya cukup uang merah buat beli %s'):format(itemName),
            type = 'error',
            duration = 5000
        })
        return
    end

    local canCarry = exports.ox_inventory:CanCarryItem(src, itemName, Config.CountItem)

    if canCarry then
        local success = exports.ox_inventory:AddItem(src, itemName, Config.CountItem)
        
        if success then
            exports.ox_inventory:RemoveItem(src, 'black_money', harga)

            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Beli Sukses',
                description = ('Kamu dapet %s dan ngabisin %d uang merah'):format(itemName, harga),
                type = 'success',
                duration = 5000
            })
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Gagal',
                description = ('Gagal nambahin %s ke inventory'):format(itemName),
                type = 'error',
                duration = 5000
            })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Inventaris Penuh',
            description = ('Kamu nggak punya cukup ruang buat %s'):format(itemName),
            type = 'error',
            duration = 5000
        })
    end
end)
RegisterNetEvent('ZzVIPPBuy')
AddEventHandler('ZzVIPPBuy', function (data)
    local src = source
    local akses = false

    local own = GetPlayerIdentifier(src, 0)
    
    for k, v in pairs(Config.HexVIP) do
        if own == v then
            print(v, own)
            akses = true
            break
        end
        if not akses then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Akses Ditolak',
                description = 'Kamu bukan member VIP!',
                type = 'error',
                duration = 5000
            })
            return
        end
    
    end

    if akses then
        local itemName = data.text
        if type(itemName) ~= 'string' then
            print(('Player %s mengirim item tidak valid.'):format(src))
            return
        end
    
        if exports.ox_inventory:CanCarryItem(src, itemName, Config.CountItem) then
            local success = exports.ox_inventory:AddItem(src, itemName, Config.CountItem)
            
            if success then
                TriggerClientEvent('ox_lib:notify', src, {
                    title = 'Pembelian Berhasil',
                    description = ('Kamu mendapatkan %s'):format(itemName),
                    type = 'success',
                    duration = 5000
                })
            else
                TriggerClientEvent('ox_lib:notify', src, {
                    title = 'Gagal',
                    description = ('Gagal menambahkan %s'):format(itemName),
                    type = 'error',
                    duration = 5000
                })
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Kantong Penuh',
                description = ('Tidak cukup ruang untuk %s'):format(itemName),
                type = 'error',
                duration = 5000
            })
        end 
    end
   
end)
RegisterNetEvent('ZzBostBuy')
AddEventHandler('ZzBostBuy', function (data)
    local src = source
    local akses = false

    local own = GetPlayerIdentifier(src, 0)
    
    for k, v in pairs(Config.HexBoost) do
        if own == v then
            print(v, own)
            akses = true
            break
        end
        if not akses then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Akses Ditolak',
                description = 'Kamu bukan member BOOSTER!',
                type = 'error',
                duration = 5000
            })
            return
        end
    
    end

    if akses then
        local itemName = data.text
        if type(itemName) ~= 'string' then
            print(('Player %s mengirim item tidak valid.'):format(src))
            return
        end
    
        if exports.ox_inventory:CanCarryItem(src, itemName, Config.CountItem) then
            local success = exports.ox_inventory:AddItem(src, itemName, Config.CountItem)
            
            if success then
                TriggerClientEvent('ox_lib:notify', src, {
                    title = 'Pembelian Berhasil',
                    description = ('Kamu mendapatkan %s'):format(itemName),
                    type = 'success',
                    duration = 5000
                })
            else
                TriggerClientEvent('ox_lib:notify', src, {
                    title = 'Gagal',
                    description = ('Gagal menambahkan %s'):format(itemName),
                    type = 'error',
                    duration = 5000
                })
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Kantong Penuh',
                description = ('Tidak cukup ruang untuk %s'):format(itemName),
                type = 'error',
                duration = 5000
            })
        end 
    end
   
end)


