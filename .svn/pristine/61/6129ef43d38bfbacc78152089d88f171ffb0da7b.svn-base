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

--Window XY Coordinates

WINDOW_X_POS = 0
WINDOW_Y_POS = 0
WINDOW_WIDTH = 704
WINDOW_HEIGHT = 480

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
	
	if( g_Mag_Attribute <= 0 ) then
		nErr,g_Mag_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( g_Mag_Handle <= 0 ) then
		nErr,g_Mag_Handle = Graphics.CreateWindow(2, g_Mag_Attribute, 0, MAG_WINDOW_X_POS, MAG_WINDOW_Y_POS, MAG_WINDOW_WIDTH, MAG_WINDOW_HEIGHT)
		print('MAG_WINDOW_WIDTH '..MAG_WINDOW_WIDTH)
		print('MAG_WINDOW_HEIGHT '..MAG_WINDOW_HEIGHT)
		x,y,w,h = getWindow(g_Mag_Handle)
		print(x)
		print(y)
		print(w)
		print(h)
	end
	
	if( g_Input_Attribute <= 0 ) then
		nErr,g_Input_Attribute = Graphics.CreateWindowAttrib()
	end
	
	if( g_Input_Handle <= 0 ) then
		nErr,g_Input_Handle = Graphics.CreateWindow(2, g_Input_Attribute, 0, INPUT_WINDOW_X_POS, INPUT_WINDOW_Y_POS, INPUT_WINDOW_WIDTH, INPUT_WINDOW_HEIGHT)
	end
	
	KeyBoard_CreateControl()

    return HG_ERR_NONE
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

function ExitApp()
    debugPrint('Exiting the Application ...')
    App.PostMessage(MESSAGE_EXIT, LUA_APPID, 0)
end

----------------------------------------------------------------------------
-- Scripts Functions
----------------------------------------------------------------------------

function lua_onKey(nKeyCode, nKeyType, nKeyState)
	KeyboardOnKeyHandler(nKeyCode, nKeyType, nKeyState)
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

function InitLuaScripts()
    debugPrint('InitLuaScripts invoked')
	nRet = HG_ERR_NONE

	nRet = InitLuaScriptCommon()

	if nRet == HG_ERR_NONE then
		Graphics.UpdateDisplay()
		return HG_ERR_NONE
	else
		ExitApp()
		return HG_ERR_FAILED
	end

    return HG_ERR_FAILED
end

----------------------------------------------------------------------------
-- Generated Scripts Functions
----------------------------------------------------------------------------

function InitLuaScriptCommon()
	debugPrint('InitLuaScriptCommon() : called')
	nRet = HG_ERR_NONE
	

	nRet = Graphics.GetAvailableFonts()
	nRet = Graphics.InitWindowAttributes()

	return nRet
end


function KeyBoard_CreateControl()
	debugPrint('\nInside KeyBoard_CreateControl')
	--Redraw()
	DrawBackground()
	nErr = Graphics.DrawImageByID(g_Input_Attribute, g_Input_Handle, 12097, 0, 0, 64)		
	Drawkeys()
	DrawHighlight(0)	
	Graphics.UpdateDisplay()
end

function KeyboardOnKeyHandler(nKeyCode, nKeyType, nKeyState)
	gnKeyCode = nKeyCode

	if(nKeyCode == KEY_UP) then
		if gtCurrentItem.row == table.getn(Keyboard) then --navigating from the last row
			if (gtCurrentItem.col >= 1 and gtCurrentItem.col <= 3) then
				gtCurrentItem.col = gtCurrentItem.col + 1
			elseif gtCurrentItem.col == 4 then
				gtCurrentItem.col = 6
			else
				gtCurrentItem.col = gtCurrentItem.col + 3
			end
		end
		gtCurrentItem.row = gtCurrentItem.row - 1
		if(gtCurrentItem.row < 1) then
			gtCurrentItem.row = 1
		end
		--nErr = Graphics.SetWindowPosition(g_Input_Handle, 105, 100)

	elseif(nKeyCode == KEY_DOWN) then
		if(gtCurrentItem.row == table.getn(Keyboard) - 1) then --navigating to the last row
			if gtCurrentItem.col == 1 then
				gtCurrentItem.col = 1
			elseif gtCurrentItem.col >= 2 and gtCurrentItem.col <= 4 then
				gtCurrentItem.col = gtCurrentItem.col - 1
			elseif gtCurrentItem.col >= 5 and gtCurrentItem.col <= 7 then
				gtCurrentItem.col = 4
			elseif gtCurrentItem.col >= 8 and gtCurrentItem.col <= 10 then
				gtCurrentItem.col = gtCurrentItem.col - 3
			elseif gtCurrentItem.col == 11 then
				gtCurrentItem.col = 7
			end
		end
		gtCurrentItem.row = gtCurrentItem.row + 1
		if(gtCurrentItem.row > table.getn(Keyboard)) then
			gtCurrentItem.row = table.getn(Keyboard)
		end
		--[[
		if(gtCurrentItem.col > table.getn(Keyboard[gtCurrentItem.row])) then
			gtCurrentItem.col = table.getn(Keyboard[gtCurrentItem.row])
		end
		]]--
	elseif(nKeyCode == KEY_LEFT) then
		gtCurrentItem.col = gtCurrentItem.col - 1
		if(gtCurrentItem.col < 1) then
			gtCurrentItem.col = 1
		end
	elseif(nKeyCode == KEY_RIGHT) then
		gtCurrentItem.col = gtCurrentItem.col + 1
		if(gtCurrentItem.col > table.getn(Keyboard[gtCurrentItem.row])) then
			gtCurrentItem.col = table.getn(Keyboard[gtCurrentItem.row])
		end
	elseif(nKeyCode == KEY_OK) then
		DrawHighlight(1)
		Graphics.UpdateDisplay()		
		DrawHighlight(0)
		UpdateInput()
		Graphics.UpdateDisplay()		
		return
	elseif (nKeyCode == KEY_INFO) then
		if gShift == 1 then
			gShift = 0
		else
			gShift = 1
		end
		DrawBackground()
		Drawkeys()
	end
	Redraw()
