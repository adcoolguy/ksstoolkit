dofile('Client.lua')
InitComponents()
dofile('List.lua')
dofile('ScrollerBall.lua')
--dofile('Login.lua')

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
profile_ID = ''
passcode = ''
isprofile = 0
ispasscode = 0
iscalsuccess = 0

--real options window variables

isoptions = 0
realoptions_Attribute = 0
realoptions_Handle = 0
timer_type = "0x01"



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
        print('   Argument 2:' .. strParam)
    else
        print('   Argument 2: Empty String' )
    end  
    Err = Graphics.InitWindowAttributes() 

    return HG_ERR_NONE
end

function lua_onLoad()

	--Util.ShowSplashWindow("Please wait ...")

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
	local Err,ret
	Err, TimerTD = Timer.Create(1,50,0)
	--debugPrint('TimerID '..TimerTD)

end
function continue_Loading()

	Graphics.ClearWindow(main_Window_Handle)
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
neighborhood_Handle = maps_Handle
--options_Handle = maps_Handle

	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30001, 0, 0, 64)
	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30002, 0, 26, 64)
	nErr = Graphics.DrawImageByID(main_Window_Attribute, main_Window_Handle, 30006, 352, 26, 64)
	DrawCalendar()


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
	if(iscalsuccess == 0) then
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30023, 7, 49, 64)
	nErr = Graphics.DrawImageByID(options_Attribute, options_Handle, 30020, 0, 0, 64)
	end
	Graphics.UpdateDisplay()
end

function Drawpasscode()
	debugPrint(" Inside passcode ")
	debugPrint(profile_ID)
	isCalendar = 1
	DrawNavbar(navbar_move_left1)
	Graphics.ClearWindow( zipcode_Handle )
	Graphics.UpdateDisplay()
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30007, 0, 0, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30004, 0, 0, 64)
	nErr = Graphics.DrawImageByID(calendar_Attribute, calendar_Handle, 30024, 7, 49, 64)
	nErr = Graphics.DrawImageByID(options_Attribute, options_Handle, 30020, 0, 0, 64)
	Graphics.UpdateDisplay()
end
function calendar_authenticate()
	debugPrint(" Inside calendar authenticate ")
	Err,Stime = Timer.GetTime()
	local data1='time='..tostring(Stime)
	local length = string.len(data1)
	urlcal = "http://cloudserviceapi.appspot.com/sci/authenticate?profileid="..profile_ID.."&passcode="..passcode
	debugPrint(urlcal)
	nResp, bData = Network.HTTPPost(urlcal, data1,length,'application/x-www-form-urlencoded')
	debugPrint(nResp)
	debugPrint(bData)
	if bData == "ok" then
	iscalsuccess = 1
	getCalendar()
	end
	if bData == "sorry" then
	isprofile = 0
	ispasscode = 0
	isoptions = 0
	passcode = ''
	profile_ID = ''
	Graphics.ClearWindow( zipcode_Handle )
	Graphics.ClearWindow( options_Handle )
	Graphics.DrawString(options_Attribute, options_Handle,  20,5,200,100, "0xFFFFFFFF", "0xFFFFFFFF", 5,1, "INCORRECT PROFILEID OR PASSCODE")
	Graphics.UpdateDisplay()
	nErr,CALENDAR_TIMER_ID = Timer.Create(1,500,0)
	end
	return
end

function getCalendar()
isCalendar = 1
	debugPrint("authenticated")
	local Data = 0
	local DalaLen = 0
	local ErrMsg = ''

	Err,Stime = Timer.GetTime()
	local data1='time='..tostring(Stime)
	local length = string.len(data1)

	debugPrint("before calling google calendar servlet ...")

--http://cloudserviceapi.appspot.com/sci/CalendarEventServletII
--	nResp, myTable = Network.HTTPPost('http://localhost:8080/CalendarWebProject/CalendarEventServletII', data1,length,'text/plain;charset=UTF-8')
	urlcal1 = "http://cloudserviceapi.appspot.com/sci/ce?profileid="..profile_ID.."&passcode="..passcode
	debugPrint(urlcal1)
	nResp, myTable = Network.HTTPPost(urlcal1, data1,length,'text/plain;charset=UTF-8')
	--nResp, myTable = Network.HTTPGET(urlcal1)


