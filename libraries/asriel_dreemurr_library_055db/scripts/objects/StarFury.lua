---@class StarFury : Sprite
---@overload fun(...) : StarFury
local StarFury, super = Class(Sprite)

function StarFury:init(red, x, y, tx, ty, after)
    super.init(self, "effects/star/starfall", x, y)

    self:setOrigin(0.5, 0.5)
    self:setScale(1)
    self:play(1/30, true)
    self.target_x = tx
    self.target_y = ty
    self.rotation = 4
    self.physics.speed = 10
    self.physics.friction = -0.05
    self.physics.match_rotation = true
    self.alpha = 0
    self.pressed = false
    self.afterimg_timer = 0
    self.after_func = after
    self.rotation_speed = 4
end

function StarFury:update()
    self.alpha = Utils.approach(self.alpha, 1, 0.25 * DTMULT)
    local dir = Utils.angle(self.x, self.y, self.target_x, self.target_y)
    self.rotation = self.rotation + (Utils.angleDiff(dir, self.rotation)) + math.rad(self.rotation_speed * 4) * DTMULT
    if Input.pressed("confirm") then
        self.pressed = true
    end
    if Utils.dist(self.x, self.y, self.target_x, self.target_y) <= 40 then
        if self.after_func then
            self.after_func(self.pressed)
        end
        self:remove()
        return
    end
    self.afterimg_timer = self.afterimg_timer + DTMULT
    if self.afterimg_timer >= 1 then
        self.afterimg_timer = 0

        local sprite = Sprite( "effects/star/star_after", self.x, self.y)
        sprite:fadeOutSpeedAndRemove()
        sprite:setOrigin(0.5, 0.5)
        sprite:setScale(1, 1)
        sprite.rotation = self.rotation
        sprite.alpha = self.alpha - 0.3
        sprite.layer = self.layer - 0.005
        sprite.graphics.grow_y = -0.05
        sprite.graphics.remove_shrunk = true
        sprite:play(1/30, true)
        self.parent:addChild(sprite)
    end

    super.update(self)
end

return StarFury