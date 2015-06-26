FDTObserver = {}
function DeepCopy(t)
    if type(t) ~= 'table' then return t end
    local mt = getmetatable(t)
    local res = {}
    for k,v in pairs(t) do
        if type(v) == 'table' then
            v = Deepcopy(v)
        end
        res[k] = v
    end
    setmetatable(res,mt)
    return res
end

function GetLastIndex(t)
	i = 1
	while (t ~= nil and t[i] ~= nil) do
		i = i + 1
	end
	return i
end

function Trim(s)
	retVal = s

	if(s ~= nil) then
      retVal = string.gsub(s, "^%s*(.-)%s*$", "%1")
    end
    
    return retVal
end

function SafeString(s)
	retVal = ''

	if(s ~= nil) then
      retVal = s
    end
    
    return retVal
end

-- Human can change the following header text or make it empty during loading --
g_FDTL1_Text362179 = 'Demo Text1'
g_FDTL1_Text362221 = 'Demo Text1'
g_FDTL1_Text362266 = 'Demo Text1'
g_FDTL1_Text362312 = 'Demo Text1'
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDTL1_ListText10584= {}

--------- begin FDT 0.251 (Tue Nov 30 23:14:24 EST 2010) ---------
-- Global variable
g_FDTL1_Main_Window_Handle = -1
g_FDTL1_Text_Window_Handle = -1
g_FDTL1_Screen_Count = 0
g_FDTL1_First_Screen = 1
g_FDTL1_Scroll_Up = nil
g_FDTL1_Scroll_Down = nil
g_FDTL1_Scroll_Left = nil
g_FDTL1_Scroll_Right = nil
g_FDTL1_Scroll_XOffset = 0
g_FDTL1_Scroll_YOffset = 0
g_FDTL1_Scroll_ElementIndex = 1
g_FDTL1_Scroll_FWDAllowed = true
g_FDTL1_Scroll_BWDAllowed = true
g_FDTL1_step = 0
-- Global constant
FDTL1_TEXT_WINDOW_LAYER = 3
FDTL1_MAIN_WINDOW_LAYER = 3

-- Font display flag
FONT_ATTRS_NORMAL = 1
FONT_ATTRS_ELIPSE = 2 
FONT_ATTRS_MULTILINE = 4
FONT_ATTRS_CLEARRECT = 8
FONT_ATTRS_RIGHT_JUST = 16
FONT_ATTRS_FADEOUT = 32
FONT_ATTRS_VERTICAL_BOTTOM_UP = 256
FONT_ATTRS_VERTICAL_TOP_DOWN = 512
g_FDTL1_Scroll_BWDClippedAtX = 352
g_FDTL1_Scroll_BWDClippedAtY = 174
g_FDTL1_Scroll_FWDClippedAtX = 329
g_FDTL1_Scroll_FWDClippedAtY = 179
function FDTListScreen1()
	rList = 11897
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rList, 352, 174, 329, 179, 64)
	rListItemSelected = 11420
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rListItemSelected, 354, 178, 327, 36, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 179+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 221+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 266+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362266))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 312+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362312))
	Graphics.UpdateDisplay()
end
function FDTListScreen2()
	rList = 11897
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rList, 352, 174, 329, 179, 64)
	rListItemSelected = 11420
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rListItemSelected, 354, 220, 327, 36, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 179+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 312+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362312))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 221+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 266+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362266))
	Graphics.UpdateDisplay()
end
function FDTListScreen3()
	rList = 11897
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rList, 352, 174, 329, 179, 64)
	rListItemSelected = 11420
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rListItemSelected, 354, 262, 327, 42, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 266+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362266))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 221+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 179+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 312+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362312))
	Graphics.UpdateDisplay()
end
function FDTListScreen4()
	rList = 11897
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rList, 352, 174, 329, 179, 64)
	rListItemSelected = 11420
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTL1_Main_Window_Handle, rListItemSelected, 354, 310, 327, 36, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 312+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362312))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 221+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 179+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTL1_Text_Window_Handle, 362+g_FDTL1_Scroll_XOffset-g_FDTL1_Scroll_BWDClippedAtX, 266+g_FDTL1_Scroll_YOffset-g_FDTL1_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTL1_Text362266))
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler1()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,177,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,177,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,177+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352+330,177,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler2()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,219,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,219,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,219+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352+330,219,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler3()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,264,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,264,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,264+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352+330,264,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler4()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,310,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,310,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352,310+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTL1_Main_Window_Handle,352+330,310,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
g_FDTL1_Last_Screen = 4
-- ######################## begin of text scrolling capability ##########################
-- Note: most important variables are scene #, key and g_FDTL1_Scroll_ElementIndex
-- ######################################################################################
g_FDTL1_Screen_Count = g_FDTL1_Last_Screen	-- due to the preview in the onLoad
g_FDTL1_Scroll_ElementIndex = g_FDTL1_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts
function FDTL1HandleScrolling(scene, key)
	g_FDTL1_Scroll_FWDAllowed = true
	g_FDTL1_Scroll_BWDAllowed = true
	if(scene == 1 and key == KEY_UP) then
		if(g_FDTL1_Scroll_ElementIndex == 1) then
			g_FDTL1_Scroll_BWDAllowed = false
		end
		if(not g_FDTL1_Scroll_BWDAllowed) then
			g_FDTL1_Scroll_ElementIndex = 2
		end
	end

	if(scene == 4 and key == KEY_DOWN) then
		lastElementIndex = GetLastIndex(g_FDTL1_ListText10584)
		Util.DebugPrint('[List]last index '..lastElementIndex)
		if(g_FDTL1_Scroll_ElementIndex == lastElementIndex -1) then
			g_FDTL1_Scroll_FWDAllowed = false
		end
		if(not g_FDTL1_Scroll_FWDAllowed) then
			g_FDTL1_Scroll_ElementIndex = g_FDTL1_Scroll_ElementIndex -1
		end
	end

	Err = Graphics.ClearWindow(g_FDTL1_Text_Window_Handle)
end
function FDTL1HandleScrollingText(scene, key)
	if(scene == 1 and key == KEY_UP and g_FDTL1_Scroll_ElementIndex >= 1) then
		FDTL1InitText(scene, key, g_FDTL1_Scroll_ElementIndex)
	elseif(scene == 4-1 and key == KEY_UP and g_FDTL1_Scroll_ElementIndex == 4-1) then
		FDTL1InitText(scene, key, g_FDTL1_Scroll_ElementIndex -2)
	elseif(scene == 4 and key == KEY_DOWN and g_FDTL1_Scroll_ElementIndex >= 4+1) then
		FDTL1GetNextText(scene, key, g_FDTL1_Scroll_ElementIndex - (g_FDTL1_Last_Screen -1))
	elseif(scene == 4 and key == KEY_OK and g_FDTL1_Scroll_ElementIndex == 4) then
		FDTL1InitText(scene, key, 1)
	end
