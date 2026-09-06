local actor, super = Class(Actor, "asriel")

function actor:init()
    super.init(self)

    self.name = "Asriel"
    self.width = 19
    self.height = 41
    self.hitbox = {0, 30, 19, 14}
    self.soul_offset = {10, 24}
    self.color = {0, 1, 1}
    self.path = "party/asriel/dark"
    self.default = "walk"
    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil
    self.can_blush = false
    self.animations = {

        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/15, false},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"sword_jump_down", 0.2, true},
        ["battle/intro"]        = {"battle/attack", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        ["jump_fall"]           = {"fall", 1/5, true},
        ["jump_ball"]           = {"ball", 1/15, true},
    }

    if Game.chapter >= 1 then
        self.animations["battle/transition"] = {"walk/right", 0, true}
    end

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }

    self.offsets = {
        ["walk/left"] = {0, 2},
        ["walk/right"] = {0, 2},
        ["walk/up"] = {0, 2},
        ["walk/down"] = {0, 2},

        ["walk_blush/down"] = {0, 0},

        ["slide"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-5, -1},

        ["battle/attack"] = {-8, -13},
        ["battle/attackready"] = {-8, -13},
        ["battle/act"] = {-5, 0},
        ["battle/actend"] = {-5, 0},
        ["battle/actready"] = {-5, 0},
        ["battle/spell"] = {-5, 0},
        ["battle/spellready"] = {-5, 0},
        ["battle/item"] = {-6, 0},
        ["battle/itemready"] = {-6, 0},
        ["battle/defend"] = {-5, -7},

        ["battle/defeat"] = {-2, 7},
        ["battle/hurt"] = {-5, -6},

        ["battle/intro"] = {-8, -9},
        ["battle/victory"] = {-3, 0},

    }
end

return actor