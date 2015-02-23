
-- Oerkki

mobs:register_mob("mobs:oerkki", {
	type = "monster",
	hp_min = 40,
	hp_max = 50,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_oerkki.x",
	--textures = {"mobs_oerkki.png"},
	available_textures = {
		total = 2,
		texture_1 = {"mobs_oerkki.png"},
		texture_2 = {"mobs_oerkki2.png"},
	},
	visual_size = {x=5, y=5},
	makes_footstep_sound = false,
	view_range = 16,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 5,
	drops = {
		{name = "default:obsidian",
		chance = 3,
		min = 1,
		max = 2,},
		{name = "maptools:silver_coin",
		chance = 2,
		min = 2,
		max = 3,},
	},
	armor = 90,
	drawtype = "front",
	light_resistant = true,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 36,
		run_start = 37,
		run_end = 49,
		punch_start = 37,
		punch_end = 49,
		speed_normal = 15,
		speed_run = 15,
	},
	sounds = {
		random = "mobs_oerkki",
		attack = "mobs_oerkki_attack",
	},
	jump = true,
	step = 1,
	blood_texture = "mobs_blood.png",
})
mobs:register_spawn("mobs:oerkki", {"default:stone"}, 2, -1, 6000, 2, -10)
