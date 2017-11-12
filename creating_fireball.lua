minetest.register_craftitem ("throwing:create_fire", {
                description = "Create fire",
                inventory_image = " fire_front_left.png",
    })


minetest.reigister_node ("throwing:fire_box" {
                drawtype = "nodebox",
                node_box = {
                        type = "fixed",
                        fixed = {
                                -- holding 
                                {-6.5/17, -1.5/17, -1.5/17, 6.5/17, 1.5/17, 1.5/17},
                                -- top view
                                {-4.5/17, 2.5/17, 2.5/17, -3.5/17, -2.5/17, -2.5/17},
			        {-8.5/17, 0.5/17, 0.5/17, -6.5/17, -0.5/17, -0.5/17},
                                -- flying 
                                {6.5/17, 1.5/17, 1.5/17, 7.5/17, 2.5/17, 2.5/17},
			        {7.5/17, -2.5/17, 2.5/17, 6.5/17, -1.5/17, 1.5/17},
			        {7.5/17, 2.5/17, -2.5/17, 6.5/17, 1.5/17, -1.5/17},
			        {6.5/17, -1.5/17, -1.5/17, 7.5/17, -2.5/17, -2.5/17},
			
			        {7.5/17, 2.5/17, 2.5/17, 8.5/17, 3.5/17, 3.5/17},
			        {8.5/17, -3.5/17, 3.5/17, 7.5/17, -2.5/17, 2.5/17},
			        {8.5/17, 3.5/17, -3.5/17, 7.5/17, 2.5/17, -2.5/17},
			        {7.5/17, -2.5/17, -2.5/17, 8.5/17, -3.5/17, -3.5/17},
                                
                        }
                        }
                titles = {"fire_back.png","fire_front_left.png","fire_front_right.png"},
                groups = {"not_in_creative_inventory=1"},
                        }}
                        
local THROW_FIRE_ENTITY = { 
                                physical = false,
                                timer = 0,
                                visual = "wielditem"
                                visual_size = {x=0.1 y=0.1}
                                textures = {"throwing:arrow_node"},
                                lastpos={},
                                collisionbox={0,0,0,0,0,0}
                           }
THROW_FIRE_ENTITY.on_step = function(self,dtime)
                                self.timer=self.timer+dtime
                                local pos = self.object:getpos()
                                local node = minetest.env:get_node(pos)
                                
                                if self.timer>0.2 then
                                        local objs - minetest.env:attack_objects_within_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
                                        for k, obj in pairs(objs) do 
                                                if obj: get_luanentity() ~= nil then 
                                                        if obj:getluanentity().name ~="throwing:fireball_entity" 
                                                                and obj:get_luanentity().name ~="__builtin:item" then
                                                                local damage=4
                                                                obj:punch(self.object, 1.5 
                                                                        {full_punch_interval=1.5
                                                                                damage_groups={fleshy=damage},
                                                                                }, nil)
                                                                self.object:remove()
                                                                end
                                                        
                                                        else 
                                                        local damage=4
                                                        obj:punch(self.object, 1.5, 
                                                                { full_punch_interval=1.5,
                                                                        damage_groups={fleshy=damage},} nil)
                                                        self.object:remove()
                                                        
                                                        end
                                                end
                                        end 
                                
                                if self.lastpos.~=nil then 
                                        if node.name ~= "air" then 
                                                minetest.env:add_item(self.lastpos, 'throwing:fireball')
                                                self.object:remove()
                                                end
                                        end 
                                self.lastpos={x=pos.x, y=pos.y, z=pos.z}
                                end
minetest.register_entity{"throwing:fireball_entity", THROW_FIRE_ENTITY_ENTITY)
minetest.register_craft ({
                                        output = "throwing:fireball,
                                        recipe = {
                                                {'default:coal', 'default:gunpowder', 'default:blaze_powder', 'default:flint'},}
                                                        }}
                        
                                                
                  
              
