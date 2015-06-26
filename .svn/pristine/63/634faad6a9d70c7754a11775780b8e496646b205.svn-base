-- Human can change the following header text or make it empty during loading --
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDTS1_ListText10584= {'Real FiOS Text1','Real FiOS Text2','Real FiOS Text3','Real FiOS Text4','Real FiOS Text5','Real FiOS Text6','7 (second to last element)','8 (last element)'}

--------- begin FDT 0.251 (Sun Nov 28 23:01:20 EST 2010) ---------
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
function lua_onInit(nAppId, strParam)
end
function lua_onLoad()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTS1_Main_Window_Handle = Graphics.CreateWindow(FDTS1_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTS1_Text_Window_Handle = Graphics.CreateWindow(FDTS1_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTS1_Scroll_BWDClippedAtX, g_FDTS1_Scroll_BWDClippedAtY, g_FDTS1_Scroll_FWDClippedAtX, g_FDTS1_Scroll_FWDClippedAtY)
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen1()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen2()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen3()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen4()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen5()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen6()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen7()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	FDTListSliderScreen8()
	FDTS1InitText(1,1,1)
	Graphics.UpdateDisplay()
end
function lua_onUnload()
	App.Cleanup()
	Graphics.DestroyWindow(g_FDTS1_Main_Window_Handle)
	Graphics.DestroyWindow(g_FDTS1_Text_Window_Handle)
	Graphics.UpdateDisplay()
end
g_FDTS1_Scroll_BWDClippedAtX = 352
g_FDTS1_Scroll_BWDClippedAtY = 174
g_FDTS1_Scroll_FWDClippedAtX = 329
g_FDTS1_Scroll_FWDClippedAtY = 179
function FDTListSliderScreenY(y)
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	autoImage = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, autoImage, 658, y, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen1()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 190, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen2()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 208, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen3()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 226, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen4()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 244, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen5()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 262, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen6()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 280, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen7()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 298, 16, 16, 64)
	Graphics.UpdateDisplay()
end
function FDTListSliderScreen8()
	Err = Graphics.ClearWindow(g_FDTS1_Main_Window_Handle)
	rSlider = 13725
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTS1_Main_Window_Handle, rSlider, 658, 316, 16, 16, 64)
	Graphics.UpdateDisplay()
end
g_FDTS1_Last_Screen = 8
function lua_onKey(nKeyCode, nKeyType, nKeyState)
	Util.DebugPrint('[ListSlider]lua_onKey')
	OnKeyS1(nKeyCode, nKeyType, nKeyState)
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
		Util.DebugPrint('[ListSlider]last index '..lastElementIndex)
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
function GetLastIndex(t)
	i = 1
	while (t[i] ~= nil) do
		i = i + 1
	end
	return i
end
function FDTListSliderGetAutoSceneStep()
	offsetAutoScene = 130
	step = offsetAutoScene/g_FDTS1_Last_Screen
	return step
end
g_FDTS1_currentY = 190
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
	if(g_FDTS1_Scroll_BWDAllowed) then
	g_FDTS1_currentY = g_FDTS1_currentY - g_FDTS1_step
	FDTListSliderScreenY(g_FDTS1_currentY)
	end
Util.DebugPrint('back allowed '..tostring(g_FDTS1_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTS1_Scroll_FWDAllowed))
		Util.DebugPrint('[ListSlider]backw scene'..g_FDTS1_Screen_Count..' current index='..g_FDTS1_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDTS1_Screen_Count > g_FDTS1_Last_Screen - 1) then
			g_FDTS1_Screen_Count = g_FDTS1_Last_Screen
		else
			g_FDTS1_Screen_Count = g_FDTS1_Screen_Count + 1
		end
			FDTS1HandleScrolling(g_FDTS1_Screen_Count, nKeyCode)
		g_FDTS1_Scroll_ElementIndex = g_FDTS1_Scroll_ElementIndex + 1
		FDTS1HandleScrollingText(g_FDTS1_Screen_Count, nKeyCode)
	if(g_FDTS1_Scroll_FWDAllowed) then
	g_FDTS1_currentY = g_FDTS1_currentY + g_FDTS1_step
	FDTListSliderScreenY(g_FDTS1_currentY)
	end
Util.DebugPrint('back allowed '..tostring(g_FDTS1_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTS1_Scroll_FWDAllowed))
		Util.DebugPrint('[ListSlider]forw scene'..g_FDTS1_Screen_Count..' current index='..g_FDTS1_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[ListSlider]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[ListSlider]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTS1HandleScrollingText(g_FDTS1_Screen_Count, nKeyCode)
		--Util.DebugPrint('[ListSlider]ok')
	elseif (nKeyCode == KEY_INFO) then
			--DrawBackground()
			--Util.DebugPrint('[ListSlider]info')
	end
	Graphics.UpdateDisplay()
end

-- ##################### begin of note to integrate this component to the other widget #####################
-- *** In the caller script ***, the following code should be defined (preferably at the top of the script):
-- FDTObserver = {}
-- dofile('ListSlider.lua')
-- The following code should be invoked directly/indirectly from the caller script's lua_onKey function:
-- TBD
function OnLoadS1()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTS1_Main_Window_Handle = Graphics.CreateWindow(FDTS1_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTS1_Text_Window_Handle = Graphics.CreateWindow(FDTS1_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTS1_Scroll_BWDClippedAtX, g_FDTS1_Scroll_BWDClippedAtY, g_FDTS1_Scroll_FWDClippedAtX, g_FDTS1_Scroll_FWDClippedAtY)
	FDTListSliderScreen1()
	g_FDTS1_Screen_Count = 1
	g_FDTS1_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnTextS1()
	g_FDTS1_step = FDTListSliderGetAutoSceneStep()
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
Util.DebugPrint('[ListSlider]listTextTable set to '..g_FDTS1_ListText10584)
end
function GetLastSceneS1()
	return g_FDTS1_Last_Screen
end
ListSlider = {
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
-- function ListSlider.Create()
-- 	local self = DeepCopy(ListSlider)
-- 	return self
-- end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
--  FDTObserver["S1"]=ListSlider.Create()

-- ##################### end of note to integrate this component to the other widget #####################
--------- end FDT ---------
Util.DebugPrint('ListSlider.lua script loaded successfully')
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
	while (t[i] ~= nil) do
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
