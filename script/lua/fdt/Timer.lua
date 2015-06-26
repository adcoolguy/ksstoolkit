--providing the Java implementation
javaTimer = luajava.bindClass("com.google.code.kss.adapter.fios.api.Timer")

--providing LUA implementation
TimerClass = {
--	javaFlag = false
	javaFlag = true
}
timermetatable = {__index = TimerClass}
function TimerClass.new (parameter)
	local self = {value = parameter}
	setmetatable(self, timermetatable)
	return self
end

function TimerClass.SetJava(j)
	javaFlag = j
	print('Timer.SetJava(' .. tostring(javaFlag) .. ')')
end

function TimerClass.Create(eTMType, nTicks, TimerData)
	print('Timer.Create()')
end

function TimerClass.Start(u32TimerID)
	print('Timer.Start()')
end

function TimerClass.Stop(u32TimerID)
	print('Timer.Stop()')
end

function TimerClass.GetTime()
	print('Timer.GetTime()')
end

Timer = TimerClass.new("lua.Timer")
