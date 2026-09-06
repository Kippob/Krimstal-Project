return {
    prebattle = function(cutscene, event)      
         --Set Up
        cutscene:detachFollowers()
        cutscene:walkTo("kris", 920, 440, 1.5, "right")
        cutscene:walkTo("susie", 920, 520, 1.5, "right")
        cutscene:walkTo("ralsei", 920, 640, 1.5, "right")
        cutscene:walkTo("kim", 1280, 520, 1, "right")
        cutscene:wait(cutscene:panTo(1120, 560, 2, "linear"))
        
        
        --Music
        Game.world.music:pause() --music
        Game.world.music:play("Pre_Klack", 50)

--where I want to put the dialogue
    
    cutscene:wait(1)

    

    cutscene:text("* So...", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:walkTo("kim", 1280, 520, 0.5, "left")
    cutscene:text("* You wanna seal this dark fountain?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)

    
    cutscene:walkTo("ralsei", 940, 640, 0.5, "right")
     cutscene:setSprite("ralsei", "walk_unhappy/right")
    cutscene:text("[voice:ralsei][face:ralsei/concern, -15, -10]* Yes! If we don't, then it \nwould cause the ROARING!", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)



    cutscene:text("* So let me get this straight.", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:text("* You barge into someone else's fantasy...", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)
    
    cutscene:setSprite("ralsei", "sad")
    cutscene:text("* And destroy it?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(1)


    cutscene:text("* To stop what, the 'ROARING'?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    
    cutscene:text("* Isn't the Knight DEAD?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:text("[voice:ralsei][face:ralsei/concern, -15, -10] * How do we know for \ncertain...?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)



    cutscene:text("* I, [wait:5]like, [wait:5]shot them? \nIn the head?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)


    cutscene:text("[voice:ralsei][face:ralsei/scared, -15, -10]* You don't know how dangerous this is!", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:text("* Wow.[wait:5] Are you seriously underestimating me?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)

    cutscene:text("* I've done this 'adventure' thing my whole life.", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:text("* So since you're so anxious...", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:fadeOut(0)
    cutscene:text("* Let's get your mind off of it \nand have some fun,[wait:5] kay?", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)
    cutscene:fadeIn(0)


    cutscene:closeText()

        cutscene:startEncounter("kimbattle")
 
    end
}