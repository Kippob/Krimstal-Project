local DebugMathsy, super = Class(EnemyBattler)

function DebugMathsy:init()
    super.init(self)

    -- Enemy name
    self.name = "Mathsy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")
    -- Enemy health
    self.max_health = 65535
    self.health = 65535
    -- Enemy attack (determines bullet damage)
    self.attack = 0
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20
    self.amplitude = 2
    self.sine_speed = 1
    self.throw_power = 8
    self.is_order = false
    self.is_fling = false

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "mathsyangle",
        "mathsyparallel",
        "mathsysinecosine"
    }
    self.wave_num = 0

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "..."
    }
    local values = {}
    for key, value in pairs(self) do
        table.insert(values,(tostring(key) .. " : " .. tostring(value)))
    end

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {
        "Throw power: " .. tostring(self.throw_power),
        "Amplitude: " .. tostring(self.amplitude),
        "Sine Speed: " .. tostring(self.sine_speed)
    }

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Use ACTs to choose what you want\nto test."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The dummy looks like it's\nabout to fall over."
    self:registerAct("Angle")
    self:registerAct("Angle throw")
    self:registerAct("Parallel")
    self:registerAct("Parallel Order")
    self:registerAct("Sine & Cosine")
    Game.battle:registerXAction("susie", "ThrowPowInc")
    Game.battle:registerXAction("ralsei", "ThrowPowDec")

    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Tell Story", "", {"ralsei"})
end

function DebugMathsy:getNextWaves()
    if self.wave_num == 1 then
        return {"mathsyangle"}
    elseif self.wave_num == 2 then
        return {"mathsyparallel"}
    elseif self.wave_num == 3 then
        return {"mathsysinecosine"}
    end
    return {"mathsyangle"}
end

function DebugMathsy:onAct(battler, name)
    if name == "Angle" then
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "That's rad!"
        self.is_fling = false
        self.wave_num = 1
        return "* Okay![wait:3]. Angles it is!"
    elseif name == "Angle throw" then
        self.dialogue_override = "Throw those rad MILLIONS!!"
        self.is_fling = true
        self.wave_num = 1
        return "* Okay![wait:3]. Throw angle it is!"
    elseif name == "Parallel" then
        self.dialogue_override = "Many hearts!!"
        self.is_order = false
        self.wave_num = 2
        return "* Okay![wait:3]. Parallel it is!"
    elseif name == "Sine & Cosine" then
        self.dialogue_override = "Cos you Sin!"
        self.wave_num = 3
        return "* Okay![wait:3]. Sine and Cosine it is!"
    elseif name == "Parallel Order" then
        self.dialogue_override = "Circle hearts!!"
        self.wave_num = 2
        self.is_order = true
        return "* Okay![wait:3]. Parallel order it is!"

    elseif name == "ThrowPowInc" then
        self.throw_power = self.throw_power + 1
        return "* "..battler.chara:getName().." increased the throwing\npower."
    elseif name == "ThrowPowDec" then
        if self.throw_power == 1 then
            return "* "..battler.chara:getName().." could not decrease\nthe throwing power\nany lower."
        end
        self.throw_power = self.throw_power - 1
        return "* "..battler.chara:getName().." increased the throwing\npower."
    end
    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return DebugMathsy