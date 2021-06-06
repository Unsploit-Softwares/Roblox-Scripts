local version = {
    Major = 0;
    Minor = 0;
    Subminor = 0;
    Build = 0;
}

function version:GetVersionString()
    return string.format("%s.%s.%s.%s", version.Major, version.Minor, version.Subminor, version.Build)
end

function version:GetVersion()
    return {
        version.Major,
        version.Minor,
        version.Subminor,
        version.Build
    }
end

function version:SetVersion(...)
    local toSet = {...}

    if (toSet[4] and toSet[3]) then
        version.Major = toSet[1]
        version.Minor = toSet[2]
        version.Subminor = toSet[3]
        version.Build = toSet[4]
    else
        version.Major = toSet[1]
        version.Minor = toSet[2]
    end
end

return version