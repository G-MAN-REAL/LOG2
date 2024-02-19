function onCreate()
end

--1664
local animations = {{'singUP', 0, -50}, {'singLEFT', -50, 0}, {'singDOWN', 0, 50}, {'singRIGHT', 50, 0}, {'idle', 0, 0}}

function onBeatHit() 
		if curBeat == 164 and getProperty('camHUD.alpha') == 1 then 
			doTweenAlpha('in', 'camHUD', 0, 1);
		else if curBeat == 180 and getProperty('camHUD.alpha') ~= 1 then 
			doTweenAlpha('out', 'camHUD', 1, 1);
		end
	end
end
function onUpdate(elapsed)
	local character = 'dad'
	if mustHitSection then
		character = 'boyfriend'
	end
	for i = 1,5 do
	 	if (string.find(string.lower(getProperty(character..'.animation.curAnim.name')), animations[i][1])) then
	 		cameraForceTarget(character)
	 		setProperty('camFollow.x', getProperty('camFollow.x') + animations[i][2])
	 		setProperty('camFollow.y', getProperty('camFollow.y') + animations[i][3])
	 	end
	end
end