local E, L, V, P, G, _ = unpack(ElvUI);
local bars = IsAddOnLoaded('ElvUI_ExtraActionBars') and 10 or 6
P.actionbar['combatstate'] = {}

for i = 1, bars do
P.actionbar['combatstate']["bar"..i] = {
	["enable"] = false,
	["ic"] = {
		['mouseover'] = false,
		['visibility'] = P.actionbar["bar"..i]['visibility'],
		['alpha'] = P.actionbar["bar"..i]['alpha'],
	},
	["ooc"] = {
		['mouseover'] = true,
		['visibility'] = P.actionbar["bar"..i]['visibility'],
		['alpha'] = P.actionbar["bar"..i]['alpha'],
	},
}
end