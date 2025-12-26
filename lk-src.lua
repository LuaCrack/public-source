local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Hop Sivi",
    SubTitle = "Chit Gai Dep",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Servers = Window:AddTab({ Title = "Tab Sex" }),
}

local function Hop(key)
    local url = "https://luacrack.site/test.php?key=" .. key
    local ok, res = pcall(function()
        return request({ Url = url, Method = "GET" })
    end)
    if not ok or not res or not res.Body then
        return
    end
    for id in string.gmatch(res.Body, '"script_id":"(.-)"') do
        if id ~= game.JobId then
            pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, id, Players.LocalPlayer)
            end)
            task.wait(3)
        end
    end
end

Tabs.Servers:AddButton({
    Title = "Hop Full Moon",
    Callback = function() Hop("fullmoon") end
})

Tabs.Servers:AddButton({
    Title = "Hop Mirage",
    Callback = function() Hop("mirage") end
})

Tabs.Servers:AddButton({
    Title = "Hop Cursed Captain",
    Callback = function() Hop("cursed-captain") end
})

Tabs.Servers:AddButton({
    Title = "Hop Dark Bread",
    Callback = function() Hop("dark-bread") end
})

Tabs.Servers:AddButton({
    Title = "Hop Rip Indra",
    Callback = function() Hop("rip-indra") end
})

Tabs.Servers:AddButton({
    Title = "Hop Dough King",
    Callback = function() Hop("dough-king") end
})