local E, L, V, P, G, _ = unpack(ElvUI);

P.actionbar['combatstate'] = {
	["bar1"] = {
		["enable"] = false,
		["ic"] = {
			['mouseover'] = false,
			['visibility'] = "[petbattle][nocombat] hide; show",
		},
		["ooc"] = {
			['mouseover'] = true,
			['visibility'] = P.actionbar.bar1.visibility,
		},
	},
	["bar2"] = {
		["enable"] = false,
		["ic"] = {
			['mouseover'] = false,
			['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; [nocombat] hide; show",
		},
		["ooc"] = {
			['mouseover'] = true,
			['visibility'] = P.actionbar.bar2.visibility,
		},
	},
	["bar3"] = {
		["enable"] = false,
		["ic"] = {
			['mouseover'] = false,
			['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; [nocombat] hide; show",
		},
		["ooc"] = {
			['mouseover'] = true,
			['visibility'] = P.actionbar.bar3.visibility,
		},
	},
	["bar4"] = {
		["enable"] = false,
		["ic"] = {
			['mouseover'] = false,
			['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; [nocombat] hide; show",
		},
		["ooc"] = {
			['mouseover'] = true,
			['visibility'] = P.actionbar.bar4.visibility,
		},
	},
	["bar5"] = {
		["enable"] = false,
		["ic"] = {
			['mouseover'] = false,
			['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; [nocombat] hide; show",
		},
		["ooc"] = {
			['mouseover'] = true,
			['visibility'] = P.actionbar.bar5.visibility,
		},
	},
	["bar6"] = {
		["enable"] = false,
		["ic"] = {
			['mouseover'] = false,
			['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; [nocombat] hide; show",
		},
		["ooc"] = {
			['mouseover'] = true,
			['visibility'] = P.actionbar.bar6.visibility,
		},
	},
}
