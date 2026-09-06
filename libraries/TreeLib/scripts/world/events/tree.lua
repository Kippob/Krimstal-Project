local Tree, super = Class(Interactable)

function Tree:init(x, y, properties)
    super.init(self, x, y, nil, properties)

    properties = properties or {}

    self.solid = false
    --self:setOrigin(0.5, 0.5)

    local shape = string.lower(Game:getFlag("soulShape", "Heart"))
    self:setSprite("world/events/tree_parts1", 1 / 6)
    self.part2 = Assets.getTexture("world/events/tree_parts2")
    self.part3 = Assets.getTexture("world/events/tree_parts3")

    self.siner = math.random(0, 600)
    self.blocktimer = 0

    self.used = false
    self.interact_count = 0

    -- The hitbox is ALMOST half the size of the sprite, but not quite.
    -- It's 9 pixels tall, 10 pixels away from the top.
    -- So divide by 2, round, then multiply by 2 to get the right size for 2x.
    --width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)

end

function Tree:onInteract(player, dir)
    super.onInteract(self, player, dir)
    return true
end

function Tree:onTextEnd()
    if not self.world then return end
end

function Tree:update()
    super.update(self)
    self.siner = self.siner + 1

    self.blocktimer = self.blocktimer + 1

    if self.blocktimer == 20 then
        local width, height = self:getSize()
        local xv = self.x + (width/4) + math.random(width/2)
        local yv = self.y + (height/4) + math.random(height/4)
        self.block = Sprite("world/events/blockleaf")
        self.block.layer = self.layer + 1
        self.block:setScale(2)
        self.block:setPosition(xv, yv)
        self.block.physics.speed_x = 0.4 + math.random(1)
        self.block.physics.speed_y = 0.7 + math.random(1.5)
        self.block.physics.gravity = 0.1
        self.block.physics.friction = -0.1
        Game.world:addChild(self.block)
    end

    if self.blocktimer >= 20 and self.blocktimer <= 30 then
        if self.block.alpha < 1 then
            self.block.alpha = self.block.alpha + 0.2
        end
    end

    if self.blocktimer >= 38 then
        self.block.alpha = self.block.alpha - 0.1
    end

    if self.blocktimer >= 48 then
        self.block:remove()
        self.blocktimer = 0
    end
end

function Tree:draw()
    super.draw(self)

    Draw.draw(self.part2, 0 + (math.sin(self.siner/12) * 2), 0 + (math.cos(self.siner/20) * 2), 0, 2)
    Draw.draw(self.part3, 0 + (math.sin(self.siner/14) * 1), 0 + (math.cos(self.siner/14) * 1), 0, 2)

end

function Tree:getDebugInfo()
end

return Tree
