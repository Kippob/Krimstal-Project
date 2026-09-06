local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Roaring Knight appeared."

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("knight")
end

function Dummy:canSwoon(target)
    if (target.chara.id == "kris") then
        return false
    end
    return true
end

function Dummy:isAutoHealingEnabled()
    return false
end

return Dummy