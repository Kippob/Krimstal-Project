local ExampleWave, super = Class(Wave)

function ExampleWave:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 5
end

function ExampleWave:onStart()
    -- code here gets called at the start of the wave
    -- create a bullet in the center of the screen
    local dummy = self:getAttackers()[1]
    local x, y = dummy:getRelativePos(dummy.width/2, dummy.height/2)
    
    
  self.timer:every(1, function()
    for i = 1, 6 do
        local bullet = self:spawnBullet("bullets/example_bullet", x, y)
        bullet.physics.speed = 4
        local target_angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
        bullet.rotation = target_angle + math.rad(MathUtils.random(-20, 20))
        bullet.physics.match_rotation = true
    end
  end)
end

function ExampleWave:update()
    -- code here gets called every frame

    super.update(self)
end

return ExampleWave