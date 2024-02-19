
local hudAlphaAdd = 0 
function onUpdatePost(elapsed)
local alphaVal = getProperty('healthBar.percent') / 100 + hudAlphaAdd
setProperty('healthBar.alpha', alphaVal)
setProperty('iconP2.alpha', alphaVal)
setProperty('iconP1.alpha', alphaVal)
setProperty('healthBarBG.alpha', alphaVal)
end 
function onBeatHit()
if curBeat == 259 then
    local rating = getProperty('healthBar.percent')
    hudAlphaAdd = 1
    local fullRand = math.random(100)
    local rand = math.random(2)

    debugPrint(botPlay);
    if botPlay then
        playSound('exothermic/cheaptrick', 1, 'X')
    else if getProperty('songMisses') + getProperty('ghostMisses') == 0 then
        if fullRand < 36 then 
        playSound('exothermic/FC', 1, 'X')
        else 
        playSound('exothermic/perfect'..rand, 1, 'X')
        end
    else if rating > 75 then
        if fullRand < 36 then 
            playSound('exothermic/deathcounter', 1, 'X')
            else 
        playSound('exothermic/notbad'..rand, 1, 'X')
            end
    else if rating < 75 and rating > 35 then
        if fullRand < 36 then 
            playSound('exothermic/misscounter', 1, 'X')
            else 
        playSound('exothermic/stillalive'..rand, 1, 'X')
            end
    else if rating < 35 then
        if fullRand < 36 then 
            playSound('exothermic/almost', 1, 'X')
        else 
        playSound('exothermic/muchlonger'..rand, 1, 'X') 
        end
                            end
                        end
                    end
                end
            end  
else if curBeat == 288 then
    hudAlphaAdd = 0
        end
    end 
end 