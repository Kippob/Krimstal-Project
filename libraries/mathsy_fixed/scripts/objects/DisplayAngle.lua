local DisplayAngle, super = Class(Object)

function DisplayAngle:init(x,y,wave)
    super.init(self, x,y)
    self.wave = wave
    self.font = Assets.getFont("main")
end

local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function DisplayAngle:draw()
    Draw.setColor(1, 1, 1, 1)
    love.graphics.setFont(self.font)
    if Input.usingGamepad() then
        love.graphics.print("Press      to exit", 250, 60)
        love.graphics.print("Press      to fire", 250, 30)
        Draw.draw(Input.getTexture("confirm"), 326, 33, 0, 2, 2)
        Draw.draw(Input.getTexture("cancel"), 326, 63, 0, 2, 2)
    else
        love.graphics.print("Press " .. Input.getText("cancel") .. " to exit", 250, 60)
        love.graphics.print("Press " .. Input.getText("confirm") .. " to fire", 250, 30)
    end
    love.graphics.print("Angle (Rad): " .. round(self.wave.angle,3), 228, 257)
    love.graphics.print("Angle (Deg): " .. round(math.deg(self.wave.angle),3), 228, 277)
    super.draw(self)
end

return DisplayAngle