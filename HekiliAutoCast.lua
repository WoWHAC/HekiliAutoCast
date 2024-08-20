HekiliAutoCast = LibStub("AceAddon-3.0"):NewAddon("HekiliAutoCast", "AceConsole-3.0", "AceEvent-3.0")

local weakAurasStatus = false

local f = CreateFrame("Frame","TestBorder",UIParent)
f:SetSize(2,2)
f:SetPoint("TOPLEFT")
f:SetFrameStrata( "TOOLTIP" )


f.back = f:CreateTexture(nil,"BACKGROUND",nil,-1)
f.back:SetAllPoints(f)
f.back:SetTexture(255/255,100,100)



-- Импортируем WeakAuras, если он не обнаружен
DEFAULT_CHAT_FRAME:AddMessage("HekiliAutoCast: Waiting for a response from WeakAuras")
C_Timer.After(5, function()
    if not weakAurasStatus then        
        DEFAULT_CHAT_FRAME:AddMessage("HekiliAutoCast: Timed out waiting for a response from WeakAuras, if this is the first launch of the program, import the configuration in the modal window. Otherwise, refuse")
        if not WeakAuras.IsTWW() then
            WeakAuras.Import("!WA:2!9r1tVnoru8nBpGKfSSKdrRG9WOGuPvGsraA5eiItDudK201XLURqi3XEEoEOoZmAMXj17XioWbeh6hHCMt5JW(jWQA)e0lCVhqIB8CCkIfTflznVzM3F(9(9EZRr)MtBYAY(LpslZTzCbOhDsWWbh5Dfn3Mk1JuwUuyCuFmJBuz0Ia4cByIupLAdvHw(uiKviOt5XH2unysLzScDXOKedy)1VEfveJU5yjxyJ65DuGNVIC3UQExd1dJZnw50knorXOwWhMbc71iOKOc84t5mBQBxCRMgVgIpX3yPARtucxWnPoU4ID7lzYWAFDwu9Q6pO5AAiiM1zG5a4CEgFOKYag5RidmDzSrI6970U(22764WticPLCxwAtbbrPXCCN2bPaP(Yk01JASK58SmIuKvqMl1NtqNviZjiUZPz4HP0z3AcHlWSildyDiKNJkftfKjGLWXGBj)W85Z7eNRnasutGoXYP7nxoFpkJHmWEPR9Xp2P9UeqWwy18jtaT5bBR3i(NU2cfu286CdesZMtlmwDoC21M8O1e848Ke(fRc71DCq44GU(blzqeEyaAN(aVHh3)KH)J2hRbuB)Xh7nCyPZl7LIq8qWyOta3CK9JQQYG2hBpaJZcJcYYgWmo1wBup(aVVBWWbH(E9gD4HEhTF3GbJok8KJrbVv1LRWkehHKIn34hNcXNx6u2u9Bj5I119Dc)eYA3fUPR62T0iKlSfHC2Uoe8dz9)VY3ADQ(E9AxOpGKmYM78M9kEJd(FZM3a7JrOcvP3I(uod57lZfBQaTkBEF17v1YodcQp6qjd(97PAF3VkMkzHOFHZuBF3kLbtOXfHjzsPoDb2OXovtvloDJGBIuyvpSVM)cYtZPm0FusqWsSw6dtQEa9(TkBDfUnIgF(eCCGG5MH8t)iSHet9w(tZZSChxSmg3Q8lD8JZOgtLKRH)cOsyrvqgJBENRmPuMC(ZQNdS1s96yu1f5ArSFjvWNUMPEs5d6)sGAGXwniMytFRYwUcPaUITHlx3bGT8XsbZSOs1k3u21DkLl6x(nObLDlDl7vUpU(U)3tU0azj1ZFChfem6q1hE3KOsdXCdg0TuFWBuRAb)kLzlRqeVE(O(I6mDOu)tyLNNu4o0RFWsRmEgcEuNh1i8VAZzx)69xB4PNxB9JV3Qen(yb5cS8S1n1dp7xDuvohnUNVN3rryCt4tC(SCoBL1xpy4U72B6tpWpwMj1F7w43Q)f4V)Q6y0B9TnA0yRL4RwGTEe6p)2R4I6KcXyl1J4tesnSzSVxvpVNwl1M0Bqge0cA23xNpN304)fD(0oFEZzV6z)n")
        else
            WeakAuras.Import("!WA:2!9rzqVXnrua4UnhQQfffwPgvb9G1IuuIaTHue5ccKI36vzHnzt96qAfc5m2ZZRhI9mJMz8UX94koWbehYfUVNHl7pH(lWkIFb5xaQh4CF2EdIIAWx8BEZBEZ799EZRv)2zTPTP)8wkrUjLXb1Ot8ho4ix1fJIJ1GzOqv0i9lF9scpkrOowW4MWEUh576jTPmTmLu4dxycIfQmIjqgyyzWQvTKRhLRnISklorsjgWdMcCZ1KCulXWIoLrnjo7JlvKidtW175PneLXYHXzMnVKkcA8XzHn)L)fjxrca(0Ud0haNZszdfekqT)k7Eb7tPJ4ACNAHMn2QtJzD22YIfBZfg7BZfMeGBlvysUvh)eWUzZQWRhrBSNXstTf80c7zc152OZke52yGNtsrLjKP3CeBghtJ0uG212(fOrreU9eWyZWl3y)9ZMnRBuUsdiPMaDJez7mtmBhcLIiyNKAF8dD7STnWPHXik0jwZnk2KjGs)(BQwj(3oMcjuU(15AiGKoJuOnQC4SR15H1KECECm7ILb92FSFWy)998x2GXGegfpOtos5WQQiOkV)R6LGb3HGwtMaVMwWjzSONISQQYKuUU8xJZ51LPTc(u76liyvtWnljHyKBkcy0TTSXpKr)FWU2MQV3M0bEaIem336D7vChRkYuVRw(4dC)2bdhe452B0Hh6E0t33FWOJco5yuWDUwcPPdOARBs9kMfILhtU2lkbIoV8(EyQcAR)HBhRaKBEJp2D4WfuieXOpEk1bUdpU)jdVmNVQcSr563v(bv9Utb)gvhkOWVFhzNB)5rMGgGqfotU5TBukmHeveeNkeQKljCwwDzyVYh0V8HoCbhEfq0WyJc4tmj37k6QcvD(HTwrcovpVYMQqVChNmcJJNTCNYp7EL7w(KYphfB)F14el4g569vSxA)SCcfDkX23FbIgpys1t0pCJYhEfUmKeD(eC6bN6KIL0(oA2lHn8YYtnmlhe7rBu(LwErPeTUskeFrGSTsCE1Lmgn)bHArUkcczzsHYCLoHqfZEEZCN1wOQVXQ43XGi6snKg3meYzKV)OdFnkckoj97WmgT83wGLnGwpw5NEp5hF74vQGiw1rwB5)YO7UkaErta847CfoQch8nswpCYs9JylelUWzOBF)fgr00M79rT(JLDy0RF724NKZOlnEQbd3E7Ezp7GLXkSndRyisx71nJu7xPQkbdh3ZZ19i5h9oJ5gbVQqNgIv2y2eR54ui6PkIC(PRe8IePc13Sg(TSjr6vROvRwRTOQFG1Kglz8ghIR2CjkgbU1pLot(i2eUqbRs4ATUkLqPtKFYTtZvZkcmjkqNisPfT1HFr3D3R7UTN(Np)n")
        end
    end
end)

