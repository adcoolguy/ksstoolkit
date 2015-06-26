-- Human can change the following header text or make it empty during loading --
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDTScrollerBall_ListText18575= {}

--------- begin FDT 0.26 (Fri May 06 11:34:57 EDT 2011) ---------
-- Global variable
g_FDTScrollerBall_Main_Window_Handle = -1
g_FDTScrollerBall_Text_Window_Handle = -1
g_FDTScrollerBall_Screen_Count = 0
g_FDTScrollerBall_First_Screen = 1
g_FDTScrollerBall_Scroll_Up = nil
g_FDTScrollerBall_Scroll_Down = nil
g_FDTScrollerBall_Scroll_Left = nil
g_FDTScrollerBall_Scroll_Right = nil
g_FDTScrollerBall_Scroll_XOffset = 0
g_FDTScrollerBall_Scroll_YOffset = 0
g_FDTScrollerBall_Scroll_ElementIndex = 1
g_FDTScrollerBall_Scroll_FWDAllowed = true
g_FDTScrollerBall_Scroll_BWDAllowed = true
g_FDTScrollerBall_step = 0
-- Global constant
FDTScrollerBall_TEXT_WINDOW_LAYER = 3
FDTScrollerBall_MAIN_WINDOW_LAYER = 3

-- Font display flag
FONT_ATTRS_NORMAL = 1
FONT_ATTRS_ELIPSE = 2 
FONT_ATTRS_MULTILINE = 4
FONT_ATTRS_CLEARRECT = 8
FONT_ATTRS_RIGHT_JUST = 16
FONT_ATTRS_FADEOUT = 32
FONT_ATTRS_VERTICAL_BOTTOM_UP = 256
FONT_ATTRS_VERTICAL_TOP_DOWN = 512
g_FDTScrollerBall_Scroll_BWDClippedAtX = 658
g_FDTScrollerBall_Scroll_BWDClippedAtY = 185
g_FDTScrollerBall_Scroll_FWDClippedAtX = 13
g_FDTScrollerBall_Scroll_FWDClippedAtY = 13
function FDTScrollerBallScreenY(y)
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	rScrollerBlackBackground3 = 13370
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, rScrollerBlackBackground3, 656, 177, 16, 242, 32)
	autoImage = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, autoImage, 658, y, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen1()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 185, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen2()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 214, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen3()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 243, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen4()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 272, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen5()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 301, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen6()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 330, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen7()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 359, 13, 13, 64)
	Graphics.UpdateDisplay()
end
function FDTScrollerBallScreen8()
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Main_Window_Handle)
	ScrollerBallButton2 = 17997
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTScrollerBall_Main_Window_Handle, ScrollerBallButton2, 658, 388, 13, 13, 64)
	Graphics.UpdateDisplay()
end
g_FDTScrollerBall_Last_Screen = 8
-- ######################## begin of text scrolling capability ##########################
-- Note: most important variables are scene #, key and g_FDTScrollerBall_Scroll_ElementIndex
-- ######################################################################################
g_FDTScrollerBall_Screen_Count = g_FDTScrollerBall_Last_Screen	-- due to the preview in the onLoad
g_FDTScrollerBall_Scroll_ElementIndex = g_FDTScrollerBall_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts

