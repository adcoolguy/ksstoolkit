--providing the Java implementation
javaGraphics = luajava.bindClass("com.google.code.kss.adapter.fios.api.Graphics")
HG_ERR_NONE = 0
HG_ERR_FAILED = -1
anyWindow = {}

--providing LUA implementation
GraphicsClass = {
	javaFlag = false
}
graphicsmetatable = {__index = GraphicsClass}
function GraphicsClass.new (parameter)
	local self = {value = parameter}
	setmetatable(self, graphicsmetatable)
	return self
end

function GraphicsClass.SetJava(j)
	javaFlag = j
	print('Util.SetJava(' .. tostring(javaFlag) .. ')')
end

function GraphicsClass.drawBackground()
	print('Graphics.drawBackground()')
	javaGraphics:drawBackground(0, 0, 1920, 1080) --draw the window 0
end

function GraphicsClass.InitWindowAttributes()
	print('Graphics.InitWindowAttributes()')
	javaGraphics:InitWindowAttributes();
	javaGraphics:initResolution(1920, 1080);	--HDTV
	print('javaGraphics:isUpdateDisplay ' .. tostring(javaGraphics:isUpdateDisplay()))
end

function GraphicsClass.CreateWindowAttrib()
	print('Graphics.CreateWindowAttrib()')
	
	return HG_ERR_NONE, -1
end

function d1()
print("iLayerNumber "..iLayerNumber)
print(iAttributeID)
print(lParentHandle)
print(iX)
print(iY)
print(iWidth)
print(iHeight)
end

function GraphicsClass.CreateWindow(iLayerNumber, iAttributeID, lParentHandle, iX, iY, iWidth, iHeight)
	print('Graphics.CreateWindow()')
	if(iLayerNumber ~= 2 and iLayerNumber < 3) then
		javaKSS:raiseError('Graphics.CreateWindow layer number can not be less than 3')
	end
	if(iAttributeID == nil) then
		iAttributeID = -1	--if nil, luajava will fail 	
	end
	
	iX, iY = handleParent(iLayerNumber, iAttributeID, lParentHandle, iX, iY, iWidth, iHeight)
	--TBD
	javaGraphics:CreateWindow(iLayerNumber, iAttributeID, lParentHandle, iX, iY, iWidth, iHeight)
	
	newWinID = getWindowCount() + 1
	--lParentHandle = newWinID
	
	return HG_ERR_NONE, lParentHandle
end

function GraphicsClass.ClearWindow(o)
	print('Graphics.ClearWindow(' .. tostring(o) .. ')')
end

function d2()
print("g_Window_Attribute "..g_Window_Attribute)
print(g_Window_Handle)
print(lImageID)
print(x)
print(y)
print(width)
print(height)
print(alphaBlending)
end

function GraphicsClass.DrawImageExByID(g_Window_Attribute, g_Window_Handle, lImageID, x, y, width, height, alphaBlending)
	print('Graphics.DrawImageExByID()')
	if(g_Window_Attribute == nil) then
		g_Window_Attribute = 1	--if nil, luajava will fail 	
	end
	--x, y = handleParent(g_Window_Handle, x, y)
	x, y = handleParent(-1, -1, g_Window_Handle, x, y, width, height)
	javaGraphics:CreateWindow(-1, g_Window_Attribute, g_Window_Handle, x, y, width, height)
end

function GraphicsClass.DrawImageByID(iAttributeID, iWinID, lImageID, x, y, alphaBlending)
	print('Graphics.DrawImageByID()')
	if(iAttributeID == nil) then
		iAttributeID = -1	--if nil, luajava will fail 	
	end
	x, y, parentWidth, parentHeight = handleParent(-1, -1, iWinID, x, y, -1, -1)
	javaGraphics:CreateWindow(-1, iAttributeID, -1, x, y, parentWidth*.7, 50)
end

function GraphicsClass.UpdateDisplay()
	print('Graphics.UpdateDisplay()')
	javaGraphics:setUpdateDisplay(true)
	javaGraphics:updateDisplay()
	--print('javaGraphics:isUpdateDisplay ' .. tostring(javaGraphics:isUpdateDisplay()))
	print('total window = '..getWindowCount())
end

function d3()
print(iAttributeID)
print(iWinID)
print(x)
print(y)
print(width)
print(height)
print(pFontColor)
print(pFontBgColor)
print(wFontCode)
print(dwFlags)
print(szText)
end

function GraphicsClass.DrawString(iAttributeID, iWinID, x, y, width, height, pFontColor, pFontBgColor, wFontCode, dwFlags, szText)
	print('Graphics.DrawString()')
	if(iAttributeID == nil) then
		iAttributeID = -1	--if nil, luajava will fail 	
	end
	if(iWinID == nil) then
		iWinID = -1	--if nil, luajava will fail 	
	end
	x, y = handleParent(-1, -1, iWinID, x, y, width, height)
	javaGraphics:DrawString(iAttributeID, iWinID, x, y, width, height, pFontColor, pFontBgColor, wFontCode, dwFlags, szText)
end

function GraphicsClass.SetWindowPosition(iWinID, x, y)
	if(iWinID == nil) then
		iWinID = -1	--if nil, luajava will fail 	
	end
print('iWinID '..iWinID)
print('x '..x)
print('y '..y)
	--TBD
--	x, y, w, h = getWindow(iWinID)
print('width '..w)
print('height '..h)	
--	javaGraphics:CreateWindow(-1, -1, -1, x, y, w, h)
end

function GraphicsClass.GetBitmapList(param1, param2)
end

function GraphicsClass.SetWindowVisibility(iWinID, bVisible)
end

Graphics = GraphicsClass.new("lua.Graphics")
