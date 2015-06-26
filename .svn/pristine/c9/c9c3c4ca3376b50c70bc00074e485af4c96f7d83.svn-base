-- Human can change the following header text or make it empty during loading --
-- Machine/script can change the following table to (pre)load the real text dynamically --
g_FDTLogin_ListText18575= {}

--------- begin FDT 0.26 (Fri May 06 11:34:56 EDT 2011) ---------
-- Global variable
g_FDTLogin_Main_Window_Handle = -1
g_FDTLogin_Text_Window_Handle = -1
g_FDTLogin_Screen_Count = 0
g_FDTLogin_First_Screen = 1
g_FDTLogin_Scroll_Up = nil
g_FDTLogin_Scroll_Down = nil
g_FDTLogin_Scroll_Left = nil
g_FDTLogin_Scroll_Right = nil
g_FDTLogin_Scroll_XOffset = 0
g_FDTLogin_Scroll_YOffset = 0
g_FDTLogin_Scroll_ElementIndex = 1
g_FDTLogin_Scroll_FWDAllowed = true
g_FDTLogin_Scroll_BWDAllowed = true
g_FDTLogin_step = 0
-- Global constant
FDTLogin_TEXT_WINDOW_LAYER = 3
FDTLogin_MAIN_WINDOW_LAYER = 3

-- Font display flag
FONT_ATTRS_NORMAL = 1
FONT_ATTRS_ELIPSE = 2 
FONT_ATTRS_MULTILINE = 4
FONT_ATTRS_CLEARRECT = 8
FONT_ATTRS_RIGHT_JUST = 16
FONT_ATTRS_FADEOUT = 32
FONT_ATTRS_VERTICAL_BOTTOM_UP = 256
FONT_ATTRS_VERTICAL_TOP_DOWN = 512
g_FDTLogin_Scroll_BWDClippedAtX = 200
g_FDTLogin_Scroll_BWDClippedAtY = 80
g_FDTLogin_Scroll_FWDClippedAtX = 322
g_FDTLogin_Scroll_FWDClippedAtY = 81
function FDTLoginScreen1()
	Login11 = 15046
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTLogin_Main_Window_Handle, Login11, 200, 80, 322, 81, 64)
	Graphics.UpdateDisplay()
end
function FDTLoginScreen2()
	Login12 = 13174
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTLogin_Main_Window_Handle, Login12, 200, 80, 321, 80, 64)
	Graphics.UpdateDisplay()
end
function FDTLoginScreen3()
	TextBox = 13861
	nErr = Graphics.DrawImageExByID(iAttributeID, g_FDTLogin_Main_Window_Handle, TextBox, 200, 166, 323, 44, 64)
	nNTErr = Graphics.DrawString(iAttributeID, g_FDTLogin_Text_Window_Handle, 268, 180, 182, 16, '0xFFffffff', '0x00000000', 5, FONT_ATTRS_MULTILINE, 'Listening at channel 1313 ...')
	Graphics.UpdateDisplay()
end
g_FDTLogin_Last_Screen = 3
-- ######################## begin of text scrolling capability ##########################
-- Note: most important variables are scene #, key and g_FDTLogin_Scroll_ElementIndex
-- ######################################################################################
g_FDTLogin_Screen_Count = g_FDTLogin_Last_Screen	-- due to the preview in the onLoad
g_FDTLogin_Scroll_ElementIndex = g_FDTLogin_Last_Screen	-- due to the preview in the onLoad; assuming total list items are the same as scene counts

