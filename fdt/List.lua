-- Human can change the following header text or make it empty during loading --
g_FDT_Text362183 = 'Demo Text1'
g_FDT_Text362233 = 'Demo Text1'
g_FDT_Text362284 = 'Demo Text1'
g_FDT_Text362334 = 'Demo Text1'
g_FDT_Text362383 = 'Demo Text1'
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDT_ListText18575= {'Real FiOS Text1','Real FiOS Text2','Real FiOS Text3','Real FiOS Text4','Real FiOS Text5','Real FiOS Text6','7 (second to last element)','8 (last element)'}

--------- begin FDT 0.26 (Tue May 10 11:52:18 EDT 2011) ---------
-- Global variable
g_FDT_Main_Window_Handle = -1
g_FDT_Text_Window_Handle = -1
g_FDT_Screen_Count = 0
g_FDT_First_Screen = 1
g_FDT_Scroll_Up = nil
g_FDT_Scroll_Down = nil
g_FDT_Scroll_Left = nil
g_FDT_Scroll_Right = nil
g_FDT_Scroll_XOffset = 0
g_FDT_Scroll_YOffset = 0
g_FDT_Scroll_ElementIndex = 1
g_FDT_Scroll_FWDAllowed = true
g_FDT_Scroll_BWDAllowed = true
g_FDT_step = 0
-- Global constant
FDT_TEXT_WINDOW_LAYER = 3
FDT_MAIN_WINDOW_LAYER = 3

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
	nErr, g_FDT_Main_Window_Handle = Graphics.CreateWindow(FDT_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDT_Text_Window_Handle = Graphics.CreateWindow(FDT_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDT_Scroll_BWDClippedAtX, g_FDT_Scroll_BWDClippedAtY, g_FDT_Scroll_FWDClippedAtX, g_FDT_Scroll_FWDClippedAtY)
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen1()
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen2()
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen3()
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, 11192, 0, 0, 704, 480, 64)
	FDTListScreen4()
	FDTInitText(1,1,1)
	Graphics.UpdateDisplay()
end
function lua_onUnload()
	App.Cleanup()
	Graphics.DestroyWindow(g_FDT_Main_Window_Handle)
	Graphics.DestroyWindow(g_FDT_Text_Window_Handle)
	Graphics.UpdateDisplay()
end
g_FDT_Scroll_BWDClippedAtX = 352
g_FDT_Scroll_BWDClippedAtY = 174
g_FDT_Scroll_FWDClippedAtX = 329
g_FDT_Scroll_FWDClippedAtY = 251
function FDTListScreen1()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, List, 352, 174, 329, 251, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, ListItemSelected, 354, 178, 325, 45, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 183+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362183))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 233+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362233))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 284+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362284))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 334+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362334))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 383+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362383))
	Graphics.UpdateDisplay()
end
function FDTListScreen2()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, List, 352, 174, 329, 251, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, ListItemSelected, 354, 227, 325, 45, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 183+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362183))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 233+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362233))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 284+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362284))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 334+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362334))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 383+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362383))
	Graphics.UpdateDisplay()
end
function FDTListScreen3()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, List, 352, 174, 329, 251, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, ListItemSelected, 354, 277, 325, 45, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 183+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362183))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 233+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362233))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 284+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362284))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 334+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362334))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 383+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362383))
	Graphics.UpdateDisplay()
end
function FDTListScreen4()
	List = 12646
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, List, 352, 174, 329, 251, 64)
	ListItemSelected = 10733
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDT_Main_Window_Handle, ListItemSelected, 354, 328, 325, 45, 64)
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 183+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362183))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 233+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362233))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 284+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362284))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 334+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362334))
	nErr = Graphics.DrawString(iAttributeID, g_FDT_Text_Window_Handle, 362+g_FDT_Scroll_XOffset-g_FDT_Scroll_BWDClippedAtX, 383+g_FDT_Scroll_YOffset-g_FDT_Scroll_BWDClippedAtY, 311, 33, '0x00000000', '0x00000000', 3, FONT_ATTRS_MULTILINE, SafeString(g_FDT_Text362383))
	Graphics.UpdateDisplay()
end
g_FDT_Last_Screen = 4
function lua_onKey(nKeyCode, nKeyType, nKeyState)
	Util.DebugPrint('[List]lua_onKey')
	OnKey(nKeyCode, nKeyType, nKeyState)
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
-- Note: most important variables are scene #, key and g_FDT_Scroll_ElementIndex
-- ######################################################################################
g_FDT_Screen_Count = g_FDT_Last_Screen	-- due to the preview in the onLoad
g_FDT_Scroll_ElementIndex = g_FDT_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts

