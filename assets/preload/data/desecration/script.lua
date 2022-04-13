

function onStepHit()




    if curStep < 1026 then --beats stop after this
        if curStep % 16 == 0 then 
            triggerEvent('Add Camera Zoom', 0.05, -0.08)
        end
    end

    if curStep == 640 then --fuckiung event not working
        setProperty('dimGo', true)
        triggerEvent('Change Cam Speed', 2.3) --change cam speed
    elseif curStep == 896 then 
        setProperty('dimGo', false)
        triggerEvent('Change Cam Speed', 1.5)
    --[[elseif curStep == 384+128 then 
        setProperty('dimGo', true)
    elseif curStep == 384+128+64 then 
        setProperty('dimGo', false)
    elseif curStep == 579 then 
        setProperty('dimGo', false) --fuck you
    elseif curStep == 580 then 
        setProperty('dimGo', false) --fuck you ???
    elseif curStep == 1024 then 
        setProperty('dimGo', true)
    elseif curStep == 1024+64 then 
        setProperty('dimGo', false)
    elseif curStep == 1024+128 then 
        setProperty('dimGo', true)
    elseif curStep == 1024+128+64 then 
        setProperty('dimGo', false)]]--


    elseif curStep == 120 then 
        --setProperty('dimGo', false)
        doTweenZoom('camz', 'camGame', 0.85, (stepCrochet*0.001) * 8, 'elasticInOut')
        setProperty('camGame.angle', 360)
        doTweenAngle('cama', 'camGame', 0, (stepCrochet*0.001) * 8, 'elasticInOut')

        doTweenZoom('camhudz', 'camHUD', 1.3, (stepCrochet*0.001) * 8, 'elasticInOut')
    elseif curStep == 128 then 
        triggerEvent('Change Cam Speed', 2.3) --change cam speed
    elseif curStep == 383 then 
        triggerEvent('Change Cam Speed', 1.4) --change cam speed
    end


end
function onSongStart()
    triggerEvent('Add Camera Zoom', 0.01, 0) --first beat in song
    triggerEvent('Change Cam Speed', 1.1) --change cam speed
end