function FDTLoginHandleScrolling(scene, key)
	g_FDTLogin_Scroll_FWDAllowed = true
	g_FDTLogin_Scroll_BWDAllowed = true
	if(scene == 1 and key == KEY_UP) then
		if(g_FDTLogin_Scroll_ElementIndex <= 1) then
			g_FDTLogin_Scroll_BWDAllowed = false
		end
		if(not g_FDTLogin_Scroll_BWDAllowed) then
			g_FDTLogin_Scroll_ElementIndex = 1
		else
			g_FDTLogin_Scroll_ElementIndex = g_FDTLogin_Scroll_ElementIndex - 1
		end
	elseif(key == KEY_UP) then
		g_FDTLogin_Scroll_ElementIndex = g_FDTLogin_Scroll_ElementIndex - 1
	end

	if(scene == 3 and key == KEY_DOWN) then
		lastElementIndex = GetLastIndex(g_FDTLogin_ListText18575) - 1
		--=== zero element and only at the last row
		if(lastElementIndex <= 1 and g_FDT_Scroll_ElementIndex == 3) then
			g_FDTLogin_Scroll_FWDAllowed = false
		--=== total data elements less than the total rows in UI
		elseif(lastElementIndex == 0 and g_FDTLogin_Scroll_ElementIndex == lastElementIndex) then
			g_FDTLogin_Scroll_FWDAllowed = false
		--=== boundary condition i.e. total data elements equals total rows in UI
		elseif (lastElementIndex > 0 and g_FDTLogin_Scroll_ElementIndex == lastElementIndex) then
			g_FDTLogin_Scroll_FWDAllowed = false
		--=== total data elements more than total rows in UI
		elseif(g_FDTLogin_Scroll_ElementIndex -1 == lastElementIndex) then
			g_FDTLogin_Scroll_FWDAllowed = false
		end
		
		if(not g_FDTLogin_Scroll_FWDAllowed) then
			--leave index alone and do nothing
			--g_FDTLogin_Scroll_ElementIndex = lastElementIndex
		else
			g_FDTLogin_Scroll_ElementIndex = g_FDTLogin_Scroll_ElementIndex + 1
		end
	elseif(key == KEY_DOWN) then
		g_FDTLogin_Scroll_ElementIndex = g_FDTLogin_Scroll_ElementIndex + 1
	end

	Err = Graphics.ClearWindow(g_FDTLogin_Text_Window_Handle)
end
function FDTLoginHandleScrollingText(scene, key) 
if(scene == 1 and key == KEY_UP and g_FDTLogin_Scroll_ElementIndex >= 1) then
FDTLoginInitText(scene, key, g_FDTLogin_Scroll_ElementIndex)
elseif (scene == 3-1 and key == KEY_UP and g_FDTLogin_Scroll_ElementIndex == 3-1) then
FDTLoginInitText(scene, key, g_FDTLogin_Scroll_ElementIndex -2 + (-1))
elseif (scene == 3 and key == KEY_DOWN and g_FDTLogin_Scroll_ElementIndex >= 3+1) then
FDTLoginGetNextText(scene, key, g_FDTLogin_Scroll_ElementIndex)
elseif (scene == 3 and key == KEY_OK and g_FDTLogin_Scroll_ElementIndex == 3) then
FDTLoginInitText(scene, key, 1)
end
end
function FDTLoginInitText(pageindex, key, index) 
end
function FDTLoginGetNextText(pageindex, key, index)
end
-- ######################## end of text scrolling capability ##########################
function FDTLoginGetAutoSceneStep()
	step = offsetAutoScene/g_FDTLogin_Last_Screen
	return step
end
function OnKeyLogin(nKeyCode, nKeyType, nKeyState)
	Err = Graphics.ClearWindow(g_FDTLogin_Text_Window_Handle)
	if(nKeyCode == KEY_UP) then
		if(g_FDTLogin_Screen_Count <= g_FDTLogin_First_Screen + 1) then
			g_FDTLogin_Screen_Count = g_FDTLogin_First_Screen
		else
			g_FDTLogin_Screen_Count = g_FDTLogin_Screen_Count - 1
		end
		FDTLoginHandleScrolling(g_FDTLogin_Screen_Count, nKeyCode)
		FDTLoginHandleScrollingText(g_FDTLogin_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDTLogin_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTLogin_Scroll_FWDAllowed))
		Util.DebugPrint('[Login]backw scene'..g_FDTLogin_Screen_Count..' current index='..g_FDTLogin_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_DOWN) then
		if(g_FDTLogin_Screen_Count > g_FDTLogin_Last_Screen - 1) then
			g_FDTLogin_Screen_Count = g_FDTLogin_Last_Screen
		else
			g_FDTLogin_Screen_Count = g_FDTLogin_Screen_Count + 1
		end
		FDTLoginHandleScrolling(g_FDTLogin_Screen_Count, nKeyCode)
		FDTLoginHandleScrollingText(g_FDTLogin_Screen_Count, nKeyCode)
