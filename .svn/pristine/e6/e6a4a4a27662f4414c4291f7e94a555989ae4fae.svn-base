-- Global constants
LUA_APPID = 1208
MESSAGE_EXIT = 9
MESSAGE_EXITNLAUNCH = 13
MESSAGE_LUALAUNCH = 14

HG_ERR_NONE = 0
HG_ERR_FAILED = -1

TRUE   = 1
FALSE  = 0

-- Global Variables

KEY_WIDTH = 51
KEY_HEIGHT = 44
KEY_SPACE = 2

SDTV_WIDTH = 704
SDTV_HEIGHT = 480

--Window XY Coordinates
WINDOW_WIDTH = 252
WINDOW_HEIGHT = 300
WINDOW_X_POS = SDTV_WIDTH - WINDOW_WIDTH
WINDOW_Y_POS = 0

MAG_WINDOW_X_POS = 100
MAG_WINDOW_Y_POS = 400
MAG_WINDOW_WIDTH = 250 --Putting maximum width of the mag window
MAG_WINDOW_HEIGHT = 90 --Putting maximum height of the mag height

INPUT_WINDOW_X_POS = 195
INPUT_WINDOW_Y_POS = 100
INPUT_WINDOW_WIDTH = 291
INPUT_WINDOW_HEIGHT = 56

KEYPAD_WINDOW_X_POS = 50
KEYPAD_WINDOW_Y_POS = 130

-- Script Global Variables
g_Window_Attribute = 0
g_Window_Handle = 0

--Global Variables for Mag area
g_Mag_Attribute = 0
g_Mag_Handle = 0

--Global Variables for Input area
g_Input_Handle = 0
g_Input_Attribute = 0

-- FiosScreen Global Variables

gnKeyCode = 0

gtCurrentItem = {}
gtCurrentItem.row = 3
gtCurrentItem.col = 3
gtCurrentItem.char = '1'

gShift = 0
gstrString = ''

-- Key Tables

Keyboard = {}
Keys_Row1 = {'1','2','3','4','5','6','7','8','9','0','BKSP'}
Keys_Row1.nStartXpos = 0
Keys_Row2 = {'q','w','e','r','t','y','u','i','o','p','\\'}
Keys_Row2.nStartXpos = Keys_Row1.nStartXpos
Keys_Row3 = {'a','s','d','f','g','h','j','k','l',';','\''}
Keys_Row3.nStartXpos = Keys_Row2.nStartXpos
Keys_Row4 = {'CAPS','z','x','c','v','b','n','m','\,','\.','\/'}
Keys_Row4.nStartXpos = Keys_Row3.nStartXpos
Keys_Row5 = {'\`','-','=','SPACE','\[','\]','Enter'}
Keys_Row5.nStartXpos = 53
Keyboard = {Keys_Row1,Keys_Row2,Keys_Row3,Keys_Row4,Keys_Row5}

KeyboardShift = {}
Keys_Row1 = {'!','@','#','$','%','^','&','*','(',')','BKSP'}
Keys_Row2 = {'Q','W','E','R','T','Y','U','I','O','P','\|'}
Keys_Row3 = {'A','S','D','F','G','H','J','K','L',':','\"'}
Keys_Row4 = {'CAPS','Z','X','C','V','B','N','M','\<','\>','\?'}
Keys_Row5 = {'\~','_','+','SPACE','\{','\}','Enter'}
KeyboardShift = {Keys_Row1,Keys_Row2,Keys_Row3,Keys_Row4,Keys_Row5}

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
    --InitLuaScripts()

	if( g_Window_Attribute <= 0 ) then
		nErr,g_Window_Attribute = Graphics.CreateWindowAttrib()
	end
	if( g_Window_Handle <= 0 ) then
		nErr,g_Window_Handle = Graphics.CreateWindow(3, g_Window_Attribute, 0, WINDOW_X_POS, WINDOW_Y_POS, WINDOW_WIDTH, WINDOW_HEIGHT)
	end
	debugPrint('\nInside KeyBoard_CreateControl')
	--Redraw()
	debugPrint('\nInside DrawBackground 111 '..g_Window_Handle)
	Graphics.ClearWindow( g_Window_Handle )
	nErr = Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 11192, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, 64)
	nErr = Graphics.DrawImageByID(g_Window_Attribute, g_Window_Handle, 53061, 30, 50, 64)
	nErr = Graphics.DrawImageByID(g_Window_Attribute, g_Window_Handle, 53207, 30, 125, 64)
	nErr = Graphics.DrawImageByID(g_Window_Attribute, g_Window_Handle, 53063, 30, 200, 64)
	Graphics.UpdateDisplay()

	--VOD
	videoWidth = SDTV_WIDTH - WINDOW_WIDTH
	videoHeight = WINDOW_HEIGHT
	nErr,g_VODWindow_Handle = Graphics.CreateWindow(3, g_Window_Attribute, g_Window_Handle + 1, 0, 0, videoWidth, videoHeight)
	VOD.DrawPoster(1, g_VODWindow_Handle, 1, 1, 0, 0, videoWidth, videoHeight, 0)

	--EPG
	nErr,g_EPGWindow_Handle = Graphics.CreateWindow(3, g_Window_Attribute, g_Window_Handle + 2, WINDOW_X_POS, WINDOW_HEIGHT, WINDOW_WIDTH, SDTV_HEIGHT-WINDOW_HEIGHT)
	--print(os.date("today is %Y/%m/%d %H:%M:%S"))
    lCurrentTime = os.date("today is %Y/%m/%d %H:%M:%S")
	err, nChannelNum = EPG.GetTunedChannel()
	err, epgStr = EPG.GetProgramInfo(lCurrentTime, nChannelNum)
	Graphics.DrawString(-1, g_VODWindow_Handle,  10, 20, -1, -1, "0xFF222222", "0x00c0c0c0", 0,2, tostring(nChannelNum)..' '..epgStr["ChName"])
	Graphics.DrawString(-1, g_EPGWindow_Handle,  10, 20, -1, -1, "0xFF222222", "0x00c0c0c0", 0,2, epgStr["ProgName"])
	Graphics.DrawString(-1, g_EPGWindow_Handle,  10, 70, -1, -1, "0xFF222222", "0x00c0c0c0", 0,2, epgStr["ProgDesc"])
	Graphics.DrawString(-1, g_EPGWindow_Handle,  10, 90, -1, -1, "0xFF222222", "0x00c0c0c0", 0,2, epgStr["Cast"])
	Graphics.UpdateDisplay()
	
	
end

-- simulate IRIS load
--lua_onLoad

print("Fios LUA script loaded.")