end
function FDTL1InitText(pageindex, key, index)
g_FDTL1_Text362179 = g_FDTL1_ListText10584[index]
index,g_FDTL1_Text362221 = next(g_FDTL1_ListText10584, index)
index,g_FDTL1_Text362266 = next(g_FDTL1_ListText10584, index)
index,g_FDTL1_Text362312 = next(g_FDTL1_ListText10584, index)
end
function FDTL1GetNextText(pageindex, key, index)
g_FDTL1_Text362179 = g_FDTL1_ListText10584[index]
index,g_FDTL1_Text362221 = next(g_FDTL1_ListText10584, index)
index,g_FDTL1_Text362266 = next(g_FDTL1_ListText10584, index)
index,g_FDTL1_Text362312 = next(g_FDTL1_ListText10584, index)
end
-- ######################## end of text scrolling capability ##########################
function FDTListGetAutoSceneStep()
	step = offsetAutoScene/g_FDTL1_Last_Screen
	return step
end
function OnKeyL1(nKeyCode, nKeyType, nKeyState)
	Err = Graphics.ClearWindow(g_FDTL1_Text_Window_Handle)
	if(nKeyCode == KEY_UP) then
		if(g_FDTL1_Screen_Count <= g_FDTL1_First_Screen + 1) then
			g_FDTL1_Screen_Count = g_FDTL1_First_Screen
		else
			g_FDTL1_Screen_Count = g_FDTL1_Screen_Count - 1
		end
			FDTL1HandleScrolling(g_FDTL1_Screen_Count, nKeyCode)
		g_FDTL1_Scroll_ElementIndex = g_FDTL1_Scroll_ElementIndex - 1
		FDTL1HandleScrollingText(g_FDTL1_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDTL1_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTL1_Scroll_FWDAllowed))
		Util.DebugPrint('[List]backw scene'..g_FDTL1_Screen_Count..' current index='..g_FDTL1_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDTL1_Screen_Count > g_FDTL1_Last_Screen - 1) then
			g_FDTL1_Screen_Count = g_FDTL1_Last_Screen
		else
			g_FDTL1_Screen_Count = g_FDTL1_Screen_Count + 1
		end
			FDTL1HandleScrolling(g_FDTL1_Screen_Count, nKeyCode)
		g_FDTL1_Scroll_ElementIndex = g_FDTL1_Scroll_ElementIndex + 1
		FDTL1HandleScrollingText(g_FDTL1_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDTL1_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTL1_Scroll_FWDAllowed))
		Util.DebugPrint('[List]forw scene'..g_FDTL1_Screen_Count..' current index='..g_FDTL1_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[List]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[List]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTL1HandleScrollingText(g_FDTL1_Screen_Count, nKeyCode)
		--Util.DebugPrint('[List]ok')
	elseif (nKeyCode == KEY_INFO) then
			--DrawBackground()
			--Util.DebugPrint('[List]info')
	end
	if(g_FDTL1_Screen_Count == 1) then
		FDTListScreen1()
		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler1()
		end
	end
	if(g_FDTL1_Screen_Count == 2) then
		FDTListScreen2()
		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler2()
		end
	end
	if(g_FDTL1_Screen_Count == 3) then
		FDTListScreen3()
		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler3()
		end
	end
	if(g_FDTL1_Screen_Count == 4) then
		FDTListScreen4()
		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler4()
		end
	end
	Graphics.UpdateDisplay()
end

-- ##################### begin of note to integrate this component to the other widget #####################
-- *** In the caller script ***, the following code should be defined (preferably at the top of the script):
-- FDTObserver = {}
-- dofile('List.lua')
-- The following code should be invoked directly/indirectly from the caller script's lua_onKey function:
-- TBD
function OnLoadL1()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTL1_Main_Window_Handle = Graphics.CreateWindow(FDTL1_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTL1_Text_Window_Handle = Graphics.CreateWindow(FDTL1_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTL1_Scroll_BWDClippedAtX, g_FDTL1_Scroll_BWDClippedAtY, g_FDTL1_Scroll_FWDClippedAtX, g_FDTL1_Scroll_FWDClippedAtY)
	FDTListScreen1()
	g_FDTL1_Screen_Count = 1
	g_FDTL1_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnTextL1()
	g_FDTL1_Text362179 = g_FDTL1_ListText10584[1]
	g_FDTL1_Text362221 = g_FDTL1_ListText10584[2]
	g_FDTL1_Text362266 = g_FDTL1_ListText10584[3]
	g_FDTL1_Text362312 = g_FDTL1_ListText10584[4]
	Graphics.UpdateDisplay()
end
function ShowL1()
	nErr = Graphics.SetWindowVisibility(g_FDTL1_Main_Window_Handle, TRUE)
	nErr = Graphics.SetWindowVisibility(g_FDTL1_Text_Window_Handle, TRUE)
	Graphics.UpdateDisplay()
end
function HideL1()
	nErr = Graphics.SetWindowVisibility(g_FDTL1_Main_Window_Handle, FALSE)
	nErr = Graphics.SetWindowVisibility(g_FDTL1_Text_Window_Handle, FALSE)
	Graphics.UpdateDisplay()
end
function GetTextL1()
	return g_FDTL1_ListText10584
end
function SetTextL1(listTextTable)
	g_FDTL1_ListText10584 = listTextTable
Util.DebugPrint('[List]listTextTable set to '..g_FDTL1_ListText10584)
end
function GetLastSceneL1()
	return g_FDTL1_Last_Screen
end
List = {
	OnKey = OnKeyL1,
	OnLoad = OnLoadL1,
	OnText = OnTextL1,
	GetText = GetTextL1,
	SetText = SetTextL1,
	GetLastScene = GetLastSceneL1,
	OnUnLoad = lua_onUnLoad,
	Show = ShowL1,
	Hide = HideL1
}
function List.Create()
	local self = DeepCopy(List)
	return self
end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
 FDTObserver["L1"]=List.Create()

-- ##################### end of note to integrate this component to the other widget #####################
--------- end FDT ---------
Util.DebugPrint('List.lua script loaded successfully')

--dofile('ListSlider.lua')
-- Human can change the following header text or make it empty during loading --
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDTS1_ListText10584= {}

--------- begin FDT 0.251 (Tue Nov 30 23:14:24 EST 2010) ---------
-- Global variable
g_FDTS1_Main_Window_Handle = -1
g_FDTS1_Text_Window_Handle = -1
g_FDTS1_Screen_Count = 0
g_FDTS1_First_Screen = 1
g_FDTS1_Scroll_Up = nil
g_FDTS1_Scroll_Down = nil
g_FDTS1_Scroll_Left = nil
g_FDTS1_Scroll_Right = nil
g_FDTS1_Scroll_XOffset = 0
g_FDTS1_Scroll_YOffset = 0
g_FDTS1_Scroll_ElementIndex = 1
g_FDTS1_Scroll_FWDAllowed = true
g_FDTS1_Scroll_BWDAllowed = true
g_FDTS1_step = 0
-- Global constant
FDTS1_TEXT_WINDOW_LAYER = 3
FDTS1_MAIN_WINDOW_LAYER = 3

-- Font display flag
FONT_ATTRS_NORMAL = 1
FONT_ATTRS_ELIPSE = 2 
FONT_ATTRS_MULTILINE = 4
FONT_ATTRS_CLEARRECT = 8
FONT_ATTRS_RIGHT_JUST = 16
FONT_ATTRS_FADEOUT = 32
FONT_ATTRS_VERTICAL_BOTTOM_UP = 256
FONT_ATTRS_VERTICAL_TOP_DOWN = 512
g_FDTS1_Scroll_BWDClippedAtX = 352
g_FDTS1_Scroll_BWDClippedAtY = 174
g_FDTS1_Scroll_FWDClippedAtX = 329
g_FDTS1_Scroll_FWDClippedAtY = 179
function FDTScrollerBallScreenY(y)
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	autoImage = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, autoImage, 658, y, 23, 13, 64)
	ScrollerBlackBackground3 = 15062
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, ScrollerBlackBackground3, 656, 177, 8, 171, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen1()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 185, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen2()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 205, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen3()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 225, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen4()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 245, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen5()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 265, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen6()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 285, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen7()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 305, 23, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen8()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rScrollerBallButton2 = 15671
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rScrollerBallButton2, 658, 325, 23, 13, 64)
	Graphics.UpdateDisplay()
