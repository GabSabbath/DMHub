local mod = dmhub.GetModLoading()

--#region class JournalPannel
local JournalPannel = {}

function JournalPannel:SearchInput()
	return gui.Input{
		id = 'JournalSearch',
		placeholderText = 'Search ...',
		editlag = 0.25,
		style = {
			fontSize = '50%',
			width = '80%',
			height = '80%',
			halign = 'left',
			valign = 'center',
		},

		-- events = {
		-- 	edit = updateSearch,
		-- 	change = updateSearch,
		-- }
	}
end

function JournalPannel:new ()
    return gui.Panel{
		height = "auto",
		width = "auto",
		flow = 'vertical',
		children = {
			gui.Label{
				height = "auto",
				width = "auto",
				text = "Journal",
				halign = "left",
				color = "#d4d1ba",
				fontFace = "dubai",
				uppercase = true,
				fontSize = 14,
				bold = true,
			},
			JournalPannel:SearchInput(),
			
		}
    }
end

--#endregion

--#region putting the panel in DMHub

DockablePanel.Register{
	dmonly=false,
	name = "Journal",
	-- icon = mod.images.bestiaryIcon,
	minHeight = 140,
	dmonly = true,
	vscroll = true,
	content = function()
		return JournalPannel:new ()
	end
}

--#endregion