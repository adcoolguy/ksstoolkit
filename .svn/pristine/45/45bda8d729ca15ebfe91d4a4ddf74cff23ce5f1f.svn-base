FDTObserver = {}
dofile('Client.lua')
dofile('List.lua')

---------------------------------------Start of File ------------------------------------


-- Script Global Variables
g_Window_Attribute = 0
g_Window_Handle = 0

-- Remote KeyCode Global Variables
KEY_DOWN = 53
KEY_EXIT = 18
KEY_FWD = 29
KEY_INFO = 51
KEY_LEFT = 54
KEY_RIGHT = 55
KEY_OK = 17
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
KEY_A = 23
KEY_PPV = 24
KEY_WIDGETS = 67
KEY_C = 40
KEY_B = 39
----------------------------------------------------------------------------
---------Colour-----------
COLOUR_WHITE = "0xFFCCCCCC"
COLOUR_BLACK = "0xFF333333"
COLOUR_GRAY =  "0xFFb2b2b2"

FONTSIZE_18 = 0
FONTSIZE_16 = 1
FONTSIZE_20 = 2
FONTSIZE_14 = 3
FONTSIZE_15 = 4
FONTSIZE_17 = 5
FONTSIZE_16_Italics = 6
FONTSIZE_22 = 7
FONTSIZE_25 = 8

font_attrs_left_just = 2
font_attrs_multiline_ellipsis = 6
font_attrs_right_just = 18
font_attrs_vertical_bottom_up = 258
HG_ERR_NONE = 0
----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- Global Functions

----------------------------------------------------------------------------
-- Utility functions
----------------------------------------------------------------------------

-- Global variable

--Enable this fr debug prints
g_nDebug = 1
bmpid1 = 45050
bmpid2 = 45069

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
    debugPrint('   Argument 1:' .. tostring(nAppId))

    if type(strParam) == 'string' then
        debugPrint('   Argument 2:' .. strParam)
    else
        debugPrint('   Argument 2: Empty String' )
    end
    Err = Graphics.InitWindowAttributes()


    return HG_ERR_NONE
end

function lua_onLoad()

    debugPrint('lua_onLoad invoked')
    -- Initialize the graphics frame and show the start up screen
    InitLuaScripts()

	if( g_Window_Attribute <= 0 ) then
		dummy,g_Window_Attribute = Graphics.CreateWindowAttrib()
	end

	if( g_Window_Handle <= 0 ) then
		dummy,g_Window_Handle = Graphics.CreateWindow(9, g_Window_Attribute, 0, 0, 0, 704, 480)
	end

	DrawFullBackground()
	Graphics.UpdateDisplay()

	for index = 1, getLastIndex(FDTObserver)-1, 1 do
		view = FDTObserver[index]
		view.OnLoad()
		debugPrint('component '..index..' initialized')
	end

    return HG_ERR_NONE
end