end

function Redraw()
	--DrawBackground()	
	DrawHighlight(0)	
	Graphics.UpdateDisplay()
end

function DrawBackground()
	debugPrint('\nInside DrawBackground')
	Graphics.ClearWindow( g_Window_Handle )
	nErr = Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 11192, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, 64)	
	
	Graphics.DrawString( g_Window_Attribute, g_Window_Handle, 50, WINDOW_HEIGHT - 55, 200, 20, "0x00c0c0c0", "0xFF33CC33", 1,2, 'Press \'INFO\' to toggle case')	
end

function UpdateInput()
	debugPrint('\nInside UpdateInput')
	
	strKey = ''
	if Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'BKSP' then
		--Redraw whole window
		Graphics.ClearWindow(g_Input_Handle )
		nErr = Graphics.DrawImageByID(g_Input_Attribute, g_Input_Handle, 12097, 0, 0, 64)
		debugPrint('\n\n############# BACKSPACE ################\n\n')
		gstrString = string.sub(gstrString,1,string.len(gstrString)-1)
	elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'CAPS' then
		if gShift == 1 then
			gShift = 0
		else
			gShift = 1
		end
		DrawBackground()
		Drawkeys()
		return
	elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'Enter' then
	--hg_showPrompt('Lua Keyboard', gstrString, 30, 'OK', 1)
	else
		--Redraw whole window
		Graphics.ClearWindow(g_Input_Handle)
		nErr = Graphics.DrawImageByID(g_Input_Attribute, g_Input_Handle, 12097, 0, 0, 64)
		if Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'SPACE' then
			strKey = ' '
		else
			if(gShift == 1) then
				strKey = KeyboardShift[gtCurrentItem.row][gtCurrentItem.col]
			else
				strKey = Keyboard[gtCurrentItem.row][gtCurrentItem.col]
			end
		end
		gstrString = gstrString..strKey
	end
	--Graphics.DrawString( g_Input_Attribute, g_Input_Handle, 250, 20, 15, 25, "0x00c0c0c0", "0xFF222222", 1, gstrString..'_')
	Graphics.DrawString( g_Input_Attribute, g_Input_Handle, 25, 15, 250, 20, "0xFF222222", "0x00c0c0c0", 1,2, gstrString..'_')
	debugPrint('\n################# '..gstrString..' ###############\n')	
end