end
g_FDTS1_Last_Screen = 8
-- ######################## begin of text scrolling capability ##########################
-- Note: most important variables are scene #, key and g_FDTS1_Scroll_ElementIndex
-- ######################################################################################
g_FDTS1_Screen_Count = g_FDTS1_Last_Screen	-- due to the preview in the onLoad
g_FDTS1_Scroll_ElementIndex = g_FDTS1_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts
function FDTS1HandleScrolling(scene, key)
	g_FDTS1_Scroll_FWDAllowed = true
	g_FDTS1_Scroll_BWDAllowed = true
	if(scene == 1 and key == KEY_UP) then
		if(g_FDTS1_Scroll_ElementIndex == 1) then
			g_FDTS1_Scroll_BWDAllowed = false
		end
		if(not g_FDTS1_Scroll_BWDAllowed) then
			g_FDTS1_Scroll_ElementIndex = 2
		end
	end

	if(scene == 8 and key == KEY_DOWN) then
		lastElementIndex = GetLastIndex(g_FDTS1_ListText10584)
		Util.DebugPrint('[ScrollerBall]last index '..lastElementIndex)
		if(g_FDTS1_Scroll_ElementIndex == lastElementIndex -1) then
			g_FDTS1_Scroll_FWDAllowed = false
		end
		if(not g_FDTS1_Scroll_FWDAllowed) then
			g_FDTS1_Scroll_ElementIndex = g_FDTS1_Scroll_ElementIndex -1
		end
	end

	Err = Graphics.ClearWindow(g_FDTS1_Text_Window_Handle)
end
function FDTS1HandleScrollingText(scene, key)
	if(scene == 1 and key == KEY_UP and g_FDTS1_Scroll_ElementIndex >= 1) then
		FDTS1InitText(scene, key, g_FDTS1_Scroll_ElementIndex)
	elseif(scene == 8-1 and key == KEY_UP and g_FDTS1_Scroll_ElementIndex == 8-1) then
		FDTS1InitText(scene, key, g_FDTS1_Scroll_ElementIndex -2)
	elseif(scene == 8 and key == KEY_DOWN and g_FDTS1_Scroll_ElementIndex >= 8+1) then
		FDTS1GetNextText(scene, key, g_FDTS1_Scroll_ElementIndex - (g_FDTS1_Last_Screen -1))
	elseif(scene == 8 and key == KEY_OK and g_FDTS1_Scroll_ElementIndex == 8) then
		FDTS1InitText(scene, key, 1)
	end
end
function FDTS1InitText(pageindex, key, index)
end
function FDTS1GetNextText(pageindex, key, index)
end
-- ######################## end of text scrolling capability ##########################
function FDTScrollerBallGetAutoSceneStep()
	offsetAutoScene = 144
	step = offsetAutoScene/g_FDTL1_Last_Screen
	return step
end
g_FDTS1_currentY = 185
function OnKeyS1(nKeyCode, nKeyType, nKeyState)
	Err = Graphics.ClearWindow(g_FDTS1_Text_Window_Handle)
	if(nKeyCode == KEY_UP) then
		if(g_FDTS1_Screen_Count <= g_FDTS1_First_Screen + 1) then
			g_FDTS1_Screen_Count = g_FDTS1_First_Screen
		else
			g_FDTS1_Screen_Count = g_FDTS1_Screen_Count - 1
		end
			FDTS1HandleScrolling(g_FDTS1_Screen_Count, nKeyCode)
		g_FDTS1_Scroll_ElementIndex = g_FDTS1_Scroll_ElementIndex - 1
		FDTS1HandleScrollingText(g_FDTS1_Screen_Count, nKeyCode)
	if(g_FDTL1_Scroll_BWDAllowed) then
	g_FDTS1_currentY = g_FDTS1_currentY - g_FDTS1_step
	FDTScrollerBallScreenY(g_FDTS1_currentY)
	end
