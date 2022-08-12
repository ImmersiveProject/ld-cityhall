Config = {}

Config.TextUILabel = '[E] City Hall' -- TextUI Label
Config.NPC = {
    [1] = {
        coords = vector4(-545.14, -204.0, 38.22, 209.42),  -- Coords for ped
        model = "s_m_m_fiboffice_02", -- Ped Model
        synced = true -- Ignor
    },
}

Config.Jobs = {
    {label = 'Unemployed', job = 'unemployed', grade = '0', icon = 'fas fa-broom'},
    {label = 'Taxi', job = 'taxi', grade = '0', icon = 'fas fa-taxi'},
    {label = 'Garbage', job = 'garbage', grade = '0', icon = 'fas fa-trash'},
    {label = 'News Reporter', job = 'reporter', grade = '0', icon = 'fas fa-microphone'},
    {label = 'Tow Truck', job = 'tow', grade = '0', icon = 'fas fa-truck-loading'},
    {label = 'Bus Driver', job = 'bus', grade = '0', icon = 'fas fa-bus'},
    {label = 'Hotdog', job = 'hotdog', grade = '0', icon = 'fas fa-hotdog'},
    {label = 'Trucker', job = 'trucker', grade = '0', icon = 'fas fa-truck'},
}

Config.Documents = {
    {
        label = 'ID Card', 
        desc = 'Take ID Card for 50$', 
        item = 'id_card', 
        price = '50', 
        icon = 'fas fa-id-card'
    },
    {
        label = 'Driver license',
        desc = 'Take Driver License 50$',
        item = 'driver_license',
        price = '50',
        icon = 'fas fa-id-card'
    },
}