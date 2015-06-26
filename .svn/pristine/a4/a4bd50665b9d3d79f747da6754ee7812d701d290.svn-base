--providing the Java implementation
javaNetwork = luajava.bindClass("com.google.code.kss.adapter.fios.api.Network")

--providing LUA implementation
NetworkClass = {
--	javaFlag = false
	javaFlag = true
}
networkmetatable = {__index = NetworkClass}
function NetworkClass.new (parameter)
	local self = {value = parameter}
	setmetatable(self, networkmetatable)
	return self
end

function NetworkClass.SetJava(j)
	javaFlag = j
	print('Network.SetJava(' .. tostring(javaFlag) .. ')')
end

function NetworkClass.HTTPPost(pHTTPURL, szPostData, nPostDataSize, szContentType)
	print('Network.HTTPPost()')
end


Network = NetworkClass.new("lua.Network")
