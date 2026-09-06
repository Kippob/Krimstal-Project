local GlowSource, super = Class(Event)

function GlowSource:init(x, y, xscale, yscale, color, fx)
    super.init(self, x, y)
	self.glow = self:addChild(glow(self.x - 42 * 5, self.y - 42 * 5, xscale, yscale, color, fx))
end

function GlowSource:update()
	super.update(self)
end

return GlowSource