-- Возвращает false если какая-то из способностей сейчас используется
-- Необходимо, чтобы не прерывать действие текущей способности новой способностью
local function CalculateIsNotChanneling(recomendAbilityId)
    local channelSpell, _, _, _, channelEndTimeMS, _, _, spellId = UnitChannelInfo("player")
    -- [Shadow Priest] позволять использовать "Взрыв разума" во время каста "Пытки разума" или "Иссушение разума"
    if spellId == 15407 or spellId == 48045 then
        if recomendAbilityId == 8092 then
            return true
        end
    end
    if channelSpell then
        return max(0, channelEndTimeMS/1000 - GetTime()) <= 0
    end
    local spell, _, _, _, endTimeMS = UnitCastingInfo("player")
    if spell then
        return max(0, endTimeMS/1000 - GetTime()) <= 0
    end
    return true
end

local allowAcceptNew = false
local shouldPressKeybind = ""

function HekiliAutoCast_Process(keyBind, recomendAbilityId)
    if keyBind == nil then
        keyBind = shouldPressKeybind
    else
        shouldPressKeybind = keyBind
    end
    keyBind = normalizeModifiers(keyBind)
    if CalculateIsNotChanneling(recomendAbilityId) then
        local red = getRed(keyBind)
        local green = getGreen(keyBind)
        local blue = getBlue(keyBind)
        f.back:SetColorTexture(red, green, blue)
    else 
        f.back:SetColorTexture(0, 0, 0)
    end
end

