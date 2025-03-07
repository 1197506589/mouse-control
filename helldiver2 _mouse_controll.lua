--1-飞鹰500kg  2-飞鹰空袭  3-飞鹰集束  4-次抛筒子  5-增援  6-哨戒机枪  7-轨道毒气  8-空爆筒子
--9-侦察车  10-飞鹰凝固汽油弹  11-哨戒加特林  12-哨戒机炮   13-哨戒火箭炮  14-无后座  15-哨戒迫击炮
--16-机炮   17-机枪狗  18-突击兵  19-激光大炮  20-火焰哨戒炮  21-磁轨炮  22-蛋盾  23-飞鹰机枪
--24-类星体  25-反器材  26-补给背包  27-毒气狗  28-喷火器

--WPFiremod自动开火模式  1-净化者  2-爆裂铳

--setting--
local on1 = 12
local on2 = 13
local lf1 = 23
local lf2 = 14
local WPFiremod = 2
--define--
local Firemod = false
local mod = 0
EnablePrimaryMouseButtonEvents(true)
-- 主函数
function OnEvent(event, arg)
    -- 检测鼠标6键按下 打开火力模式
    if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
        Firemod = true  -- 切换模式
        OutputLogMessage("Firemod mode: on\n")
    end
     -- 检测鼠标9键按下 关闭火力模式
    if event == "MOUSE_BUTTON_PRESSED" and arg == 9 then
        Firemod = false  -- 切换模式
        OutputLogMessage("Firemod mode: off\n")
    end

    -- 如果模式1开启（净化者）
    if WPFiremod == 1 then
        if Firemod then
            if event == "MOUSE_BUTTON_PRESSED" and arg == 1 then
                if not running then  -- 防止重复触发
                    running = true
                    OutputLogMessage("Loop started\n")
                    while running do
                        PressMouseButton(1)        -- 模拟按下左键
                        OutputLogMessage("Pressed MB1\n")
                        -- 分割 1050ms 为小块，检查状态
                        for i = 1, 105 do
                            Sleep(10)
                            if not IsMouseButtonPressed(1) then running = false break end
                        end
                        if running then            -- 仅在仍运行时松开
                            ReleaseMouseButton(1)
                            OutputLogMessage("Released MB1\n")
                            -- 检查状态
                            count = 0
                            repeat
                                Sleep(10)
                                count = count + 1
                            until not IsMouseButtonPressed(1) or count >= 5
                        end
                   end
                   OutputLogMessage("Loop ended\n")
               end
           elseif event == "MOUSE_BUTTON_RELEASED" and arg == 1 then
               running = false
           end
        end
    end       
    -- 如果模式2开启（爆裂铳）
    if WPFiremod == 2 then
        if Firemod then
            if IsMouseButtonPressed(1) then
                repeat           
                    Sleep(150)
                    PressKey("2")
                    Sleep(150)
                    ReleaseKey("2")
                    Sleep(300) 
                    PressKey("1")  --爆裂铳
                    Sleep(150)
                    ReleaseKey("1")
                    PressMouseButton(1)
                    Sleep(150)
                    ReleaseMouseButton(1)
                    Sleep(150)
                until not IsMouseButtonPressed(1)         
            end
        end
    end     

        if event == "MOUSE_BUTTON_PRESSED" and arg == 3 then
            mod = 5
            OutputLogMessage("support actived \n")
        end

        if event == "MOUSE_BUTTON_PRESSED" and arg == 5 then
            mod = lf1
            OutputLogMessage("wapen 1 actived \n")
        end

        if event == "MOUSE_BUTTON_PRESSED" and arg == 4 then
            mod = lf2
            OutputLogMessage("wapen 2 actived\n")
        end

        if event == "MOUSE_BUTTON_PRESSED" and arg == 8 then
            mod = on1
            OutputLogMessage("wapen 3 actived\n")
        end

        if event == "MOUSE_BUTTON_PRESSED" and arg == 7 then
            mod = on2
            OutputLogMessage("wapen 4 actived\n")
        end

        if mod == 1 then  --飞鹰500kg
            PressKey("lctrl")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 2 then  --飞鹰空袭
            PressKey("lctrl")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 3 then  --飞鹰集束
            PressKey("lctrl")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 4 then  --次抛筒子
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end
        if mod == 5 then  --增援
            PressKey("lctrl")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 6 then  --哨戒机枪
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 7 then  --轨道毒气
            PressKey("lctrl")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 8 then  --空爆筒子
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 9 then  --侦察车
            PressKey("lctrl")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 10 then  --飞鹰凝固汽油弹
            PressKey("lctrl")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 11 then  --哨戒加特林
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 12 then  --哨戒机炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 13 then  --哨戒机炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 14 then  --无后座
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 15 then  --哨戒迫击炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0          
        end

        if mod == 16 then  --机炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 17 then  --机枪狗
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 18 then  --突击兵
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 19 then  --激光大炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 20 then  --火焰哨戒炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 21 then  --磁轨炮
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 22 then  --蛋盾
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 23 then  --飞鹰机枪
            PressKey("lctrl")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 24 then  --类星体
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 25 then  --反器材
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 26 then  --补给背包
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 27 then  --毒气狗
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("right")
            Sleep(50)
            ReleaseKey("right")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

        if mod == 28 then  --喷火器
            PressKey("lctrl")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("left")
            Sleep(50)
            ReleaseKey("left")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            PressKey("down")
            Sleep(50)
            ReleaseKey("down")
            Sleep(50)
            PressKey("up")
            Sleep(50)
            ReleaseKey("up")
            Sleep(50)
            ReleaseKey("lctrl")
            mod = 0 
        end

    
end
