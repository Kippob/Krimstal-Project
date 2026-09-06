local MathsySineCosine, super = Class(Wave)
local y_offset = 0

function MathsySineCosine:onStart()
    self.time = -1
    self:setArenaSize(250, 200)
    self.attacker = self:getAttackers()[1]
    self.angle = 0 
    self.measure_hearts = {}
    self.measure_disp = {}
    self.displays = {}
    self.can_move_other_soul = false
    self.sin_soul = Soul(460, 100, {0.3,0.7,0.5})
    -- self.sin_soul = Sprite("player/heart",460, 100)
    -- self.sin_soul:setColor({0.3,0.7,0.5})
    -- self.sin_soul:setOrigin(0.5, 0.5)
    self.sin_soul.layer = BATTLE_LAYERS["bullets"]
    self.sin_soul.can_move = false
    self.sin_soul.noclip = true
    self.time_elapsed = 0
    Game.battle:addChild(self.sin_soul)
    self.disp = DisplayAmpSpeed(0,0,self.attacker)
    Game.battle:addChild(self.disp)
    self.disp2Real = DisplayText(0,0,"")
    Game.battle:addChild(self.disp2Real)
    self.moveSoulInst = DisplayText(230,72,"g")
    Game.battle:addChild(self.moveSoulInst)
end

function MathsySineCosine:update()
    if (Input.pressed("cancel")) then
        self.finished = true
    end
    if (Input.pressed("confirm")) then
        Assets.playSound("noise")
        Game.battle.soul.can_move = not Game.battle.soul.can_move
        self.sin_soul.can_move = not self.sin_soul.can_move
    end
    if self.sin_soul.can_move then
        if Input.down("up")    then y_offset = y_offset - 2 end
        if Input.down("down")  then y_offset = y_offset + 2 end
    end
    local deltaTime = 1/30
    self.time_elapsed = self.time_elapsed + deltaTime
    local arenaCentreY = Game.battle.arena.top + Game.battle.arena.height/2
    local arenaCentreX = Game.battle.arena.left + Game.battle.arena.width/2
    self.angle = Utils.angle(arenaCentreX, arenaCentreY, Game.battle.soul.x, Game.battle.soul.y)
    self.disp2Real.txt = "SineSpeed: " .. math.abs(Game.battle.arena.left - Game.battle.soul.x) .."\nAmplitude: " .. math.abs(Game.battle.arena.bottom - Game.battle.soul.y) 
    self.attacker.sine_speed = math.abs(Game.battle.arena.left - Game.battle.soul.x) * 0.01
    self.attacker.amplitude = math.abs(Game.battle.arena.bottom - Game.battle.soul.y) * 0.4
    self.sin_soul.y = y_offset +(arenaCentreY - (math.sin(self.time_elapsed * self.attacker.sine_speed) * self.attacker.amplitude))
    super.update(self)
end

function MathsySineCosine:draw()
    Draw.setColor(1, 0.5, 0, 1)
    love.graphics.setLineWidth(3);
    if self.sin_soul ~= nil then
        if self.sin_soul.can_move then
            self.moveSoulInst.txt = "Move the\ngreen soul"
        else
            self.moveSoulInst.txt = "Move the\nred soul to\nmanipulate\nthe amplitude\n& speed"
        end
        local arenaCentreY = Game.battle.arena.top + Game.battle.arena.height/2
        love.graphics.line(self.sin_soul.x, y_offset + arenaCentreY, self.sin_soul.x, self.sin_soul.y);
    end
    super.draw(self)
end

function MathsySineCosine:onEnd()
    Game.battle:removeChild(self.disp)
    Game.battle:removeChild(self.disp2Real)
    Game.battle:removeChild(self.moveSoulInst)
    Game.battle:removeChild(self.sin_soul)
end

return MathsySineCosine