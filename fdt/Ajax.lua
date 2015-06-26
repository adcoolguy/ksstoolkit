function lua_onInit(nAppId, strParam)
end

function lua_onLoad()

Util.DebugPrint('ajax :)')

nErr, lRequestID = Network. HTTPGetAsync('http://cloudserviceapi.appspot.com/url?target=weather&value=20170',true)

Util.DebugPrint(nErr..'< waiting on '..lRequestID..' for 5s ...')

Err1 = Util.Sleep(5000)

Err2, Data, Datalen = Network.GetAsyncData (lRequestID)

Util.DebugPrint(Err2..'<response = '..tostring(Data))

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



function lua_onKey(nKeyCode, nKeyType, nKeyState)
    return HG_ERR_NONE
end

