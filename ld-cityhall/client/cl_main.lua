local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k,v in pairs(Config.NPC) do
        modelHash = GetHashKey(v.model)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(1)
        end   
        created_ped = CreatePed(0, modelHash , v.coords.x, v.coords.y, v.coords.z - 1, v.coords.w, v.synced)
	    FreezeEntityPosition(created_ped, true)
	    SetEntityInvincible(created_ped, true)
	    SetBlockingOfNonTemporaryEvents(created_ped, true)
    end
end)

CreateThread(function()
    while true do
        toPed = false
        wait = 1000
        for k, v in pairs(Config.NPC) do
            local pos = GetEntityCoords(PlayerPedId())
            local Distance = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))

            if Distance < 2 then
                toPed = true
                wait = 5
                exports['qb-core']:DrawText(Config.TextUILabel,'left')
                if IsControlJustPressed(0, 38) then
                    TriggerEvent('ld-cityhall:mainMenu')
                end
            else
                exports['qb-core']:HideText()
                wait = 1000
            end

        end
        Wait(wait)
    end
end)

RegisterNetEvent('ld-cityhall:mainMenu', function()
    local mainMenu = {
        {
            header = "City Hall",
            txt='',
            icon = 'fas fa-city',
            isMenuHeader = true,
        },
        {
            header = "Take job",
            txt='',
            icon = 'fas fa-address-book',
            params = {
                event = 'ld-cityhall:jobMenu'
            }
        },
        {
            header = "Identity Documents",
            txt='',
            icon = 'fas fa-id-card',
            params = {
                event = 'ld-cityhall:cardMenu'
            }
        },
        {
            header = 'Close',
            icon = 'fas fa-times',
            params = {}
        },
    }
    exports['qb-menu']:openMenu(mainMenu)
end)

RegisterNetEvent('ld-cityhall:jobMenu', function(data)
    local jobMenu = {
        {
            header = "Select job:",
            txt='',
            icon = 'fas fa-address-book',
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Jobs) do
        jobMenu[#jobMenu+1] = {
            header = v.label,
            txt = "",
            icon = v.icon,
            params = {
                event = 'ld-cityhall:setjob',
                isServer = true,
                args = {
                    job = v.job,
                    grade = v.grade,
                }
            }
        }
    end
    jobMenu[#jobMenu+1] = {
        header = 'Return',
        icon = 'fas fa-redo',
        params = {
            event = 'ld-cityhall:mainMenu',
        },
    }
    jobMenu[#jobMenu+1] = {
        header = 'Close',
        icon = 'fas fa-times',
        params = {}
    }
    exports['qb-menu']:openMenu(jobMenu)
end)

RegisterNetEvent('ld-cityhall:cardMenu', function(data)
    local cardMenu = {
        {
            header = "Take identity documents:",
            txt='',
            icon = 'fas fa-list-ul',
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Documents) do
        cardMenu[#cardMenu+1] = {
            header = v.label,
            txt = v.desc,
            icon = v.icon,
            params = {
                event = 'ld-cityhall:giveitem',
                isServer = true,
                args = {
                    label = v.label,
                    item = v.item,
                    price = v.price,
                }
            }
        }
    end
    cardMenu[#cardMenu+1] = {
        header = 'Return',
        icon = 'fas fa-redo',
        params = {
            event = 'ld-cityhall:mainMenu',
        },
    }
    cardMenu[#cardMenu+1] = {
        header = 'Close',
        icon = 'fas fa-times',
        params = {}
    }
    exports['qb-menu']:openMenu(cardMenu)
end)