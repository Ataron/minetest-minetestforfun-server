 -- Mobs Api (15th March 2015)
mobs = {}
mobs.mod = "redo"

-- Do mobs spawn in protected areas (0=yes, 1=no)
mobs.protected = 0

-- Initial check to see if damage is enabled and peaceful mode active
local damage_enabled = minetest.setting_getbool("enable_damage")
local peaceful_only = minetest.setting_getbool("only_peaceful_mobs")

function mobs:register_mob(name, def)
	minetest.register_entity(name, {
		name = name,
		hp_min = def.hp_min or 5,
		hp_max = def.hp_max or 10,
		physical = true,
		collisionbox = def.collisionbox,
		visual = def.visual,
		visual_size = def.visual_size or {x=1, y=1},
		mesh = def.mesh,
		makes_footstep_sound = def.makes_footstep_sound,
		view_range = def.view_range,
		walk_velocity = def.walk_velocity,
		run_velocity = def.run_velocity,
		damage = def.damage,
		light_damage = def.light_damage,
		water_damage = def.water_damage,
		lava_damage = def.lava_damage,
		fall_damage = def.fall_damage or 1,
		fall_speed = def.fall_speed or -10, -- must be lower than -2
		drops = def.drops,
		armor = def.armor,
		drawtype = def.drawtype,
		on_rightclick = def.on_rightclick,
		type = def.type,
		attack_type = def.attack_type,
		arrow = def.arrow,
		shoot_interval = def.shoot_interval,
		sounds = def.sounds or {},
		animation = def.animation,
		follow = def.follow or "",
		jump = def.jump or true,
		exp_min = def.exp_min or 0,
		exp_max = def.exp_max or 0,
		walk_chance = def.walk_chance or 50,
		attacks_monsters = def.attacks_monsters or false,
		group_attack = def.group_attack or false,
		--fov = def.fov or 120,
		passive = def.passive or false,
		recovery_time = def.recovery_time or 0.5,
		knock_back = def.knock_back or 1, --default value is "or 3",
		blood_offset = def.blood_offset or 0,
		blood_amount = def.blood_amount or 5,
		blood_texture = def.blood_texture or "mobs_blood.png",
		shoot_offset = def.shoot_offset or 0,
		floats = def.floats or 1, -- floats in water by default
		replace_rate = def.replace_rate,
		replace_what = def.replace_what,
		replace_with = def.replace_with,
		replace_offset = def.replace_offset or 0,

		stimer = 0,
		timer = 0,
		env_damage_timer = 0, -- only if state = "attack"
		attack = {player=nil, dist=nil},
		state = "stand",
		v_start = false,
		old_y = nil,
		lifetimer = 600,
		tamed = false,
		last_state = nil,
		pause_timer = 0,
		horny = false,
		hornytimer = 0,
		child = false,
		gotten = false,

		do_attack = function(self, player, dist)
			if self.state ~= "attack" then
					if math.random(0,100) < 90  and self.sounds.war_cry then
						minetest.sound_play(self.sounds.war_cry,{ object = self.object })
					end
				self.state = "attack"
				self.attack.player = player
				self.attack.dist = dist
			end
		end,
		
		set_velocity = function(self, v)
			local yaw = self.object:getyaw()
			if self.drawtype == "side" then
				yaw = yaw+(math.pi/2)
			end
			local x = math.sin(yaw) * -v
			local z = math.cos(yaw) * v
			self.object:setvelocity({x=x, y=self.object:getvelocity().y, z=z})
		end,
		
		get_velocity = function(self)
			local v = self.object:getvelocity()
			return (v.x^2 + v.z^2)^(0.5)
		end,
--[[
		in_fov = function(self,pos)
			-- checks if POS is in self's FOV
			local yaw = self.object:getyaw()
			if self.drawtype == "side" then
				yaw = yaw+(math.pi/2)
			end
			local vx = math.sin(yaw)
			local vz = math.cos(yaw)
			local ds = math.sqrt(vx^2 + vz^2)
			local ps = math.sqrt(pos.x^2 + pos.z^2)
			local d = { x = vx / ds, z = vz / ds }
			local p = { x = pos.x / ps, z = pos.z / ps }
			
			local an = ( d.x * p.x ) + ( d.z * p.z )
			
			a = math.deg( math.acos( an ) )
			
			if a > ( self.fov / 2 ) then
				return false
			else
				return true
			end
		end,
]]
		set_animation = function(self, type)
			if not self.animation then
				return
			end
			if not self.animation.current then
				self.animation.current = ""
			end
			if type == "stand" and self.animation.current ~= "stand" then
				if self.animation.stand_start and self.animation.stand_end and self.animation.speed_normal then
					self.object:set_animation({x=self.animation.stand_start,
						y=self.animation.stand_end},self.animation.speed_normal, 0)
					self.animation.current = "stand"
				end
			elseif type == "walk" and self.animation.current ~= "walk"  then
				if self.animation.walk_start and self.animation.walk_end and self.animation.speed_normal then
					self.object:set_animation({x=self.animation.walk_start,y=self.animation.walk_end},
						self.animation.speed_normal, 0)
					self.animation.current = "walk"
				end
			elseif type == "run" and self.animation.current ~= "run"  then
				if self.animation.run_start and self.animation.run_end and self.animation.speed_run then
					self.object:set_animation({x=self.animation.run_start,y=self.animation.run_end},
						self.animation.speed_run, 0)
					self.animation.current = "run"
				end
			elseif type == "punch" and self.animation.current ~= "punch"  then
				if self.animation.punch_start and self.animation.punch_end and self.animation.speed_normal then
					self.object:set_animation({x=self.animation.punch_start,y=self.animation.punch_end},
						self.animation.speed_normal, 0)
					self.animation.current = "punch"
				end
			end
		end,
		
		on_step = function(self, dtime)

			local yaw = 0

			if self.type == "monster" and peaceful_only then
				self.object:remove()
			end
			
			self.lifetimer = self.lifetimer - dtime
			if self.lifetimer <= 0 and not self.tamed and self.type ~= "npc" then
				local player_count = 0
				for _,obj in ipairs(minetest.get_objects_inside_radius(self.object:getpos(), 10)) do
					if obj:is_player() then
						player_count = player_count + 1
						break -- only really need 1 player to be found
					end
				end
				if player_count == 0 and self.state ~= "attack" then
					minetest.log("action","lifetimer expired, removed mob "..self.name)
					self.object:remove()
					return
				end
			end

			-- check for mob drop/replace (used for chicken egg and sheep eating grass/wheat)
			if self.replace_rate and math.random(1,self.replace_rate) == 1 and self.child == false then
				local pos = self.object:getpos() ; pos.y = pos.y + self.replace_offset
				if #minetest.find_nodes_in_area(pos,pos,self.replace_what) > 0
				and self.object:getvelocity().y == 0 and self.state == "stand" then
					minetest.set_node(pos, {name = self.replace_with})
				end
			end

			-- gravity, falling or floating in water
			if self.floats == 1 then
				if minetest.get_item_group(minetest.get_node(self.object:getpos()).name, "water") ~= 0 then
					self.object:setacceleration({x = 0, y = 1.5, z = 0})
				else
					self.object:setacceleration({x = 0, y = self.fall_speed, z = 0})
				end
			else
				self.object:setacceleration({x = 0, y = self.fall_speed, z = 0})
			end

			-- fall damage
			if self.fall_damage == 1 and self.object:getvelocity().y == 0 then
				local d = self.old_y - self.object:getpos().y
				if d > 5 then
					local damage = math.floor(d - 5)
					self.object:set_hp(self.object:get_hp()-damage)
					check_for_death(self)
				end
				self.old_y = self.object:getpos().y
			end
			
			-- if pause state then this is where the loop ends
			-- pause is only set after a monster is hit
			if self.pause_timer > 0 then
				self.pause_timer = self.pause_timer - dtime
				if self.pause_timer < 1 then
					self.pause_timer = 0
				end
				return
			end
			
			self.timer = self.timer + dtime
			if self.state ~= "attack" then
				if self.timer < 1 then
					return
				end
				self.timer = 0
			end

			if self.sounds and self.sounds.random and math.random(1, 100) <= 1 then
				minetest.sound_play(self.sounds.random, {object = self.object})
			end
			
			local do_env_damage = function(self)

				local pos = self.object:getpos()
				local n = minetest.get_node(pos)
				local lit = minetest.get_node_light(pos) or 0
				local tod = minetest.get_timeofday()

				if self.light_damage and self.light_damage ~= 0
				and pos.y > 0
				and lit > 10 -- direct sunlight (was 4)
				and tod > 0.2 and tod < 0.8 then
					self.object:set_hp(self.object:get_hp()-self.light_damage)
					effect(pos, 5, "tnt_smoke.png")
				end

				if self.water_damage and self.water_damage ~= 0
				and minetest.get_item_group(n.name, "water") ~= 0 then
					self.object:set_hp(self.object:get_hp()-self.water_damage)
					effect(pos, 5, "bubble.png")
				end
				
				if self.lava_damage and self.lava_damage ~= 0
				and minetest.get_item_group(n.name, "lava") ~= 0 then
					self.object:set_hp(self.object:get_hp()-self.lava_damage)
					effect(pos, 5, "fire_basic_flame.png")
				end

				check_for_death(self)
			end
			
			self.env_damage_timer = self.env_damage_timer + dtime
			if self.state == "attack" and self.env_damage_timer > 1 then
				self.env_damage_timer = 0
				do_env_damage(self)
			elseif self.state ~= "attack" then
				do_env_damage(self)
			end
			
			-- FIND SOMEONE TO ATTACK
			if self.type == "monster" and damage_enabled and self.state ~= "attack" then

				local s = self.object:getpos()
				local inradius = minetest.get_objects_inside_radius(s,self.view_range)
				local player = nil
				local type = nil

				for _,oir in ipairs(inradius) do

					if oir:is_player() then
						player = oir
						type = "player"
					else
						local obj = oir:get_luaentity()
						if obj then
							player = obj.object
							type = obj.type
						end
					end
					
					if type == "player" or type == "npc" then
						local s = self.object:getpos()
						local p = player:getpos()
						local sp = s
						p.y = p.y + 1
						sp.y = sp.y + 1		-- aim higher to make looking up hills more realistic
						local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
						if dist < self.view_range then -- and self.in_fov(self,p) then
							if minetest.line_of_sight(sp,p,2) == true then
								self.do_attack(self,player,dist)
								break
							end
						end
					end
				end
			end
			
			-- NPC FIND A MONSTER TO ATTACK
			if self.type == "npc" and self.attacks_monsters and self.state ~= "attack" then
				local s = self.object:getpos()
				local inradius = minetest.get_objects_inside_radius(s,self.view_range)
				for _, oir in pairs(inradius) do
					local obj = oir:get_luaentity()
					if obj and obj.type == "monster" then
						-- attack monster
						local p = obj.object:getpos()
						local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
						self.do_attack(self,obj.object,dist)
						break
					end
				end
			end

			if self.follow ~= "" and not self.following then
				for _,player in pairs(minetest.get_connected_players()) do
					local s = self.object:getpos()
					local p = player:getpos()
					local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
					if self.view_range and dist < self.view_range then
						self.following = player ; self.following_player = true
						break
					else self.following_player = nil
					end
				end
			end
			
			if self.following and self.following:is_player() and self.following:get_wielded_item():get_name() ~= self.follow then
				self.following = nil
				self.v_start = false
			end

			if self.following then

                local s = self.object:getpos()
                local p
                if self.following.is_player and self.following:is_player() then
					p = self.following:getpos()
				elseif self.following.object then
					p = self.following.object:getpos()
                end

				if p then
					local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
					if dist > self.view_range then
						self.following = nil
						self.v_start = false
					else
						local vec = {x=p.x-s.x, y=p.y-s.y, z=p.z-s.z}
						local yaw = math.atan(vec.z/vec.x)+math.pi/2
						if self.drawtype == "side" then
							yaw = yaw+(math.pi/2)
						end
						if p.x > s.x then
							yaw = yaw+math.pi
						end
						self.object:setyaw(yaw)
						if dist > 2 then
							if not self.v_start then
								self.v_start = true
								self.set_velocity(self, self.walk_velocity)
							else
								if self.jump and self.get_velocity(self) <= 1.5 and self.object:getvelocity().y == 0 then
									local v = self.object:getvelocity()
									v.y = 6
									self.object:setvelocity(v)
								end
								self.set_velocity(self, self.walk_velocity)
							end
							self:set_animation("walk")
						else
							self.v_start = false
							self.set_velocity(self, 0)
							self:set_animation("stand")
						end
						return
					end
				end
			end

			-- horny animal can mate for 40 seconds, afterwards horny animal cannot mate again for 60 seconds
			if self.horny == true and self.hornytimer < 100 and self.child == false then
				self.hornytimer = self.hornytimer + 1
				if self.hornytimer <= 40 then
					effect(self.object:getpos(), 4, "heart.png")
				end
				if self.hornytimer >= 100 then
					self.hornytimer = 0
					self.horny = false
				end
			end

			-- if animal is child take 120 seconds before growing into adult
			if self.child == true then
				self.hornytimer = self.hornytimer + 1
				if self.hornytimer > 120 then
					self.child = false
					self.hornytimer = 0
					self.object:set_properties({
						textures = self.base_texture,
						mesh = self.base_mesh,
						visual_size = {x=self.visual_size.x,y=self.visual_size.y},
					})
				end
			end

			-- if animal is horny, find another same animal who is horny and mate
			if self.horny == true and self.hornytimer <= 40 then
				local pos = self.object:getpos()
				local ents = minetest.get_objects_inside_radius(pos, self.view_range)
				local num = 0
				for i,obj in ipairs(ents) do

					local ent = obj:get_luaentity()
					if ent and ent.name == self.name and ent.horny == true and ent.hornytimer <= 40 then num = num + 1 end

					if num > 1 then
						--print("2 horny "..name)
						self.following = ent
						ent.following = self
						self.horny = false
						self.hornytimer = 0
						self.following = nil
						ent.horny = false
						ent.following = nil
						ent.hornytimer = 0

						minetest.after(7, function(dtime)
							--print ("spawned baby:",self.name)
							local mob = minetest.add_entity(pos, self.name)
							local ent2 = mob:get_luaentity()
							local texture = self.base_texture
							if def.child_texture then
								print ("child texture detected")
								textures = def.child_texture[1]
							end
							mob:set_properties({
								textures = textures,
								visual_size = {x=self.visual_size.x/2,y=self.visual_size.y/2},
							})
							ent2.child = true
							ent2.tamed = true
						end)
						num = 0
						break
					end
				end
			end

			if self.state == "stand" then
				-- randomly turn
				if math.random(1, 4) == 1 then
					-- if there is a player nearby look at them
					local lp = nil
					local s = self.object:getpos()

					if self.type == "npc" then
						local o = minetest.get_objects_inside_radius(self.object:getpos(), 3)
						
						local yaw = 0
						for _,o in ipairs(o) do
							if o:is_player() then
								lp = o:getpos()
								break
							end
						end
					end

					if lp ~= nil then
						local vec = {x=lp.x-s.x, y=lp.y-s.y, z=lp.z-s.z}
						yaw = math.atan(vec.z/vec.x)+math.pi/2
						if self.drawtype == "side" then
							yaw = yaw+(math.pi/2)
						end
						if lp.x > s.x then
							yaw = yaw+math.pi
						end
					else 
						yaw = self.object:getyaw()+((math.random(0,360)-180)/180*math.pi)
					end
					self.object:setyaw(yaw)
				end

				self.set_velocity(self, 0)
				self.set_animation(self, "stand")

				if math.random(1, 100) <= self.walk_chance then
					self.set_velocity(self, self.walk_velocity)
					self.state = "walk"
					self.set_animation(self, "walk")
				end

			elseif self.state == "walk" then

				if math.random(1, 100) <= 30 then
					self.object:setyaw(self.object:getyaw()+((math.random(0,360)-180)/180*math.pi))
				end
				if self.jump and self.get_velocity(self) <= 0.5 and self.object:getvelocity().y == 0 then
					local v = self.object:getvelocity()
					v.y = 5
					self.object:setvelocity(v)
				end
				self:set_animation("walk")
				self.set_velocity(self, self.walk_velocity)
				if math.random(1, 100) <= 30 then
					self.set_velocity(self, 0)
					self.state = "stand"
					self:set_animation("stand")
				end
			elseif self.state == "attack" and self.attack_type == "kamicaze" then
				if not self.attack.player or not self.attack.player:is_player() then
					self.state = "stand"
					self:set_animation("stand")
					self.timer = 0
					self.blinktimer = 0
					return
				end
				local s = self.object:getpos()
				local p = self.attack.player:getpos()
				local dist = ((p.x - s.x) ^ 2 + (p.y - s.y) ^ 2 + (p.z - s.z) ^ 2) ^ 0.5
				if dist > self.view_range or self.attack.player:get_hp() <= 0 then
					self.state = "stand"
					self.v_start = false
					self.set_velocity(self, 0)
					self.timer = 0
					self.blinktimer = 0
					self.attack = {player = nil, dist = nil}
					self:set_animation("stand")
					return
				else
					self:set_animation("walk")
					self.attack.dist = dist
				end
				
				local vec = {x = p.x -s.x, y = p.y -s.y, z = p.z -s.z}
				local yaw = math.atan(vec.z/vec.x)+math.pi/2
				if self.drawtype == "side" then
					yaw = yaw+(math.pi/2)
				end
				if p.x > s.x then
					yaw = yaw+math.pi
				end
				self.object:setyaw(yaw)
				if self.attack.dist > 3 then
					if not self.v_start then
						self.v_start = true
						self.set_velocity(self, self.run_velocity)
						self.timer = 0
						 self.blinktimer = 0
					else
					     self.timer = 0
						 self.blinktimer = 0
						if self.get_velocity(self) <= 1.58 and self.object:getvelocity().y == 0 then
							local v = self.object:getvelocity()
							v.y = 5
							self.object:setvelocity(v)
						end
						self.set_velocity(self, self.run_velocity)
					end
					self:set_animation("run")
				else
					self.set_velocity(self, 0)
					self.timer = self.timer + dtime
					self.blinktimer = (self.blinktimer or 0) + dtime
						if self.blinktimer > 0.2 then
							self.blinktimer = self.blinktimer - 0.2
							if self.blinkstatus then
								self.object:settexturemod("")
							else
								self.object:settexturemod("^[brighten")
							end
							self.blinkstatus = not self.blinkstatus
						end
						if self.timer > 3 then
							local pos = self.object:getpos()
							pos.x = math.floor(pos.x+0.5)
							pos.y = math.floor(pos.y+0.5)
							pos.z = math.floor(pos.z+0.5)
							do_tnt_physics(pos, 3) -- on applique le principe le la tnt
							local meta = minetest.get_meta(pos)
							minetest.sound_play("tnt_explode", {pos = pos,gain = 1.0,max_hear_distance = 16,})
							if minetest.get_node(pos).name == "default:water_source" or minetest.get_node(pos).name == "default:water_flowing" or minetest.is_protected(pos, "tnt") then
								self.object:remove()
								return
							end
							for x=-3,3 do
								for y=-3,3 do
									for z=-3,3 do
										if x*x+y*y+z*z <= 3 * 3 + 3 then
											local np={x=pos.x+x,y=pos.y+y,z=pos.z+z}
											local n = minetest.get_node(np)
											if n.name ~= "air" and n.name ~= "default:obsidian" and n.name ~= "default:bedrock" and n.name ~= "protector:protect" then
												--activate_if_tnt(n.name, np, pos, 3) -- Pas de module TNT sur le serveur donc inutile
												minetest.remove_node(np)
												nodeupdate(np)
												if n.name ~= "tnt:tnt" and math.random() > 0.9 then
													local drop = minetest.get_node_drops(n.name, "")
													for _,item in ipairs(drop) do
														if type(item) == "string" then
															if math.random(1,100) > 40 then
															local obj = minetest.add_item(np, item)
															end
														end
													end
												end
											end
										end
									end
								end
								self.object:remove()
							end
						end
				end
			elseif self.state == "attack" and self.attack_type == "dogfight" then

				if not self.attack.player or not self.attack.player:getpos() then
					print("stop attacking")
					self.state = "stand"
					self:set_animation("stand")
					return
				end
				local s = self.object:getpos()
				local p = self.attack.player:getpos()
				local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
				if dist > self.view_range or self.attack.player:get_hp() <= 0 then
					self.state = "stand"
					self.v_start = false
					self.set_velocity(self, 0)
					self.attack = {player=nil, dist=nil}
					self:set_animation("stand")
					return
				else
					self.attack.dist = dist
				end
				
				local vec = {x=p.x-s.x, y=p.y-s.y, z=p.z-s.z}
				local yaw = math.atan(vec.z/vec.x)+math.pi/2
				if self.drawtype == "side" then
					yaw = yaw+(math.pi/2)
				end
				if p.x > s.x then
					yaw = yaw+math.pi
				end
				self.object:setyaw(yaw)
				if self.attack.dist > 2 then
					if not self.v_start then
						self.v_start = true
						self.set_velocity(self, self.run_velocity)
					else
						if self.jump and self.get_velocity(self) <= 0.5 and self.object:getvelocity().y == 0 then
							local v = self.object:getvelocity()
							v.y = 5
							self.object:setvelocity(v)
						end
						self.set_velocity(self, self.run_velocity)
					end
					self:set_animation("run")
				else
					self.set_velocity(self, 0)
					self:set_animation("punch")
					self.v_start = false
					if self.timer > 1 then
						self.timer = 0
						local p2 = p
						local s2 = s
						p2.y = p2.y + 1.5
						s2.y = s2.y + 1.5
						if minetest.line_of_sight(p2,s2) == true then
							if self.sounds and self.sounds.attack then
								minetest.sound_play(self.sounds.attack, {object = self.object})
							end
							self.attack.player:punch(self.object, 1.0,  {
								full_punch_interval=1.0,
								damage_groups = {fleshy=self.damage}
							}, vec)
							if self.attack.player:get_hp() <= 0 then
								self.state = "stand"
								self:set_animation("stand")
							end
						end
					end
				end

			elseif self.state == "attack" and self.attack_type == "shoot" then

				if not self.attack.player or not self.attack.player:is_player() then
					self.state = "stand"
					self:set_animation("stand")
					return
				end
				local s = self.object:getpos()
				local p = self.attack.player:getpos()
				p.y = p.y - .5
				s.y = s.y + .5
				local dist = ((p.x-s.x)^2 + (p.y-s.y)^2 + (p.z-s.z)^2)^0.5
				if dist > self.view_range or self.attack.player:get_hp() <= 0 then
					self.state = "stand"
					self.v_start = false
					self.set_velocity(self, 0)
					if self.type ~= "npc" then
						self.attack = {player=nil, dist=nil}
					end
					self:set_animation("stand")
					return
				else
					self.attack.dist = dist
				end
				
				local vec = {x=p.x-s.x, y=p.y-s.y, z=p.z-s.z}
				local yaw = math.atan(vec.z/vec.x)+math.pi/2
				if self.drawtype == "side" then
					yaw = yaw+(math.pi/2)
				end
				if p.x > s.x then
					yaw = yaw+math.pi
				end
				self.object:setyaw(yaw)
				self.set_velocity(self, 0)
				
				if self.timer > self.shoot_interval and math.random(1, 100) <= 60 then
					self.timer = 0

					self:set_animation("punch")

					if self.sounds and self.sounds.attack then
						minetest.sound_play(self.sounds.attack, {object = self.object})
					end

					local p = self.object:getpos()
					p.y = p.y + (self.collisionbox[2]+self.collisionbox[5])/2
					local obj = minetest.add_entity(p, self.arrow)
					local amount = (vec.x^2+vec.y^2+vec.z^2)^0.5
					local v = obj:get_luaentity().velocity
					vec.y = vec.y + self.shoot_offset -- this makes shoot aim accurate
					vec.x = vec.x*v/amount
					vec.y = vec.y*v/amount
					vec.z = vec.z*v/amount
					obj:setvelocity(vec)
				end
			end
		end,

		on_activate = function(self, staticdata, dtime_s)
			local pos = self.object:getpos()
			self.object:set_hp( math.random(self.hp_min, self.hp_max) ) -- set HP
			self.object:set_armor_groups({fleshy=self.armor})
			self.object:setacceleration({x=0, y= self.fall_speed, z=0})
			self.state = "stand"
			self.object:setvelocity({x=0, y=self.object:getvelocity().y, z=0}) ; self.old_y = self.object:getpos().y
			self.object:setyaw(math.random(1, 360)/180*math.pi)
			if self.type == "monster" and peaceful_only then
				self.object:remove()
			end
			if self.type ~= "npc" then
				self.lifetimer = 600 - dtime_s
			end
			if staticdata then
				local tmp = minetest.deserialize(staticdata)
				if tmp then
					if tmp.lifetimer then
						self.lifetimer = tmp.lifetimer - dtime_s
					end
					if tmp.tamed then
						self.tamed = tmp.tamed
					end
					if tmp.gotten then
						self.gotten = tmp.gotten
					end
					if tmp.child then
						self.child = tmp.child
					end
					if tmp.horny then
						self.horny = tmp.horny
					end
					if tmp.hornytimer then
						self.hornytimer = tmp.hornytimer
					end
					if tmp.textures then
						self.textures = tmp.textures
					end
					if tmp.mesh then
						self.mesh = tmp.mesh
					end
					if tmp.base_texture then
						self.base_texture = tmp.base_texture
					end
					if tmp.base_mesh then
						self.base_mesh = tmp.base_mesh
					end
				end
			end

			if self.lifetimer <= 0 and not self.tamed and self.type ~= "npc" then
				self.object:remove()
			end
			
			-- Internal check to see if player damage is still enabled
			damage_enabled = minetest.setting_getbool("enable_damage")

		end,

		get_staticdata = function(self)
			-- select random texture, set model
			if not self.base_texture then
				self.base_texture = def.textures[math.random(1,#def.textures)]
				self.base_mesh = def.mesh
			end
			-- set texture, model and size
			local textures = self.base_texture
			local mesh = self.base_mesh
			local vis_size = self.visual_size
			-- specific texture if gotten
			if self.gotten == true and def.gotten_texture then
				textures = def.gotten_texture
			end
			-- specific mesh if gotten
			if self.gotten == true and def.gotten_mesh then
				mesh = def.gotten_mesh
			end
			-- if object is child then set half size
			if self.child == true then
				vis_size = {x=self.visual_size.x/2,y=self.visual_size.y/2}
				if def.child_texture then
					textures = def.child_texture[1]
				end
			end
			-- remember settings
			local tmp = {
				lifetimer = self.lifetimer,
				tamed = self.tamed,
				gotten = self.gotten,
				child = self.child,
				horny = self.horny,
				hornytimer = self.hornytimer,
				mesh = mesh,
				textures = textures,
				visual_size = vis_size,
				base_texture = self.base_texture,
			}
			self.object:set_properties(tmp)
			return minetest.serialize(tmp)
		end,

		on_punch = function(self, hitter, tflp, tool_capabilities, dir)

			process_weapon(hitter,tflp,tool_capabilities)
			local pos = self.object:getpos()
			check_for_death(self)

			--blood_particles
			if self.blood_amount > 0 and pos then
				local p = pos
				p.y = p.y + self.blood_offset
				effect(p, self.blood_amount, self.blood_texture)
			end

			-- knock back effect, adapted from blockmen's pyramids mod
			-- https://github.com/BlockMen/pyramids
			local kb = self.knock_back
			local r = self.recovery_time

			if tflp < tool_capabilities.full_punch_interval then
				kb = kb * ( tflp / tool_capabilities.full_punch_interval )
				r = r * ( tflp / tool_capabilities.full_punch_interval )
			end

			local ykb=2
			local v = self.object:getvelocity()
			if v.y ~= 0 then
				ykb = 0
			end 

			self.object:setvelocity({x=dir.x*kb,y=ykb,z=dir.z*kb})
			self.pause_timer = r

			-- attack puncher and call other mobs for help
			if self.passive == false and not self.tamed then
				if self.state ~= "attack" then
					self.do_attack(self,hitter,1)
				end
				-- alert other NPCs to the attack
				local inradius = minetest.get_objects_inside_radius(hitter:getpos(),5)
				for _, oir in pairs(inradius) do
					local obj = oir:get_luaentity()
					if obj then
						if obj.group_attack == true and obj.state ~= "attack" then
							obj.do_attack(obj,hitter,1)
						end
					end
				end
			end

		end,
		
	})
end

mobs.spawning_mobs = {}
function mobs:register_spawn(name, nodes, max_light, min_light, chance, active_object_count, max_height)
	mobs.spawning_mobs[name] = true	
	minetest.register_abm({
		nodenames = nodes,
		neighbors = {"air"},
		interval = 30,
		chance = chance,
		action = function(pos, node, _, active_object_count_wider)

			-- do not spawn if too many active in area
			if active_object_count_wider > active_object_count
			or not mobs.spawning_mobs[name] 
			or not pos then
				return
			end

			-- spawn above node
			pos.y = pos.y + 1

			-- mobs cannot spawn inside protected areas if enabled
			if mobs.protected == 1 and minetest.is_protected(pos, "") then
				return
			end

			-- check if light and height levels are ok to spawn
			local light = minetest.get_node_light(pos)
			if not light or light > max_light or light < min_light
			or pos.y > max_height then
				return
			end

			-- are we spawning inside a solid node?
			local nod = minetest.get_node_or_nil(pos)
			if not nod or minetest.registered_nodes[nod.name].walkable == true then return end
			pos.y = pos.y + 1
			nod = minetest.get_node_or_nil(pos)
			if not nod or minetest.registered_nodes[nod.name].walkable == true then return end

			if minetest.setting_getbool("display_mob_spawn") then
				minetest.chat_send_all("[mobs] Add "..name.." at "..minetest.pos_to_string(pos))
			end

			-- spawn mob half block higher
			pos.y = pos.y - 0.5
			minetest.add_entity(pos, name)

		end
	})
end

-- particle effects
function effect(pos, amount, texture)
	minetest.add_particlespawner({
		amount = amount,
		time = 0.25,
		minpos = {x=pos.x-0.2, y=pos.y-0.2, z=pos.z-0.2},
		maxpos = {x=pos.x+0.2, y=pos.y+0.2, z=pos.z+0.2},
		minvel = {x=-0, y=-2, z=-0},
		maxvel = {x=2,  y=2,  z=2},
		minacc = {x=-4, y=-4, z=-4},
		maxacc = {x=4, y=4, z=4},
		minexptime = 0.1,
		maxexptime = 1,
		minsize = 0.5,
		maxsize = 1,
		texture = texture,
	})
end

-- on mob death drop items
function check_for_death(self)
	if self.object:get_hp() > 0 then return end
	local pos = self.object:getpos()
	pos.y = pos.y + 0.5 -- drop items half a block higher
	self.object:remove()
	for _,drop in ipairs(self.drops) do
		if math.random(1, drop.chance) == 1 then
			local d = ItemStack(drop.name.." "..math.random(drop.min, drop.max))
			local obj = minetest.add_item(pos, d)
			if obj then
				obj:setvelocity({x=math.random(-1,1), y=5, z=math.random(-1,1)})
			end
		end
	end
	if self.sounds.death ~= nil then
		minetest.sound_play(self.sounds.death,{object = self.object,})
	end
end

function do_tnt_physics(tnt_np,tntr)
    local objs = minetest.get_objects_inside_radius(tnt_np, tntr)
    for k, obj in pairs(objs) do
        local oname = obj:get_entity_name()
        local v = obj:getvelocity()
        local p = obj:getpos()
            if v ~= nil then
                obj:setvelocity({x=(p.x - tnt_np.x) + (tntr / 4) + v.x, y=(p.y - tnt_np.y) + (tntr / 2) + v.y, z=(p.z - tnt_np.z) + (tntr / 4) + v.z})
            else
                if obj:get_player_name() ~= nil then
                    obj:set_hp(obj:get_hp() - 8) -- lost of 8 life level
                end
            end
    end
end
--MODIFICATION MADE BY MFF

function mobs:register_arrow(name, def)
	minetest.register_entity(name, {
		physical = false,
		visual = def.visual,
		visual_size = def.visual_size,
		textures = def.textures,
		velocity = def.velocity,
		hit_player = def.hit_player,
		hit_node = def.hit_node,
		collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

		on_step = function(self, dtime)
			local pos = self.object:getpos()
			local node = minetest.get_node(self.object:getpos()).name
			if minetest.registered_nodes[node].walkable then
				self.hit_node(self, pos, node)
				self.object:remove()
				return
			end

			for _,player in pairs(minetest.get_objects_inside_radius(pos, 1)) do
				if player:is_player() then
					self.hit_player(self, player)
					self.object:remove()
					return
				end
			end
		end
	})
end

function process_weapon(player, time_from_last_punch, tool_capabilities)
local weapon = player:get_wielded_item()
	if tool_capabilities ~= nil then
		local wear = ( tool_capabilities.full_punch_interval / 75 ) * 65535
		weapon:add_wear(wear)
		player:set_wielded_item(weapon)
	end
	
--	if weapon:get_definition().sounds ~= nil then
--		local s = math.random(0,#weapon:get_definition().sounds)
--		minetest.sound_play(weapon:get_definition().sounds[s], {object=player,})
--	else
--		minetest.sound_play("default_sword_wood", {object = player,})
--	end
end

-- Spawn Egg
function mobs:register_egg(mob, desc, background, addegg)
local invimg = background
if addegg == 1 then
	invimg = invimg.."^mobs_chicken_egg.png"
end
minetest.register_craftitem(mob, {
	description = desc,
	inventory_image = invimg,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		if pointed_thing.above and not minetest.is_protected(pos, placer:get_player_name()) then
			pos.y = pos.y + 0.5
			minetest.add_entity(pos, mob)
			itemstack:take_item()
		end
		return itemstack
	end,
})
end
