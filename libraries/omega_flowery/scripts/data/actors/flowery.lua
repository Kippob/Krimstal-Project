local actor, super = Class(Actor, "flowery")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Flowery"

    -- Width and height for this actor, used to determine its center
    self.width = 20
    self.height = 59

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {3, 48, 20, 10}

    -- A table that defines where the Soul should be placed on this actor if they are a player.
    -- First value is x, second value is y.
    self.soul_offset = {16, 30}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 1, 1}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/flowery"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "flowery"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {
        -- Battle animations
        ["battle/idle"]         = {"idle", 0.2, true},

        ["battle/attack"]       = {"wind_punch", 1/15, false},
        ["battle/act"]          = {"kiss", 0.2, false},
        ["battle/spell"]        = {"pose", 0.2, false},
        ["battle/item"]         = {"pose", 0.2, false, next="battle/idle"},
        ["battle/spare"]        = {"kiss", 0.2, false, next="battle/idle"},

        ["battle/attack_ready"] = {"windup", 0.1, true},
        ["battle/act_ready"]    = {"idle", 0.2, true},
        ["battle/spell_ready"]  = {"pose", 0.2, true},
        ["battle/item_ready"]   = {"idle", 0.2, true},
        ["battle/defend_ready"] = {"deflect", 0.2, true},

        ["battle/act_end"]      = {"idle", 0.2, false, next="battle/idle"},

        ["battle/hurt"]         = {"hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"defeated", 1/15, false},

        ["battle/transition"]   = {"idle", 0.2, true},
        ["battle/intro"]        = {"idle", 1/15, false},
        ["battle/victory"]      = {"idle", 1/10, false},

        ["battle/deflect"]       = {"deflect", 0.2, true},

        ["battle/jarona"]       = {"jarona", 0.2, true},
        ["punch"]               = {"punch", 0.2, true},
        ["kick"]                = {"kick", 0.2, true},
        ["axe_kick"]            = {"axe_kick", 1/15, false},
        ["flashkick"]           = {"flashkick", 0.2, true},
    }

    self.animations_normal = {
        -- Battle animations
        ["battle/idle"]         = {"normal_battle/idle", 0.15, true},

        ["battle/attack"]       = {"normal_battle/wind_punch", 1/15, false},
        ["battle/act"]          = {"normal_battle/kiss", 0.2, false},
        ["battle/spell"]        = {"normal_battle/pose", 1, false},
        ["battle/item"]         = {"normal_battle/pose", 0.2, false, next="battle/idle"},
        ["battle/spare"]        = {"normal_battle/kiss", 0.2, false, next="battle/idle"},

        ["battle/attack_ready"] = {"normal_battle/windup", 0.1, true},
        ["battle/act_ready"]    = {"normal_battle/idle", 0.2, true},
        ["battle/spell_ready"]  = {"normal_battle/pose", 0.2, true},
        ["battle/item_ready"]   = {"normal_battle/idle", 0.2, true},
        ["battle/defend_ready"] = {"normal_battle/deflect", 0.2, true},

        ["battle/act_end"]      = {"normal_battle/idle", 0.2, false, next="battle/idle"},

        ["battle/hurt"]         = {"normal_battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"normal_battle/defeated", 1/15, false},

        ["battle/transition"]   = {"normal_battle/idle", 1/15, false},
        ["battle/intro"]        = {"normal_battle/jacket", 1/15, false},
        ["battle/victory"]      = {"power_up", 0.1, false},

        ["battle/deflect"]       = {"normal_battle/deflect", 0.2, true},

        ["battle/run_prepare"]  = {"normal_battle/run_prepare", 0.4, false},
        ["battle/run"]          = {"normal_battle/run", 1/15, true},
        ["punch"]               = {"normal_battle/punch", 0.2, true},
        ["kick"]                = {"normal_battle/kick", 0.2, true},
        ["axe_kick"]            = {"normal_battle/axe_kick", 1/15, false},
        ["flashkick"]           = {"normal_battle/flashkick", 0.2, true},
    }

    -- Tables of sprites to change into in mirrors
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {-1, 0},
        ["walk/down"] = {-1, 0},

        -- Battle offsets
        ["idle"] = {-8, -1},
        ["normal_battle/idle"] = {-30, 0},

        ["wind_punch"] = {0, -10},
        ["windup"] = {-5, -10},
        ["deflect"] = {0, -3},

        ["normal_battle/wind_punch"] = {0, -16},
        ["normal_battle/run_prepare"] = {-4, 0},
        ["normal_battle/jacket"] = {-30, -10},
        ["power_up"] = {-6, -12},
        ["normal_battle/run"] = {0, 4},
        ["normal_battle/kiss"] = {-2, -4},
        ["normal_battle/windup"] = {-8, -2},
        ["normal_battle/deflect"] = {-6, 4},

        ["battle/defeat"] = {-8, -5},
        ["hurt"] = {0, 0},
        ["normal_battle/hurt"] = {-4, 10},

        ["battle/intro"] = {-8, -9},
        ["battle/victory"] = {-3, 0},

        -- Cutscene offsets
        ["knight_clash"] = {-46, -12},

        ["pose"] = {-4, -2},
    }
    self.hue = 0

    self.siner = 0
end

function actor:onTextSound()
    local random_num = math.random(1, 3)
    Assets.playSound("voice/flowery_"..random_num)

    return true
end

function actor:getAnimation(anim)
    -- If the weird route flag is set and an alt animation is defined, use it instead
    if Game:getPartyMember("flowery"):getFlag("omega_color", true) == false and self.animations_normal[anim] ~= nil then
        return self.animations_normal[anim] or nil
    else
        return super.getAnimation(self, anim)
    end
end

function actor:onSpriteUpdate(sprite)
    local flowery = Game:getPartyMember("flowery")
    if Game.battle then
        if flowery:getFlag("omega_color", true) == true then
            self.hue = (self.hue + DT * 5 / 100) % 1
            sprite:setColor(ColorUtils.HSVToRGB(self.hue, 0.6, 1))
        end
        if flowery:getFlag("afterimage", true) == true then
            if self.timer == 4 then
                self.afterimage = AfterImage(sprite, 0.25, 0.01)
                local afterimage = self.afterimage
                afterimage.debug_select = false
                afterimage.physics.speed_x = -3
                afterimage:setColor(sprite:getColor())
                afterimage:addFX(ColorMaskFX({sprite:getColor()}, 1))
                sprite.parent:addChild(afterimage)
                self.timer = 0
            else
                self.timer = self.timer + 1
            end
        end

        if flowery:getFlag("hover", true) == true then sprite.parent.y = 200 + math.sin(self.siner * 2) * 8 self.siner = self.siner + DT end
    else
        sprite:setColor(1,1,1)
    end
end

return actor