local DisplayAmpSpeed, super = Class(Object)

function DisplayAmpSpeed:init(x,y,target)
    super.init(self, x,y)
    self.target = target
    self.font = Assets.getFont("main")
end

local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function DisplayAmpSpeed:draw()
    Draw.setColor(1, 1, 1, 1)
    love.graphics.setFont(self.font)
    local arena_x = Game.battle.arena.left - 30
    local arena_y = Game.battle.arena.bottom + 10
    local arena_top = Game.battle.arena.top - 35
    if Input.usingGamepad() then
        love.graphics.print("Press      to exit", 250, arena_top)
        Draw.draw(Input.getTexture("cancel"), 326, arena_top + 3, 0, 2, 2)
        love.graphics.print("Press      to switch souls", 250, arena_top - 30)
        Draw.draw(Input.getTexture("confirm"), 326, arena_top - 33, 0, 2, 2)
    else
        love.graphics.print("Press "..Input.getText("cancel").." to exit", 250, arena_top)
        love.graphics.print("Press "..Input.getText("confirm").." switch souls", 250, arena_top - 30)
    end
    love.graphics.print("Amplitude: "..round(self.target.amplitude,3), 228, arena_y)
    love.graphics.print("S", arena_x, 92)
    love.graphics.print("p", arena_x, 112)
    love.graphics.print("e", arena_x, 135)
    love.graphics.print("e", arena_x, 155)
    love.graphics.print("d", arena_x, 180)
    love.graphics.print(""..round(self.target.sine_speed,3), arena_x - 20, 202)
    super.draw(self)
end

return DisplayAmpSpeed