Util.DebugPrint('back allowed '..tostring(g_FDTS1_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTS1_Scroll_FWDAllowed))
		Util.DebugPrint('[ScrollerBall]backw scene'..g_FDTS1_Screen_Count..' current index='..g_FDTS1_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDTS1_Screen_Count > g_FDTS1_Last_Screen - 1) then
			g_FDTS1_Screen_Count = g_FDTS1_Last_Screen
		else
			g_FDTS1_Screen_Count = g_FDTS1_Screen_Count + 1
		end
			FDTS1HandleScrolling(g_FDTS1_Screen_Count, nKeyCode)
		g_FDTS1_Scroll_ElementIndex = g_FDTS1_Scroll_ElementIndex + 1
		FDTS1HandleScrollingText(g_FDTS1_Screen_Count, nKeyCode)
	if(g_FDTL1_Scroll_FWDAllowed) then
	g_FDTS1_currentY = g_FDTS1_currentY + g_FDTS1_step
	FDTScrollerBallScreenY(g_FDTS1_currentY)
	end
Util.DebugPrint('back allowed '..tostring(g_FDTS1_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTS1_Scroll_FWDAllowed))
		Util.DebugPrint('[ScrollerBall]forw scene'..g_FDTS1_Screen_Count..' current index='..g_FDTS1_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[ScrollerBall]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[ScrollerBall]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTS1HandleScrollingText(g_FDTS1_Screen_Count, nKeyCode)
		--Util.DebugPrint('[ScrollerBall]ok')
	elseif (nKeyCode == KEY_INFO) then
			--DrawBackground()
			--Util.DebugPrint('[ScrollerBall]info')
	end
	Graphics.UpdateDisplay()
end

-- ##################### begin of note to integrate this component to the other widget #####################
-- *** In the caller script ***, the following code should be defined (preferably at the top of the script):
-- FDTObserver = {}
-- dofile('ScrollerBall.lua')
-- The following code should be invoked directly/indirectly from the caller script's lua_onKey function:
-- TBD
function OnLoadS1()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTS1_Main_Window_Handle = Graphics.CreateWindow(FDTS1_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTS1_Text_Window_Handle = Graphics.CreateWindow(FDTS1_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTS1_Scroll_BWDClippedAtX, g_FDTS1_Scroll_BWDClippedAtY, g_FDTS1_Scroll_FWDClippedAtX, g_FDTS1_Scroll_FWDClippedAtY)
	FDTScrollerBallScreen1()
	g_FDTS1_Screen_Count = 1
	g_FDTS1_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnTextS1()
	g_FDTS1_step = FDTScrollerBallGetAutoSceneStep()
	Graphics.UpdateDisplay()
end
function ShowS1()
	nErr = Graphics.SetWindowVisibility(g_FDTS1_Main_Window_Handle, TRUE)
	nErr = Graphics.SetWindowVisibility(g_FDTS1_Text_Window_Handle, TRUE)
	Graphics.UpdateDisplay()
end
function HideS1()
	nErr = Graphics.SetWindowVisibility(g_FDTS1_Main_Window_Handle, FALSE)
	nErr = Graphics.SetWindowVisibility(g_FDTS1_Text_Window_Handle, FALSE)
	Graphics.UpdateDisplay()
end
function GetTextS1()
	return g_FDTS1_ListText10584
end
function SetTextS1(listTextTable)
	g_FDTS1_ListText10584 = listTextTable
Util.DebugPrint('[ScrollerBall]listTextTable set to '..g_FDTS1_ListText10584)
end
function GetLastSceneS1()
	return g_FDTS1_Last_Screen
end
ScrollerBall = {
	OnKey = OnKeyS1,
	OnLoad = OnLoadS1,
	OnText = OnTextS1,
	GetText = GetTextS1,
	SetText = SetTextS1,
	GetLastScene = GetLastSceneS1,
	OnUnLoad = lua_onUnLoad,
	Show = ShowS1,
	Hide = HideS1
}
function ScrollerBall.Create()
	local self = DeepCopy(ScrollerBall)
	return self
end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
 FDTObserver["S1"]=ScrollerBall.Create()

-- ##################### end of note to integrate this component to the other widget #####################
--------- end FDT ---------
Util.DebugPrint('ScrollerBall.lua script loaded successfully')


BACKGROUND_LAYER=4
NAVIGATOR_LAYER=5

-- Global constants
LUA_APPID = 1291
MESSAGE_EXIT = 9
MESSAGE_EXITNLAUNCH = 13
MESSAGE_LUALAUNCH = 14
 
HG_ERR_NONE = 0
HG_ERR_FAILED = -1

TRUE   = 1
FALSE  = 0

--Window XY Coordinates

WINDOW_X_POS = 0
WINDOW_Y_POS = 0
WINDOW_WIDTH = 704
WINDOW_HEIGHT = 480

NAVBAR_X_POS = 352
NAVBAR_Y_POS = 82
NAVBAR_WIDTH = 329
NAVBAR_HEIGHT = 46
navbar_move_right = 1
navbar_move_right1 = 2
navbar_move_left = 3
navbar_move_left1 = 4


WIDGETBODYWINDOW_X_POS = 352
WIDGETBODYWINDOW_Y_POS = 128
WIDGETBODYWINDOW_WIDTH = 329
WIDGETBODYWINDOW_HEIGHT = 319


-- Remote KeyCode Global Variables
KEY_DOWN = 53
KEY_EXIT = 18
KEY_FWD = 29
KEY_INFO = 51
KEY_LEFT = 54
KEY_RIGHT = 55
KEY_OK = 17
KEY_BACK = 60
KEY_PAGEUP = 58
KEY_CH_UP = 11
KEY_CH_DN = 12
KEY_PAUSE = 31
KEY_PLAY = 27
KEY_REC = 49
KEY_REW = 30
KEY_STOP = 28
KEY_UP = 52
KEY_LAST = 19
KEY_GUIDE = 48
KEY_MENU = 25
KEY_VOD = 26         
KEY_LIST = 61
KEY_OPTION = 50
KEY_C = 40
KEY_A = 23
KEY_B = 39

-- Script Global Variables
main_Window_Attribute = 0
main_Window_Handle = 0

--Global Variables for Navbar area
navbar_Attribute = 0
navbar_Handle = 0

--Global Variables for Calendar Window area
calendar_Handle = 0
calendar_Attribute = 0
isCalendar = 0

--Global Variables for neighborhood Window area
neighborhood_Handle = 0
neighborhood_Attribute = 0
isneighborhood = 0

--Global Variables for Maps Window area
maps_Handle = 0
maps_Attribute = 0
ismaps = 0
zoomvalue = 13
maptoggle = 0
movemapX = 0
movemapY = 0
pandown = 0
panleft = 0
panright = 0
panup = 0
--Zipcode variables
zipcode_VALUE = ''
zipcode_Attribute = 0
zipcode_Handle = 0
ZIPCODE_X_POS = 541
ZIPCODE_Y_POS = 188
ZIPCODE_WIDTH = 40
ZIPCODE_HEIGHT = 30

--subwindows for calendar, neighborhood, maps window variables

isoptions = 0
options_Attribute = 0
options_Handle = 0
OPTIONS_X_POS = 362 
OPTIONS_Y_POS = 220
OPTIONS_WIDTH = 314
OPTIONS_HEIGHT = 223

--real options window variables

isoptions = 0
realoptions_Attribute = 0
realoptions_Handle = 0




-- Global Functions

----------------------------------------------------------------------------
-- Utility functions
----------------------------------------------------------------------------

-- Global variable

--Enable this for debug prints
g_nDebug = 1

function debugPrint(s)
    if g_nDebug == 1 then
    	Util.DebugPrint(s)
    end 
end

-------------------------------------------------------------------------
-- This function is called from Mercury when the Lua script is loaded
-- only if the function has been defined in the Lua script.
-------------------------------------------------------------------------

function lua_onInit(nAppId, strParam)
    print('   Argument 1:' .. tostring(nAppId))
    if type(strParam) == 'string' then
        print('   Argument 2:' .. tostring(strParam))
    else
        print('   Argument 2: Empty String' )
    end  
    Err = Graphics.InitWindowAttributes() 

    return HG_ERR_NONE
end

function lua_onLoad()

    print('lua_onLoad invoked')
    -- Initialize the graphics frame and show the start up screen
    --InitLuaScripts()

	if( main_Window_Attribute <= 0 ) then
		nErr,main_Window_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( main_Window_Handle <= 0 ) then
		nErr,main_Window_Handle = Graphics.CreateWindow(BACKGROUND_LAYER, main_Window_Attribute, 0, WINDOW_X_POS, WINDOW_Y_POS, WINDOW_WIDTH, WINDOW_HEIGHT)
	end

	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30018, 320, 220, 64)
	Graphics.UpdateDisplay()
	nErr,mainpageTimerID = Timer.Create(1,10000,0)
	Timer.Start(mainpageTimerID)
	--Timer.Stop(mainpageTimerID)
--	Graphics.ClearWindow(main_Window_Handle)
	Graphics.UpdateDisplay()
	
	if( navbar_Attribute <= 0 ) then
		nErr,navbar_Attribute = Graphics.CreateWindowAttrib()
	end

	if( navbar_Handle <= 0 ) then
		nErr,navbar_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, navbar_Attribute, main_Window_Handle, NAVBAR_X_POS, NAVBAR_Y_POS, NAVBAR_WIDTH, NAVBAR_HEIGHT)
	end
	
	if( calendar_Attribute <= 0 ) then
		nErr,calendar_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( calendar_Handle <= 0 ) then
