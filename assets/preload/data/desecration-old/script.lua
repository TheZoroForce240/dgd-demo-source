function onStepHit()
    if (curStep > 255 and curStep < 639) or (curStep > 895 and curStep < 1279) then --beats happen during this
        if curStep % 16 == 0 or curStep % 16 == 3 or curStep % 16 == 6 or curStep % 16 == 9 or curStep % 16 == 12 or curStep % 16 == 14 then 
            triggerEvent('Add Camera Zoom', 0, 0.01)
        end
    elseif curStep < 1391 then --beats stop after this
        if curStep % 16 == 0 or curStep % 16 == 4 or curStep % 16 == 6 or curStep % 16 == 10 or curStep % 16 == 12 or curStep % 16 == 14 then 
            triggerEvent('Add Camera Zoom', 0.01, 0)
        end
    end

    if curStep == 384 then --fuckiung event not working
        setProperty('dimGo', true)
    elseif curStep == 384+64 then 
        setProperty('dimGo', false)
    elseif curStep == 384+128 then 
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
        setProperty('dimGo', false)
    end


end
function onSongStart()
    triggerEvent('Add Camera Zoom', 0.01, 0) --first beat in song
    triggerEvent('Change Cam Speed', 2) --change cam speed
end