function DrawFullBackground()
	--Full BG
	debugPrint('DrawFullBackground enter')
	nErr = Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, bmpid1, 0, 0, 704, 480, 64)
	nErr = Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, bmpid2, 0, 0, 704, 480, 64)
	Graphics.DrawString(g_Window_Attribute, g_Window_Handle,  320, 105,200, 20, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Timer Demo!!!')
	Graphics.DrawString(g_Window_Attribute, g_Window_Handle,  250, 155,305, 320, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Press B to Start the Timer of 5 Sec')
	Graphics.DrawString(g_Window_Attribute, g_Window_Handle,  250, 175,300, 320, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Press C to Stop the Timer')

	debugPrint('DrawFullBackground exit')
end

-------------------------------------------------------------------------
-- This function is called just before unloading the lua script and is
-- a chance for the Lua script to do any clean up in Mercury code.
-------------------------------------------------------------------------

function lua_onUnload()
    debugPrint('lua_onUnload invoked')
    nErr = App.Cleanup()
    return HG_ERR_NONE
end



function lua_onKey(nKeyCode, nKeyType, nKeyState)
	OnKeyHandler(nKeyCode, nKeyType, nKeyState)
    return HG_ERR_NONE
end


function InitLuaScripts()
    debugPrint('InitLuaScripts invoked')
	nRet = HG_ERR_NONE

	nRet = InitLuaScriptCommon()

	if nRet == HG_ERR_NONE then
		Graphics.UpdateDisplay()
		return HG_ERR_NONE
	else
		return HG_ERR_FAILED
	end

    return HG_ERR_FAILED
end

----------------------------------------------------------------------------
-- Generated Scripts Functions
----------------------------------------------------------------------------

function Start_Testing()

	TIMER_TYPE_NONE           = 0
	TIMER_TYPE_ONE_TIME       = 1
	TIMER_TYPE_REPEAT         = 2
	TIMER_TYPE_AT_TIME        = 3
	TIMER_TYPE_AT_GPS_TIME    = 4
	TIMER_TYPE_KILL_ON_EXPIRY = 16
	TIMER_TYPE_DO_NOT_START   = 32

	local Err,ret
	Err,TEST_TIMER_ID = Timer.Create(TIMER_TYPE_REPEAT, 100, "100")

	if(TEST_TIMER_ID <= 0 ) then
		debugPrint("Timer call Failed")
	else
		debugPrint("Timer call Succeeded : "..TEST_TIMER_ID)
		ret = Timer.Start(TEST_TIMER_ID)
	end
end

function Stop_Testing()
	debugPrint("Stop_Testing: "..tostring(TEST_TIMER_ID))
    if( TEST_TIMER_ID > 0 ) then
		ret = Timer.Stop(TEST_TIMER_ID)
		debugPrint("Timer Stop Succeeded : "..TEST_TIMER_ID)
	end
end

--### This is needed as FiOS lua does not seem to understand # operator (size of table) of lua
function getLastIndex(t)
	i = 1
	while (t[i] ~= nil) do
		i = i + 1
	end
	return i
end

function OnKeyHandler(nKeyCode, nKeyType, nKeyState)
	debugPrint('OnKeyHandler() : called')
debugPrint('OnKeyHandler() : debug1')
	debugPrint('total component registered '..getLastIndex(FDTObserver)-1)
	for index = 1, getLastIndex(FDTObserver)-1, 1 do
		view = FDTObserver[index]
		view.OnKey(nKeyCode, nKeyType, nKeyState)
		debugPrint('component '..index..' notified')
	end
debugPrint('OnKeyHandler() : debug2')


	Graphics.ClearWindow(g_Window_Handle)
	DrawFullBackground()

	if (nKeyCode == KEY_UP) then
		--Graphics.DrawString( g_Window_Attribute, g_Window_Handle,  250, 225,200, 20, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Key UP Pressed!!!')

	elseif (nKeyCode == KEY_DOWN) then
		--Graphics.DrawString(g_Window_Attribute, g_Window_Handle,  250, 225,200, 20, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Key DOWN Pressed!!!')

	elseif (nKeyCode == KEY_B) then
		Start_Testing()
		Graphics.DrawString(g_Window_Attribute, g_Window_Handle, 300, 225,200, 20, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Test Timer Started')
	elseif (nKeyCode == KEY_C) then
		Stop_Testing()
		Graphics.DrawString(g_Window_Attribute, g_Window_Handle, 300, 225,200, 20, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Test Timer Stopped')
	end
	Graphics.UpdateDisplay()
	return HG_ERR_NONE
end


function InitLuaScriptCommon()
	debugPrint('InitLuaScriptCommon() : called')
	nRet = HG_ERR_NONE

	nRet = Graphics.InitWindowAttributes()
	debugPrint('InitLuaScriptCommon() : exit')
	return nRet
end

Toggle_Flag = 1

function lua_onTimerEvent(nTimerID, nData, strData)
	debugPrint('lua_onTimerEvent Called')
	debugPrint('Argument 1:' .. tostring(nTimerID))
	debugPrint('Argument 2:' .. tostring(nData))
	debugPrint('Argument 3:' .. tostring(strData))

	if(nTimerID == TEST_TIMER_ID) then
		local Err,Stime
		debugPrint('Timer Event for TEST_TIMER_ID')
		Graphics.ClearWindow(g_Window_Handle)
		DrawFullBackground()
		Graphics.DrawString(g_Window_Attribute, g_Window_Handle, 300, 225,200, 20, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Test Timer Running')
		if(Toggle_Flag == 1) then
			Err,Stime = Timer.GetTime ()
			--Toggle_Flag = 0
			Graphics.DrawString(g_Window_Attribute, g_Window_Handle, 220, 400,400, 200, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Timer Event(SYS) :'..tostring(Stime))
		else
			Toggle_Flag = 1
			Err,CurrentTime = Timer.GetGPSTime()
			Graphics.DrawString(g_Window_Attribute, g_Window_Handle, 220, 300,400, 200, "0x00c0c0c0", "0xFF33CC33", 5,2, 'Timer Event(GPS) :'..tostring(CurrentTime))
		end
		Graphics.UpdateDisplay()
	end
	
	Toggle_Flag = 1

    return HG_ERR_NONE
end