Util.DebugPrint('back allowed '..tostring(g_FDTLogin_Scroll_BWDAllowed)..' forward allowed '..tostring(g_FDTLogin_Scroll_FWDAllowed))
		Util.DebugPrint('[Login]forw scene'..g_FDTLogin_Screen_Count..' current index='..g_FDTLogin_Scroll_ElementIndex)
	elseif(nKeyCode == KEY_LEFT) then
		Util.DebugPrint('[Login]KEY_LEFT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_RIGHT) then
		Util.DebugPrint('[Login]KEY_RIGHT do nothing, as it is vertical list view')
	elseif(nKeyCode == KEY_OK) then
		FDTLoginHandleScrollingText(g_FDTLogin_Screen_Count, nKeyCode)
		--Util.DebugPrint('[Login]ok')
	elseif (nKeyCode == KEY_INFO) then
			--DrawBackground()
			--Util.DebugPrint('[Login]info')
	end
	if(g_FDTLogin_Screen_Count == 1) then
		FDTLoginScreen1()
	end
	if(g_FDTLogin_Screen_Count == 2) then
		FDTLoginScreen2()
	end
	if(g_FDTLogin_Screen_Count == 3) then
		FDTLoginScreen3()
	end
	Graphics.UpdateDisplay()
end

-- ##################### begin of note to integrate this component to the other widget #####################
-- *** In the caller script ***, the following code should be defined (preferably at the top of the script):
-- FDTObserver = {}
-- dofile('Login.lua')
-- The following code should be invoked directly/indirectly from the caller script's lua_onKey function:
-- TBD
function OnLoadLogin()
	nErr, iAttributeID = Graphics.CreateWindowAttrib()
	nErr, g_FDTLogin_Main_Window_Handle = Graphics.CreateWindow(FDTLogin_MAIN_WINDOW_LAYER, iAttributeID, 0, 0, 0, 704, 480)
	nErr, g_FDTLogin_Text_Window_Handle = Graphics.CreateWindow(FDTLogin_TEXT_WINDOW_LAYER, iAttributeID, 0, g_FDTLogin_Scroll_BWDClippedAtX, g_FDTLogin_Scroll_BWDClippedAtY, g_FDTLogin_Scroll_FWDClippedAtX, g_FDTLogin_Scroll_FWDClippedAtY)
	FDTLoginScreen1()
	g_FDTLogin_Screen_Count = 1
	g_FDTLogin_Scroll_ElementIndex = 1
	Graphics.UpdateDisplay()
end
function OnTextLogin()
	Graphics.UpdateDisplay()
end
function ShowLogin()
	nErr = Graphics.SetWindowVisibility(g_FDTLogin_Main_Window_Handle, TRUE)
	nErr = Graphics.SetWindowVisibility(g_FDTLogin_Text_Window_Handle, TRUE)
	Graphics.UpdateDisplay()
end
function HideLogin()
	nErr = Graphics.SetWindowVisibility(g_FDTLogin_Main_Window_Handle, FALSE)
	nErr = Graphics.SetWindowVisibility(g_FDTLogin_Text_Window_Handle, FALSE)
	Graphics.UpdateDisplay()
end
function GetTextLogin()
	return g_FDTLogin_ListText18575
end
function SetTextLogin(listTextTable)
	g_FDTLogin_ListText18575 = listTextTable
Util.DebugPrint('[Login]listTextTable set to '..g_FDTLogin_ListText18575)
end
function GetLastSceneLogin()
	return g_FDTLogin_Last_Screen
end
Login = {
	OnKey = OnKeyLogin,
	OnLoad = OnLoadLogin,
	OnText = OnTextLogin,
	GetText = GetTextLogin,
	SetText = SetTextLogin,
	GetLastScene = GetLastSceneLogin,
	OnUnLoad = lua_onUnLoad,
	Show = ShowLogin,
	Hide = HideLogin
}
function Login.Create()
	local self = DeepCopy(Login)
	return self
end
-- *** In the current script ***, uncomment the following and change the #1 to whatever index as required by the application
 FDTObserver["Login"]=Login.Create()

-- ##################### end of note to integrate this component to the other widget #####################
--------- end FDT ---------
Util.DebugPrint('Login.lua script loaded successfully')
