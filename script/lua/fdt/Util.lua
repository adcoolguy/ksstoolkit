--providing the Java implementation
javaUtil = luajava.bindClass("com.google.code.kss.adapter.fios.api.Util")

--providing LUA implementation
UtilClass = {
--	javaFlag = false
	javaFlag = true
}
utilmetatable = {__index = UtilClass}
function UtilClass.new (parameter)
	local self = {value = parameter}
	setmetatable(self, utilmetatable)
	return self
end

function UtilClass.SetJava(j)
	javaFlag = j
	print('Util.SetJava(' .. tostring(javaFlag) .. ')')
end

function UtilClass.DebugPrint(msg)
	if(msg == nil) 
	then
  		msg = ''
	end
	
  	print('Util.DebugPrint(' .. tostring(msg) .. ') javaFlag ' .. tostring(javaFlag))
 	if(javaFlag ~= true) 
 	then
  		print(msg)
  	else
		javaUtil:DebugPrint(msg)
	end	
end

function UtilClass.ShowSplashWindow(s)

end

Util = UtilClass.new("lua.Util")
