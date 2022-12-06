local mod = dmhub.GetModLoading()
JOURNAL_PANEL_NAME = "Journal"
FONT_SIZE = 14
FONT = "dubai"

--#region Classes
-- JournalPanel
-- Main
--#endregion


--#region class folder



local folder = {}
local isCollapsed = true
function folder.panel()
	return gui.Panel{
		flow = "horizontal",
		gui.Label{
			text="aaa"
		},
		folder.triangle(),
		gui.Label{
			text="bbb"
		}
	}
end

function folder.triangle()
	return gui.Panel({
		bgimage = 'triangle.png',
		classes = "expanded",
		styles =
		{
			{
				bgcolor = 'white',
				width = 12,
				height = 12,
				halign = 'left',
				margin = 5,
				rotate = 90,
				valign = "center",
			},
			{
				selectors = {'empty'},
				bgcolor = 'grey',
			},
			{
				selectors = {'hover'},
				transitionTime = 0.1,
				bgcolor = 'yellow',
			},
			{
				selectors = {'expanded'},
				transitionTime = 0.2,
				rotate = 0,
			},
			{
				selectors = {'search'},
				transitionTime = 0,
				rotate = 0,
			},
		},

		swallowPress = true,

		events = {
			create = function(element)
				element:SetClass('expanded', not isCollapsed)
			end,
			press = function(element)
				if element:HasClass("collapsed") then
					--the triangle itself isn't usable.
					return
				end

				isCollapsed = not isCollapsed

				triangle:SetClass('expanded', not isCollapsed)

				if not isCollapsed then
					folder:FireEvent('expand')
				end
			end,
		},
	})
end

--#endregion

--#region class JournalPannel

local JournalPanel = {}

function JournalPanel.new ()
    return gui.Panel{
		height = "auto",
		width = "auto",
		flow = 'vertical',
		children = {
			JournalPanel.TitleLabel(),
			JournalPanel.SearchInput(),
			addFolderButton,
			addJournalPage,
			folder.panel()
		}
    }
end

function JournalPanel.TitleLabel()
	return gui.Label{
		margin = 5,
		text = JOURNAL_PANEL_NAME,
		height = "auto",
		width = "auto",
		halign = "left",
		color = "#d4d1ba",
		fontFace = FONT,
		uppercase = true,
		fontSize = FONT_SIZE,
		bold = true,
	}
end

function JournalPanel.SearchInput()
	return gui.Input{
		id = 'JournalSearch',
		placeholderText = 'Search ...',
		margin = 5,
		editlag = 0.25,
		style = {
			fontSize = '50%',
			width = 'auto',
			height = '80%',
			halign = 'left',
			valign = 'center',
		}
	}
end

--#endregion

--#region class monsterNode
addFolderButton = gui.AddButton{
	halign = "right",
	width = 24,
	height = 24,
	hover = gui.Tooltip("Create a folder"),
	press = function(element)
		-- local guid = assets:CreateBestiaryEntry()

		-- local newMonster = assets.monsters[guid]
		-- newMonster.properties = monster.CreateNew()

		-- newMonster:Upload()

		-- printf("MONSTER:: %s", guid)
	end,
}

addJournalPage = gui.AddButton{
	halign = "right",
	width = 24,
	height = 24,
	hover = gui.Tooltip("Create a journal page"),
	press = function(element)
		-- local guid = assets:CreateBestiaryEntry()

		-- local newMonster = assets.monsters[guid]
		-- newMonster.properties = monster.CreateNew()

		-- newMonster:Upload()

		-- printf("MONSTER:: %s", guid)
	end,
}
--#endregion


--#region class Main

DockablePanel.Register{
	dmonly=false,
	name = JOURNAL_PANEL_NAME,
	-- icon = mod.images.bestiaryIcon,
	minHeight = 140,
	vscroll = true,
	content = function()
		return JournalPanel.new()
	end
}

--#endregion