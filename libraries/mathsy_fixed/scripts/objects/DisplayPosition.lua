local DisplayPosition, super = Class(Object)
local m_ui_x, m_ui_y

function DisplayPosition:init(ui_x,ui_y,target, targ_name)
    super.init(self, ui_x,ui_y)
    self.targ_name = targ_name
    m_ui_x = ui_x
    m_ui_y = ui_y
    self.target = target
    self.font = Assets.getFont("main")
    self.colour = self.target:getColor()
end

local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function DisplayPosition:draw()
    Draw.setColor({self.colour})
    -- local y = Game.battle.arena.top + Game.battle.arena.height/2
    -- local x = Game.battle.arena.left + Game.battle.arena.width/2
    -- love.graphics.setLineWidth(2);
    -- love.graphics.line(x, y, self.target.x, self.target.y);
    --Draw.setColor({self.target:getColor()})
    Draw.draw(self.target:getTexture(), m_ui_x - 45, m_ui_y, 0, 2, 2)
    love.graphics.setFont(self.font)
    
    love.graphics.print(self.targ_name .. " Position: (".. round(self.target.x, 1)  .. ", " .. round(self.target.y,1) .. ")", m_ui_x  , m_ui_y)
    super.draw(self)
end

return DisplayPosition