function FDTScrollerBallHandleScrolling(scene, key)
	g_FDTScrollerBall_Scroll_FWDAllowed = true
	g_FDTScrollerBall_Scroll_BWDAllowed = true
	if(scene == 1 and key == KEY_UP) then
		if(g_FDTScrollerBall_Scroll_ElementIndex <= 1) then
			g_FDTScrollerBall_Scroll_BWDAllowed = false
		end
		if(not g_FDTScrollerBall_Scroll_BWDAllowed) then
			g_FDTScrollerBall_Scroll_ElementIndex = 1
		else
			g_FDTScrollerBall_Scroll_ElementIndex = g_FDTScrollerBall_Scroll_ElementIndex - 1
		end
	elseif(key == KEY_UP) then
		g_FDTScrollerBall_Scroll_ElementIndex = g_FDTScrollerBall_Scroll_ElementIndex - 1
	end

	if(scene == 8 and key == KEY_DOWN) then
		lastElementIndex = GetLastIndex(g_FDTScrollerBall_ListText18575) - 1
		--=== zero element and only at the last row
		if(lastElementIndex <= 1 and g_FDT_Scroll_ElementIndex == 8) then
			g_FDTScrollerBall_Scroll_FWDAllowed = false
		--=== total data elements less than the total rows in UI
		elseif(lastElementIndex == 5 and g_FDTScrollerBall_Scroll_ElementIndex == lastElementIndex) then
			g_FDTScrollerBall_Scroll_FWDAllowed = false
		--=== boundary condition i.e. total data elements equals total rows in UI
		elseif (lastElementIndex > 5 and g_FDTScrollerBall_Scroll_ElementIndex == lastElementIndex) then
			g_FDTScrollerBall_Scroll_FWDAllowed = false
		--=== total data elements more than total rows in UI
		elseif(g_FDTScrollerBall_Scroll_ElementIndex -1 == lastElementIndex) then
			g_FDTScrollerBall_Scroll_FWDAllowed = false
		end
		
		if(not g_FDTScrollerBall_Scroll_FWDAllowed) then
			--leave index alone and do nothing
			--g_FDTScrollerBall_Scroll_ElementIndex = lastElementIndex
		else
			g_FDTScrollerBall_Scroll_ElementIndex = g_FDTScrollerBall_Scroll_ElementIndex + 1
		end
	elseif(key == KEY_DOWN) then
		g_FDTScrollerBall_Scroll_ElementIndex = g_FDTScrollerBall_Scroll_ElementIndex + 1
	end

	Err = Graphics.ClearWindow(g_FDTScrollerBall_Text_Window_Handle)
end
function FDTScrollerBallHandleScrollingText(scene, key) 
if(scene == 1 and key == KEY_UP and g_FDTScrollerBall_Scroll_ElementIndex >= 1) then
FDTScrollerBallInitText(scene, key, g_FDTScrollerBall_Scroll_ElementIndex)
elseif (scene == 8-1 and key == KEY_UP and g_FDTScrollerBall_Scroll_ElementIndex == 8-1) then
FDTScrollerBallInitText(scene, key, g_FDTScrollerBall_Scroll_ElementIndex -2 + (-1))
elseif (scene == 8 and key == KEY_DOWN and g_FDTScrollerBall_Scroll_ElementIndex >= 8+1) then
FDTScrollerBallGetNextText(scene, key, g_FDTScrollerBall_Scroll_ElementIndex)
elseif (scene == 8 and key == KEY_OK and g_FDTScrollerBall_Scroll_ElementIndex == 8) then
FDTScrollerBallInitText(scene, key, 1)
end
end
function FDTScrollerBallInitText(pageindex, key, index) 
end
function FDTScrollerBallGetNextText(pageindex, key, index)
end
-- ######################## end of text scrolling capability ##########################
function FDTScrollerBallGetAutoSceneStep()
	offsetAutoScene = 215
	step = offsetAutoScene/g_FDTList_Last_Screen
	step = step + (step/5)
	return step
end
g_FDTScrollerBall_currentY = 185
function OnKeyScrollerBall(nKeyCode, nKeyType, nKeyState)
	Err = Graphics.ClearWindow(g_FDTScrollerBall_Text_Window_Handle)
	if(nKeyCode == KEY_UP) then
		if(g_FDTScrollerBall_Screen_Count <= g_FDTScrollerBall_First_Screen + 1) then
			g_FDTScrollerBall_Screen_Count = g_FDTScrollerBall_First_Screen
		else
			g_FDTScrollerBall_Screen_Count = g_FDTScrollerBall_Screen_Count - 1
		end
		FDTScrollerBallHandleScrolling(g_FDTScrollerBall_Screen_Count, nKeyCode)
		FDTScrollerBallHandleScrollingText(g_FDTScrollerBall_Screen_Count, nKeyCode)
	if(g_FDTList_Scroll_BWDAllowed) then
	g_FDTScrollerBall_currentY = g_FDTScrollerBall_currentY - g_FDTScrollerBall_step
	FDTScrollerBallScreenY(g_FDTScrollerBall_currentY)
	end