--	nResp, myTable = Network.HTTPPost('http://cloudserviceapi.appspot.com:8888/sci/CalendarEventServletII', data1,length,'text/plain;charset=UTF-8')
--	nResp, len, myTable = Network.HTTPGetFile('http://localhost:8888/sci/CalendarEventServletII')
--	nResp, len, myTable = Network.HTTPGetFile('http://cloudserviceapi.appspot.com/sci/CalendarEventServletII')

	debugPrint("calling google calendar servlet done.")



--	Component("List").GetText = {'jt1','jt2','jt3','jt4','jt5','jt6','jt7'}
--	debugPrint("table = "..myTable)
Graphics.ClearWindow( options_Handle )
Graphics.UpdateDisplay()
s = myTable
debugPrint(s)
local k = 0
k = string.find(s, "empty")
if(k == 1) then
isprofile = 0
	ispasscode = 0
	isoptions = 0
	passcode = ''
	profile_ID = ''
	Graphics.ClearWindow( zipcode_Handle )
	Graphics.ClearWindow( options_Handle )
	Graphics.DrawString(options_Attribute, options_Handle,  55,5,200,100, "0xFFFFFFFF", "0xFFFFFFFF", 5,1, "NO EVENT INFORMATION")
	Graphics.DrawString(options_Attribute, options_Handle,  60,20,200,100, "0xFFFFFFFF", "0xFFFFFFFF", 5,1, "COULD BE RETRIEVED")
	Graphics.UpdateDisplay()
	nErr,CALENDAR_TIMER_ID = Timer.Create(1,500,0)
return
end
Component("List").OnLoad()
Graphics.UpdateDisplay()
Component("ScrollerBall").OnLoad()
Graphics.UpdateDisplay()
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
		textList = Component("List").GetText()
		textList[i] = temp
	end
	begin = t[i]
