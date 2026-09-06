local actor, super = Class(Actor, "may")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "May"

    -- Width and height for this actor, used to determine its center
    self.width = 22
    self.height = 48

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = { 0, 31, 22, 17}
    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 1, 1, 0 }

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/may"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"

    -- Sound to play when this actor speaks (optional)
    self.voice = "maytxt"
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

    self.timer = 0.6
    self.maxtime = self.timer
end 
    

function actor:onSpriteUpdate(sprite)
    if sprite.visible then
            sprite.parent.y = sprite.parent.y + Utils.wave(Kristal.getTime() * 3, -1, 1)
        end
        
    end

 

return actor
