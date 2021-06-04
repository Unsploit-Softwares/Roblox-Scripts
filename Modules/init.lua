local Modules = {}

function Modules:Load(moduleName)
    local module;
    for _,v in pairs(script:GetChildren()) do
        if (v.Name == moduleName and v:IsA("ModuleScript")) then
            module = require(v)
        end
    end
    return module
end

return Modules