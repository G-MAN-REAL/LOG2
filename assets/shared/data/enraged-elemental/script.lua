function onCreate()
    addLuaScript('enragedModchart')
	cameraFlash('', "0xFF000000", 2)
end

--1664

local keyCount = 9
local thing = 0
function onCreatePost()
	setProperty('blackscreen.alpha', 1)
	doTweenAlpha('black', 'blackscreen', 0, 3.9)
end

function onStepHit()
	if curStep == 24 + 1664 then
		for i = 0,(keyCount - 1) do
			noteTweenAlpha('tweenGaryOut'..i, i, 0, 0.5, 'cubeInOut')
		end
		noteTweenAlpha('tweenBFOut1', 9, 0, 0.5, 'cubeInOut')
		noteTweenAlpha('tweenBFOut2', 10, 0, 0.5, 'cubeInOut')
		noteTweenAlpha('tweenBFOut3', 13, 0, 0.5, 'cubeInOut')
		noteTweenAlpha('tweenBFOut4', 16, 0, 0.5, 'cubeInOut')
		noteTweenAlpha('tweenBFOut5', 17, 0, 0.5, 'cubeInOut')
		doTweenX('moveBFNotes1', 'strumOffset11', -30, 0.5, 'cubeInOut')
		doTweenX('moveBFNotes2', 'strumOffset12', 10, 0.5, 'cubeInOut')
		doTweenX('moveBFNotes3', 'strumOffset15', 30, 0.5, 'cubeInOut')
		doTweenX('moveBFNotes4', 'strumOffset14', -10, 0.5, 'cubeInOut')
		doTweenAngle('BFRotate1', 'confusion11', -90, 0.5, 'cubeInOut')
		doTweenAngle('BFRotate2', 'confusion12', 90, 0.5, 'cubeInOut')
		doTweenAngle('BFRotate3', 'confusion15', -90, 0.5, 'cubeInOut')
		doTweenAngle('BFRotate4', 'confusion14', 90, 0.5, 'cubeInOut')
		doTweenX('BFScale1', 'scale', 0.7, 0.5, 'cubeInOut')
		doTweenY('BFScale2', 'scale', 0.7, 0.5, 'cubeInOut')
		setProperty('healthGain', 0.25)
	end

	if curStep == 276 + 1664 then
		for i = 0,(keyCount * 2 - 1) do
			noteTweenAlpha('tweenAllIn'..i, i, 1, 0.5, 'cubeInOut')
			doTweenAngle('rotateBack'..i, 'confusion'..i, 0, 0.5, 'cubeInOut')
		end
		triggerEvent('resetX', '0.5', 'cubeInOut')
		doTweenX('BFScaleBack1', 'scale', 0.5, 0.5, 'cubeInOut')
		doTweenY('BFScaleBack2', 'scale', 0.5, 0.5, 'cubeInOut')
		setProperty('healthGain', 2.0);
	end
end