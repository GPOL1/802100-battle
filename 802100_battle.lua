RegisterTableGoal(GOAL_AlonneChampion_Battle, "AlonneChampion")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_AlonneChampion_Battle, true)

Goal.Initialize = function (_, arg1, _, _)
    arg1:SetTimer(10, 3)
    arg1:SetNumber(0, 0)
end

Goal.Activate = function (_, actor, goals)
    Init_Pseudo_Global(actor, goals)
    actor:SetStringIndexedNumber("Dist_SideStep", 4)
    actor:SetStringIndexedNumber("Dist_BackStep", 3.8)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        actor:SetStringIndexedNumber("Gunda_ADAdjustment", -1)
        actor:SetStringIndexedNumber("Gunda_ForceRunDist", 999)
        actor:SetStringIndexedNumber("Gunda_Odds_Run", 100)
    elseif actor:GetNpcThinkParamID() == 80210000 then
        actor:SetStringIndexedNumber("Gunda_ADAdjustment", -1)
        actor:SetStringIndexedNumber("Gunda_ForceRunDist", 999)
        actor:SetStringIndexedNumber("Gunda_Odds_Run", 0)
    else
        actor:SetStringIndexedNumber("Gunda_ADAdjustment", 0)
        actor:SetStringIndexedNumber("Gunda_ForceRunDist", 999)
        actor:SetStringIndexedNumber("Gunda_Odds_Run", 0)
    end
    local probabilities = {}
    local acts = {}
    local f2778_local0 = {}
    Common_Clear_Param(probabilities, acts, f2778_local0)
    actor:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 90)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5050)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    local distance = actor:GetDist(TARGET_ENE_0)
    actor:GetRandam_Int(1, 100)
    if actor:GetHpRate(TARGET_SELF) <= 0.55 and actor:GetNpcThinkParamID() == 80210000 == false and actor:HasSpecialEffectId(TARGET_SELF, 5404) == false then
        probabilities[50] = 100
    elseif actor:GetHpRate(TARGET_SELF) < 0.65 and actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) == false then
        probabilities[30] = 100
    elseif actor:GetNumber(0) == 0 then
        probabilities[21] = 10
    elseif actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 150) then
            if InsideRange(actor, goals, 180, 150, -1, 4 - actor:GetMapHitRadius(TARGET_SELF)) then
                probabilities[6] = 90
                probabilities[12] = 30
                probabilities[13] = 20
                probabilities[20] = 10
                probabilities[22] = 100
            else
                probabilities[20] = 10
                probabilities[22] = 100
            end
        elseif InsideRange(actor, goals, 105, 60, -1, 2) then
            probabilities[12] = 10
            probabilities[13] = 20
            probabilities[16] = 20
            probabilities[22] = 100
        elseif InsideRange(actor, goals, -105, 60, -1, 2) then
            probabilities[3] = 30
            probabilities[11] = 30
            probabilities[12] = 10
            probabilities[13] = 10
            probabilities[22] = 100
        elseif distance >= 10 then
            probabilities[1] = 30
            probabilities[2] = 25
            probabilities[9] = 10
            probabilities[16] = 10
            probabilities[18] = 100
            probabilities[19] = 100
            probabilities[22] = 100
        elseif distance >= 8 then
            probabilities[1] = 30
            probabilities[4] = 10
            probabilities[5] = 10
            probabilities[9] = 10
            probabilities[16] = 10
            probabilities[18] = 100
            probabilities[19] = 100
            probabilities[22] = 100
        elseif distance >= 3 then
            probabilities[4] = 20
            probabilities[5] = 20
            probabilities[9] = 20
            probabilities[10] = 10
            probabilities[16] = 20
            probabilities[19] = 100
            probabilities[22] = 100
        else
            probabilities[3] = 20
            probabilities[7] = 20
            probabilities[8] = 20
            probabilities[10] = 10
            probabilities[11] = 10
            probabilities[12] = 10
            probabilities[13] = 20
            probabilities[16] = 20
            probabilities[22] = 100
        end
    elseif actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 150) then
        if InsideRange(actor, goals, 180, 150, -1, 4 - actor:GetMapHitRadius(TARGET_SELF)) then
            probabilities[6] = 70
            probabilities[20] = 30
        else
            probabilities[20] = 10
        end
    elseif InsideRange(actor, goals, 105, 60, -1, 3) then
        probabilities[4] = 55
        probabilities[5] = 45
    elseif InsideRange(actor, goals, -105, 60, -1, 3) then
        probabilities[4] = 25
        probabilities[5] = 35
        probabilities[8] = 40
    elseif distance >= 10 then
        probabilities[1] = 75
        probabilities[2] = 25
    elseif distance >= 8 then
        probabilities[1] = 30
        probabilities[2] = 55
        probabilities[9] = 15
    elseif distance >= 3 then
        probabilities[4] = 10
        probabilities[5] = 10
        probabilities[9] = 75
    elseif distance >= 1.5 then
        probabilities[4] = 10
        probabilities[5] = 10
        probabilities[7] = 35
        probabilities[8] = 10
        probabilities[9] = 35
    else
        probabilities[3] = 20
        probabilities[4] = 10
        probabilities[5] = 10
        probabilities[7] = 25
        probabilities[8] = 10
        probabilities[9] = 25
    end
    if actor:GetNpcThinkParamID() == 80210000 then
        probabilities[2] = 0
    end
    if actor:HasSpecialEffectAttribute(TARGET_ENE_0, SP_EFFECT_TYPE_TARGET_DOWN) then
        if actor:GetNpcThinkParamID() == 80210000 then
            probabilities[1] = probabilities[1] + 30
            probabilities[2] = probabilities[2] + 30
        else
            probabilities[21] = probabilities[21] + 300
        end
    end
    probabilities[1] = SetCoolTime(actor, goals, 3000, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(actor, goals, 3002, 8, probabilities[2], 1)
    probabilities[3] = SetCoolTime(actor, goals, 3003, 8, probabilities[3], 1)
    probabilities[4] = SetCoolTime(actor, goals, 3004, 8, probabilities[4], 1)
    probabilities[5] = SetCoolTime(actor, goals, 3007, 8, probabilities[5], 1)
    probabilities[6] = SetCoolTime(actor, goals, 3009, 8, probabilities[6], 1)
    probabilities[7] = SetCoolTime(actor, goals, 3010, 16, probabilities[7], 1)
    probabilities[8] = SetCoolTime(actor, goals, 3011, 8, probabilities[8], 1)
    probabilities[9] = SetCoolTime(actor, goals, 3012, 8, probabilities[9], 1)
    probabilities[10] = SetCoolTime(actor, goals, 3020, 16, probabilities[10], 1)
    probabilities[11] = SetCoolTime(actor, goals, 3021, 8, probabilities[11], 1)
    probabilities[12] = SetCoolTime(actor, goals, 3022, 12, probabilities[12], 1)
    probabilities[13] = SetCoolTime(actor, goals, 3026, 8, probabilities[13], 1)
    probabilities[13] = SetCoolTime(actor, goals, 3021, 8, probabilities[13], 1)
    probabilities[16] = SetCoolTime(actor, goals, 3026, 8, probabilities[16], 1)
    probabilities[18] = SetCoolTime(actor, goals, 3015, 15, probabilities[18], 0)
    probabilities[19] = SetCoolTime(actor, goals, 3016, 15, probabilities[19], 0)
    probabilities[22] = SetCoolTime(actor, goals, 3030, 60, probabilities[22], 0)
    if actor:GetNpcThinkParamID() == 511000 then
        probabilities[6] = 0
        probabilities[7] = probabilities[7] * 0.2
        probabilities[7] = SetCoolTime(actor, goals, 3010, 30, probabilities[7], 1)
    end
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) == false then
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[12] = 0
    end
    acts[1] = REGIST_FUNC(actor, goals, AlonneChampion_Act01)
    acts[2] = REGIST_FUNC(actor, goals, AlonneChampion_Act02)
    acts[3] = REGIST_FUNC(actor, goals, AlonneChampion_Act03)
    acts[4] = REGIST_FUNC(actor, goals, AlonneChampion_Act04)
    acts[5] = REGIST_FUNC(actor, goals, AlonneChampion_Act05)
    acts[6] = REGIST_FUNC(actor, goals, AlonneChampion_Act06)
    acts[7] = REGIST_FUNC(actor, goals, AlonneChampion_Act07)
    acts[8] = REGIST_FUNC(actor, goals, AlonneChampion_Act08)
    acts[9] = REGIST_FUNC(actor, goals, AlonneChampion_Act09)
    acts[10] = REGIST_FUNC(actor, goals, AlonneChampion_Act10)
    acts[11] = REGIST_FUNC(actor, goals, AlonneChampion_Act11)
    acts[12] = REGIST_FUNC(actor, goals, AlonneChampion_Act12)
    acts[13] = REGIST_FUNC(actor, goals, AlonneChampion_Act13)
    acts[14] = REGIST_FUNC(actor, goals, AlonneChampion_Act14)
    acts[15] = REGIST_FUNC(actor, goals, AlonneChampion_Act15)
    acts[16] = REGIST_FUNC(actor, goals, AlonneChampion_Act16)
    acts[17] = REGIST_FUNC(actor, goals, AlonneChampion_Act17)
    acts[18] = REGIST_FUNC(actor, goals, AlonneChampion_Act18)
    acts[19] = REGIST_FUNC(actor, goals, AlonneChampion_Act19)
    acts[20] = REGIST_FUNC(actor, goals, AlonneChampion_Act20)
    acts[21] = REGIST_FUNC(actor, goals, AlonneChampion_Act21)
    acts[22] = REGIST_FUNC(actor, goals, AlonneChampion_Act22)
    acts[30] = REGIST_FUNC(actor, goals, AlonneChampion_Act30)
    acts[40] = REGIST_FUNC(actor, goals, AlonneChampion_Act40)
    acts[50] = REGIST_FUNC(actor, goals, AlonneChampion_Act50)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, AlonneChampion_ActAfter_AdjustSpace), f2778_local0)