function DrawHighlight(shade)
	debugPrint('\nInside DrawHighlight')
	Graphics.ClearWindow( g_Mag_Handle )
	debugPrint('\n g_Mag_Handle'..tostring(g_Mag_Handle))
	--local xPos = Keyboard[gtCurrentItem.row].nStartXpos + KEY_WIDTH*gtCurrentItem.col - 9 + WINDOW_X_POS
	--local yPos = KEYPAD_WINDOW_Y_POS+KEY_HEIGHT*gtCurrentItem.row-3 + WINDOW_Y_POS
	nRowCount = table.getn(Keyboard)
	
	local xPos = Keyboard[gtCurrentItem.row].nStartXpos + (KEY_WIDTH+KEY_SPACE)*gtCurrentItem.col - 22
	local yPos = KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*gtCurrentItem.row - 22
	
	local imageToUse = 45035

	local strKey
	if(gShift == 1) then
		strKey = KeyboardShift[gtCurrentItem.row][gtCurrentItem.col]
	else
		strKey = Keyboard[gtCurrentItem.row][gtCurrentItem.col]
	end

	debugPrint('\n1')
	--Drawing Highlighted Key (MAG image and text)
	if(shade == 0) then
	debugPrint('\n2')
		if Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'BKSP' then
	debugPrint('\n3')
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0, 0, 96, 90, 64)
	debugPrint('\n4')
			--Graphics.DrawString( g_Mag_Attribute, g_Mag_Handle, 250, 20, 35, 28, "0x00c0c0c0", "0xFF222222", 0, ' <--')
			Graphics.DrawString( g_Mag_Attribute, g_Mag_Handle,  28, 35,250, 20, "0x00c0c0c0", "0xFF222222", 0,2, ' <--')
	debugPrint('\n5')
		elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'CAPS' then
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0, 0, 96, 90, 64)
			Graphics.DrawString( g_Mag_Attribute, g_Mag_Handle,  28, 35,250, 20, "0xFF222222", "0x00c0c0c0", 0,2, strKey)
	debugPrint('\n6')
		elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'Enter' then
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0, 0, 96, 90, 64)
			Graphics.DrawString(g_Mag_Attribute, g_Mag_Handle,  28, 35,250, 20, "0xFF222222", "0x00c0c0c0", 0,2, strKey)
			xPos = xPos + 2*(KEY_WIDTH+KEY_SPACE)
	debugPrint('\n7')
		elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'SPACE' then
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0, 0, 240, 90, 64)
			Graphics.DrawString(g_Mag_Attribute, g_Mag_Handle, 95, 35,250, 20, "0xFF222222", "0x00c0c0c0", 0,2, strKey)
			xPos = xPos - 17
	debugPrint('\n8')
		elseif (nRowCount == gtCurrentItem.row and gtCurrentItem.col >= 5) then --Last Row
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0, 0, 96, 90, 64)
			Graphics.DrawString(g_Mag_Attribute, g_Mag_Handle,  42, 35,250, 20, "0xFF222222", "0x00c0c0c0", 0,2, strKey)
			xPos = xPos + 2*(KEY_WIDTH+KEY_SPACE)
	debugPrint('\n9')
		else
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0, 0, 96, 90, 64)
			Graphics.DrawString(g_Mag_Attribute, g_Mag_Handle,42, 35,250, 20, "0xFF222222", "0x00c0c0c0", 0,2, strKey)
	debugPrint('\n10')
		end
	else
		KEYPRESS_SIZE = 10
		if Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'BKSP' then
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0+KEYPRESS_SIZE, 0+KEYPRESS_SIZE, 96-(KEYPRESS_SIZE*2), 90-(KEYPRESS_SIZE*2), 64)
			--Graphics.DrawString(g_Mag_Attribute, g_Mag_Handle, 42, 35,250, 20, "0x00c0c0c0", "0xFF222222", 0, strKey,2)
		elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'CAPS' then
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0+KEYPRESS_SIZE, 0+KEYPRESS_SIZE, 96-(KEYPRESS_SIZE*2), 90-(KEYPRESS_SIZE*2), 64)
			--Graphics.DrawString( g_Mag_Attribute, g_Mag_Handle, 28, 35,250, 20, "0x00c0c0c0", "0xFFFF2222", 0, strKey,2)
		elseif Keyboard[gtCurrentItem.row][gtCurrentItem.col] == 'SPACE' then
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0+KEYPRESS_SIZE, 0+KEYPRESS_SIZE, 240-(KEYPRESS_SIZE*2), 90-(KEYPRESS_SIZE*2), 64)
			--Graphics.DrawString(g_Mag_Attribute, g_Mag_Handle, 50, 35,250, 20, "0x00c0c0c0", "0xFFFF2222", 0, strKey,2)
			xPos = xPos - 17
		elseif (nRowCount == gtCurrentItem.row and gtCurrentItem.col >= 5) then --Last Row
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0+KEYPRESS_SIZE, 0+KEYPRESS_SIZE, 96-(KEYPRESS_SIZE*2), 90-(KEYPRESS_SIZE*2), 64)
			xPos = xPos + 2*(KEY_WIDTH+KEY_SPACE)
		else
			Graphics.DrawImageExByID(g_Mag_Attribute, g_Mag_Handle, imageToUse, 0+KEYPRESS_SIZE, 0+KEYPRESS_SIZE, 96-(KEYPRESS_SIZE*2), 90-(KEYPRESS_SIZE*2), 64)
			--Graphics.DrawString( g_Mag_Attribute, g_Mag_Handle, 42, 35,250, 20, "0x00c0c0c0", "0xFFFF2222", 0, strKey,2)
		end
	end
	debugPrint('\n11')
	
	nErr = Graphics.SetWindowPosition(g_Mag_Handle, xPos, yPos)
	debugPrint('\n12')
	
