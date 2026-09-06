local DisplayText, super = Class(Object)

function DisplayText:init(ui_x,ui_y,text)
    super.init(self, ui_x,ui_y)
    self.m_ui_x = ui_x
    self.m_ui_y = ui_y
    self.txt = text
    self.font = Assets.getFont("main")
end

function DisplayText:Txt(text)
    self.txt = text
end

function DisplayText:draw()
    Draw.setColor({1,1,1,1})
    love.graphics.setFont(self.font)
    love.graphics.print(self.txt, self.m_ui_x  , self.m_ui_y)
    super.draw(self)
end

return DisplayText