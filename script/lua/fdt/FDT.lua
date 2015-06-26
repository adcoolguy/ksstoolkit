--[
--	This function offset the x and y based on the parent handle. It also resize the width and height
--  based on the parent (optional).
--	If the parent does not exist, FDT recognize the handle by saving it to a buffer.
--]
function handleParent(iLayerNumber, iAttributeID, lParentHandle, iX, iY, iWidth, iHeight)
	found = false
	if(lParentHandle ~= nil) then
		for key,value in pairs(anyWindow) do
			--print(key..": "..tostring(value))
			if(value.name == lParentHandle) then
				print("found "..lParentHandle.." "..value.name)
				found = true
				iX = iX + value.x
				iY = iY + value.y
				w = value.width
				h = value.height
			end
		end
		if(not found) then
			parentTable = {}
			parentTable["name"] = lParentHandle
			parentTable["x"] = iX
			parentTable["y"] = iY
			parentTable["width"] = iWidth
			parentTable["height"] = iHeight
			table.insert(anyWindow, parentTable)
			w = iWidth
			h = iHeight
		end
		print('Graphics.CreateWindow() coordinates x='..iX..' y='..iY..' width='..iWidth..' height='..iHeight)
	end
	
	return iX, iY, w, h
end

--[
--	This function uses the x and y based of the parent handle. It also resize the width and height
--  based on the parent window.
--]
function fitParent(iLayerNumber, iAttributeID, lParentHandle, iX, iY, iWidth, iHeight)
	if(lParentHandle ~= nil) then
		for key,value in pairs(anyWindow) do
			--print(key..": "..tostring(value))
			if(value.name == lParentHandle) then
				print("found "..lParentHandle.." "..value.name)
				iX = value.x
				iY = value.y
				iWidth = value.width
				iHeight = value.height
			end
		end
	end
	
	print(iX..' '..iY..' '..iWidth..' '..iHeight)
	return iX, iY, iWidth, iHeight
end

function getWindow(iWinID)
	iX=-1
	iY=-1
	iWidth=-1
	iHeight=-1
	if(iWinID ~= nil) then
		for key,value in pairs(anyWindow) do
			--print(key..": "..tostring(value))
			if(value.name == iWinID) then
				print("found "..iWinID.." "..value.name)
				iX = value.x
				iY = value.y
				iWidth = value.width
				iHeight = value.height
			end
		end
	end
	
	print(iX..' '..iY..' '..iWidth..' '..iHeight)
	return iX, iY, iWidth, iHeight
end

function getWindowCount()
	count = 0
	for key,value in pairs(anyWindow) do
		count = count + 1
	end
	
	return count
end