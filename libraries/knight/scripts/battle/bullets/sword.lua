---@class SmallBullet : Bullet
local SmallBullet, super = Class(Bullet)

---@param direction number # Horizontal = 1, Vertical = 2, Diagonal = 3
function SmallBullet:init(time)
    -- Last argument = sprite path
    super.init(self, 0, 0, "bullets/knight_sword")
    self:setScale(1)

    self.launched = false
    self.timer = time - 0.025 or 1

    self.destroy_on_hit = false

    self.y = Game.battle.arena:getTop() - 60
    self.rotation = math.rad(90)

    Game.battle.timer:after(self.timer, function ()
        self.launched = true
    end)

    Game.battle.timer:after(self.timer - 0.25, function ()
        Assets.playSound("knight_jump_quick", 1.5, 1.25)
    end)

    Game.battle.timer:tween(self.timer, self, {color = {1, 0, 0}})

    self.physics.match_rotation = true

    self.sounded = false

    self:setHitbox(2, 5, self.sprite.width-4, self.sprite.height-10)
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    if self.launched == false then self.x = Game.battle.soul.x end

    if self.launched == true then
        Game.battle.timer:after(0.09, function ()
            if self.sounded == false then Assets.playSound("knight_cut2", 1.5, 1.25) end
            self.sounded = true
            self.physics.speed = 150
            self:setColor(1, 1, 1, 1)
            self:setScale(4, 0.75)
            self.sprite:addFX(ColorMaskFX({1,1,1}, 1))
        end)
    end

    super.update(self)
end

function SmallBullet:shouldSwoon(damage, target, soul)
    return true
end

return SmallBullet
