function onCreate()
    addLuaScript('SimpleModchartTemplate')
	doTweenAlpha('healthy', 'healthBar', 0.25, 0.01)
	doTweenAlpha('healthrghy', 'iconP1', 0.25, 0.01)
	doTweenAlpha('healthdfhfhy', 'iconP2', 0.25, 0.01)
end

local keyCount = 6
local thing = 0

function onBeatHit()
	if curStep == 0+1104 or curStep == 32+1104 or curStep == 64+1104 or curStep == 96+1104 or curStep == 0+256+1104 or curStep == 32+256+1104 or curStep == 64+256+1104 or curStep == 96+256+1104 then
		doTweenX('bars', 'strumOffset0', -250+320, 1.2, 'cubeOut')
		doTweenX('bars1', 'strumOffset1', -125+320, 1.2, 'cubeOut')
		doTweenX('bars4', 'strumOffset4', 125+320, 1.2, 'cubeOut')
		doTweenX('bars2', 'strumOffset2', -30+320, 1.2, 'cubeOut')
		doTweenX('bars3', 'strumOffset3', 30+320, 1.2, 'cubeOut')
		doTweenX('bars5', 'strumOffset5', 250+320, 1.2, 'cubeOut')
		doTweenY('bro', 'tipsy', -1, stepCrochet/1000, 'cubeInOut')
		noteTweenAlpha('freak', 6, 0, 1)
		noteTweenAlpha('freak1', 7, 0, 1)
		noteTweenAlpha('freak2', 8, 0, 1)
		noteTweenAlpha('freak3', 9, 0, 1)
		noteTweenAlpha('freak4', 10, 0, 1)
		noteTweenAlpha('freak5', 11, 0, 1)
		doTweenY('ballin', 'BALLS', 1, 0.25, 'cubeInOut')
	end
	if curStep == 16+1104 or curStep == 48+1104 or curStep == 80+1104 or curStep == 112+1104 or curStep == 16+256+1104 or curStep == 48+256+1104 or curStep == 80+256+1104 or curStep == 112+256+1104 then
		for i = 0,(keyCount*2)-1 do
			doTweenX(i..'x', 'strumOffset'..i, 320, 1.2, 'cubeIn')
		end
	end
	if curStep == 128+1104 or curStep == 128+256+1104 then
		doTweenX('barssss', 'strumOffset0', -600+320, 1.8)
		doTweenX('barsss1', 'strumOffset1', -300+320, 1.8)
		doTweenX('barsss4', 'strumOffset4', 300+320, 1.8)
		doTweenX('barsss2', 'strumOffset2', -60+320, 1.8)
		doTweenX('barsss3', 'strumOffset3', 60+320, 1.8)
		doTweenX('barsss5', 'strumOffset5', 600+320, 1.8)
		noteTweenAlpha('treenissssssssssss', 5, 0, 0.8)
		noteTweenAlpha('treenissssssssssss1', 4, 0, 0.8)
		noteTweenAlpha('treenissssssssssss2', 3, 0, 0.8)
		noteTweenAlpha('treenissssssssssss3', 2, 0, 0.8)
		noteTweenAlpha('treenisssssssssss54s', 1, 0, 0.8)
		noteTweenAlpha('treenisssssssssss5s', 0, 0, 0.8)
	end
	if curStep == 128+256+1104 then
		doTweenY('movie', 'strumOffset0', 1000, 1.8)
		doTweenY('movi5555e', 'strumOffset1', 1000, 1.8)
		doTweenY('movie457', 'strumOffset4', 1000, 1.8)
		doTweenY('movie234234', 'strumOffset2', 1000, 1.8)
		doTweenY('movie345354', 'strumOffset3', 1000, 1.8)
		doTweenY('movie24234', 'strumOffset5', 1000, 1.8)
	end
	if curStep == 256+1104 then
		noteTweenAlpha('treenissssssssssssb', 6, 0, 1.8)
		noteTweenAlpha('treenissssssssssssb1', 7, 0, 1.8)
		noteTweenAlpha('treenissssssssssssb2', 8, 0, 1.8)
		noteTweenAlpha('treenissssssssssss3', 9, 0, 1.8)
		noteTweenAlpha('treenisssssssssss5b4s', 10, 0, 1.8)
		noteTweenAlpha('treenisssssssssss5bs', 11, 0, 1.8)
		noteTweenAlpha('treenissssssssssssbbfgb', 5, 1, 0.2)
		noteTweenAlpha('treenissssssssssssbbgfb1', 4, 1, 0.2)
		noteTweenAlpha('treenisssssssssssbgb2vv', 3, 1, 0.2)
		noteTweenAlpha('treenisssssssssssfbfgbs3', 2, 1, 0.2)
		noteTweenAlpha('treenisssssssssssvbvb54s', 1, 1, 0.2)
		noteTweenAlpha('treenisssssssssssvv5s', 0, 0, 0.2)
	end
	if curStep == 116+1104 or curStep == 116+256+1104 then
		doTweenY('the tips', 'tipsy', 0, 0.25, 'cubeInOut')
		noteTweenAlpha('freakr', 6, 1, 0.2)
		noteTweenAlpha('freakr1', 7, 1, 0.2)
		noteTweenAlpha('freakr2', 8, 1, 0.2)
		noteTweenAlpha('freakr3', 9, 1, 0.2)
		noteTweenAlpha('freakr4', 10, 1, 0.2)
		noteTweenAlpha('freakr5', 11, 1, 0.2)
		for i = 6,(keyCount*2)-1 do
			doTweenX(i..'x', 'strumOffset'..i, -320, 0.75, 'cubeInOut')
		end
	end
	if curStep >= 0+1104 and curStep < 512+1104 then
		if curStep % 16 == 8 then
			setProperty('camHUD.angle', 1) 
			doTweenAngle('cammy', 'camHUD', 0, 1, 'cubeInOut')
			if (curStep >= 0+1104 and curStep < 120+1104) or (curStep >= 256+1104 and curStep < 120+256+1104) then
				noteTweenAlpha('treeniafsf', 0, 0, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf1', 1, 0, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf2', 2, 0, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf3', 3, 0, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf4s', 4, 0, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsfs5', 5, 0, 1, 'cubeInOut')
			end
		end
		if curStep % 16 == 0 then
			setProperty('camHUD.angle', -1) 
			doTweenAngle('cammy', 'camHUD', 0, 1, 'cubeInOut')
			if (curStep < 120+1104) or (curStep >= 256+1104 and curStep < 512+1104) then
				noteTweenAlpha('treeniafsf', 0, 1, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf1', 1, 1, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf2', 2, 1, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf3', 3, 1, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsf4s', 4, 1, 1, 'cubeInOut')
				noteTweenAlpha('treeniafsfs5', 5, 1, 1, 'cubeInOut')
			end
		end
	end
	if curStep == 1632 then
		triggerEvent('resetX', '0.5', 'cubeInOut')
		triggerEvent('resetY', '0.5', 'cubeInOut')
	end
end