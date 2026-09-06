local Lib = {}

function Lib:registerTextCommands(text)
	text:registerCommand("glow", function(text, node, dry)
        local glow = Game.world:spawnObject(glow(Game.world.camera.x - text.parent.x + 56 + node.arguments[1], Game.world.camera.y + text.parent.y - 344 + node.arguments[2], 1.5, 0.5, {node.arguments[3],node.arguments[4],node.arguments[5],1}))
		if node.arguments[7] then
			if node.arguments[7] == "teox" then
				glow.sprite:setSprite("effects/glow_teox")
			end
		end
		glow.sprite.alpha = 0
		glow:setLayer(1000)
		glow.sprite:fadeTo(node.arguments[6] + 1 - 1, 0.1)
		table.insert(text.sprites, glow)
		function text:advance()
			for i,v in ipairs(Game.world.cutscene.textbox.text.sprites) do
				v:remove()
			end
			text.should_advance = false
			text.fast_skipping_timer = text.fast_skipping_timer - 1

			text.line_index = text.line_index + 1
			if #text.text_table <= 1 then
				if not text.done then
					text.done = true
					text.line_index = 1
					if text.advance_callback then
						text.advance_callback()
					end
				end
			else
				table.remove(text.text_table, 1)
				text:setText(text.text_table, text.advance_callback, text.line_callback)
			end
		end
    end)
end

return Lib