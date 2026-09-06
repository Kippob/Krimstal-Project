local DarkConfigMenu, super = Class("DarkConfigMenu")

function DarkConfigMenu:registerDefaults()
    self:addOption(DarkConfigOption(self, "Volume Configuration", function()
        self:setState("VOLUME")
    end))
    -- self:addOption(DarkConfigVolumeOption(self))

    self:addOption(DarkConfigOption(self, "Controls", function()
        self:setState("REBIND")
    end))

    self:addOption(DarkConfigBooleanOption(self, "Simplify VFX", function(option)
        Kristal.Config["simplifyVFX"] = not Kristal.Config["simplifyVFX"]
        option:setEnabled(Kristal.Config["simplifyVFX"])
    end, Kristal.Config["simplifyVFX"]))

    if not Kristal.isForcedFullscreen() then
        self:addOption(DarkConfigBooleanOption(self, "Fullscreen", function(option)
            Kristal.Config["fullscreen"] = not Kristal.Config["fullscreen"]
            love.window.setFullscreen(Kristal.Config["fullscreen"])
            option:setEnabled(Kristal.Config["fullscreen"])
        end, Kristal.Config["fullscreen"]))
    end

    self:addOption(DarkConfigBooleanOption(self, "Auto-Run", function(option)
        Kristal.Config["autoRun"] = not Kristal.Config["autoRun"]
        option:setEnabled(Kristal.Config["autoRun"])
    end, Kristal.Config["autoRun"]))

    if Kristal.isForcedFullscreen() then
        self:addOption(DarkConfigBorderOption(self))
    end
end

return DarkConfigMenu
