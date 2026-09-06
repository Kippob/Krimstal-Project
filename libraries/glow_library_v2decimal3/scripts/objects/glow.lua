local glow, super = Class(Object)

function glow:init(x, y, xscale, yscale, color, fx)
    super.init(self, x, y)
	self.sprite = Sprite("effects/glow")
    self:addChild(self.sprite)
	if xscale then
		self.scale_x = xscale
	end
	if yscale then
		self.scale_y = yscale
	end
	if self.parent then
		self.layer = 1000
	end
	if color then
		self.color = color
	else
		self.color = {1, 0, 0, 1}
	end
	
	self.x = self.x - 42 * (self.scale_x * 6.26)
	self.y = self.y - 42 * (self.scale_y * 5)
	if fx then
		self:addFX(fx(self.color))
	else
		self:addFX(RecolorFX(self.color))
	end
end

function glow:update()
	super.update(self)
end

return glow