--		nErr,calendar_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, calendar_Attribute, main_Window_Handle, WIDGETBODYWINDOW_X_POS, WIDGETBODYWINDOW_Y_POS, WIDGETBODYWINDOW_WIDTH, WIDGETBODYWINDOW_HEIGHT)
	end
	
	if( neighborhood_Attribute <= 0 ) then
		nErr,neighborhood_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( neighborhood_Handle <= 0 ) then
--		nErr,neighborhood_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, neighborhood_Attribute, main_Window_Handle, WIDGETBODYWINDOW_X_POS, WIDGETBODYWINDOW_Y_POS, WIDGETBODYWINDOW_WIDTH, WIDGETBODYWINDOW_HEIGHT)
	end
	
	if( maps_Attribute <= 0 ) then
		nErr,maps_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( maps_Handle <= 0 ) then
		nErr,maps_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, maps_Attribute, main_Window_Handle, WIDGETBODYWINDOW_X_POS, WIDGETBODYWINDOW_Y_POS, WIDGETBODYWINDOW_WIDTH, WIDGETBODYWINDOW_HEIGHT)
	end
	
	if( zipcode_Attribute <= 0 ) then
		nErr,zipcode_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( zipcode_Handle <= 0 ) then
		nErr,zipcode_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, zipcode_Attribute, main_Window_Handle, ZIPCODE_X_POS, ZIPCODE_Y_POS, ZIPCODE_WIDTH, ZIPCODE_HEIGHT)
	end
	
	if( options_Attribute <= 0 ) then
		nErr,options_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( options_Handle <= 0 ) then
		nErr,options_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, options_Attribute, main_Window_Handle, OPTIONS_X_POS, OPTIONS_Y_POS, OPTIONS_WIDTH, OPTIONS_HEIGHT)
	end
	
	if( realoptions_Attribute <= 0 ) then
		nErr,realoptions_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( realoptions_Handle <= 0 ) then
		nErr,realoptions_Handle = Graphics.CreateWindow(NAVIGATOR_LAYER, realoptions_Attribute, main_Window_Handle, WIDGETBODYWINDOW_X_POS, WIDGETBODYWINDOW_Y_POS, WIDGETBODYWINDOW_WIDTH, WIDGETBODYWINDOW_HEIGHT)
	end

calendar_Handle = maps_Handle
--navbar_Handle = maps_Handle
neighborhood_Handle = maps_Handle
 	
	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30001, 0, 0, 64)
	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30002, 0, 26, 64)
	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30006, 352, 26, 64)
	DrawCalendar()

	FDTObserver["L1"].OnLoad()
	Graphics.UpdateDisplay()
	FDTObserver["S1"].OnLoad()
	Graphics.UpdateDisplay()


end 


-------------------------------------------------------------------------
-- This function is called just before unloading the lua script and is
-- a chance for the Lua script to do any clean up in Mercury code.
-------------------------------------------------------------------------

function lua_onUnload()
    print('lua_onUnload invoked')
	
    nErr = App.Cleanup()
    return HG_ERR_NONE
end

function ExitApp()
    print('Exiting the Application ...')
    App.PostMessage(MESSAGE_EXIT, LUA_APPID, 0)
end

-------------------------------------------------------------------------
-- Functions to Draw Calendar and Navbar
-------------------------------------------------------------------------

function DrawNavbar(move_value)
	debugPrint(" Inside Navbar ")
	if( move_value == navbar_move_right ) then
		nErr = Graphics.DrawImageByID(navbar_Attribute, navbar_Handle, 30008, 0, 0, 64)
	end
	
	if( move_value == navbar_move_right1 ) then
		nErr = Graphics.DrawImageByID(navbar_Attribute, navbar_Handle, 30009, 0, 0, 64)
	end
	
	if( move_value == navbar_move_left ) then
		nErr = Graphics.DrawImageByID(navbar_Attribute, navbar_Handle, 30008, 0, 0, 64)
	end
	
	if( move_value == navbar_move_left1 ) then
		nErr = Graphics.DrawImageByID(navbar_Attribute, navbar_Handle, 30003, 0, 0, 64)
	end
	
