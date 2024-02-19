function onCreate()
	makeAnimatedLuaSprite('mainBody', 'vom/Void_of_Malice_Phase_2_WendigoMainBody_withGirlfriend_Complete', -25, 300)
	addLuaSprite('mainBody')
	setProperty('mainBody.scale.x', 1.5)
	setProperty('mainBody.scale.y', 1.5)
	setProperty('mainBody.alpha', 0.001)
	setProperty('dad.idleSuffix', '-tired')

	addAnimationByPrefix('mainBody', 'loop', 'Wendigo_MainBody_Primary_Idle instance', 24, true)
	playAnim('mainBody', 'loop')
end

--1664
function onCreatePost()
	setProperty('blackscreen.alpha', 1)
	doTweenAlpha('black', 'blackscreen', 0, 3.9)
end

function onBeatHit() 
	if curBeat == 292 then 
		cameraFlash('x', 0xFFFFFFFF, 1)
		cameraShake('x', 0.002, 0.1)
		clearFilters('x')
		setProperty('sewer.visible', false) -- no idea why this works
		setProperty('gf.visible', false)
		setProperty('mainBody.alpha', 1)
		setProperty('boyfriend.x', getProperty('boyfriend.x' + 100))	
	else if curBeat == 391 then 
		doTweenAlpha('black', 'blackscreen', 1, 1)	
	else if curBeat == 143 then
		setProperty('camFollow.y', getProperty('camFollow.y') - 250)
		setProperty('camFollow.x', getProperty('camFollow.x') + 50)
			end
		end
	end
end

function onUpdatePost(elapsed)
	if not mustHitSection and curBeat < 292 then
		if string.find(string.lower(getProperty('dad.animation.curAnim.name')), 'singup') then
			cameraForceTarget('dad')
			setProperty('camFollow.x', getProperty('dad.x') + 650)
			setProperty('camFollow.y', getProperty('camFollow.y') - 250)
		else if string.find(string.lower(getProperty('dad.animation.curAnim.name')), 'singdown') then
			cameraForceTarget('dad')
			setProperty('camFollow.x', getProperty('dad.x') + 650)
			setProperty('camFollow.y', getProperty('camFollow.y') + 120)
		else
			setProperty('camFollow.x', getProperty('dad.x') + 650)
			setProperty('camFollow.y', getProperty('dad.y') + 300)
			end
		end
	end
end