-- Вызывается из WeakAuras.
-- Hekili отправляет рекомендуемую для нажатия способность в WeakAuras
-- Так мы понимаем, что WeakAuras и Hekili работают нормально
-- Изменяем код Hekili, чтобы получить доступ к keybind
function HekiliAutoCast_Recomend(abilityId)
    allowAcceptNew = true
    if not weakAurasStatus then
        DEFAULT_CHAT_FRAME:AddMessage("HekiliAutoCast: WeakAuras detected and working correctly")
        weakAurasStatus = true
        local GetBindingForAction = Hekili.GetBindingForAction
        Hekili.GetBindingForAction = function ( key, display, i )
            local result, secondResult = GetBindingForAction(key, display, i)
            if allowAcceptNew then
                HekiliAutoCast_Process(result, abilityId)
                allowAcceptNew = false
            end
            return result, secondResult
        end
    end
    HekiliAutoCast_Process(nil, abilityId)
end

function normalizeModifiers(keyBind)
    keyBind = keyBind:upper()
    local result = ""
    local withAlt = false
    local withCtrl = false
    local withShift = false
    if keyBind:len() > 1 and keyBind:match("^A") ~= nil then
        withAlt = true
        keyBind = keyBind:sub(2)
    end
    if keyBind:len() > 1 and keyBind:match("^C") ~= nil then
        withCtrl = true
        keyBind = keyBind:sub(2)
    end
    if keyBind:len() > 1 and keyBind:match("^S") ~= nil then
        withShift = true
        keyBind = keyBind:sub(2)
    end
    if withShift then
        result = "SHIFT\-" .. result
    end
    if withCtrl then
        result = "CTRL\-" .. result
    end
    if withAlt then
        result = "ALT\-" .. result
    end
    return result .. keyBind
end

function getRed(keyBind)
    local red = 0
    if keyBind:match('ALT.CTRL.SHIFT.') ~= nil then
        red = 70/255
    elseif keyBind:match("ALT.CTRL.") ~= nil then
        red = 60/255
    elseif keyBind:match("ALT.SHIFT.") ~= nil then
        red = 50/255
    elseif keyBind:match("ALT.") ~= nil then
        red = 40/255
    elseif keyBind:match("CTRL.SHIFT.") ~= nil then
        red = 30/255
    elseif keyBind:match("CTRL.") ~= nil then
        red = 20/255
    elseif keyBind:match("SHIFT.") ~= nil then
        red = 10/255
    end
    return red
end


-- ` = 96
-- 1 = 49
-- 2 = 50
-- 3 = 51
-- 4 = 52
-- 5 = 53
-- 6 = 54
-- 7 = 55
-- 8 = 56
-- 9 = 57
-- 0 = 48
-- - = 45
-- = = 61
-- Q = 81
-- W = 87
-- E = 69
-- R = 82
-- T = 84
-- Y = 89
-- U = 85
-- I = 73
-- O = 79
-- P = 80
-- [ = 91
-- ] = 93
-- A = 65
-- S = 83
-- D = 68
-- F = 70
-- G = 71
-- H = 72
-- J = 74
-- K = 75
-- L = 76
-- ; = 59
-- ' = 39
-- Z = 90
-- X = 88
-- C = 67
-- V = 86
-- B = 66
-- N = 78
-- M = 77
-- , = 44
-- . = 46
-- / = 47
-- F1 = 149
-- F2 = 150
-- F3 = 151
-- F4 = 152
-- F5 = 153
-- F6 = 154
-- F7 = 155
-- F8 = 156
-- F9 = 157
-- F10 = 158
-- F11 = 159
-- F12 = 160
function getGreen(keyBind)
    local green = 0
    keyBind = keyBind:gsub("ALT.", ""):gsub("CTRL.", ""):gsub("SHIFT.", "")
    if keyBind:len() == 1 then
        green = keyBind:byte() .. ""
        green = green * 1
        green = green /255
    elseif keyBind:match("^F") ~= nil then
        if keyBind:match("^F12$") ~= nil then
            green = 160/255
        elseif keyBind:match("^F11$") ~= nil then
            green = 159/255
        elseif keyBind:match("^F10$") ~= nil then
            green = 158/255
        elseif keyBind:match("^F9$") ~= nil then
            green = 157/255
        elseif keyBind:match("^F8$") ~= nil then
            green = 156/255
        elseif keyBind:match("^F7$") ~= nil then
            green = 155/255
        elseif keyBind:match("^F6$") ~= nil then
            green = 154/255
        elseif keyBind:match("^F5$") ~= nil then
            green = 153/255
        elseif keyBind:match("^F4$") ~= nil then
            green = 152/255
        elseif keyBind:match("^F3$") ~= nil then
            green = 151/255
        elseif keyBind:match("^F2$") ~= nil then
            green = 150/255
        elseif keyBind:match("^F1$") ~= nil then
            green = 149/255
        end
    end
    return green
end

function getBlue(keyBind)
    return getRed(keyBind)
end
