return {
    chest = function(cutscene, event)
    
    cutscene:text("[voice:ralsei][face:ralsei/small_smile, -15, -10] * Look![wait:5] It's the chest\n from earlier!")
    cutscene:text("[voice:susie][face:susie/smile] * Aw hell yeah.[wait:5] Kris,[wait:5]\n open it up!")
    cutscene:text("* (You try to open the chest.)")
    cutscene:text("* (It's locked.)")
    cutscene:text("[voice:susie][face:susie/nervous_side] * ...uh Kris?[wait:5] You gonna\n open it?")
    cutscene:text("[voice:susie][face:susie/closed_grin_fixed] * Heh,[wait:5] leave it to me,[wait:5]\n wimp.")
    cutscene:text("[voice:susie][face:susie/small_smile] * [wait:70][next]")
    Game.world.music:setPitch(0.9)
    cutscene:text("[voice:susie][face:susie/nervous_side] * [wait:70][next]")
    Game.world.music:setPitch(0.8)
    cutscene:text("[voice:susie][face:susie/shock_nervous] * [wait:70][next]")
    Game.world.music:setPitch(0.7)
    cutscene:text("[voice:susie][face:susie/shy_fixed] * It uh...[wait:5] Won't open.")
    cutscene:text("[voice:ralsei][face:ralsei/shock, -15, -10] * Are we...[wait:5] trapped?!")

     local option = cutscene:choicer({"Look further.", "Don't look further."})
    if option == 1 then
        cutscene:text("* (Upon further investigation,[wait:5] you find a button!)")
        cutscene:playSound("screenshake")
        cutscene:shakeCamera(4, 2, 1)
        Game.world.music:setPitch(1)
        Game:setFlag("troll", true)
        cutscene:text("[voice:susie][face:susie/suspicious] * ...")
        cutscene:text("[voice:ralsei][face:ralsei/surprise_neutral_side, -15, -10] * Maybe the real treasure\n is the friends we made\n along the way...?")
        cutscene:text("[voice:susie][face:susie/suspicious] * I am gonna [glow:210, 115, 1, 0, 0, 1][color:red]FUCKING[color:reset]\n slaughter whoever made\n this")
        
    elseif option == 2 then
        
        Game.world.music:pause()    
        cutscene:fadeOut(1)
        cutscene:text("* You didn't look further.")
        cutscene:text("* You sit down.")
        cutscene:text("* And wait.")
        cutscene:text("* Until...")
        cutscene:text("* E[wait:5]v[wait:5]e[wait:5]r[wait:5]y[wait:5]t[wait:5]h[wait:5]i[wait:5]n[wait:5]g[wait:5] [wait:5]w[wait:5]e[wait:5]n[wait:5]t[wait:5] [wait:5]b[wait:5]l[wait:5]a[wait:5]c[wait:5]k") --Everything went black
        Game.world:hurtParty(500)
    
    
    end
            
    
    
    
 end
}

