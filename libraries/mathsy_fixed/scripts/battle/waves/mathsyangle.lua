local MathsyAngle, super = Class(Wave)

function MathsyAngle:onStart()
    self.time = -1
    self.attacker = self:getAttackers()[1]
    self.angle = 0 
    self.disp = DisplayAngle(0,0,self)
    Game.battle:addChild(self.disp)
    --self.layout.children[1].text = 4
end

function MathsyAngle:update()
    if (Input.pressed("cancel")) then
        self.finished = true
    end
    local arenaCentreY = Game.battle.arena.top + Game.battle.arena.height/2
    local arenaCentreX = Game.battle.arena.left + Game.battle.arena.width/2
    -- print(arenaCentreX)
    self.angle = Utils.angle(arenaCentreX, arenaCentreY, Game.battle.soul.x, Game.battle.soul.y)
    if (Input.pressed("confirm")) then
        local Ax, Ay = self.attacker:getRelativePos(self.attacker.width/2, self.attacker.height/2)
        if self.attacker.is_fling then
            Assets.playSound("ui_cancel_small")
            self:spawnBullet("flingbullet", Ax, Ay, self.angle, 8)
        else
            self:spawnBullet("smallbullet", Ax, Ay, self.angle, 8)
        end
    end
    
    super.update(self)
end

-- For some reason, the line only works here
-- Don't ask why.
function MathsyAngle:draw()
    local arenaCentreY = Game.battle.arena.top + Game.battle.arena.height/2
    local arenaCentreX = Game.battle.arena.left + Game.battle.arena.width/2
    Draw.setColor(1, 0.5, 0, 1)
    love.graphics.setLineWidth(3);
    love.graphics.line(arenaCentreX, arenaCentreY, Game.battle.soul.x, Game.battle.soul.y);
    
    super.draw(self)
end

function MathsyAngle:onEnd()
    Game.battle:removeChild(self.disp)
end

return MathsyAngle