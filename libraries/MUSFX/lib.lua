local Lib = {}

function Lib:init()
    Kristal.Config.sfxVolume = Kristal.Config.sfxVolume or 1
    Kristal.Config.musVolume = Kristal.Config.musVolume or 1
    Kristal.saveConfig()
end

function Lib:getSfxVolume()
    return Kristal.Config.sfxVolume or 1
end

function Lib:getMusVolume()
    return Kristal.Config.musVolume or 1
end

HookSystem.hook(Music.lib, "getVolume", function(orig, self, ...)
    return self.volume * MUSIC_VOLUME * (self.current and MUSIC_VOLUMES[self.current] or 1) * Lib:getMusVolume()
end)

HookSystem.hook(Sound, "play", function(orig, self, ...)
    self.source:setVolume(math.min(self.set_volume * Lib:getSfxVolume() * self.volume, 1))
    return self.source:play()
end)

HookSystem.hook(Sound, "internal_updateSource", function(orig, self, ...)
    local calculated_volume = self.set_volume * self.volume * Lib:getSfxVolume()

    if calculated_volume ~= self.last_volume then
        if self.last_volume <= 1 and calculated_volume <= 1 then
            self.last_volume = calculated_volume
            self.source:setVolume(calculated_volume)
            return
        end
    end

    local old_source = self.source

    self.last_volume = calculated_volume
    if calculated_volume > 1 then
        -- Amplify it...
        local use_data = self.data:clone() --[[@as love.SoundData]]

        for i = 0, (use_data:getSampleCount() * use_data:getChannelCount()) - 1 do
            use_data:setSample(i, use_data:getSample(i) * calculated_volume)
        end

        self.source = love.audio.newSource(use_data)
        self.source:setVolume(1)
    else
        self.source = love.audio.newSource(self.data)
        self.source:setVolume(self.set_volume * self.volume)
    end

    if old_source == nil then
        return
    end

    if SOUND_DISABLED then
        -- Anything that uses "old_source" will probably error
        old_source:stop()
        old_source:release()
        return
    end

    self.source:setPitch(old_source:getPitch())
    self.source:setLooping(old_source:isLooping())
    self.source:setVolumeLimits(old_source:getVolumeLimits())
    for _, effect in ipairs(old_source:getActiveEffects()) do
        local settings = old_source:getEffect(effect)
        self.source:setEffect(effect, true)
        if settings then
            self.source:setEffect(effect, settings)
        end
    end

    self.source:seek(old_source:tell())

    if old_source:isPlaying() then
        self.source:play()
    end

    old_source:stop()
    old_source:release()
end)
return Lib
