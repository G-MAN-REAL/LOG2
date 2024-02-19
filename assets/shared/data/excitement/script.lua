function onCreate()
	changeIcon(true, "test")
end
-- local flipHP = false
-- function onBeatHit()
-- 	if curBeat == 10 then 
-- 		changeBarFillDirection()
-- 		swapStrums()
-- 		flipHealthbar(false)
-- 		flipHP = true;

-- 	end
-- end
-- local keyCount = 4;
-- function swapStrums() 
-- 	local tableOpp = {}
-- 	for i = 0,keyCount -1 do
-- 		tableOpp[i + 1] = (getPropertyFromGroup("opponentStrums", i, "x"))
-- 		setPropertyFromGroup("opponentStrums", i, "x", getPropertyFromGroup("playerStrums", i, "x"))
-- 		setPropertyFromGroup("playerStrums", i, "x", tableOpp[i + 1])
-- 	end
-- end
-- function onUpdatePost(elapsed)
-- 	if flipHP then
-- 		setProperty("healthBar.percent", (2 - getHealth()) * 50)
-- 		setProperty("iconP2.x", getProperty("healthBar.x") + getProperty("healthBar.width") * (1 - (getProperty("healthBar.percent") * 0.01)) - 26)
-- 		setProperty("iconP1.x", getProperty("iconP2.x") - getProperty("iconP2.width") + 26)
-- 		setProperty("iconP2.flipX", true)
-- 		setProperty("iconP1.flipX", true)
-- 	else 
-- 		setProperty("healthBar.percent", getHealth() * 50)
-- 		setProperty("iconP1.x", getProperty("healthBar.x") + getProperty("healthBar.width") * (1 -(getProperty("healthBar.percent") * 0.01)) - 26)
-- 		setProperty("iconP2.x", getProperty("iconP1.x") - getProperty("iconP2.width") + 26)
-- 		setProperty("iconP2.flipX", false)
-- 		setProperty("iconP1.flipX", false)
-- 	end
-- end


--1664