local TIMER = 0
minetest.register_globalstep(function(dtime)
	TIMER = TIMER + dtime
	if TIMER < 25 then return end
	TIMER = 0
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		if not minetest.check_player_privs(name, {shout=true}) then
			minetest.chat_send_player(name, "Hey " .. name .. " ! Pour pouvoir communiquer avec les autres joueurs sur ce serveur, tu dois lire les règles de l'irc et les accepter. Tape /irc.")
			minetest.chat_send_player(name, "Hey " .. name .. " ! To speak to other people on this server, you have to read the rules of our irc channel and agree them. Type /irc.")
		end
	end
end)