end

function Drawkeys()
	debugPrint('\nInside DrawKeys')
	nRowCount = table.getn(Keyboard)
	nCount = table.getn(Keyboard)
	for i = 1,nCount do
		nCount2 = table.getn(Keyboard[i])
		for j = 1,nCount2 do

			--Drawing KEY Background Image
			if(Keyboard[i][j] == 'BKSP') then
				Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  51, 44, 64)
				Graphics.DrawString( g_Window_Attribute, g_Window_Handle,  Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+5, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8,50, 20, "0x00c0c0c0", "0xFF9999FF", 0,2, ' <--')
				--Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 12488, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+10 , KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+10 ,  16, 20, 64)
				--Graphics.DrawString( g_Window_Attribute, g_Window_Handle, 50, 20, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+6, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+5, "0x00c0c0c0", "0xFFCCCCCC", 0,2, '   --')
			elseif(Keyboard[i][j] == 'CAPS') then
				Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  51, 44, 64)
				Graphics.DrawString( g_Window_Attribute, g_Window_Handle, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+5, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8, 50, 20,"0x00c0c0c0", "0xFF9999FF", 0,2, KeyboardShift[i][j])
			elseif(Keyboard[i][j] == 'Enter') then
				Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*(j+2) ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  51, 44, 64)
				Graphics.DrawString( g_Window_Attribute, g_Window_Handle,  Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*(j+2)+3,  KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8, 50, 20,"0x00c0c0c0", "0xFF9999FF", 0,2, KeyboardShift[i][j])
			elseif(Keyboard[i][j] == 'SPACE') then
				--Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  51+150, 44, 64)
				Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45034, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j + 0 ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  30, 44, 64)				
				Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45032, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j + 30,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  95, 44, 64)				
				Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45033, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j + 125 ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  30, 44, 64)				
				Graphics.DrawString( g_Window_Attribute, g_Window_Handle, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+55, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8,  100, 20, "0x00c0c0c0", "0xFF9999FF", 0,2, Keyboard[i][j])
			else
				if(i == nRowCount and j >= 5) then --Last Row
					Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*(j+2) ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  51, 44, 64)

					--Drawing KEY text
					if(gShift == 1) then
						Graphics.DrawString( g_Window_Attribute, g_Window_Handle,  Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*(j+2)+20,  KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8,50, 20, "0x00c0c0c0", "0xFFCCCCCC", 2,2, KeyboardShift[i][j])
					else
						Graphics.DrawString( g_Window_Attribute, g_Window_Handle,  Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*(j+2)+20, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8, 50, 20,"0x00c0c0c0", "0xFFCCCCCC", 2,2, Keyboard[i][j])
					end					
				else
					Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i ,  51, 44, 64)

					--Drawing KEY text
					if(gShift == 1) then
						Graphics.DrawString( g_Window_Attribute, g_Window_Handle, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+20, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8,  50, 20, "0x00c0c0c0", "0xFFCCCCCC", 2,2, KeyboardShift[i][j])
					else
						Graphics.DrawString( g_Window_Attribute, g_Window_Handle, Keyboard[i].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+20,  KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*i+8, 50, 20, "0x00c0c0c0", "0xFFCCCCCC", 2,2, Keyboard[i][j])
					end
				end
			end
			
		end
	end
	
	--[[
	nCount2 = table.getn(Keyboard[nRowCount]) -- Last Row
	for j = 1,nCount2 do
		if Keyboard[gtCurrentItem.row][gtCurrentItem.col] ~= 'SPACE' then
			--Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 12105, Keyboard[nRowCount].nStartXpos + KEY_WIDTH*j - 9,KEYPAD_WINDOW_Y_POS+KEY_HEIGHT*nRowCount - 3,  150, 32, 64)
			Graphics.DrawImageExByID(g_Window_Attribute, g_Window_Handle, 45037, Keyboard[nRowCount].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j ,KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*nRowCount ,  51+150, 44, 64)
		end
		--Graphics.DrawString( g_Window_Attribute, g_Window_Handle,   50 + Keyboard[5].nStartXpos + KEY_WIDTH*j,KEYPAD_WINDOW_Y_POS+KEY_HEIGHT*5, 50, 20,"0x00c0c0c0", "0xFF888888", 1, Keyboard[5][j])
		Graphics.DrawString( g_Window_Attribute, g_Window_Handle, Keyboard[nRowCount].nStartXpos + (KEY_WIDTH+KEY_SPACE)*j+75, KEYPAD_WINDOW_Y_POS+(KEY_HEIGHT+KEY_SPACE)*nRowCount+8,   100, 20, "0x00c0c0c0", "0xFFCCCCCC", 0,2, Keyboard[nRowCount][j])
	end
	]]--
end