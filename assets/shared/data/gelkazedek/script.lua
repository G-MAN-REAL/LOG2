function onCreate()
    makeAnimatedLuaSprite('redeye', 'gelk/Gelkazedek_Red_Eyes', 200, -200)
    addAnimationByPrefix('redeye', 'idle', 'Dimensional_Geyser instance 1')
    addLuaSprite('redeye')
    setProperty('redeye.alpha', 0.0000001)
end 
local time = 0
function onUpdatePost(elapsed)
    time = time + elapsed
    setProperty('subtitles.x', screenWidth/2 - getProperty('subtitles.width') / 2)
    setProperty('subtitles.y', 100 + screenHeight/2 - getProperty('subtitles.height') / 2)
    if not mustHitSection and curBeat >= 576 then 
        setProperty('camFollow.y', getProperty('camFollow.y') + math.sin(time))
    end
end
function onBeatHit() 
if curBeat == 206 then 
    setProperty('subtitles.text', 'Very well...')
    setTextColor('subtitles', "0xFF6E25FF")
else if curBeat == 208 then 
        setProperty('subtitles.text', '')
else if curBeat == 284 then 
    playAnim('5', 'gem-init init')
else if curBeat == 287 then
    playAnim('3', 'idle')
    removeLuaSprite('5')
else if curBeat == 297 then
    playAnim('4', 'idle')
    removeLuaSprite('3')
else if curBeat == 303 then 
    cameraFlash('', "0xFFFFFFFF", 2)
    playAnim('0', 'Gem_Attacking_4')
    playAnim('1', 'Gem_Attacking_3')
    playAnim('2', 'Gem_Attacking_1')
    -- playAnim('3', 'Action Lines')
    removeLuaSprite('4')
else if curBeat == 448 then 
    removeLuaSprite('0')
    removeLuaSprite('1')
    removeLuaSprite('2')
    cameraFlash('', "0xFFFFFFFF", 1)
    -- removeLuaSprite('3')
    playAnim('6', 'gem-disappear')
    setProperty('6.alpha', 0.5)
    runGC()
else if curBeat == 520 then 
    doTweenAlpha('black', 'blackscreen', 1, 3.9)
else if curBeat == 540 then 
    doTweenAlpha('black', 'blackscreen', 0, 1.9)
    for i = 0,5 do
        if i ~= 2 then 
        doTweenAlpha('tween'..i, 'fooSpr'..i, 0, 2)
        end
    end
else if curBeat == 568 then
    doTweenAlpha('dad', 'dad', 0, 2)
    doTweenAlpha('body', 'garyBody', 0, 2)
    doTweenAlpha('spr2', 'fooSpr2', 0, 2)
else if curBeat == 576 then 
    for i = 0,5 do
        setProperty('fooSpr'..i..'.alpha', 1)
    end
    cameraFlash('', "0xFFFFFFFF", 2)
    removeLuaSprite('garyBody')
    removeLuaSprite('fooSpr2')
    setProperty('redeye.alpha', 1)
    setProperty('forceAlpha', 0.75)
else if curBeat == 640 then
    setTextColor('subtitles', "FFFFFFFF")
    setProperty('subtitles.text', 'How long are you gonna keep this up?')
else if curBeat == 646 then
    setProperty('subtitles.text', "Heh, that's my line!")
    setTextColor('subtitles', "0xFF99FEFF")
else if curBeat == 652 then
    setProperty('subtitles.text', "So it is...")
    setTextColor('subtitles', "0xFFFFFFFF")
else if curBeat == 656 then
    setProperty('subtitles.text', '')
else if curBeat == 959 then 
    setProperty('subtitles.text', "That's enough!")
    setTextColor('subtitles', "0xFFFFFFFF")
    doTweenAlpha('tween', 'subtitles', 0, 3)
    doTweenAlpha('black', 'blackscreen', 1, 4)
    end
                end
            end
        end
    end
                end
            end
        end
    end
                end
            end
        end
    end
            end
        end
    end
end 