end

function DrawCalendar()
	debugPrint(" Inside Calendar ")
	isCalendar = 1
	DrawNavbar(navbar_move_left1)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30007, 0, 0, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30004, 0, 0, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30005, 0, 47, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30005, 0, 90, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30005, 0, 133, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30005, 0, 180, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30005, 0, 223, 64)
	local Data = 0
	local DalaLen = 0
	local ErrMsg = ''
	
	Err,Stime = Timer.GetTime()
	local data1='time='..tostring(Stime)
	local length = string.len(data1)

	debugPrint("before calling google calendar servlet ...")

--http://cloudserviceapi.appspot.com/sci/CalendarEventServletII
--	nResp, myTable = Network.HTTPPost('http://localhost:8080/CalendarWebProject/CalendarEventServletII', data1,length,'text/plain;charset=UTF-8')
	nResp, myTable = Network.HTTPPost('http://cloudserviceapi.appspot.com/sci/CalendarEventServletII', data1,length,'text/plain;charset=UTF-8')
--	nResp, myTable = Network.HTTPPost('http://cloudserviceapi.appspot.com:8888/sci/CalendarEventServletII', data1,length,'text/plain;charset=UTF-8')
--	nResp, len, myTable = Network.HTTPGetFile('http://localhost:8888/sci/CalendarEventServletII')
--	nResp, len, myTable = Network.HTTPGetFile('http://cloudserviceapi.appspot.com/sci/CalendarEventServletII')

	debugPrint("calling google calendar servlet done.")



--	FDTObserver["L1"].GetText = {'jt1','jt2','jt3','jt4','jt5','jt6','jt7'}
--	debugPrint("table = "..myTable)

s = myTable
local t = {}                   -- table to store the indices
local i = 0
	debugPrint("before first loop...")
while true do
debugPrint("1")
	if(s == nil) then break end
  i = string.find(s, "\n", i+1)    -- find 'next' newline
debugPrint("1.1")
  if i == nil then break end
debugPrint("1.2")
  table.insert(t, i)
debugPrint("1.3")
end
debugPrint("2")

begin = 1
	debugPrint("before second loop...")
for i=1,GetLastIndex(t)-1,1 do
	temp = string.sub(s, begin, t[i])
	len = string.len(Trim(temp))
 	debugPrint(temp..' len is '..tostring(len))
  	if (len > 0) then
		textList = FDTObserver["L1"].GetText()
		textList[i] = temp
	end
	begin = t[i]
end
	debugPrint("after second loop.")
	--debugPrint(g_FDT_ListText10584[1])
	--debugPrint(g_FDT_ListText10584[2])
	--debugPrint(g_FDT_ListText10584[3])
	--debugPrint(g_FDT_ListText10584[4])

	FDTObserver["L1"].OnText()
	
	debugPrint('******** b4 table print')
	debugPrint('size of table '..GetLastIndex(FDTObserver["L1"].GetText())-1)
	debugPrint('******** aftr table print')

	if(myTable ~= nil) then
	FDTObserver["S1"].SetText(myTable)
	FDTObserver["S1"].OnText()
	end
	
	if(nResp==nil) then nResp = '' end
--	debugPrint('google cal text = '..nResp)
--	nErr = Graphics.DrawString(calendar_Attribute, calendar_Handle, 10,51, 200,100, "0x00550000", "0x00000000", 3,1, nResp)
   	debugPrint(nErr)
	Graphics.UpdateDisplay()

	debugPrint("draw calendar done.")
	
end


-------------------------------------------------------------------------
-- Neighborhood Related Functions 
-------------------------------------------------------------------------
function DrawNeighborhood()
debugPrint(" Inside Neighborhood ")
	isNeighborhood = 1
	DrawNavbar(navbar_move_right1)
	nErr = Graphics.DrawImageByID(neighborhood_Attribute, neighborhood_Handle, 30012, 0, 0, 64)
	nErr = Graphics.DrawImageByID(neighborhood_Attribute, neighborhood_Handle, 30010, 0, 0, 64)
	nErr = Graphics.DrawImageByID(neighborhood_Attribute, neighborhood_Handle, 30011, 7, 49, 64)
	nErr = Graphics.DrawImageByID(options_Attribute, options_Handle, 30020, 0, 0, 64)
	Graphics.UpdateDisplay()
	
end

function getTraffic()
	zipVal = zipcode_VALUE
--	url = 'http://localhost:8080/quercus-4.0.8/Php_Lua/Traffic.php'

	postData = 'zip='..zipVal
	size = string.len(postData)
	nErr, strResponse = Network.HTTPPost(url, postData, size, 'application/x-www-form-urlencoded')
	nErr, len,bData = Network.HTTPGetFile('http://localhost:8080/quercus-4.0.8/Php_Lua/TrafficResults.txt')
	url = 'http://cloudserviceapi.appspot.com/url?target=traffic&value='..zipVal
--	url = 'http://cloudserviceapi.appspot.com:8888/url?target=traffic&value='..zipVal
	nErr, bData = Network.HTTPPost(url, postData, size, 'application/x-www-form-urlencoded')
	if bData == 'Failed' or bData == '' then
		bData = 'Not Available'
	end    
	Graphics.ClearWindow( options_Handle )
	Graphics.UpdateDisplay()
	nErr = Graphics.DrawImageByID(options_Attribute, options_Handle, 30013, 0, 0, 64)
	nErr = Graphics.DrawImageByID(options_Attribute, options_Handle, 30014, 0, 113, 64)
	Graphics.DrawString(options_Attribute, options_Handle,  40,5,200,100, "0x00c0c0c0", "0xFF33CC33", 5,1, bData)
	Graphics.UpdateDisplay()
end
function getWeather()
	postData = 'addr='..zipVal
	dataLen = string.len(postData)
--	nErr, strResponse = Network.HTTPPost('http://localhost:8080/quercus-4.0.8/Php_Lua/weatherLocation.php', postData, dataLen, 'application/x-www-form-urlencoded')
--	nErr, len,bData = Network.HTTPGetFile('http://localhost:8080/quercus-4.0.8/Php_Lua/weather.txt' )
	nErr, len,bData = Network.HTTPGetFile('http://cloudserviceapi.appspot.com/url?target=weather&value='..zipVal)
