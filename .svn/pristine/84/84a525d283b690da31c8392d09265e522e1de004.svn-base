--providing the Java implementation
javaVOD = luajava.bindClass("com.google.code.kss.adapter.fios.api.VOD")

--providing LUA implementation
VODClass = {
--	javaFlag = false
	javaFlag = true
}
vodmetatable = {__index = VODClass}
function VODClass.new (parameter)
	local self = {value = parameter}
	setmetatable(self, vodmetatable)
	return self
end

function VODClass.SetJava(j)
	javaFlag = j
	print('VOD.SetJava(' .. tostring(javaFlag) .. ')')
end

function VODClass.PlayAssetByID(nContext, pPID, pPAID)
	print('VOD.PlayAssetByID()')
	--javaVOD:PlayAssetByID(nContext, pPID, pPAID)	--this method seems to fail for weird unknown reason!
end

iSwap = 0
function VODClass.DrawPoster(iAttributeID, iWinID, lAssetID, lHirarchyID, X_Position, Y_Position, Width, Height, alphaBlending)
	print('VOD.DrawPoster()')
	X_Position, Y_Position, Width, Height = fitParent(-1, -1, iWinID, X_Position, Y_Position, Width, Height)
	X_Position = X_Position + 8		--manual offset for now, seems like a bug for the HTML 5 video tag
	--Y_Position = Y_Position - 12	--manual offset for now, seems like a bug for the HTML 5 video tag
	Height = Height + .15*Height	--manual offset for now, seems like a bug for the HTML 5 video tag
	if(lAssetID ~= nil) then
		poster = "http://www.blogcdn.com/hd.engadget.com/media/2007/09/verizon_fios.jpg"
		--poster = ""
		print('VOD.DrawPoster ' ..lAssetID)
		if(iSwap ~= 0) then
			url = "http://video-js.s3.amazonaws.com/oceans-clip.mp4"
			iSwap = 0
		else
			url = "http://cdn.kaltura.org/apis/html5lib/kplayer-examples/media/bbb400p.ogv"
			iSwap = 1
		end
	end
	javaVOD:createVOD(poster, url, X_Position, Y_Position, Width, Height)
end

VOD = VODClass.new("lua.VOD")
