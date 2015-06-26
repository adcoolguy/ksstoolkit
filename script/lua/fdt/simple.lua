function lua_onInit(nAppId, strParam)
end
function lua_onLoad()
dummy,windowAttribute = Graphics.CreateWindowAttrib()
dummy,windowHandle = Graphics.CreateWindow(3, windowAttribute, 0, 0, 0, 704, 480)
Graphics.DrawString(windowAttribute, windowHandle, 64, 48, 344, 257, "0x00C82536", "0xFF33CC33", 5,2, 'Enter Pincode:')
Graphics.UpdateDisplay()
end
print('simple lua script done')