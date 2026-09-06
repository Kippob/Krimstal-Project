local flingBullet, super = Class(Bullet)

function flingBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/smallbullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.physics.gravity = 10
end

function flingBullet:update()
    self.physics.gravity = (self.physics.gravity + (math.pi/2)) * 0.2
    super.update(self)
end

return flingBullet