--	nErr, len,bData = Network.HTTPGetFile('http://cloudserviceapi.appspot.com:8888/url?target=weather&value='..zipVal)
	Graphics.DrawString(options_Attribute, options_Handle,  40,115,200,100, "0x00c0c0c0", "0xFF33CC33", 3,1, bData)
	Graphics.UpdateDisplay()
end


----------------------------------------------------------------------------
-- Maps Related Functions
----------------------------------------------------------------------------
function DrawMaps()
	debugPrint(" Inside maps ")
	isMaps = 1
	zipcode_VALUE = ''
	DrawNavbar(navbar_move_right)
	nErr = Graphics.DrawImageByID(maps_Attribute, maps_Handle, 30012, 0, 0, 64)
	nErr = Graphics.DrawImageByID(maps_Attribute, maps_Handle, 30015, 0, 0, 64)
	nErr = Graphics.DrawImageByID(maps_Attribute, maps_Handle, 30011, 7, 49, 64)
	nErr = Graphics.DrawImageByID(options_Attribute, options_Handle, 30019, 0, 0, 64)
	zoomvalue = 13
	Graphics.UpdateDisplay()

end

function DrawMapImage(zoomvalue,zipcode_VALUE,movemapX,movemapY)
	Graphics.ClearWindow( options_Handle )
	Graphics.UpdateDisplay()
	mapsUrl = "http://developer.multimap.com/API/map/1.2/OA10110113074911284?ZIP="..zipcode_VALUE.."&countryCode=US&zoomFactor="..zoomvalue.."&width=307&height=217&moveMap="..movemapX..","..movemapY..""
	-- mapsUrl = "http://maps.google.com/maps/api/staticmap?zoom="..zoomvalue.."&size=307x217&markers=color:blue|label:S|"..zipcode_VALUE.."&sensor=true&maptype=roadmap"
	debugPrint( mapsUrl )
	Err, DalaLen, Data = Network.HTTPGetFile(mapsUrl)
	Err = Graphics.DrawImage (options_Attribute, options_Handle, Data,DalaLen, 0, 0, 307, 217, 1)
	Graphics.UpdateDisplay()
end

----------------------------------------------------------------------------
-- Scripts Functions
----------------------------------------------------------------------------

function lua_onKey(nKeyCode, nKeyType, nKeyState)
debugPrint(nKeyCode)
	OnKeyHandler(nKeyCode, nKeyType, nKeyState)
    return HG_ERR_NONE
end

function lua_onEvent(nEventID,nData,strData)
	--FaceBookOnEventHandler(nEventID, nData, strData)
    return HG_ERR_NONE
end

function lua_onTimerEvent(nTimerID, nData, strData)
	--FaceBookOnTimerEventHandler(nTimerID, nData, strData)
    return HG_ERR_NONE
end


----------------------------------------------------------------------------
-- onkeyhandler Functions
----------------------------------------------------------------------------

function OnKeyHandler(nKeyCode, nKeyType, nKeyState)
--	debugPrint('total component registered '..GetLastIndex(FDTObserver)-1)
--	for index = 1, GetLastIndex(FDTObserver)-1, 1 do
--		FDTObserver[index].OnKey(nKeyCode, nKeyType, nKeyState)
--		debugPrint('component '..index..' notified')
--	end


	--FDTObserver["L1"].Hide()	--refresh bug fix
	if( isCalendar == 1) then
		if(nKeyCode == KEY_LEFT or nKeyCode == KEY_UP or nKeyCode == KEY_DOWN) then
			FDTObserver["L1"].Show()
			FDTObserver["L1"].OnKey(nKeyCode, nKeyType, nKeyState)
			FDTObserver["S1"].Show()
			FDTObserver["S1"].OnKey(nKeyCode, nKeyType, nKeyState)
		end
		CalendarOnKeyHandler(nKeyCode, nKeyType, nKeyState)
		return 
	end
	if( isNeighborhood == 1) then
		NeignborhoodOnKeyHandler(nKeyCode, nKeyType, nKeyState)
		return
	end
	if( isMaps == 1) then
		MapsOnKeyHandler(nKeyCode, nKeyType, nKeyState)
		return
	end

end

function CalendarOnKeyHandler(nKeyCode, nKeyType, nKeyState)
	--if( nKeyCode == KEY_OPTION) then
		--isoptions = 1
		--Graphics.ClearWindow( realoptions_Handle )
		--nErr = Graphics.DrawImageByID(realoptions_Attribute, realoptions_Handle, 30016, 8, 51, 64)
		--Graphics.UpdateDisplay()
		--return
	--end

	--if( nKeyCode == KEY_BACK) then
		--isoptions = 0
		--Graphics.ClearWindow( realoptions_Handle )
		--Graphics.UpdateDisplay()
		--return
	--end

	if( nKeyCode == KEY_RIGHT) then
		FDTObserver["L1"].Hide()
		FDTObserver["S1"].Hide()
		Graphics.ClearWindow( calendar_Handle )
		Graphics.ClearWindow( options_Handle )
		Graphics.ClearWindow( navbar_Handle )
		Graphics.ClearWindow( realoptions_Handle )
		--Graphics.UpdateDisplay()
		isCalendar = 0
		isoptions = 0
		debugPrint( " Pressed key right " )
		DrawMaps()
		return
	end
	
end

