local mod = dmhub.GetModLoading()

--#region class JournalPannel
local JournalPannel = {}

function JournalPannel:new ()
    return gui.Panel{
		height = "auto",
		width = "auto",
        gui.Label{
			height = "auto",
			width = "auto",
            text = "This is the journal"
        }
    }
end
--#endregion

--#region putting the panel in DMHub

DockablePanel.Register{
	name = "Journal",
	-- icon = mod.images.bestiaryIcon,
	minHeight = 140,
	dmonly = true,
	vscroll = true,
	content = function()
		return JournalPannel:new ()
	end
}