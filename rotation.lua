-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Nov 15th 2013 2:04 pm
ProbablyEngine.rotation.register_custom(263, "GauMeo 0.1", {

--Trinket Procs

--Get Outta that Shit
    { "Tremor Totem", "player.state.fear" },
    { "Tremor Totem", "player.state.charm" },
    { "Tremor Totem", "player.state.sleep" },

-- Pause Rotation - Ghost Wolf Form
    { "pause", "player.buff(Ghost Wolf)" },

-- Interrupt with wind shear
	{ "57994", "modifier.interrupts" },
	{ "57994", "modifier.interrupts", "focus" },

-- Buffs
	{ "8232", "!player.enchant.mainhand" },	-- windfury
	{ "8024", "!player.enchant.offhand" }, 	-- flametongue
	{ "324", "!player.buff(324)" }, 		-- lightning shield
	{ "5394", "player.health < 80" }, 	-- HST

-- Defensives
	{ "30823", { 					-- sham rage
	  "modifier.lalt",
	}},

	{ "108271", { 				-- astral shift
	  "modifier.lalt",
	  "!player.buff(30823)"
	}},

	{ "108270", { 				-- stone bulwark totem
	  "modifier.lalt",
	  "!player.buff(30823)"
	}},
	{ "#5512", "player.health <= 45" },  	-- use healthstone

-- Maelstrom Weapon heal

	{ "1064", { 					-- chain heal
	  "player.buff(53817).count = 5",
	  "modifier.lcontrol" },
	  "mouseover" },

-- cc chaining

	{ "51514", {					-- Hex
	  "focus.debuff(51514).duration < 10",
	  "!player.moving" }, "focus" },
	
	{ "76780", {					-- Bind Elemental
	  "focus.debuff(51514).duration < 10",
	  "!player.moving" }, "focus" },
	   

--Cooldowns (used nested conditions from guide)
{{

-- potion on lust (and other effects)
	{ "#76089", "player.buff(2825)" },	-- bloodlust
	{ "#76089", "player.buff(32182)" },	-- heroism
	{ "#76089", "player.buff(80353)" },	-- timewarp
	{ "#76089", "player.buff(90355)" },	-- Ancient Hysteria

	{ "26297", {					-- Berserking
	  "player.spell(26297).exists"
	}},
	{ "33697", {					-- Blood Fury
	  "player.spell(33697).exists"
	}},
	{ "16166", { 					-- elemental mastery
	  "player.spell(16166).exists"
	}},
	{ "16188", { 					-- ancestral swiftness
	  "player.spell(16188).exists"
	}},
	{ "114049", { 				-- ascendance
	  "!player.buff(114051)"
	}},
	{ "120668", { 				-- stormlash
	  "!player.buff(120676)"
	}},
	{ "2894" }, 					-- fire elemental totem
	{ "2062" }, 					-- earth elemental totem
	{ "51533" }, 					-- feral spirit
} , "modifier.cooldowns" },

-- Totems (separate toggle from multitarget)
	{ "3599", { 					-- searing totem multitarget
	  "!player.totem(2894)",
	  "!player.totem(3599)",
	  "!toggle.magma",
	  "modifier.multitarget"
	}},
	{ "3599", { 					-- searing totem single target
	  "!player.totem(2894)",
	  "!player.totem(3599)",
	  "!modifier.multitarget"
	}},
	{ "8190", { 					-- magma totem
	  "!player.totem(2894)",
	  "!player.totem(8190)",
	  "toggle.magma",
	  "modifier.multitarget"
	}},  

-- Rotations

-- Multitarget (nested)
{{
	{ "8050", "!target.debuff(8050)" }, 	-- flame shock if no debuff
	{ "60103", { 				-- lava lash if flame shock on target
	  "target.debuff(8050)"
	}},	
	{ "1535", { 					-- fire nova if flame shock on target
	  "target.debuff(8050)"
	}},	
	{ "421", {					-- instant chain lightning
	  "player.buff(53817).count = 5",
	}},
	{ "8050", "target.debuff(8050).duration <= 6" }, -- flame shock if debuff is about to expire
	{ "73680" }, 					-- unleash elements
	{ "17364" }, 					-- stormstrike
	{ "115365" }, 				-- stormblast
	{ "8042" }, 					-- earth shock

} , "modifier.multitarget" },

-- Single Target (nested)
{{
	{ "73680" }, 					-- unleash elements
	{ "79206", { 					-- spiritwalker's grace if moving (EB)
	  "player.moving",
	  "player.spell(117014).exists"
	}},
	{ "117014", {					-- elemental blast
	  "player.buff(53817).count = 5",
	  "player.spell(117014).exists"
	  }}, 
	{ "421", { 					-- CL instant with maelstrom weapon (cleave)
	  "player.buff(53817).count = 5",
	  "toggle.magma",
	  "!modifier.lcontrol", 
	}},
	{ "403", { 					-- lb instant with maelstrom weapon
	  "player.buff(53817).count = 5",
	  "!modifier.lcontrol" 
	}},
	{ "17364", "target.range <= 6"  }, 	-- stormstrike
	{ "115365" }, -- stormblast
	{ "1535", { 					-- fire nova if flame shock on target (cleave)
	  "target.debuff(8050)",
	  "toggle.magma"
	}},
	{ "8050", {					-- flame shock with unleash flame when no flame shock on target
	  "player.buff(73683)",
	  "!target.debuff(8050)"
	}}, 	
	{ "60103", "target.range <= 6" }, 	-- lava lash
	{ "8050", "player.buff(73683)" }, 	-- flame shock with unleash flame
	{ "8050", "target.debuff(8050).duration <= 3" }, -- flame shock if about to expire
	{ "421", { 					-- CL with 3+ maelstrom weapon (Cleave) (UF)
	  "player.buff(53817).count >= 3",
	  "!modifier.lcontrol",
	  "!player.moving",
	  "toggle.magma",
	  "player.mana > 20",
	  "player.spell(117012).exists" 
	}},
	{ "79206", { 					-- spiritwalker's grace if moving for CL (Cleave) (UF)
	  "player.moving",
	  "player.spell(117012).exists"
	}},
	{ "403", { 					-- lb with 3+ maelstrom weapon (UF)
	  "player.buff(53817).count >= 3",
	  "!modifier.lcontrol",
	  "player.spell(117012).exists" 
	}},
	{ "421", {						-- CL instant with as buff (cleave)
	  "player.buff(16188)",
	  "toggle.magma"
	}},
	{ "403", "player.buff(16188)" }, 		-- lb instant with as buff 							
	{ "8042" }, 					-- earth shock
	{ "403", { 					-- lb if out of melee range
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "target.range > 6",
	}},
	{ "421", { 					-- CL if everything else is on cooldown (cleave)
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "!player.moving",
	  "toggle.magma",
	  "player.mana > 25",
	  "player.spell(73680).cooldown >= 1.5",
	  "player.spell(17364).cooldown >= 1.5",
	  "player.spell(8050).cooldown >= 1.5",
	  "player.spell(60103).cooldown >= 1.5"
	}},
	{ "403", { 					-- lb if everything else is on cooldown
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "player.spell(73680).cooldown >= 1.5",
	  "player.spell(17364).cooldown >= 1.5",
	  "player.spell(8050).cooldown >= 1.5",
	  "player.spell(60103).cooldown >= 1.5"
	}},
	{ "3599", { 					-- refresh searing totem if nothing else to do
	  "!player.totem(2894)",
	  "!player.totem(3599)"
	}}
} , "!modifier.multitarget" },

  ProbablyEngine.toggle.create('magma', 'Interface\\ICONS\\Spell_fire_selfdestruct.png', 'Magma Totem', 'Enable Magma instead of Searing in AOE')
}, {

-- Buffs out of combat
	{ "8232", "!player.enchant.mainhand" }, -- windfury
	{ "8024", "!player.enchant.offhand" }, 	-- flametongue
	{ "324", "!player.buff(Lightning Shield)" }, -- lightning shield
	{ "5394", "player.health < 60" } 		-- HST

})


