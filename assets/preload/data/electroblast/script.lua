

function onStepHit()

    if curStep < 1534 then --beats stop after this
        if curStep % 16 == 0 then 
            triggerEvent('Add Camera Zoom', 0.07, 0.01)
        elseif curStep % 16 == 6 then 
            triggerEvent('Add Camera Zoom', 0.01, 0.07)
        elseif curStep % 16 == 12 then 
            triggerEvent('Add Camera Zoom', 0.01, 0.07)
        end
    end


end
function onSongStart()
    triggerEvent('Add Camera Zoom', 0.07, 0.01) --first beat in song
    triggerEvent('Change Cam Speed', 1.4) --change cam speed
end