end

function AlonneChampion_Act01(actor, goals, _)
    local f2779_local0 = 18 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2779_local1 = 18 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2779_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2779_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2779_local4 = 0
    local f2779_local5 = 1
    local f2779_local6 = 3
    Approach_Act_Flex(actor, goals, f2779_local0, f2779_local1, f2779_local2, f2779_local3, f2779_local4, f2779_local5, f2779_local6)
    local action0 = 3000
    local f2779_local7 = 3001
    local action1 = 3029
    local f2779_local8 = 3006
    local action2 = 3014
    local f2779_local9 = 3024
    local action3 = 3026
    local f2779_local10 = 3027
    local success_distance0 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2779_local11 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 7.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2779_local12 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local f2779_local13 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 30 then
            goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2779_local7, TARGET_ENE_0, f2779_local13)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2779_local10, TARGET_ENE_0, success_distance3)
        elseif random <= 60 then
            goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance0)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2779_local7, TARGET_ENE_0, f2779_local11)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2779_local8, TARGET_ENE_0, success_distance3)
        else
            goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance0)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2779_local7, TARGET_ENE_0, f2779_local12)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2779_local9, TARGET_ENE_0, success_distance3)
        end
    elseif random <= 25 then
        goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance3, turn_time_before, front_decision_angle)
    elseif random <= 50 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2779_local7, TARGET_ENE_0, success_distance3)
    elseif random <= 75 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2779_local7, TARGET_ENE_0, f2779_local11)
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action1, TARGET_ENE_0, success_distance3)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action2, TARGET_ENE_0, success_distance3)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act02(arg0, goals, _)
    local f2780_local0 = 16.8 - arg0:GetMapHitRadius(TARGET_SELF) + arg0:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2780_local1 = 16.8 - arg0:GetMapHitRadius(TARGET_SELF) + arg0:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2780_local2 = arg0:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2780_local3 = arg0:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2780_local4 = 0
    local f2780_local5 = 2.5
    local f2780_local6 = 5
    Approach_Act_Flex(arg0, goals, f2780_local0, f2780_local1, f2780_local2, f2780_local3, f2780_local4, f2780_local5, f2780_local6)
    local f2780_local7 = 3002
    local f2780_local8 = 12 - arg0:GetMapHitRadius(TARGET_SELF)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f2780_local7, TARGET_ENE_0, f2780_local8, 0, 0)
    GetWellSpace_Odds = 50
    return GetWellSpace_Odds