function FDTHandleScrolling(scene, key)
	g_FDT_Scroll_FWDAllowed = true
	g_FDT_Scroll_BWDAllowed = true
	if(scene == 1 and key == KEY_UP) then
		if(g_FDT_Scroll_ElementIndex <= 1) then
			g_FDT_Scroll_BWDAllowed = false
		end
		if(not g_FDT_Scroll_BWDAllowed) then
			g_FDT_Scroll_ElementIndex = 1
		else
			g_FDT_Scroll_ElementIndex = g_FDT_Scroll_ElementIndex - 1
		end
	elseif(key == KEY_UP) then
		g_FDT_Scroll_ElementIndex = g_FDT_Scroll_ElementIndex - 1
	end

	if(scene == 4 and key == KEY_DOWN) then
		lastElementIndex = GetLastIndex(g_FDT_ListText18575) - 1
		--=== zero element and only at the last row
		if(lastElementIndex <= 1 and g_FDT_Scroll_ElementIndex == 4) then
			g_FDT_Scroll_FWDAllowed = false
		--=== total data elements less than the total rows in UI
		elseif(lastElementIndex == 0 and g_FDT_Scroll_ElementIndex == lastElementIndex) then
			g_FDT_Scroll_FWDAllowed = false
		--=== boundary condition i.e. total data elements equals total rows in UI
		elseif (lastElementIndex > 0 and g_FDT_Scroll_ElementIndex == lastElementIndex) then
			g_FDT_Scroll_FWDAllowed = false
		--=== total data elements more than total rows in UI
		elseif(g_FDT_Scroll_ElementIndex -1 == lastElementIndex) then
			g_FDT_Scroll_FWDAllowed = false
		end
		
		if(not g_FDT_Scroll_FWDAllowed) then
			--leave index alone and do nothing
			--g_FDT_Scroll_ElementIndex = lastElementIndex
		else
			g_FDT_Scroll_ElementIndex = g_FDT_Scroll_ElementIndex + 1
		end
	elseif(key == KEY_DOWN) then
		g_FDT_Scroll_ElementIndex = g_FDT_Scroll_ElementIndex + 1
	end

	Err = Graphics.ClearWindow(g_FDT_Text_Window_Handle)
end
function FDTHandleScrollingText(scene, key) 
if(scene == 1 and key == KEY_UP and g_FDT_Scroll_ElementIndex >= 1) then
FDTInitText(scene, key, g_FDT_Scroll_ElementIndex)
elseif (scene == 4-1 and key == KEY_UP and g_FDT_Scroll_ElementIndex == 4-1) then
FDTInitText(scene, key, g_FDT_Scroll_ElementIndex -2 + (-1))
elseif (scene == 4 and key == KEY_DOWN and g_FDT_Scroll_ElementIndex >= 4+1) then
FDTGetNextText(scene, key, g_FDT_Scroll_ElementIndex)
elseif (scene == 4 and key == KEY_OK and g_FDT_Scroll_ElementIndex == 4) then
FDTInitText(scene, key, 1)
end
end
function FDTInitText(pageindex, key, index) 
g_FDT_Text362183 = g_FDT_ListText18575[index]
g_FDT_Text362233 = g_FDT_ListText18575[index + 1]
g_FDT_Text362284 = g_FDT_ListText18575[index + 2]
g_FDT_Text362334 = g_FDT_ListText18575[index + 3]
g_FDT_Text362383 = g_FDT_ListText18575[index + 4]
end
function FDTGetNextText(pageindex, key, index)
g_FDT_Text362183 = g_FDT_ListText18575[index - 4]
g_FDT_Text362233 = g_FDT_ListText18575[index - 3]
g_FDT_Text362284 = g_FDT_ListText18575[index - 2]
g_FDT_Text362334 = g_FDT_ListText18575[index - 1]
g_FDT_Text362383 = g_FDT_ListText18575[index - 0]
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
	step = offsetAutoScene/g_FDT_Last_Screen
	return step
