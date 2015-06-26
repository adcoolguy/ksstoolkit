function lua_onInit(nAppId, strParam)
end

function lua_onLoad()

Util.DebugPrint('loading svg2 ...')

url = "http://cloudserviceapi.appspot.com:8888/sci/php/lab/fioslua-svg.php"
--nErr, szData = Network.HTTPGet(url)
nErr, len, szData = Network.HTTPGetFile(url)
	local data1='time=dummy'
	local length = string.len(data1)
--nErr, szData = Network.HTTPPost(url, data1, length,'image/svg+xml')

Util.DebugPrint(nErr..'<response size '..len..' = '..tostring(szData))

Util.DebugPrint('svg2 done')

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

