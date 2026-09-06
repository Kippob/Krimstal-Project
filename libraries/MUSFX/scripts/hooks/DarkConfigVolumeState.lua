local DarkConfigVolumeState, super = Class("DarkConfigVolumeState")
function DarkConfigVolumeState:init(menu)
    self.menu = menu
    self.options = {
        "Master",
        "Sound Effects",
        "Music"
    }
end

function DarkConfigVolumeState:registerEvents()
    self:registerEvent("enter", self.onEnter)
    self:registerEvent("leave", self.onLeave)
    self:registerEvent("update", self.onUpdate)
    self:registerEvent("draw", self.onDraw)
    self:registerEvent("keyPressed", self.onKeyPressed)
end

-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------

function DarkConfigVolumeState:onEnter(old_state)
    self.currently_selected = 1
    self.setting_volume = false
    self.noise_timer = 0
    self.reset_flash_timer = 0
    self.old_value = 0

    self.menu:hideOptions()
end

function DarkConfigVolumeState:onLeave(new_state)
    self.menu:showOptions()
end

function DarkConfigVolumeState:onKeyPressed(key)
    if Input.pressed("cancel") and self.setting_volume and self.currently_selected < 4 then
        local funcs = {
            function()
                Kristal.setVolume(self.old_value)
            end,
            function()
                Kristal.Config.sfxVolume = self.old_value
            end,
            function()
                Kristal.Config.musVolume = self.old_value
                Game.world.music:setVolume(Game.world.music.volume)
            end,
        }
        funcs[self.currently_selected]()
        Kristal.saveConfig()
        Assets.stopAndPlaySound("ui_cancel")

        self.setting_volume = false
        return
    end
    if Input.pressed("confirm") and self.setting_volume and self.currently_selected < 4 then
        local funcs = {
            function()
                Kristal.setVolume(MathUtils.round(Kristal.getVolume() * 100) / 100)
            end,
            function()
                Kristal.Config.sfxVolume = MathUtils.round(Kristal.Config.sfxVolume * 100) / 100
            end,
            function()
                Kristal.Config.musVolume = MathUtils.round(Kristal.Config.musVolume * 100) / 100
                Game.world.music:setVolume(Game.world.music.volume)
            end,
        }
        funcs[self.currently_selected]()
        Kristal.saveConfig()
        Assets.stopAndPlaySound("ui_select")

        self.setting_volume = false
        return
    end
    if Input.pressed("confirm") and not self.setting_volume then
        if self.currently_selected < 4 then
            self.old_value = self.currently_selected == 1 and Kristal.getVolume() or (self.currently_selected == 2 and Kristal.Config.sfxVolume or Kristal.Config.musVolume)
            Assets.stopAndPlaySound("ui_select")
            self.setting_volume = true
            return
        end

        if self.currently_selected == 4 then
            Assets.playSound("levelup")
            Kristal.setVolume(0.6)
            Kristal.Config.sfxVolume = 1
            Kristal.Config.musVolume = 1
            Game.world.music:setVolume(Game.world.music.volume)
            Kristal.saveConfig()
            self.reset_flash_timer = 10
        end

        if self.currently_selected == 5 then
            self.reset_flash_timer = 0
            self.menu:setState("MAIN")
            self.currently_selected = 1

            Assets.stopAndPlaySound("ui_select")

            Input.clear("confirm", true)
        end
        return
    end

    local old_selected = self.currently_selected
    if Input.pressed("up") and not self.setting_volume then
        self.currently_selected = self.currently_selected - 1
    end
    if Input.pressed("down") and not self.setting_volume then
        self.currently_selected = self.currently_selected + 1
    end

    self.currently_selected = MathUtils.clamp(self.currently_selected, 1, 5)

    if old_selected ~= self.currently_selected then
        Assets.stopAndPlaySound("ui_move")
    end
end

function DarkConfigVolumeState:onUpdate()
    self.reset_flash_timer = math.max(self.reset_flash_timer - DTMULT, 0)
    self.noise_timer = self.noise_timer + DTMULT
    local modVolFuncs = {
        function(mod)
            Kristal.setVolume(Kristal.getVolume() + mod)
        end,
        function(mod)
            Kristal.Config.sfxVolume = MathUtils.clamp(Kristal.Config.sfxVolume + mod, 0, 1)
        end,
        function(mod)
            Kristal.Config.musVolume = MathUtils.clamp(Kristal.Config.musVolume + mod, 0, 1)
            Game.world.music:setVolume(Game.world.music.volume)
        end,
    }
    if self.setting_volume then
        if Input.down("left") then
            modVolFuncs[self.currently_selected]( - ((2 * DTMULT) / 100))
            if self.noise_timer >= 3 then
                self.noise_timer = self.noise_timer - 3
                Assets.stopAndPlaySound("noise")
            end
        end

        if Input.down("right") then
            modVolFuncs[self.currently_selected](((2 * DTMULT) / 100))
            if self.noise_timer >= 3 then
                self.noise_timer = self.noise_timer - 3
                Assets.stopAndPlaySound("noise")
            end
        end

        if (not Input.down("right")) and (not Input.down("left")) then
            self.noise_timer = 3
        end
    end
end

function DarkConfigVolumeState:onDraw()
    local volDispFuncs = {
        function ()
            return MathUtils.round(Kristal.getVolume() * 100) .. "%"
        end,
        function()
            return MathUtils.round(Kristal.Config.sfxVolume * 100) .. "%"
        end,
        function()
            return MathUtils.round(Kristal.Config.musVolume * 100) .. "%"
        end,
    }
    love.graphics.setFont(Assets.getFont("main"))
    Draw.setColor(PALETTE["world_text"])

    love.graphics.print("Option", 23, -12)
    -- Console accuracy for the Heck of it
    if not Kristal.isConsole() then
        love.graphics.print("Percent", 243, -12)
    end

    for index, name in ipairs(self.options) do
        Draw.setColor(PALETTE["world_text"])
        if self.currently_selected == index then
            if self.setting_volume then
                Draw.setColor(PALETTE["world_text_rebind"])
            else
                Draw.setColor(PALETTE["world_text_hover"])
            end
        end

        love.graphics.print(name, 23, -4 + (28 * index) + 4)
        love.graphics.print(volDispFuncs[index](), 243, 0 + (28 * index))

        Draw.setColor(1, 1, 1)
    end

    Draw.setColor(PALETTE["world_text"])
    if self.currently_selected == 4 then
        Draw.setColor(PALETTE["world_text_hover"])
    end

    if (self.reset_flash_timer > 0) then
        Draw.setColor(ColorUtils.mergeColor(PALETTE["world_text_hover"], PALETTE["world_text_selected"],
            ((self.reset_flash_timer / 10) - 0.1)))
    end
    
    local offset = 4 * 28
    love.graphics.print("Reset to default", 23, -4 + (28 * 4) + 4 + offset)

    Draw.setColor(PALETTE["world_text"])
    if self.currently_selected == 9 then
        Draw.setColor(PALETTE["world_text_hover"])
    end

    love.graphics.print("Finish", 23, -4 + (28 * 5) + 4 + offset)

    Draw.setColor(Game:getSoulColor())
    local heart = Assets.getTexture("player/heart")

    Draw.draw(heart, -2, 34 + ((self.currently_selected - 1) * 28) + 2 + (self.currently_selected > 3 and offset or 0))
end

return DarkConfigVolumeState
