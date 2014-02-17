local E, L, V, P, G, _ =  unpack(ElvUI);
local AB = E:GetModule('ActionBars');
local EP = LibStub("LibElvUIPlugin-1.0")
local addon = ...

function AB:EnteringCombat()
	for i = 1, 6 do
		if E.db.actionbar.combatstate['bar'..i]['enable'] then
			E.db.actionbar['bar'..i]['visibility'] = E.db.actionbar.combatstate['bar'..i]['ic']['visibility']
			E.db.actionbar['bar'..i]['mouseover'] = E.db.actionbar.combatstate['bar'..i]['ic']['mouseover']
			E.db.actionbar['bar'..i]['alpha'] = E.db.actionbar.combatstate['bar'..i]['ic']['alpha']
			AB:PositionAndSizeBar('bar'..i)
			AB:UpdateButtonSettings()
		end
	end
end

function AB:LeavingCombat(force, x)
	for i = 1, 6 do
		if E.db.actionbar.combatstate['bar'..i]['enable'] then
			E.db.actionbar['bar'..i]['visibility'] = E.db.actionbar.combatstate['bar'..i]['ooc']['visibility']
			E.db.actionbar['bar'..i]['mouseover'] = E.db.actionbar.combatstate['bar'..i]['ooc']['mouseover']
			E.db.actionbar['bar'..i]['alpha'] = E.db.actionbar.combatstate['bar'..i]['ooc']['alpha']
			AB:PositionAndSizeBar('bar'..i)
			AB:UpdateButtonSettings()
		end
	end
	if force and x then
		if E.db.actionbar.combatstate['bar'..x]['enable'] then
			E.db.actionbar['bar'..x]['visibility'] = E.db.actionbar.combatstate['bar'..x]['ooc']['visibility']
			E.db.actionbar['bar'..x]['mouseover'] = E.db.actionbar.combatstate['bar'..x]['ooc']['mouseover']
			E.db.actionbar['bar'..x]['alpha'] = E.db.actionbar.combatstate['bar'..x]['ooc']['alpha']
			AB:PositionAndSizeBar('bar'..x)
			AB:UpdateButtonSettings()
		else
			E.db.actionbar['bar'..x]['visibility'] = P.actionbar['bar'..x]['visibility']
			E.db.actionbar['bar'..x]['mouseover'] = P.actionbar['bar'..x]['mouseover']
			E.db.actionbar['bar'..x]['alpha'] = P.actionbar['bar'..x]['alpha']
			AB:PositionAndSizeBar('bar'..x)
			AB:UpdateButtonSettings()
		end
	end
end

function AB:MouseOverOption(i)
	if not IsAddOnLoaded("ElvUI_Config") then return end
	if E.db.actionbar.combatstate['bar'..i]['enable'] then
		E.Options.args.actionbar.args['bar'..i]['args']['mouseover'] = nil
		E.Options.args.actionbar.args['bar'..i]['args']['visibility'] = nil
		E.Options.args.actionbar.args['bar'..i]['args']['alpha'] = nil
	else
		E.Options.args.actionbar.args['bar'..i]['args']['mouseover'] = {
			order = 5,
			name = L['Mouse Over'],
			desc = L['The frame is not shown unless you mouse over the frame.'],
			type = "toggle",
			get = function(info) return E.db.actionbar['bar'..i]['mouseover'] end,
			set = function(info, value) E.db.actionbar['bar'..i]['mouseover'] = value; AB:PositionAndSizeBar('bar'..i) end,
		}
		E.Options.args.actionbar.args['bar'..i]['args']['alpha'] = {
			order = 12,
			type = 'range',
			name = L['Alpha'],
			isPercent = true,
			min = 0, max = 1, step = 0.01,
			get = function(info) return E.db.actionbar['bar'..i]['alpha'] end,
			set = function(info, value) E.db.actionbar['bar'..i]['alpha'] = value; AB:PositionAndSizeBar('bar'..i) end,
		}
		E.Options.args.actionbar.args['bar'..i]['args']['visibility'] = {
			type = 'input',
			order = 14,
			name = L['Visibility State'],
			desc = L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"],
			width = 'full',
			multiline = true,
			get = function(info) return E.db.actionbar['bar'..i]['visibility'] end,
			set = function(info, value) 						
				E.db.actionbar['bar'..i]['visibility'] = value; 
				AB:UpdateButtonSettings()
			end,
		}
	end
end

AB.InitializeABCS = AB.Initialize
function AB:Initialize()
	
	AB.InitializeABCS(self)
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "EnteringCombat")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "LeavingCombat")
	EP:RegisterPlugin(addon,ABCSGetOptions)

	for i = 1, 6 do
		AB:MouseOverOption(i)
	end
	
end