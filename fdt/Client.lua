function DeepCopy(t)
    if type(t) ~= 'table' then return t end
    local mt = getmetatable(t)
    local res = {}
    for k,v in pairs(t) do
        if type(v) == 'table' then
            v = Deepcopy(v)
        end
        res[k] = v
    end
    setmetatable(res,mt)
    return res
end

function GetLastIndex(t)
	i = 1
	while (t ~= nil and t[i] ~= nil) do
		i = i + 1
	end
	return i
end

function Trim(s)
	retVal = s

	if(s ~= nil) then
      retVal = string.gsub(s, "^%s*(.-)%s*$", "%1")
    end
    
    return retVal
end

function SafeString(s)
	retVal = ''

	if(s ~= nil) then
      retVal = s
    end
    
    return retVal
end

function DoNothing()
end

DummyProxy = {
	OnKey = DoNothing,
	OnLoad = DoNothing,
	OnText = DoNothing,
	GetText = DoNothing,
	SetText = DoNothing,
	GetLastScene = DoNothing,
	OnUnLoad = DoNothing,
	Show = DoNothing,
	Hide = DoNothing
}
function DummyProxy.Create()
	local self = DeepCopy(DummyProxy)
	return self
end

function InitComponents()
	FDTObserver = {}
end

function LoadComponent(c)
	dofile(c)
end

function Component(s)
	retVal = nil
	
	if(FDTObserver[s] ~= nil) then
		retVal = FDTObserver[s]
	else
		retVal = DummyProxy.Create()
	end	

	return retVal
end

function Rect(x,y,w,h,color,windowHandle)
	--Full BG
	--debugPrint('DrawFullBackground enter x= '..x..' ; y='..y)
	--Draw Line 1
	Graphics.DrawLine(windowHandle,x,y,w,0,color)
	--Graphics.UpdateDisplay()
	
	--Draw Line 2 
	Graphics.DrawLine(windowHandle,x,y,h,1,color)
	--Graphics.UpdateDisplay()
	
	--Draw Line 3
	Graphics.DrawLine(windowHandle,x,y+h,w,0,color)
	--Graphics.UpdateDisplay()
	
	--Draw Line 4
	Graphics.DrawLine(windowHandle,x+w,y,h,1,color)
	--Graphics.UpdateDisplay()
end

function Line(x1,y1,x2,y2,color,windowHandle)
	--Graphics.DrawLine(windowHandle,0,0,10,0,"0xFF33CC33")
	Graphics.DrawLine(windowHandle,x1,y1,x2,y2,color)
end

function Text(vX, vY, windowAttribute, vW, vH, value, windowHandle)
	Graphics.DrawString(windowAttribute, windowHandle,  vX, vY,vW, vH, "0x00C82536", "0xFF33CC33", 5,2, value)
end

function Circle(x,y,r,color)
	--http://code.google.com/p/divranspack/source/browse/trunk/+divranspack/EGP+v3+beta/lua/entities/gmod_wire_egp/lib/objects/circle.lua?r=423
	--TBD
end