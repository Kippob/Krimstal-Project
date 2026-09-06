return {
    plaza = function(cutscene, event)
    cutscene:text("[voice:sans][face:sans/neutral]* need somethin'?") 
    local option = cutscene:choicer({"Hiiiii!", "Leave my mom alone", "SANS UNDERTALE FIGHT ME", "gay."})
    if option == 1 then
        cutscene:text("[voice:sans][face:sans/neutral]* heya.")

    elseif option == 2 then
            cutscene:text("[voice:sans][face:sans/look_left]* hmmmm... ")
            cutscene:text("[voice:sans][face:sans/wink]* nah. ")

    elseif option == 3 then
            Game.world.music:pause()
            cutscene:text("[voice:sans][face:sans/closed]* woah woah hey chill")
            cutscene:text("[voice:sans][face:sans/look_left]* your mom would kill me \nif we fought")
            cutscene:text("[voice:sans][face:sans/closed]* [wait:5].[wait:5].[wait:5].")
            cutscene:text("[voice:sans][face:sans/neutral]* then again, you look \npretty determined to fight.")
            cutscene:text("[voice:sans][face:sans/closed]* [wait:5].[wait:5].[wait:5].heh")
            cutscene:text("[voice:sans][face:sans/look_left]* you want a fight?")
            cutscene:text("[voice:sans][face:sans/closed]* then i'll give you one.")
            cutscene:text("[voice:sans][face:sans/neutral]* but not like this.")
            cutscene:text("[voice:sans][face:sans/closed]* more like[wait:5].[wait:5].[wait:5].")
            cutscene:text("[voice:sans][face:sans/neutral]* this.")
            love.system.openURL("https://jcw87.github.io/c2-sans-fight/")
            cutscene:text("[face:sans/look_left]* did you have fun?")
            cutscene:text("[voice:ralsei][face:ralsei/neutral]* Kris, why'd you go still for a while?")
            Game.world.music:resume()
    
    elseif option == 4 then
        cutscene:text("[voice:sans][face:sans/eye_roll]* and?")
        cutscene:text("[voice:sans][face:sans/wink]* considering what i did to \nyour mom i don't think \nthat's exactly true")

        end
 end
}