end

function AlonneChampion_Act03(actor, goals, _)
    local f2781_local0 = 3.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2781_local1 = 3.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2781_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2781_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2781_local4 = 0
    local f2781_local5 = 1
    local f2781_local6 = 3
    Approach_Act_Flex(actor, goals, f2781_local0, f2781_local1, f2781_local2, f2781_local3, f2781_local4, f2781_local5, f2781_local6)
    local action0 = 3003
    local action1 = 3005
    local action2 = 3006
    local action3 = 3014
    local f2781_local7 = 3001
    local action4 = 3004
    local f2781_local8 = 3027
    local success_distance0 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 9.8 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 7.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2781_local9 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance4 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance5 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 30 then
            local f2781_local10 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            f2781_local10:SetTargetAngle(0, 0, 75)
            f2781_local10 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
            f2781_local10:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action2, TARGET_ENE_0, success_distance5)
        elseif random <= 60 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action3, TARGET_ENE_0, success_distance5)
        else
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance3)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2781_local7, TARGET_ENE_0, f2781_local9)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action4, TARGET_ENE_0, success_distance4)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2781_local8, TARGET_ENE_0, success_distance5)
        end
    elseif random <= 30 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, success_distance5)
    elseif random <= 65 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action2, TARGET_ENE_0, success_distance5)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance5)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act04(actor, goals, _)
    local f2782_local0 = 8.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2782_local1 = 8.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2782_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2782_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2782_local4 = 0
    local f2782_local5 = 2.5
    local f2782_local6 = 5
    Approach_Act_Flex(actor, goals, f2782_local0, f2782_local1, f2782_local2, f2782_local3, f2782_local4, f2782_local5, f2782_local6)
    local action0 = 3004
    local action1 = 3005
    local action2 = 3006
    local action3 = 3003
    local action4 = 3010
    local f2782_local7 = 3024
    local success_distance0 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 9.8 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 3.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance4 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local f2782_local8 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 20 then
            local f2782_local9 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            f2782_local9 = f2782_local9:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            f2782_local9:SetTargetAngle(0, 0, 75)
            f2782_local9 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
            f2782_local9 = f2782_local9:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            f2782_local9:SetTargetAngle(0, 0, 75)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action2, TARGET_ENE_0, f2782_local8)
        elseif random <= 70 then
            local f2782_local9 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance2, turn_time_before, front_decision_angle)
            f2782_local9:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            f2782_local9 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance0)
            f2782_local9:SetTargetAngle(0, 0, 75)
            f2782_local9 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
            f2782_local9:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance4)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2782_local7, TARGET_ENE_0, f2782_local8)
        else
            local f2782_local9 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            f2782_local9 = f2782_local9:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            f2782_local9:SetTargetAngle(0, 0, 75)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance3)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action4, TARGET_ENE_0, success_distance1)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action2, TARGET_ENE_0, f2782_local8)
        end
    elseif random <= 50 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, f2782_local8)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action2, TARGET_ENE_0, f2782_local8)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act05(actor, goals, _)
    local f2783_local0 = 7 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2783_local1 = 7 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2783_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2783_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2783_local4 = 0
    local f2783_local5 = 2.5
    local f2783_local6 = 5
    Approach_Act_Flex(actor, goals, f2783_local0, f2783_local1, f2783_local2, f2783_local3, f2783_local4, f2783_local5, f2783_local6)
    local action0 = 3007
    local f2783_local7 = 3008
    local action1 = 3024
    local f2783_local8 = 3006
    local action2 = 3029
    local f2783_local9 = 3020
    local f2783_local10 = 3027
    local success_distance0 = 7 - actor:GetMapHitRadius(TARGET_SELF)
    local f2783_local11 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local success_distance1 = 9.8 - actor:GetMapHitRadius(TARGET_SELF) + 1
    local f2783_local12 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 22 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2783_local13 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 25 then
            local f2783_local14 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            f2783_local14:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2783_local7, TARGET_ENE_0, f2783_local11)
            f2783_local14 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
            f2783_local14:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2783_local8, TARGET_ENE_0, f2783_local13)
        elseif random <= 75 then
            local f2783_local14 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            f2783_local14:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2783_local7, TARGET_ENE_0, f2783_local12)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance3)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2783_local10, TARGET_ENE_0, f2783_local13)
        else
            local f2783_local14 = goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            f2783_local14:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2783_local7, TARGET_ENE_0, f2783_local12)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2783_local9, TARGET_ENE_0, f2783_local13)
        end
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2783_local7, TARGET_ENE_0, f2783_local13)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act06(actor, goals, _)
    local action0 = 3009
    local f2784_local0 = 3008
    local f2784_local1 = 3004
    local f2784_local2 = 3026
    local action1 = 3027
    local action2 = 3011
    local f2784_local3 = 3029
    local success_distance0 = 9 - actor:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2784_local4 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 8 - actor:GetMapHitRadius(TARGET_SELF)
    local f2784_local5 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2784_local6 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 30 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2784_local0, TARGET_ENE_0, f2784_local4)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2784_local2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, f2784_local6)
        elseif random <= 60 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2784_local0, TARGET_ENE_0, f2784_local5)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2784_local3, TARGET_ENE_0, f2784_local4)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2784_local2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, f2784_local6)
        else
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance2, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance3)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance1)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2784_local1, TARGET_ENE_0, f2784_local6)
        end
    else
        goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, action0, TARGET_ENE_0, f2784_local6, turn_time_before, front_decision_angle)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act07(actor, goals, arg2)
    local f2785_local0 = 5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2785_local1 = 5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2785_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2785_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2785_local4 = 0
    local f2785_local5 = 3
    local f2785_local6 = 3
    Approach_Act_Flex(actor, goals, f2785_local0, f2785_local1, f2785_local2, f2785_local3, f2785_local4, f2785_local5, f2785_local6)
    local action0 = 3010
    local action1 = 3028
    local action2 = 3029
    local f2785_local7 = 3027
    local action3 = 3021
    local success_distance0 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 6.3 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance4 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    if actor:GetNpcThinkParamID() == 80210000 then
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    end
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 50 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2785_local7, TARGET_ENE_0, success_distance4)
        else
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance3, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2785_local7, TARGET_ENE_0, success_distance4)
        end
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance4, turn_time_before, front_decision_angle)
    end
    if actor:GetNpcThinkParamID() == 511000 then
        AlonneChampion_Act21(actor, goals, arg2)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act08(actor, goals, _)
    local f2786_local0 = 8 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2786_local1 = 8 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2786_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2786_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2786_local4 = 0
    local f2786_local5 = 1.5
    local f2786_local6 = 3
    Approach_Act_Flex(actor, goals, f2786_local0, f2786_local1, f2786_local2, f2786_local3, f2786_local4, f2786_local5, f2786_local6)
    local action0 = 3011
    local f2786_local7 = 3024
    local action1 = 3004
    local f2786_local8 = 3027
    local success_distance0 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local success_distance1 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2786_local9 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 50 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2786_local7, TARGET_ENE_0, f2786_local9)
        else
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2786_local8, TARGET_ENE_0, f2786_local9)
        end
    else
        goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, action0, TARGET_ENE_0, f2786_local9, turn_time_before, front_decision_angle)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act09(actor, goals, _)
    local f2787_local0 = 6.3 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2787_local1 = 6.3 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2787_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2787_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2787_local4 = 0
    local f2787_local5 = 3
    local f2787_local6 = 3
    Approach_Act_Flex(actor, goals, f2787_local0, f2787_local1, f2787_local2, f2787_local3, f2787_local4, f2787_local5, f2787_local6)
    local action0 = 3012
    local action1 = 3001
    local action2 = 3013
    local action3 = 3014
    local action4 = 3026
    local f2787_local7 = 3027
    local f2787_local8 = 3024
    local success_distance0 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 7.8 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 7.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance4 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2787_local9 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local success_distance5 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    local random = actor:GetRandam_Int(1, 100)
    if actor:GetNpcThinkParamID() == 80210000 and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
        if random <= 25 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance1)
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action3, TARGET_ENE_0, success_distance5)
        elseif random <= 50 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action3, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, action3, TARGET_ENE_0, success_distance5)
        elseif random <= 75 then
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance0)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, action1, TARGET_ENE_0, f2787_local9)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2787_local8, TARGET_ENE_0, success_distance5)
        else
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance3)
            goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action4, TARGET_ENE_0, success_distance4)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2787_local7, TARGET_ENE_0, success_distance5)
        end
    elseif random <= 30 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance5)
    elseif random <= 50 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance5)
    elseif random <= 75 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action3, TARGET_ENE_0, success_distance5)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance2, turn_time_before, front_decision_angle)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance5)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act10(arg0, goals, _)
    local action0 = 3023
    local action1 = 3020
    local action2 = 3028
    local action3 = 3029
    local f2788_local0 = 3006
    local success_distance0 = 11.5 - arg0:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 11.5 - arg0:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 9.8 - arg0:GetMapHitRadius(TARGET_SELF)
    local f2788_local1 = 12 - arg0:GetMapHitRadius(TARGET_SELF)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, 15, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance1)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance2)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2788_local0, TARGET_ENE_0, f2788_local1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act11(actor, goals, _)
    local f2789_local0 = 3.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2789_local1 = 3.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2789_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2789_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2789_local4 = 0
    local f2789_local5 = 1
    local f2789_local6 = 3
    Approach_Act_Flex(actor, goals, f2789_local0, f2789_local1, f2789_local2, f2789_local3, f2789_local4, f2789_local5, f2789_local6)
    local action0 = 3003
    local action1 = 3021
    local f2789_local7 = 3006
    local success_distance0 = 6.3 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 9.8 - actor:GetMapHitRadius(TARGET_SELF)
    local f2789_local8 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f2789_local7, TARGET_ENE_0, f2789_local8)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act12(arg0, goals, _)
    local f2790_local0 = 3022
    local f2790_local1 = 12 - arg0:GetMapHitRadius(TARGET_SELF)
    local f2790_local2 = 0
    local f2790_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f2790_local0, TARGET_ENE_0, f2790_local1, f2790_local2, f2790_local3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act13(actor, goals, _)
    local action0 = 3026
    local action1 = 3021
    local f2791_local0 = 3027
    local success_distance = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2791_local1 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) then
        if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
            local f2791_local2 = goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 0)
            f2791_local2:SetTargetRange(1, -99, 5)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action0, TARGET_ENE_0, success_distance)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2791_local0, TARGET_ENE_0, f2791_local1)
        else
            local f2791_local2 = goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 0)
            f2791_local2:SetTargetRange(1, -99, 5)
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance)
            goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2791_local0, TARGET_ENE_0, f2791_local1)
        end
    elseif actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
        local f2791_local2 = goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 0)
        f2791_local2:SetTargetRange(1, -99, 5)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2791_local0, TARGET_ENE_0, f2791_local1)
    else
        local f2791_local2 = goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 0)
        f2791_local2:SetTargetRange(1, -99, 5)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2791_local0, TARGET_ENE_0, f2791_local1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act14(actor, goals, _)
    local f2792_local0 = 3008
    local f2792_local1 = 3004
    local f2792_local2 = 3026
    local action0 = 3027
    local action1 = 3011
    local success_distance0 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2792_local3 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2792_local4 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 8 - actor:GetMapHitRadius(TARGET_SELF)
    local f2792_local5 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    if actor:GetRandam_Int(1, 100) <= 50 then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2792_local0, TARGET_ENE_0, f2792_local3)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2792_local2, TARGET_ENE_0, f2792_local4)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action0, TARGET_ENE_0, f2792_local5)
    else
        local f2792_local6 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action0, TARGET_ENE_0, success_distance1)
        f2792_local6:SetTargetRange(0, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 999)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance0)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2792_local1, TARGET_ENE_0, f2792_local5)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act15(actor, goals, _)
    local f2793_local0 = 3001
    local action0 = 3029
    local f2793_local1 = 3006
    local action1 = 3014
    local f2793_local2 = 3024
    local action2 = 3026
    local f2793_local3 = 3027
    local success_distance0 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local f2793_local4 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 7.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2793_local5 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local f2793_local6 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local f2793_local7 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    if random <= 30 then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2793_local0, TARGET_ENE_0, f2793_local6)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2793_local3, TARGET_ENE_0, f2793_local7)
    elseif random <= 60 then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance0)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2793_local0, TARGET_ENE_0, f2793_local4)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action0, TARGET_ENE_0, success_distance1)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2793_local1, TARGET_ENE_0, f2793_local7)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance0)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f2793_local0, TARGET_ENE_0, f2793_local5)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2793_local2, TARGET_ENE_0, f2793_local7)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function AlonneChampion_Act16(actor, goals, _)
    local f2794_local0 = 4.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2794_local1 = 4.5 - actor:GetMapHitRadius(TARGET_SELF) + actor:GetStringIndexedNumber("Gunda_ADAdjustment")
    local f2794_local2 = actor:GetStringIndexedNumber("Gunda_ForceRunDist")
    local f2794_local3 = actor:GetStringIndexedNumber("Gunda_Odds_Run")
    local f2794_local4 = 0
    local f2794_local5 = 1
    local f2794_local6 = 3
    Approach_Act_Flex(actor, goals, f2794_local0, f2794_local1, f2794_local2, f2794_local3, f2794_local4, f2794_local5, f2794_local6)
    local action0 = 3026
    local action1 = 3027
    local action2 = 3011
    local action3 = 3004
    local f2794_local7 = 3024
    local action4 = 3021
    local success_distance0 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 8 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 8.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 3.8 - actor:GetMapHitRadius(TARGET_SELF) - 1.5
    local success_distance4 = 6.3 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance5 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local random = actor:GetRandam_Int(1, 100)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    if random <= 30 then
        goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action0, TARGET_ENE_0, success_distance4)
        goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action4, TARGET_ENE_0, success_distance0)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, success_distance5)
    elseif random <= 65 then
        local f2794_local8 = goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action0, TARGET_ENE_0, success_distance0)
        f2794_local8:SetTargetAngle(0, 0, 75)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance5)
    else
        local f2794_local8 = goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action0, TARGET_ENE_0, success_distance0)
        f2794_local8:SetTargetAngle(0, 0, 75)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance3)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2794_local7, TARGET_ENE_0, success_distance5)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act17(actor, goals, _)
    local action0 = 3021
    local action1 = 3026
    local f2795_local0 = 3027
    local action2 = 3028
    local action3 = 3029
    local f2795_local1 = 3006
    local success_distance0 = 4.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance1 = 5.2 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance2 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance3 = 11.5 - actor:GetMapHitRadius(TARGET_SELF)
    local success_distance4 = 9.8 - actor:GetMapHitRadius(TARGET_SELF)
    local f2795_local2 = 12 - actor:GetMapHitRadius(TARGET_SELF)
    local f2795_local3 = actor:GetHpRate(TARGET_SELF)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    if actor:GetRandam_Int(1, 100) <= 60 then
        local f2795_local4 = goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
        f2795_local4:SetTargetRange(1, -99, 5)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action0, TARGET_ENE_0, success_distance0)
        f2795_local4 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1)
        f2795_local4:SetTargetAngle(0, 0, 75)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2795_local0, TARGET_ENE_0, f2795_local2)
    else
        goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3020, TARGET_ENE_0, success_distance2)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance3)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, success_distance4)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2795_local1, TARGET_ENE_0, f2795_local2)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act18(arg0, goals, _)
    local f2790_local0 = 3015
    local f2790_local1 = 12 - arg0:GetMapHitRadius(TARGET_SELF) +999
    local f2790_local2 = 0
    local f2790_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f2790_local0, TARGET_ENE_0, f2790_local1, f2790_local2, f2790_local3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act19(arg0, goals, _)
    local f2790_local0 = 3016
    local f2790_local1 = 12 - arg0:GetMapHitRadius(TARGET_SELF) +999
    local f2790_local2 = 0
    local f2790_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f2790_local0, TARGET_ENE_0, f2790_local1, f2790_local2, f2790_local3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act20(arg0, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Turn, 3, TARGET_ENE_0, arg0:GetRandam_Int(15, 90))
    return 0
