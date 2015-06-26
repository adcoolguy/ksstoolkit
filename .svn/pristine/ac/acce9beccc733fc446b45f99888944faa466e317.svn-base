-- Human can change the following header text or make it empty during loading --
g_FDTList_Text362179 = 'Demo Text1'
g_FDTList_Text362221 = 'Demo Text1'
g_FDTList_Text362266 = 'Demo Text1'
g_FDTList_Text362312 = 'Demo Text1'
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDTList_ListText10584= {'Real FiOS Text1','Real FiOS Text2','Real FiOS Text3','Real FiOS Text4','Real FiOS Text5','Real FiOS Text6','7 (second to last element)','8 (last element)'}

--------- begin FDT 0.251 (Wed Dec 01 19:26:09 EST 2010) ---------
-- Global variable
g_FDTList_Main_Window_Handle = -1
g_FDTList_Text_Window_Handle = -1
g_FDTList_Screen_Count = 0
g_FDTList_First_Screen = 1
g_FDTList_Scroll_Up = nil
g_FDTList_Scroll_Down = nil
g_FDTList_Scroll_Left = nil
g_FDTList_Scroll_Right = nil
g_FDTList_Scroll_XOffset = 0
g_FDTList_Scroll_YOffset = 0
g_FDTList_Scroll_ElementIndex = 1
g_FDTList_Scroll_FWDAllowed = true
g_FDTList_Scroll_BWDAllowed = true
g_FDTList_step = 0
-- Global constant
FDTList_TEXT_WINDOW_LAYER = 3
FDTList_MAIN_WINDOW_LAYER = 3

-- Font display flag
FONT_ATTRS_NORMAL = 1
FONT_ATTRS_ELIPSE = 2 
FONT_ATTRS_MULTILINE = 4
FONT_ATTRS_CLEARRECT = 8
FONT_ATTRS_RIGHT_JUST = 16
FONT_ATTRS_FADEOUT = 32
FONT_ATTRS_VERTICAL_BOTTOM_UP = 256
FONT_ATTRS_VERTICAL_TOP_DOWN = 512
function lua_onInit(nAppId, strParam)
end
function lua_onLoad()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTList_Main_Window_Handle = Graphics.CreateWindow(FDTList_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTList_Text_Window_Handle = Graphics.CreateWindow(FDTList_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTList_Scroll_BWDClippedAtX, g_FDTList_Scroll_BWDClippedAtY, g_FDTList_Scroll_FWDClippedAtX, g_FDTList_Scroll_FWDClippedAtY)
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen1()
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen2()
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen3()
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen4()
	FDTListInitText(1,1,1)
	Graphics.UpdateDisplay()
end
function lua_onUnload()
	App.Cleanup()
	Graphics.DestroyWindow(g_FDTList_Main_Window_Handle)
	Graphics.DestroyWindow(g_FDTList_Text_Window_Handle)
	Graphics.UpdateDisplay()
end
g_FDTList_Scroll_BWDClippedAtX = 352
g_FDTList_Scroll_BWDClippedAtY = 174
g_FDTList_Scroll_FWDClippedAtX = 329
g_FDTList_Scroll_FWDClippedAtY = 179
function FDTListScreen1()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, List, 352, 174, 329, 179, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, ListItemSelected, 354, 178, 327, 36, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 179+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 221+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 266+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362266))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 312+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362312))
	Graphics.UpdateDisplay()
end
function FDTListScreen2()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, List, 352, 174, 329, 179, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, ListItemSelected, 354, 220, 327, 36, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 179+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 312+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362312))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 221+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 266+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362266))
	Graphics.UpdateDisplay()
end
function FDTListScreen3()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, List, 352, 174, 329, 179, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, ListItemSelected, 354, 262, 327, 42, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 266+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362266))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 221+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 179+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 312+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362312))
	Graphics.UpdateDisplay()
end
function FDTListScreen4()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, List, 352, 174, 329, 179, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTList_Main_Window_Handle, ListItemSelected, 354, 310, 327, 36, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 312+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362312))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 221+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362221))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 179+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362179))
	nErr = Graphics.DrawString(iAttributeID, g_FDTList_Text_Window_Handle, 362+g_FDTList_Scroll_XOffset-g_FDTList_Scroll_BWDClippedAtX, 266+g_FDTList_Scroll_YOffset-g_FDTList_Scroll_BWDClippedAtY, 311, 33, '0xFFffffff', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDTList_Text362266))
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler1()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,177,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,177,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,177+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352+330,177,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler2()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,219,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,219,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,219+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352+330,219,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler3()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,264,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,264,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,264+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352+330,264,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
function FDTListScreenRectangleOKRegionHandler4()
	RECT_COLOR = '0xFFff9900'
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,310,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,310,38,1,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352,310+38,330,0,RECT_COLOR)
	Graphics.DrawLine(g_FDTList_Main_Window_Handle,352+330,310,38,1,RECT_COLOR)
	Graphics.UpdateDisplay()