end
	debugPrint("after second loop.")
	--debugPrint(g_FDT_ListText10584[1])
	--debugPrint(g_FDT_ListText10584[2])
	--debugPrint(g_FDT_ListText10584[3])
	--debugPrint(g_FDT_ListText10584[4])

	Component("List").OnText()
	
	debugPrint('******** b4 table print')
	debugPrint('size of table '..GetLastIndex(Component("List").GetText())-1)
	debugPrint('******** aftr table print')

	if(myTable ~= nil) then
	Component("ScrollerBall").SetText(myTable)
	Component("ScrollerBall").OnText()
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
    --debugPrint('Argument 1:' .. tostring(nTimerID))
    --debugPrint('Argument 2:' .. tostring(nData))
    --debugPrint('Argument 3:' .. tostring(strData))

    debugPrint('\n*****TO TEST ONE TIME TIMER*****\n'..nTimerID)
	if (nTimerID == TimerTD) then
	continue_Loading()
	TimerTD = 0
	end
	if (nTimerID == CALENDAR_TIMER_ID) then
	--Graphics.ClearWindow( options_Handle )
	--Graphics.UpdateDisplay()
	DrawCalendar()
	end
    	--Err1 = hg_deleteTimer(TimerID)
	Err1 = Timer.Delete(nTimerID)
	debugPrint('Err '..Err1)


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


	--Component("List").Hide()	--refresh bug fix
	if( isCalendar == 1) then
		--if(nKeyCode == KEY_LEFT or nKeyCode == KEY_UP or nKeyCode == KEY_DOWN) then
		--	Component("List").Show()
		--	Component("List").OnKey(nKeyCode, nKeyType, nKeyState)
		--	Component("ScrollerBall").Show()
		--	Component("ScrollerBall").OnKey(nKeyCode, nKeyType, nKeyState)
		--end
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
	if( nKeyCode == KEY_OK and isprofile == 0 ) then
		isprofile = 1
		Drawpasscode()
		return
	end
	if( nKeyCode == KEY_OK and isprofile == 1) then
		if ispasscode == 0 then
		debugPrint(passcode)
		ispasscode = 1
		calendar_authenticate()
		return
		end
	end
	if isprofile == 1 then
	if nKeyCode == 1 and ispasscode == 0 then
			passcode = passcode..'1'
			elseif nKeyCode == 2 and ispasscode == 0 then
			passcode = passcode..'2'
			elseif nKeyCode == 3 and ispasscode == 0 then
			passcode = passcode..'3'
			elseif nKeyCode == 4 and ispasscode == 0 then
			passcode = passcode..'4'
			elseif nKeyCode == 5 and ispasscode == 0 then
			passcode = passcode..'5'
			elseif nKeyCode == 6 and ispasscode == 0 then
			passcode = passcode..'6'
			elseif nKeyCode == 7 and ispasscode == 0 then
			passcode = passcode..'7'
			elseif nKeyCode == 8 and ispasscode == 0 then
			passcode = passcode..'8'
			elseif nKeyCode == 9 and ispasscode == 0 then
			passcode = passcode..'9'
			elseif nKeyCode == 0 and ispasscode == 0 then
			passcode = passcode..'0'
			elseif nKeyCode == 40 and ispasscode == 0 then -- KEY_C
			length = string.len(passcode)
			if length > 1 then
			    passcode = string.sub(passcode,1,string.len(passcode)-1)
			elseif length == 1 then
			   passcode=''
			end
	end
	end
	if ispasscode == 0 and isprofile == 1 then
		if string.len(passcode) < 6 then
		Graphics.ClearWindow( zipcode_Handle )
		Graphics.UpdateDisplay()
		nErr = Graphics.DrawString(zipcode_Attribute, zipcode_Handle, 0, 0, 10, 10, "0x00550000", "0x00000000", 3,1, passcode)
		Graphics.UpdateDisplay()
		end
		end
	if nKeyCode == 1 and isprofile == 0 then
			profile_ID = profile_ID..'1'
			elseif nKeyCode == 2 and isprofile == 0 then
			profile_ID = profile_ID..'2'
			elseif nKeyCode == 3 and isprofile == 0 then
			profile_ID = profile_ID..'3'
			elseif nKeyCode == 4 and isprofile == 0 then
			profile_ID = profile_ID..'4'
			elseif nKeyCode == 5 and isprofile == 0 then
			profile_ID = profile_ID..'5'
			elseif nKeyCode == 6 and isprofile == 0 then
			profile_ID = profile_ID..'6'
			elseif nKeyCode == 7 and isprofile == 0 then
			profile_ID = profile_ID..'7'
			elseif nKeyCode == 8 and isprofile == 0 then
			profile_ID = profile_ID..'8'
			elseif nKeyCode == 9 and isprofile == 0 then
			profile_ID = profile_ID..'9'
			elseif nKeyCode == 0 and isprofile == 0 then
			profile_ID = profile_ID..'0'
			elseif nKeyCode == 40 and isprofile == 0 then -- KEY_C
			length = string.len(profile_ID)
			if length > 1 then
			    profile_ID = string.sub(profile_ID,1,string.len(profile_ID)-1)
			elseif length == 1 then
			   profile_ID=''
			end
	end
	if isprofile == 0 then
		if string.len(profile_ID) < 6 then
		Graphics.ClearWindow( zipcode_Handle )
		Graphics.UpdateDisplay()
		nErr = Graphics.DrawString(zipcode_Attribute, zipcode_Handle, 0, 0, 10, 10, "0x00550000", "0x00000000", 3,1, profile_ID)
		Graphics.UpdateDisplay()
		end
		end


	if( nKeyCode == KEY_RIGHT) then
		--Graphics.UpdateDisplay()
		Component("List").Hide()
		Component("ScrollerBall").Hide()
		Graphics.UpdateDisplay()
		Graphics.ClearWindow( calendar_Handle )
		Graphics.ClearWindow( options_Handle )
		Graphics.ClearWindow( navbar_Handle )
		Graphics.ClearWindow( realoptions_Handle )
		Graphics.ClearWindow( zipcode_Handle )
		isCalendar = 0
		isprofile = 0
		ispasscode = 0
		isoptions = 0
		passcode = ''
		profile_ID = ''
		debugPrint( " Pressed key right " )
		DrawMaps()
		return
	end

	if(nKeyCode == KEY_LEFT or nKeyCode == KEY_UP or nKeyCode == KEY_DOWN) then
		Component("List").OnKey(nKeyCode, nKeyType, nKeyState)
		Component("ScrollerBall").OnKey(nKeyCode, nKeyType, nKeyState)
		Component("List").Show()
		Component("ScrollerBall").Show()
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
			Component("List").Show()
			Component("ScrollerBall").Show()
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
