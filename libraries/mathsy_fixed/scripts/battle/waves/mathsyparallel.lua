local MathsyParralel, super = Class(Wave)
local order_count = 18
local order_distance = 30

function MathsyParralel:onStart()
    self.time = -1
    self.attacker = self:getAttackers()[1]
    self.angle = 0 
    self.attach = 0
    self.measure_hearts = {}
    self.measure_disp = {}
    self.displays = {}
    self.time_elapsed = 0
    self.orbit_elapsed = 0
    
    if self.attacker.is_order then
        local third_order_count = order_count/3
        -- print(third_order_count)
        for r = 1, third_order_count, 1 do
            for g = 1, third_order_count, 1 do
                for b = 1, third_order_count, 1 do
                    local order_soul = self:CreateSoul(100,180,{r/third_order_count, g/third_order_count, b/third_order_count},"Order", 0, 0)
                end
            end
        end
    else
        self:CreateSoul(100,150,{0.1, 0.8, 0.5},"Cosine", -1, 1)
        self:CreateSoul(100,180,{0.8, 0.5, 0.1},"Sine", 1, -1)
        self:CreateSoul(100,180,{0.2, 0.2, 0.9},"Front", 1, 0)
        self:CreateSoul(100,180,{0.2, 0.9, 0.9},"Opposite", 1, 0)
        self:CreateSoul(100,180,{0.9, 0.3, 0.9},"Orbit", 1, 0)
    end
    
    self.txt = DisplayText(35,20, "Test")
    Game.battle:addChild(self.txt)
    -- self:CreateSoul(100,110,{0.9, 0.2, 0.7},"Opposite", -1, -1)
end

function MathsyParralel:CreateSoul(ui_pos_x, ui_pos_y, colour, nm, ang_x, ang_y)
    
    local heart = Sprite("player/heart", 0, 0)
    heart:setColor(colour)
    heart:setOrigin(0.5, 0.5)
    heart.layer = BATTLE_LAYERS["bullets"]
    table.insert(self.measure_hearts, heart)
    Game.battle:addChild(heart)

    local disp = DisplayPosition(ui_pos_x,ui_pos_y,heart, nm)
    Game.battle:addChild(disp)
    table.insert(self.measure_disp, {x=ang_x,y=ang_y,targ_name=nm})
    table.insert(self.displays, disp)
    return heart
end

function MathsyParralel:update()
    if (Input.pressed("cancel")) then
        self.finished = true
    end
    if (Input.pressed("confirm")) then
        self.attach = self.attach + 1
        Assets.playSound("noise")
        if self.attach == 3 then
            self.attach = 0
        end
    end
    
    if self.attach == 0 then
        self.txt.txt = "Attach mode: Direction"
    elseif self.attach == 1 then
        self.txt.txt = "Attach mode: Circling"
    elseif self.attach == 2 then
        self.txt.txt = "Attach mode: AutoCircle"
    end
    local what = " [image:" .. "]"
    self.txt.txt = self.txt.txt..tostring(what)

    local arenaCentreY = Game.battle.arena.top + Game.battle.arena.height/2
    local arenaCentreX = Game.battle.arena.left + Game.battle.arena.width/2
    local ind = 1
    local x = arenaCentreX
    local y = arenaCentreY
    local deltaTime = 1/30

    if self.attach == 0 or self.attach == 1 then
        self.angle = Utils.angle(arenaCentreX, arenaCentreY, Game.battle.soul.x, Game.battle.soul.y)
    end

    if self.attach == 1 or self.attach == 2 then
        x = Game.battle.soul.x
        y = Game.battle.soul.y
    end
    self.orbit_elapsed = self.orbit_elapsed + deltaTime

    if self.attach == 2 then
        self.time_elapsed = self.time_elapsed + deltaTime
        self.angle = self.time_elapsed
    end
    order_distance = (math.sin(self.time_elapsed) * 50) + 80
    local order_found = 0
    for _, heart in ipairs(self.measure_hearts) do
        heart.x = x - ((math.sin(self.angle) * 30) * self.measure_disp[ind].x)
        heart.y = y - ((math.cos(self.angle) * 30) * self.measure_disp[ind].y)
        if self.measure_disp[ind].targ_name == "Front" then
            heart.x = x - ((math.cos(self.angle) * 30))
            heart.y = y - ((math.sin(self.angle) * 30))
        elseif self.measure_disp[ind].targ_name == "Opposite" then
            heart.x = x - ((math.cos(self.angle) * -30))
            heart.y = y - ((math.sin(self.angle) * -30))
        elseif self.measure_disp[ind].targ_name == "Orbit" then
            heart.x = x - ((math.cos(self.angle + self.orbit_elapsed) * -30))
            heart.y = y - ((math.sin(self.angle + self.orbit_elapsed) * -30))
        elseif self.measure_disp[ind].targ_name == "Order" then
            heart.x = x - ((math.cos(self.angle + (order_found/order_count * 2*math.pi)) * order_distance))
            heart.y = y - ((math.sin(self.angle + (order_found/order_count * 2*math.pi)) * order_distance))
            
            order_found = order_found + 1
        end
        ind = ind + 1
        
    super.update(self)
    end
end

function MathsyParralel:draw()
    local arenaCentreY = Game.battle.arena.top + Game.battle.arena.height/2
    local arenaCentreX = Game.battle.arena.left + Game.battle.arena.width/2
    Draw.setColor(1, 0.5, 0, 1)
    love.graphics.setLineWidth(3);
    love.graphics.line(arenaCentreX, arenaCentreY, Game.battle.soul.x, Game.battle.soul.y);
    Draw.setColor(0, 0.5, 1, 1)
    love.graphics.setLineWidth(3);
    
    if self.measure_hearts ~= nil then
        local ind = 1
        for _, heart in ipairs(self.measure_hearts) do
            local t_x  = arenaCentreX - ((math.sin(self.angle) * 30) * self.measure_disp[ind].x)
            local t_y = arenaCentreY - ((math.cos(self.angle) * 30) * self.measure_disp[ind].y)
            love.graphics.line(arenaCentreX, arenaCentreY, t_x, t_y);
            ind = ind + 1
        end
    end
    
    super.draw(self)
end

function MathsyParralel:onEnd()
    for _, heart in ipairs(self.measure_hearts) do
        Game.battle:removeChild(heart)
    end
    for _, disp in ipairs(self.displays) do
        Game.battle:removeChild(disp)
    end
    Game.battle:removeChild(self.txt)
end

return MathsyParralel