end
g_FDTList_Last_Screen = 4
function lua_onKey(nKeyCode, nKeyType, nKeyState)
	Util.DebugPrint('[List]lua_onKey')
	OnKeyList(nKeyCode, nKeyType, nKeyState)
	return HG_ERR_NONE
end
-- Remote KeyCode Global Variables
KEY_DOWN = 53
KEY_EXIT = 18
KEY_FWD = 29
KEY_INFO = 51
KEY_LEFT =  54
KEY_RIGHT = 55
KEY_OK = 17
KEY_BACK = 60
KEY_PAGEDOWN = 59
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
-- ######################## begin of text scrolling capability ##########################
-- Note: most important variables are scene #, key and g_FDTList_Scroll_ElementIndex
-- ######################################################################################
g_FDTList_Screen_Count = g_FDTList_Last_Screen	-- due to the preview in the onLoad
g_FDTList_Scroll_ElementIndex = g_FDTList_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts
function FDTListHandleScrolling(scene, key)
	g_FDTList_Scroll_FWDAllowed = true
	g_FDTList_Scroll_BWDAllowed = true
	if(scene == 1 and key == KEY_UP) then
		if(g_FDTList_Scroll_ElementIndex == 1) then
			g_FDTList_Scroll_BWDAllowed = false
		end
		if(not g_FDTList_Scroll_BWDAllowed) then
			g_FDTList_Scroll_ElementIndex = 2
		end
	end

	if(scene == 4 and key == KEY_DOWN) then
		lastElementIndex = GetLastIndex(g_FDTList_ListText10584)
		Util.DebugPrint('[List]last index '..lastElementIndex)
		if(g_FDTList_Scroll_ElementIndex == lastElementIndex -1) then
			g_FDTList_Scroll_FWDAllowed = false
		end
		if(not g_FDTList_Scroll_FWDAllowed) then
			g_FDTList_Scroll_ElementIndex = g_FDTList_Scroll_ElementIndex -1
		end
	end

	Err = Graphics.ClearWindow(g_FDTList_Text_Window_Handle)
end
function FDTListHandleScrollingText(scene, key)
	if(scene == 1 and key == KEY_UP and g_FDTList_Scroll_ElementIndex >= 1) then
		FDTListInitText(scene, key, g_FDTList_Scroll_ElementIndex)
	elseif(scene == 4-1 and key == KEY_UP and g_FDTList_Scroll_ElementIndex == 4-1) then
		FDTListInitText(scene, key, g_FDTList_Scroll_ElementIndex -2)
	elseif(scene == 4 and key == KEY_DOWN and g_FDTList_Scroll_ElementIndex >= 4+1) then
		FDTListGetNextText(scene, key, g_FDTList_Scroll_ElementIndex - (g_FDTList_Last_Screen -1))
	elseif(scene == 4 and key == KEY_OK and g_FDTList_Scroll_ElementIndex == 4) then
		FDTListInitText(scene, key, 1)
	end
end
function FDTListInitText(pageindex, key, index)
g_FDTList_Text362179 = g_FDTList_ListText10584[index]
index,g_FDTList_Text362221 = next(g_FDTList_ListText10584, index)
index,g_FDTList_Text362266 = next(g_FDTList_ListText10584, index)
index,g_FDTList_Text362312 = next(g_FDTList_ListText10584, index)
end
function FDTListGetNextText(pageindex, key, index)
g_FDTList_Text362179 = g_FDTList_ListText10584[index]
index,g_FDTList_Text362221 = next(g_FDTList_ListText10584, index)
index,g_FDTList_Text362266 = next(g_FDTList_ListText10584, index)
index,g_FDTList_Text362312 = next(g_FDTList_ListText10584, index)
end
-- ######################## end of text scrolling capability ##########################
function GetLastIndex(t)
	i = 1
	while (t[i] ~= nil) do
		i = i + 1
	end
	return i
end
function FDTListGetAutoSceneStep()
	step = offsetAutoScene/g_FDTList_Last_Screen
	return step
