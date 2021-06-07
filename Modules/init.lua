local Modules = {}

function Modules:Load(moduleName)
    local module;

    module = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Modules/" .. moduleName .. ".lua"))()

    return module
end

return Modules