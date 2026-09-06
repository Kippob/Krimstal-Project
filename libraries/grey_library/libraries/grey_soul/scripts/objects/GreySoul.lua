local GreySoul, super = Class(Soul)

function GreySoul:init(x, y)
    super:init(self, x, y)

	-- Do not modify these variables
    self.color = {147/255, 147/255, 147/255}

    self.speed = 0

    self.wave_start = false

    self.sprite = Sprite("soul/heart_mouse")
    self.sprite:setOrigin(0.5, 0.5)
    self.sprite.inherit_color = false
    self:addChild(self.sprite)

    self.wall_hurt = true
    self.hurt_amnt = 5
    self.target = "ANY"
end

function GreySoul:onWaveStart()
    self.valeur_x = Game.battle.arena.x
    self.valeur_y = Game.battle.arena.y

    if self.wall_hurt == true then
        Game.battle.arena.color = {1, 1, 1}
    end
    
    love.mouse.setPosition(self.valeur_x + 160, self.valeur_y + 32)

    self.meese_x = love.mouse.getX()
    self.meese_y = love.mouse.getY()
end

function GreySoul:update()
    super:update(self)

    if Game.battle.state == "DEFENDING" then

        if self.valeur_x > Game.battle.arena:getRight() - 18 then
            self.valeur_x = Game.battle.arena:getRight() - 18
            love.mouse.setX(Game.battle.arena:getRight() + 160 - 18)
            if self.wall_hurt == true then
                Game.battle:hurt(self.hurt_amnt, true, self.target)
            end
        elseif self.valeur_x < Game.battle.arena:getLeft() + 18 then
            self.valeur_x = Game.battle.arena:getLeft() + 18
            love.mouse.setX(Game.battle.arena:getLeft() + 160 + 18)
            if self.wall_hurt == true then
                Game.battle:hurt(self.hurt_amnt, true, self.target)
            end
        end

        if self.valeur_y > Game.battle.arena:getBottom() - 18 then
            self.valeur_y = Game.battle.arena:getBottom() - 18
            love.mouse.setY(Game.battle.arena:getBottom() + 32 - 18)
            if self.wall_hurt == true then
                Game.battle:hurt(self.hurt_amnt, true, self.target)
            end
        elseif self.valeur_y < Game.battle.arena:getTop() + 18 then
            self.valeur_y = Game.battle.arena:getTop() + 18
            love.mouse.setY(Game.battle.arena:getTop() + 32 + 18)
            if self.wall_hurt == true then
                Game.battle:hurt(self.hurt_amnt, true, self.target)
            end
        end

        if love.mouse.isDown(1) and not(self.timer_count) then
            Assets.playSound("squeak")
            self.time_count = 0
            self.timer_count = true
            --print("True")
        end
    
        if self.timer_count then
            self.time_count = self.time_count + 1
        end
    
        if self.time_count == 10 then
            self.timer_count = false
        end
        
        --Soul based of Mouse
        self:setExactPosition(love.mouse.getX() - 160, love.mouse.getY() - 32)

        if love.mouse.getX() ~= self.meese_x then
            if love.mouse.getX() < self.meese_x then
                -- on retire a x
                self.valeur_x = self.valeur_x - (self.meese_x - love.mouse.getX())
            else
                -- on ajoute a x
                self.valeur_x = self.valeur_x + (love.mouse.getX() - self.meese_x)
            end
            self.meese_x = love.mouse.getX()
        end

        if love.mouse.getY() ~= self.meese_y then
            if love.mouse.getY() > self.meese_y then
                -- on retire a y
                self.valeur_y = self.valeur_y + (love.mouse.getY() - self.meese_y)
            else
                -- on ajoute a y
                self.valeur_y = self.valeur_y - (self.meese_y - love.mouse.getY())
            end
            self.meese_y = love.mouse.getY()
        end
    end
end

function GreySoul:doMovement()

end

function GreySoul:draw()
    local r,g,b,a = self:getDrawColor()
    local heart_texture = Assets.getTexture(self.sprite.texture_path)
    local heart_w, heart_h = heart_texture:getDimensions()

    super:draw(self)
    self.color = {r,g,b}
end

return GreySoul