local actor, super = Class(Actor, "kim")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Kim"

    -- Width and height for this actor, used to determine its center
    self.width = 18
    self.height = 20

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {}
    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 1, 1, 0 }

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/kim"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"

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
    self.animations = {}

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}

    if self.visible then
        if self.waving == true then
            self.parent.y = self.parent.y + Utils.wave(Kristal.getTime() * 4, -1, 1)
        end
    end

end



return actor