end

function AlonneChampion_Act21(actor, goals, _)
    actor:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 4.5)
    local random = actor:GetRandam_Float(4, 6)
    goals:AddSubGoal(GOAL_COMMON_ApproachTarget, random, TARGET_ENE_0, 5, TARGET_SELF, true, -1)
    actor:SetNumber(0, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act22(arg0, goals, _)
    local f2790_local0 = 3030
    local f2790_local1 = 12 - arg0:GetMapHitRadius(TARGET_SELF) +999
    local f2790_local2 = 0
    local f2790_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f2790_local0, TARGET_ENE_0, f2790_local1, f2790_local2, f2790_local3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act30(arg0, goals, _)
    local action = 3017
    --local f2798_local0 = 3020
    local success_distance = 22 - arg0:GetMapHitRadius(TARGET_SELF) - 1
    local f2798_local1 = 12 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle)
    --goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f2798_local0, TARGET_ENE_0, f2798_local1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act40(_, goals, _)
    local action0 = 3008
    local action1 = 3029
    local action2 = 3020
    local action3 = 3029
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, 999, turn_time_before, front_decision_angle)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, 999)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, 999)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action3, TARGET_ENE_0, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_Act50(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 1500, TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AlonneChampion_ActAfter_AdjustSpace(arg0, goals, _)
    if arg0:GetNpcThinkParamID() == 80210000 == false then
        goals:AddSubGoal(GOAL_AlonneChampion_AfterAttackAct, 10)
    end
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, actor, goals)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5050)
    if actor:GetNpcThinkParamID() == 80210000 then
        if actor:IsInterupt(INTERUPT_ActivateSpecialEffect) then
            actor:GetDist(TARGET_ENE_0)
            local f2804_local0 = 12 - actor:GetMapHitRadius(TARGET_SELF)
            local random = actor:GetRandam_Int(1, 100)
            local f2804_local1 = actor:GetHpRate(TARGET_SELF)
            local distance = actor:GetDist(TARGET_ENE_0)
            if actor:GetSpecialEffectActivateInterruptType(0) == 5027 and InsideRange(actor, goals, 0, 120, 6.8 - actor:GetMapHitRadius(TARGET_SELF) - 1, 16.8 - actor:GetMapHitRadius(TARGET_SELF) + 1) and actor:HasSpecialEffectId(TARGET_ENE_0, 12301) == true and actor:HasSpecialEffectId(TARGET_ENE_0, 90) == true then
                if random <= 30 then
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, f2804_local0)
                    return true
                else
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, f2804_local0)
                    return true
                end
            elseif actor:GetSpecialEffectActivateInterruptType(0) == 5026 and actor:HasSpecialEffectId(TARGET_ENE_0, 90) and actor:HasSpecialEffectId(TARGET_ENE_0, 12302) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3025, TARGET_ENE_0, f2804_local0)
                return true
            elseif actor:GetSpecialEffectActivateInterruptType(0) == 90 and actor:HasSpecialEffectId(TARGET_ENE_0, 12301) == false and actor:HasSpecialEffectId(TARGET_ENE_0, 12302) == false then
                goals:ClearSubGoal()
                actor:Replaning()
                return true
            elseif actor:GetSpecialEffectActivateInterruptType(0) == 5029 and InsideRange(actor, goals, 210, 150, -99 - actor:GetMapHitRadius(TARGET_SELF) - 1, 4 - actor:GetMapHitRadius(TARGET_SELF) + 1) and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
                actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5029)
                actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 0)
                AlonneChampion_Act14(actor, goals, paramTbl)
                return true
            elseif actor:GetSpecialEffectActivateInterruptType(0) == 5030 and InsideRange(actor, goals, 0, 210, 5.5, 22 - actor:GetMapHitRadius(TARGET_SELF)) and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3020, TARGET_ENE_0, 11.5 - actor:GetMapHitRadius(TARGET_SELF))
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, 11.5 - actor:GetMapHitRadius(TARGET_SELF))
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3029, TARGET_ENE_0, 9.8 - actor:GetMapHitRadius(TARGET_SELF))
                goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 999)
                return true
            elseif actor:GetSpecialEffectActivateInterruptType(0) == 5032 and InsideRange(actor, goals, 180, 180, -99, 2) and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
                if random <= 50 then
                    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5032)
                    goals:ClearSubGoal()
                    AlonneChampion_Act13(actor, goals, paramTbl)
                    return true
                else
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3018, TARGET_ENE_0, 0)
                    return true
                end
            elseif actor:GetSpecialEffectActivateInterruptType(0) == 5050 then
                if distance <= 5 then
                    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3021, TARGET_ENE_0, 0)
                    return true
                else
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3020, TARGET_ENE_0, 0)
                    return true
                end
            end
        end
        if actor:IsInterupt(INTERUPT_FindAttack) then
            actor:GetRandam_Int(1, 100)
            local f2804_local0 = actor:GetHpRate(TARGET_SELF)
            if InsideRange(actor, goals, 0, 240, -99, 2.5) and actor:HasSpecialEffectId(TARGET_SELF, 5020) and actor:HasSpecialEffectId(TARGET_SELF, 5032) then
                goals:ClearSubGoal()
                AlonneChampion_Act17(actor, goals, paramTbl)
                return true
            end
        end
        if actor:IsInterupt(INTERUPT_TargetOutOfRange) then
            if actor:IsTargetOutOfRangeInterruptSlot(0) and InsideRange(actor, goals, 0, 120, -99 - actor:GetMapHitRadius(TARGET_SELF), 6.3 - actor:GetMapHitRadius(TARGET_SELF)) and actor:HasSpecialEffectId(TARGET_SELF, 5028) and actor:HasSpecialEffectId(TARGET_SELF, 5020) and actor:IsFinishTimer(1) == true then
                actor:SetTimer(1, 6)
                actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3021, TARGET_ENE_0, 3.8 - actor:GetMapHitRadius(TARGET_SELF))
                return true
            elseif actor:IsTargetOutOfRangeInterruptSlot(1) then
                goals:ClearSubGoal()
                actor:Replaning()
                return true
            end
        end
        if actor:IsInterupt(INTERUPT_TargetOutOfAngle) and actor:IsTargetOutOfAngleInterruptSlot(0) then
            goals:ClearSubGoal()
            actor:Replaning()
            return true
        elseif actor:IsInterupt(INTERUPT_Damaged) then
            if actor:HasSpecialEffectId(TARGET_SELF, 5025) and targetDist <= 5 then
                actor:Replaning()
                return true
            elseif InsideRange(actor, goals, 180, 150, -1, 4 - actor:GetMapHitRadius(TARGET_SELF)) then
                goals:ClearSubGoal()
                actor:Replaning()
                return true
            end
        end
        if actor:IsInterupt(INTERUPT_Inside_ObserveArea) and actor:IsInsideObserve(0) then
            goals:ClearSubGoal()
            actor:Replaning()
            actor:DeleteObserve(0)
            return true
        elseif actor:IsFinishTimer(2) == true then
            actor:GetDist(TARGET_ENE_0)
            local f2804_local0 = 5
            local random = 100
            local f2804_local1 = 12 - actor:GetMapHitRadius(TARGET_SELF)
            if GuardBreak_Act(actor, goals, f2804_local0, random) then
                if actor:HasSpecialEffectId(TARGET_SELF, 5034) == false then
                    actor:SetTimer(2, 5)
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3013, TARGET_ENE_0, 7.2 - actor:GetMapHitRadius(TARGET_SELF))
                    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3014, TARGET_ENE_0, f2804_local1)
                    return true
                elseif actor:HasSpecialEffectId(TARGET_SELF, 5034) == true and actor:HasSpecialEffectId(TARGET_SELF, 5033) == true and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
                    actor:SetTimer(2, 5)
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3027, TARGET_ENE_0, f2804_local1)
                    return true
                end
            end
            if actor:IsInterupt(INTERUPT_UseItem) and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
                if InsideRange(actor, goals, 0, 180, 10 - actor:GetMapHitRadius(TARGET_SELF) - 3, 18 - actor:GetMapHitRadius(TARGET_SELF)) then
                    actor:SetTimer(2, 5)
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 5, 3000, TARGET_ENE_0, 5)
                    AlonneChampion_Act15(actor, goals, paramTbl)
                    return true
                elseif InsideRange(actor, goals, 0, 180, 2 - actor:GetMapHitRadius(TARGET_SELF), 4.5 - actor:GetMapHitRadius(TARGET_SELF)) then
                    actor:SetTimer(2, 5)
                    goals:ClearSubGoal()
                    AlonneChampion_Act16(actor, goals, paramTbl)
                    return true
                end
            end
        end
        actor:GetRandam_Int(1, 100)
        actor:GetDist(TARGET_ENE_0)
        if actor:IsInterupt(INTERUPT_Shoot) then
            if actor:HasSpecialEffectId(TARGET_SELF, 5032) and actor:HasSpecialEffectId(TARGET_SELF, 5020) then
                if InsideRange(actor, goals, 0, 210, 5, 10) then
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6000, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 0)
                    if InsideRange(actor, goals, 0, 150, 9 - actor:GetMapHitRadius(TARGET_SELF), 22 - actor:GetMapHitRadius(TARGET_SELF)) then
                        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3020, TARGET_ENE_0, 999)
                        return true
                    end
                elseif InsideRange(actor, goals, 0, 210, 10, 18 - actor:GetMapHitRadius(TARGET_SELF)) then
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3000, TARGET_ENE_0, 999)
                    return true
                end
            elseif actor:HasSpecialEffectId(TARGET_SELF, 5025) and actor:HasSpecialEffectId(TARGET_SELF, 5020) == false then
                goals:ClearSubGoal()
                AlonneChampion_Act01(actor, goals, paramTbl)
                return true
            end
        end
    end
    return false
end

RegisterTableGoal(GOAL_AlonneChampion_AfterAttackAct, "GOAL_AlonneChampion_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_AlonneChampion_AfterAttackAct, true)

Goal.Activate = function (_, actor, goals)
    if actor:HasSpecialEffectId(TARGET_SELF, 5404) == false then
        local distance = actor:GetDist(TARGET_ENE_0)
        local random = actor:GetRandam_Int(0, 1)
        if InsideRange(actor, goals, 90, 180, -99, 5) then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, actor:GetRandam_Float(2, 3.5), TARGET_ENE_0, 1, 45, true, true, 0)
        elseif InsideRange(actor, goals, -90, 180, -99, 5) then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, actor:GetRandam_Float(2, 3.5), TARGET_ENE_0, 0, 45, true, true, 0)
        elseif distance >= 5 then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, actor:GetRandam_Float(2.5, 4.5), TARGET_ENE_0, random, 45, true, true, 0)
        end
    end
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end