end
function OnKey(nKeyCode, nKeyType, nKeyState)
	Err = Graphics.ClearWindow(g_FDT_Text_Window_Handle)
	if(nKeyCode == KEY_UP) then
		if(g_FDT_Screen_Count <= g_FDT_First_Screen + 1) then
			g_FDT_Screen_Count = g_FDT_First_Screen
		else
			g_FDT_Screen_Count = g_FDT_Screen_Count - 1
		end
		FDTHandleScrolling(g_FDT_Screen_Count, nKeyCode)
		FDTHandleScrollingText(g_FDT_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDT_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDT_Scroll_FWDAllowed))
		Util.DebugPrint('[List]backw scene'..g_FDT_Screen_Count..' current index='..g_FDT_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDT_Screen_Count > g_FDT_Last_Screen - 1) then
			g_FDT_Screen_Count = g_FDT_Last_Screen
		else
			g_FDT_Screen_Count = g_FDT_Screen_Count + 1
		end
		FDTHandleScrolling(g_FDT_Screen_Count, nKeyCode)
		FDTHandleScrollingText(g_FDT_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDT_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDT_Scroll_FWDAllowed))
		Util.DebugPrint('[List]forw scene'..g_FDT_Screen_Count..' current index='..g_FDT_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[List]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[List]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTHandleScrollingText(g_FDT_Screen_Count, nKeyCode)
		--Util.DebugPrint('[List]ok')
	elseif (nKeyCode == KEY_INFO) then
			--DrawBackground()
			--Util.DebugPrint('[List]info')
	end
	if(g_FDT_Screen_Count == 1) then
		FDTListScreen1()
	end
	if(g_FDT_Screen_Count == 2) then
		FDTListScreen2()
	end
	if(g_FDT_Screen_Count == 3) then
		FDTListScreen3()
	end
	if(g_FDT_Screen_Count == 4) then
		FDTListScreen4()
	end
	Graphics.UpdateDisplay()
end

-- ##################### begin of note to integrate this component to the other widget #####################
-- *** In the caller script ***, the following code should be defined (preferably at the top of the script):
-- FDTObserver = {}
-- dofile('List.lua')
-- The following code should be invoked directly/indirectly from the caller script's lua_onKey function:
-- TBD
function OnLoad()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDT_Main_Window_Handle = Graphics.CreateWindow(FDT_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDT_Text_Window_Handle = Graphics.CreateWindow(FDT_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDT_Scroll_BWDClippedAtX, g_FDT_Scroll_BWDClippedAtY, g_FDT_Scroll_FWDClippedAtX, g_FDT_Scroll_FWDClippedAtY)
	FDTListScreen1()
	g_FDT_Screen_Count = 1
	g_FDT_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnText()
	g_FDT_Text362183 = standalone[1]
	g_FDT_Text362233 = standalone[2]
	g_FDT_Text362284 = standalone[3]
	g_FDT_Text362334 = standalone[4]
	g_FDT_Text362383 = standalone[5]
	Graphics.UpdateDisplay()
end
function Show()
	nErr = Graphics.SetWindowVisibility(g_FDT_Main_Window_Handle, TRUE)
	nErr = Graphics.SetWindowVisibility(g_FDT_Text_Window_Handle, TRUE)
	Graphics.UpdateDisplay()
end
function Hide()
	nErr = Graphics.SetWindowVisibility(g_FDT_Main_Window_Handle, FALSE)
	nErr = Graphics.SetWindowVisibility(g_FDT_Text_Window_Handle, FALSE)
	Graphics.UpdateDisplay()
end
function GetText()
	return g_FDT_ListText18575
end
function SetText(listTextTable)
	g_FDT_ListText18575 = listTextTable
Util.DebugPrint('[List]listTextTable set to '..g_FDT_ListText18575)
end
function GetLastScene()
	return g_FDT_Last_Screen
end
List = {
	OnKey = OnKey,
	OnLoad = OnLoad,
	OnText = OnText,
	GetText = GetText,
	SetText = SetText,
	GetLastScene = GetLastScene,
	OnUnLoad = lua_onUnLoad,
	Show = Show,
	Hide = Hide
}
-- function List.Create()
-- 	local self = DeepCopy(List)
-- 	return self
-- end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
--  FDTObserver[""]=List.Create()

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

function Rect(x,y,w,h,color,windowHandle)
	--Full BG
	--debugPrint('DrawFullBackground enter x= '..x..' ; y='..y)
	--Draw Line 1
	Graphics.DrawLine(windowHandle,x,y,w,0,color)
	--Graphics.UpdateDisplay()
	
	--Draw Line 2 
	Graphics.DrawLine(windowHandle,x,y,h,1,color)
	--Graphics.UpdateDisplay()
	
	--Draw Line 3
	Graphics.DrawLine(windowHandle,x,y+h,w,0,color)
	--Graphics.UpdateDisplay()
	
	--Draw Line 4
	Graphics.DrawLine(windowHandle,x+w,y,h,1,color)
	--Graphics.UpdateDisplay()
end

function Line(x1,y1,x2,y2,color,windowHandle)
	--Graphics.DrawLine(windowHandle,0,0,10,0,"0xFF33CC33")
	Graphics.DrawLine(windowHandle,x1,y1,x2,y2,color)
end

function Text(vX, vY, windowAttribute, vW, vH, value, windowHandle)
	Graphics.DrawString(windowAttribute, windowHandle,  vX, vY,vW, vH, "0x00C82536", "0xFF33CC33", 5,2, value)
end

function Circle(x,y,r,color)
	--http://code.google.com/p/divranspack/source/browse/trunk/+divranspack/EGP+v3+beta/lua/entities/gmod_wire_egp/lib/objects/circle.lua?r=423
	--TBD
end