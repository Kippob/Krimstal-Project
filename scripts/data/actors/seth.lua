local actor, super = Class(Actor, "seth")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Seth"

    -- Width and height for this actor, used to determine its center
    self.width = 27
    self.height = 31

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = { 3, 23, 21, 14 }
    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 1, 1, 0 }

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/seth"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {
          ["spin"]         = {"spin", 1/8, true},
          ["NOO"]         = {"NOO", 1/8, true},
          ["dizzy"]         = {"dizzy", 1/8, true},
          ["ded"]         = {"ded", 1/8, true},
          ["WHAT"]         = {"WHAT", 1/8, true},
          ["fall"]         = {"fall", 1/8, false},
          ["nervous"]         = {"nervous", 1/8, true},
          ["WAIT"]         = {"WAIT", 1/8, true},
          ["wait_sigh"]         = {"wait_sigh", 1/8, true},
          ["ohfuck"]         = {"ohfuck", 1/8, true},
          ["read"]         = {"read", 1/8, true},
          ["run"]         = {"run", 1/8, true},
          ["plead"]         = {"plead", 1/8, true},
          ["glasses"]         = {"glasses", 1/8, false},
          ["show_book"]         = {"show_book", 1/8, true},
          ["adjust"]         = {"adjust", 1/8, true},
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}
end

return actor