function MapsOnKeyHandler(nKeyCode, nKeyType, nKeyState)

	--if( nKeyCode == KEY_OPTION) then
		--isoptions = 1
		--Graphics.ClearWindow( realoptions_Handle )
		--nErr = Graphics.DrawImageByID(realoptions_Attribute, realoptions_Handle, 30017, 8, 93, 64)
		--Graphics.UpdateDisplay()
		--return
	--end

	--if( nKeyCode == KEY_BACK and isoptions == 1) then
		--isoptions = 0
		--Graphics.ClearWindow( realoptions_Handle )
		--Graphics.UpdateDisplay()
		--return
	--end

	if( nKeyCode == KEY_BACK and isoptions == 0) then
		maptoggle = 0
		return
	end

	if( nKeyCode == KEY_OK and isoptions == 0) then
		movemapX = 0
		movemapY = 0
		maptoggle = 1
		DrawMapImage(zoomvalue, zipcode_VALUE,movemapX,movemapY)
		return
	end

	if(nKeyCode == KEY_LEFT and isoptions == 0) then
		if( maptoggle == 1) then
		panleft = panleft+1
		movemapX = (panright*100)-(panleft*100)
		movemapY = (pandown*100)-(panup*100)
		DrawMapImage(zoomvalue, zipcode_VALUE,movemapX,movemapY)
		return
		end
	end

	if( nKeyCode == KEY_UP and isoptions == 0) then
		if(maptoggle == 1) then
		panup = panup+1
		movemapX = (panright*100)-(panleft*100)
		movemapY = (pandown*100)-(panup*100)
		DrawMapImage(zoomvalue, zipcode_VALUE,movemapX,movemapY)
		return
		end
	end

	if( nKeyCode == KEY_RIGHT and isoptions == 0) then
		if(maptoggle == 1) then
		panright = panright+1
		movemapX = (panright*100)-(panleft*100)
		movemapY = (pandown*100)-(panup*100)
		DrawMapImage(zoomvalue, zipcode_VALUE,movemapX,movemapY)
		return
		end
	end
		
	if( nKeyCode == KEY_DOWN and isoptions == 0) then
		if(maptoggle == 1) then
		pandown = pandown+1
		movemapX = (panright*100)-(panleft*100)
		movemapY = (pandown*100)-(panup*100)
		DrawMapImage(zoomvalue, zipcode_VALUE,movemapX,movemapY)
		return
		end
	end



	if( nKeyCode == KEY_LEFT and isoptions == 0) then
		if(maptoggle == 0) then
			Graphics.ClearWindow( maps_Handle )
			Graphics.ClearWindow( options_Handle )
			Graphics.ClearWindow( zipcode_Handle )
			Graphics.ClearWindow( navbar_Handle )
			Graphics.ClearWindow( realoptions_Handle )
			isoptions = 0
			zoomvalue = 13
			movemapX = 0
			movemapY = 0
			pandown = 0
			panleft = 0
			panright = 0
			panup = 0
			zipcode_VALUE = ''
			isMaps = 0
			DrawCalendar()
			FDTObserver["L1"].Show()
			FDTObserver["S1"].Show()
		return
		end
	end


	if( nKeyCode == KEY_B and isoptions == 0) then
		zoomvalue = zoomvalue - 1
		DrawMapImage(zoomvalue, zipcode_VALUE, movemapX, movemapY)
		return
	end
	if( nKeyCode == KEY_A and isoptions == 0) then
		zoomvalue = zoomvalue + 1
		DrawMapImage(zoomvalue, zipcode_VALUE, movemapX, movemapY)
		return
	end

	if( nKeyCode == KEY_RIGHT and isoptions == 0) then
		if(maptoggle == 0) then
			debugPrint( "Pressed Key Right in Maps")
			Graphics.ClearWindow( maps_Handle )
			Graphics.ClearWindow( options_Handle )
			Graphics.ClearWindow( zipcode_Handle )
			Graphics.ClearWindow( navbar_Handle )
			Graphics.ClearWindow( realoptions_Handle )
			isoptions = 0
			zoomvalue = 13
			movemapX = 0
			movemapY = 0
			pandown = 0
			panleft = 0
			panright = 0
			panup = 0
			zipcode_VALUE = ''
			isMaps = 0
			DrawNeighborhood()
		return
		end
	end
		if nKeyCode == 1 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'1'
			elseif nKeyCode == 2 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'2'
			elseif nKeyCode == 3 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'3'
			elseif nKeyCode == 4 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'4'
			elseif nKeyCode == 5 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'5'
			elseif nKeyCode == 6 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'6'
			elseif nKeyCode == 7 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'7'
			elseif nKeyCode == 8 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'8'
			elseif nKeyCode == 9 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'9'
			elseif nKeyCode == 0 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'0'
			elseif nKeyCode == 40 and isoptions == 0 then -- KEY_C
			length = string.len(zipcode_VALUE)
			if length > 1 then
			    zipcode_VALUE = string.sub(zipcode_VALUE,1,string.len(zipcode_VALUE)-1)
			elseif length == 1 then
			   zipcode_VALUE=''
			end
		end
		if isoptions == 0 then
			Graphics.ClearWindow( zipcode_Handle )
			Graphics.UpdateDisplay()
			nErr = Graphics.DrawString(zipcode_Attribute, zipcode_Handle, 0, 0, 10, 10, "0x00550000", "0x00000000", 3,1, zipcode_VALUE)
			Graphics.UpdateDisplay()
		end
end


function NeignborhoodOnKeyHandler(nKeyCode, nKeyType, nKeyState)

	--if( nKeyCode == KEY_OPTION) then
		--isoptions = 1
		--Graphics.ClearWindow( realoptions_Handle )
		--nErr = Graphics.DrawImageByID(realoptions_Attribute, realoptions_Handle, 30017, 10, 92, 64)
		--Graphics.UpdateDisplay()
		--return
	--end

	--if( nKeyCode == KEY_BACK) then
		--isoptions = 0
		--Graphics.ClearWindow( realoptions_Handle )
		--Graphics.UpdateDisplay()
		--return
	--end
		if( nKeyCode == KEY_OK and isoptions == 0) then
			getTraffic()
			getWeather()
			return
		end
		if( nKeyCode == KEY_LEFT ) then
			Graphics.ClearWindow( neighborhood_Handle )
			Graphics.ClearWindow( options_Handle )
			Graphics.ClearWindow( zipcode_Handle )
			Graphics.ClearWindow( navbar_Handle )
			Graphics.ClearWindow( realoptions_Handle )
			isoptions = 0
			zipcode_VALUE = ''
			isNeighborhood = 0
			DrawMaps()
			return
		end
		if( nKeyCode == KEY_RIGHT) then
			return
		end
			if nKeyCode == 1 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'1'
			elseif nKeyCode == 2 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'2'
			elseif nKeyCode == 3 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'3'
			elseif nKeyCode == 4 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'4'
			elseif nKeyCode == 5 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'5'
			elseif nKeyCode == 6 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'6'
			elseif nKeyCode == 7 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'7'
			elseif nKeyCode == 8 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'8'
			elseif nKeyCode == 9 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'9'
			elseif nKeyCode == 0 and isoptions == 0 then
			zipcode_VALUE = zipcode_VALUE..'0'
			elseif nKeyCode == 40 and isoptions == 0 then -- KEY_C
			length = string.len(zipcode_VALUE)
			if length > 1 then
			    zipcode_VALUE = string.sub(zipcode_VALUE,1,string.len(zipcode_VALUE)-1)
			elseif length == 1 then
			   zipcode_VALUE=''
			end
		end
		if isoptions == 0 then
		Graphics.ClearWindow( zipcode_Handle )
		Graphics.UpdateDisplay()
		nErr = Graphics.DrawString(zipcode_Attribute, zipcode_Handle, 0, 0, 10, 10, "0x00550000", "0x00000000", 3,1, zipcode_VALUE)
		Graphics.UpdateDisplay()
		end
		return
end
