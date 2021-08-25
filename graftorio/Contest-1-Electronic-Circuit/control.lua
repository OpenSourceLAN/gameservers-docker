script.on_init(function(event)
	for k, player in pairs(game.players) do
                player.admin=true
		player.cheat_mode=true
		player.surface.always_day=true
		player.research_all_technologies()
	end
end)

script.on_event(defines.events.on_marked_for_deconstruction, function(event)
	event.entity.clear_items_inside()
	event.entity.destroy()
end)

script.on_event(defines.events.on_built_entity, function(ev)
    if (ev.created_entity.name == "entity-ghost" or ev.created_entity.name == "tile-ghost") then
        ev.created_entity.revive()
    end
end)


script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  if player.index == 1 then
  game.show_message_dialog({text = {"welcome-to-contest"}})
  player.admin=true
  player.cheat_mode=true
  player.surface.always_day=true

  else
    player.admin=true
    player.cheat_mode=true
    player.surface.always_day=true

    player.print({"welcome-to-contest"})
  end
  end


 )
