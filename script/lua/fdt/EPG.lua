--providing the Java implementation
javaEPG = luajava.bindClass("com.google.code.kss.adapter.fios.api.EPG")

--providing LUA implementation
EPGClass = {
--	javaFlag = false
	javaFlag = true
}
epgmetatable = {__index = EPGClass}
function EPGClass.new (parameter)
	local self = {value = parameter}
	setmetatable(self, epgmetatable)
	return self
end

function EPGClass.SetJava(j)
	javaFlag = j
	print('EPG.SetJava(' .. tostring(javaFlag) .. ')')
end

function EPGClass.GetTunedChannel()
	return HG_ERR_NONE, 35	--TBD
end

function EPGClass.GetProgramInfo(lCurrentTime, nChannelNum)
	--TBD just hard code for now since the real EPG does not work anyway in Iris
	pInfo = {}
	pInfo["ChNum"] = 'Channel Number'
	pInfo["ChName"] = 'Channel Name'
	pInfo["ProgName"] = 'Program Name'
	pInfo["ProgDesc"] = 'Program Description'
	pInfo["FiosID"] = 'Fios ID'
	pInfo["PCRating"] = 'Parental Control Rating'
	pInfo["Cast"] = 'Cast information'
	pInfo["EpisodeName"] = 'Episode Name'
	pInfo["Ch_Index"] = 'EPG Index'
	pInfo["Ch_Adult"] = ''
	pInfo["Ch_HD"] = 'High Definition'
	pInfo["Ch_ServiceID"] = 'EPG ServiceID'
	pInfo["Ch_BitMapID"] = 'EPG BitMapID'

	return HG_ERR_NONE, pInfo
end

function EPGClass.TuneToChannel()
end

function EPGClass.GetChannelLogo()
end

function EPGClass.GetVersion()
end

function EPGClass.GetProgramType()
end

function EPGClass.ShowProgramInfo()
end

function EPGClass.GetNextChannel()
end

EPG = EPGClass.new("lua.EPG")