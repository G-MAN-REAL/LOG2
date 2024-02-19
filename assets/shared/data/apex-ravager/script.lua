function onCreate()
end

--1664

function onBeatHit() 
	if (difficulty == 1) then
		runBeatCheck(curBeat)
	end
	setProperty('gfBlock', ((curBeat >= 165 and curBeat) <= 312 or (curBeat >= 456 and curBeat <= 590)));
	if (curBeat) == 401 then 
		doTweenAlpha('twinner', 'blackPeople', 0.0, 1)
	end
	
end

function onUpdate(elapsed)
	if (getProperty('gfBlock')) then
		cameraShake('', 0.1, 0.01)
	end
end

function onMoveCamera(player)
	if (getProperty('gfBlock')) then
		setProperty('gf.idleSuffix', '-tree')
		if (player == 'dad') then
		setProperty('defaultCamZoom', 0.6)
		else
		setProperty('defaultCamZoom', 0.7)
		end
	else 
		setProperty('defaultCamZoom', 0.7)
	end
end