end
function OnKeyList(nKeyCode, nKeyType, nKeyState)
	Err = Graphics.ClearWindow(g_FDTList_Text_Window_Handle)
	if(nKeyCode == KEY_UP) then
		if(g_FDTList_Screen_Count <= g_FDTList_First_Screen + 1) then
			g_FDTList_Screen_Count = g_FDTList_First_Screen
		else
			g_FDTList_Screen_Count = g_FDTList_Screen_Count - 1
		end
			FDTListHandleScrolling(g_FDTList_Screen_Count, nKeyCode)
		g_FDTList_Scroll_ElementIndex = g_FDTList_Scroll_ElementIndex - 1
		FDTListHandleScrollingText(g_FDTList_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDTList_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTList_Scroll_FWDAllowed))
		Util.DebugPrint('[List]backw scene'..g_FDTList_Screen_Count..' current index='..g_FDTList_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDTList_Screen_Count > g_FDTList_Last_Screen - 1) then
			g_FDTList_Screen_Count = g_FDTList_Last_Screen
		else
			g_FDTList_Screen_Count = g_FDTList_Screen_Count + 1
		end
			FDTListHandleScrolling(g_FDTList_Screen_Count, nKeyCode)
		g_FDTList_Scroll_ElementIndex = g_FDTList_Scroll_ElementIndex + 1
		FDTListHandleScrollingText(g_FDTList_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDTList_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTList_Scroll_FWDAllowed))
		Util.DebugPrint('[List]forw scene'..g_FDTList_Screen_Count..' current index='..g_FDTList_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[List]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[List]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTListHandleScrollingText(g_FDTList_Screen_Count, nKeyCode)
		--Util.DebugPrint('[List]ok')
	elseif (nKeyCode == KEY_INFO) then
			--DrawBackground()
			--Util.DebugPrint('[List]info')
	end
	if(g_FDTList_Screen_Count == 1) then
		FDTListScreen1()
		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler1()
		end
	end
	if(g_FDTList_Screen_Count == 2) then
		FDTListScreen2()
		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler2()
		end
	end
	if(g_FDTList_Screen_Count == 3) then
		FDTListScreen3()
 		if(nKeyCode == KEY_OK) then
			FDTListScreenRectangleOKRegionHandler3()
		end
	end
	if(g_FDTList_Screen_Count == 4) then
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
function OnLoadList()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTList_Main_Window_Handle = Graphics.CreateWindow(FDTList_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTList_Text_Window_Handle = Graphics.CreateWindow(FDTList_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTList_Scroll_BWDClippedAtX, g_FDTList_Scroll_BWDClippedAtY, g_FDTList_Scroll_FWDClippedAtX, g_FDTList_Scroll_FWDClippedAtY)
	FDTListScreen1()
	g_FDTList_Screen_Count = 1
	g_FDTList_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnTextList()
	g_FDTList_Text362179 = g_FDTList_ListText10584[1]
	g_FDTList_Text362221 = g_FDTList_ListText10584[2]
	g_FDTList_Text362266 = g_FDTList_ListText10584[3]
	g_FDTList_Text362312 = g_FDTList_ListText10584[4]
	Graphics.UpdateDisplay()
end
function ShowList()
	nErr = Graphics.SetWindowVisibility(g_FDTList_Main_Window_Handle, TRUE)
	nErr = Graphics.SetWindowVisibility(g_FDTList_Text_Window_Handle, TRUE)
	Graphics.UpdateDisplay()
end
function HideList()
	nErr = Graphics.SetWindowVisibility(g_FDTList_Main_Window_Handle, FALSE)
	nErr = Graphics.SetWindowVisibility(g_FDTList_Text_Window_Handle, FALSE)
	Graphics.UpdateDisplay()
end
function GetTextList()
	return g_FDTList_ListText10584
end
function SetTextList(listTextTable)
	g_FDTList_ListText10584 = listTextTable
Util.DebugPrint('[List]listTextTable set to '..g_FDTList_ListText10584)
end
function GetLastSceneList()
	return g_FDTList_Last_Screen
end
List = {
	OnKey = OnKeyList,
	OnLoad = OnLoadList,
	OnText = OnTextList,
	GetText = GetTextList,
	SetText = SetTextList,
	GetLastScene = GetLastSceneList,
	OnUnLoad = lua_onUnLoad,
	Show = ShowList,
	Hide = HideList
}
-- function List.Create()
-- 	local self = DeepCopy(List)
-- 	return self
-- end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
--  FDTObserver["List"]=List.Create()

-- ##################### end of note to integrate this component to the other widget #####################
--------- end FDT ---------
Util.DebugPrint('List.lua script loaded successfully')
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

function DoNothing()
end

DummyProxy = {
	OnKey = DoNothing,
	OnLoad = DoNothing,
	OnText = DoNothing,
	GetText = DoNothing,
	SetText = DoNothing,
	GetLastScene = DoNothing,
	OnUnLoad = DoNothing,
	Show = DoNothing,
	Hide = DoNothing
}
function DummyProxy.Create()
	local self = DeepCopy(DummyProxy)
	return self
end

function InitComponents()
	FDTObserver = {}
end

function LoadComponent(c)
	dofile(c)
end

function Component(s)
	retVal = nil
	
	if(FDTObserver[s] ~= nil) then
		retVal = FDTObserver[s]
	else
		retVal = DummyProxy.Create()
	end	

	return retVal
end