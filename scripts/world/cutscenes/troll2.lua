return {
    mover = function(cutscene, event)
    
    cutscene:enableMovement()
    cutscene:text("* See? I told you.", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(5)
    
    cutscene:text("* ...Ok this is funny to watch", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(2)

    cutscene:text("* Alright alright fine I'll make you a path you've suffered enough...", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)
    
    cutscene:text("* Lemme try...", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(4)

    Game:setFlag("mover_spawn", true)
    cutscene:playSound("screenshake")
    cutscene:shakeCamera(4, 2, 1)
    cutscene:text("* This!", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)
    cutscene:text("* There you go!", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)

    cutscene:text("* Now go have fun!", nil, nil,
        { skip = false, advance = false })
    cutscene:wait(3)

 end
}

