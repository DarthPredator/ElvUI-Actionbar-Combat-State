local E, L, V, P, G, _ = unpack(ElvUI);
local AB = E:GetModule('ActionBars');

--Options
local function ABConf()
	for i=1, 6 do
		local name = L['Bar ']..i
		E.Options.args.actionbar.args.combatstate.args['bar'..i] = {
			order = i,
			name = name,
			type = 'group',
			order = 200,
			disabled = function() return not E.private.actionbar.enable or not E.db.actionbar['bar'..i]['enabled'] end,
			args = {
				enable = {
					type = "toggle",
					order = 1,
					name = L['Enable'],
					get = function(info) return E.db.actionbar.combatstate['bar'..i]['enable'] end,
					set = function(info, value) E.db.actionbar.combatstate['bar'..i]['enable'] = value; AB:MouseOverOption(i); AB:LeavingCombat(true, i) end
				},
				ic = {
					order = 2,
					name = L["In Combat"],
					type = 'group',
					guiInline = true,
					disabled = function() return not E.db.actionbar.combatstate['bar'..i]['enable'] end,
					get = function(info) return E.db.actionbar.combatstate['bar'..i]['ic'][ info[#info] ] end,
					set = function(info, value) E.db.actionbar.combatstate['bar'..i]['ic'][ info[#info] ]  = value end,
					args = {
						intro = {
							order = 1,
							type = 'description',
							name = L["Conditions below will take effet when entering combat."],
						},
						mouseover = {
							type = "toggle",
							order = 2,
							name = L['Mouseover'],
							desc = L['The frame is not shown unless you mouse over the frame.'],
						},
						visibility = {
							type = 'input',
							order = 3,
							name = L['Visibility State'],
							desc = L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"],
							width = 'full',
							multiline = true,
						},
					},
				},
				ooc = {
					order = 3,
					name = L["Out of Combat"],
					type = 'group',
					guiInline = true,
					disabled = function() return not E.db.actionbar.combatstate['bar'..i]['enable'] end,
					get = function(info) return E.db.actionbar.combatstate['bar'..i]['ooc'][ info[#info] ] end,
					args = {
						intro = {
							order = 1,
							type = 'description',
							name = L["Conditions below will take effet when leaving combat."],
						},
						mouseover = {
							type = "toggle",
							order = 2,
							name = L['Mouseover'],
							desc = L['The frame is not shown unless you mouse over the frame.'],
							set = function(info, value) E.db.actionbar.combatstate['bar'..i]['ooc']['mouseover'] = value; AB:LeavingCombat() end,
						},
						visibility = {
							type = 'input',
							order = 3,
							name = L['Visibility State'],
							desc = L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"],
							width = 'full',
							multiline = true,
							set = function(info, value) E.db.actionbar.combatstate['bar'..i]['ooc']['mouseover'] = value; AB:LeavingCombat() end,
						},
					},
				},
			},
		}
	end
end


function ABCSGetOptions()
E.Options.args.actionbar.args.combatstate = {
	type = 'group',
	order = 13,
	name = L['Combat State Options'],
	childGroups = "select",
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Combat State Options"],
		},
		intro = {
			order = 2,
			type = 'description',
			name = L["OOC_DESC"],
		},
	},
}

ABConf()
end
