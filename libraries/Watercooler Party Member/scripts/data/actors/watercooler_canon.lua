local actor, super = Class(Actor, "watercooler_canon")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "watercooler"

    -- Width and height for this actor, used to determine its center
    self.width = 27
    self.height = 43

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {1, 25, 25, 17}

    -- A table that defines where the Soul should be placed on this actor if they are a player.
    -- First value is x, second value is y.
    self.soul_offset = {36, 42}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 170/255, 1}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/watercooler/dark/walk"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "down"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {}

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}
end

return actor