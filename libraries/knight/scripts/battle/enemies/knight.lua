local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Knight"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("knight")

    -- Enemy health
    self.max_health = 7300
    self.health = 7300
    -- Enemy attack (determines bullet damage)
    self.attack = 40
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    self.tired_percentage = -math.huge

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "Nothing happened."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Why couldn't the skeleton go to the dance?"
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Because he was [color:red]Ugly[color:reset], [color:red]FAT[color:reset], and nobody liked him."

    self.flags = {
        ["hover"] = true,
        ["shake"] = false,
        ["afterimage"] = true
    }

    self.battle_offset = {0, 10}
end

function Dummy:getHealthDisplay()
    return "???"
end

function Dummy:onHurt(damage, battler)
    if damage > 100 then
        self:setFlag("shake", true)

        super.onHurt(self, damage, battler)
    else
        self:getActiveSprite():shake(5, 0, 1, 2 / 30, true)
    end
end

function Dummy:onHurtEnd()
    super.onHurtEnd(self)

    self:setFlag("shake", false)
end

function Dummy:selectWave()
    local turn = Game.battle.turn_count

    if turn % 5 == 0 then
        self.selected_wave = "sword_trackers_1"
    elseif turn % 4 == 0 then
        self.selected_wave = "sword_trackers_1"
    elseif turn % 3 == 0 then
        self.selected_wave = "sword_trackers_1"
    elseif turn % 2 == 0 then
        self.selected_wave = "sword_trackers_1"
    else
        self.selected_wave = "sword_trackers_1"
    end

    return self.selected_wave
end

return Dummy