Util.DebugPrint('back allowed '..tostring(g_FDTScrollerBall_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTScrollerBall_Scroll_FWDAllowed))
		Util.DebugPrint('[ScrollerBall]backw scene'..g_FDTScrollerBall_Screen_Count..' current index='..g_FDTScrollerBall_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDTScrollerBall_Screen_Count > g_FDTScrollerBall_Last_Screen - 1) then
			g_FDTScrollerBall_Screen_Count = g_FDTScrollerBall_Last_Screen
		else
			g_FDTScrollerBall_Screen_Count = g_FDTScrollerBall_Screen_Count + 1
		end
		FDTScrollerBallHandleScrolling(g_FDTScrollerBall_Screen_Count, nKeyCode)
		FDTScrollerBallHandleScrollingText(g_FDTScrollerBall_Screen_Count, nKeyCode)
	if(g_FDTList_Scroll_FWDAllowed) then
	g_FDTScrollerBall_currentY = g_FDTScrollerBall_currentY + g_FDTScrollerBall_step
	FDTScrollerBallScreenY(g_FDTScrollerBall_currentY)
	end
Util.DebugPrint('back allowed '..tostring(g_FDTScrollerBall_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTScrollerBall_Scroll_FWDAllowed))
		Util.DebugPrint('[ScrollerBall]forw scene'..g_FDTScrollerBall_Screen_Count..' current index='..g_FDTScrollerBall_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[ScrollerBall]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[ScrollerBall]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTScrollerBallHandleScrollingText(g_FDTScrollerBall_Screen_Count, nKeyCode)
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
function OnLoadScrollerBall()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTScrollerBall_Main_Window_Handle = Graphics.CreateWindow(FDTScrollerBall_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTScrollerBall_Text_Window_Handle = Graphics.CreateWindow(FDTScrollerBall_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTScrollerBall_Scroll_BWDClippedAtX, g_FDTScrollerBall_Scroll_BWDClippedAtY, g_FDTScrollerBall_Scroll_FWDClippedAtX, g_FDTScrollerBall_Scroll_FWDClippedAtY)
	FDTScrollerBallScreen1()
	g_FDTScrollerBall_Screen_Count = 1
	g_FDTScrollerBall_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnTextScrollerBall()
	g_FDTScrollerBall_step = FDTScrollerBallGetAutoSceneStep()
	Graphics.UpdateDisplay()
end
function ShowScrollerBall()
	nErr = Graphics.SetWindowVisibility(g_FDTScrollerBall_Main_Window_Handle, TRUE)
	nErr = Graphics.SetWindowVisibility(g_FDTScrollerBall_Text_Window_Handle, TRUE)
	Graphics.UpdateDisplay()
end
function HideScrollerBall()
	nErr = Graphics.SetWindowVisibility(g_FDTScrollerBall_Main_Window_Handle, FALSE)
	nErr = Graphics.SetWindowVisibility(g_FDTScrollerBall_Text_Window_Handle, FALSE)
	Graphics.UpdateDisplay()
end
function GetTextScrollerBall()
	return g_FDTScrollerBall_ListText18575
end
function SetTextScrollerBall(listTextTable)
	g_FDTScrollerBall_ListText18575 = listTextTable
Util.DebugPrint('[ScrollerBall]listTextTable set to '..g_FDTScrollerBall_ListText18575)
end
function GetLastSceneScrollerBall()
	return g_FDTScrollerBall_Last_Screen
end
ScrollerBall = {
	OnKey = OnKeyScrollerBall,
	OnLoad = OnLoadScrollerBall,
	OnText = OnTextScrollerBall,
	GetText = GetTextScrollerBall,
	SetText = SetTextScrollerBall,
	GetLastScene = GetLastSceneScrollerBall,
	OnUnLoad = lua_onUnLoad,
	Show = ShowScrollerBall,
	Hide = HideScrollerBall
}
function ScrollerBall.Create()
	local self = DeepCopy(ScrollerBall)
	return self
end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
 FDTObserver["ScrollerBall"]=ScrollerBall.Create()

-- ##################### end of note to integrate this component to the other widget #####################
--------- end FDT ---------
Util.DebugPrint('ScrollerBall.lua script loaded successfully')
