local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)

    local mess = message.content

    if string.match(mess, "=g") then

        local setback = tonumber(string.match(mess, "s(%d+)"))

        if setback == nill then
            setback = tonumber(string.match(mess, "(%d+)s"))
        end

        local boost = tonumber(string.match(mess, "b(%d+)"))

        if boost == nill then
            boost = tonumber(string.match(mess, "(%d+)b"))
        end

        local ability = tonumber(string.match(mess, "a(%d+)"))

        if ability == nill then
            ability = tonumber(string.match(mess, "(%d+)a"))
        end

        local proficiency = tonumber(string.match(mess, "p(%d+)"))

        if proficiency == nill then
            proficiency = tonumber(string.match(mess, "(%d+)p"))
        end

        local dificulity = tonumber(string.match(mess, "d(%d+)"))

        if dificulity == nill then
            dificulity = tonumber(string.match(mess, "(%d+)d"))
        end

        local challenge = tonumber(string.match(mess, "c(%d+)"))

        if challenge == nill then
            challenge = tonumber(string.match(mess, "(%d+)c"))
        end

        local succes = 0
        local advantage = 0
        local failure = 0
        local threat = 0
        local triumph = 0
        local despair = 0

        local Wsucces = 0
        local Wadvantage = 0
        local Wfailure = 0
        local Wthreat = 0
        local Wtriumph = 0
        local Wdespair = 0

        if ability~=nill or proficiency~=nill or boost~=nill or dificulity~=nill or challenge~=nill or setback~=nill then
        if ability~=nill then
        local i = 1
            while i<=ability do
                local Wa = math.random(8)
                if Wa==1 then
                    succes = succes+0
                elseif Wa==2 then
                    succes = succes+1
                elseif Wa==3 then
                    succes = succes+1
                elseif Wa==4 then
                    succes = succes+2
                elseif Wa==5 then
                    advantage = advantage+1
                elseif Wa==6 then
                    advantage = advantage+1
                elseif Wa==7 then
                    advantage = advantage+1
                    succes = succes+1
                elseif Wa==8 then
                    advantage = advantage+2
                else
                    print("błąd")
                end

            i = i + 1

        end
        end
    if dificulity~=nill then
        local i = 1
            while i<=dificulity do
                local Wd = math.random(8)
                if Wd==1 then
                    failure = failure+0
                elseif Wd==2 then
                    failure = failure+1
                elseif Wd==3 then
                    failure = failure+2
                elseif Wd==4 then
                    threat = threat+1
                elseif Wd==5 then
                    threat = threat+1
                elseif Wd==6 then
                    threat = threat+1
                elseif Wd==7 then
                    threat = threat+2
                elseif Wd==8 then
                    failure = failure+1
                    threat = threat+1
                else
                    print("błąd")
                end

            i = i + 1

        end
    end
    if boost~=nill then
        local i = 1
            while i<=boost do
                local Wb = math.random(6)
                if Wb==1 then
                    succes = succes+0
                elseif Wb==2 then
                    succes = succes+0
                elseif Wb==3 then
                    succes = succes+1
                elseif Wb==4 then
                    succes = succes+1
                    advantage = advantage+1
                elseif Wb==5 then
                    advantage = advantage+2
                elseif Wb==6 then
                    advantage = advantage+1
                else
                    print("błąd")
                end

            i = i + 1

            end
    end
    if setback~=nill then
        local i = 1
            while i<=setback do
                local Ws = math.random(6)
                if Ws==1 then
                    failure = failure+0
                elseif Ws==2 then
                    failure = failure+0
                elseif Ws==3 then
                    failure = failure+1
                elseif Ws==4 then
                    failure = failure+1
                elseif Ws==5 then
                    threat = threat+1
                elseif Ws==6 then
                    threat = threat+1
                else
                    print("błąd")
                end

            i = i + 1

        end
    end
    if proficiency~=nill then
        local i = 1
            while i<=proficiency do
                local Wp = math.random(12)
                if Wp==1 then
                    succes = succes+0
                elseif Wp==2 then
                    succes = succes+1
                elseif Wp==3 then
                    succes = succes+1
                elseif Wp==4 then
                    succes = succes+2
                elseif Wp==5 then
                    succes = succes+2
                elseif Wp==6 then
                    advantage = advantage+1
                elseif Wp==7 then
                    succes = succes+1
                    advantage = advantage+1
                elseif Wp==8 then
                    succes = succes+1
                    advantage = advantage+1
                elseif Wp==9 then
                    succes = succes+1
                    advantage = advantage+1
                elseif Wp==10 then
                    advantage = advantage+2
                elseif Wp==11 then
                    advantage = advantage+2
                elseif Wp==12 then
                    triumph = triumph+1
                else
                    print("błąd")
                end

            i = i + 1

        end
    end
    if challenge~=nill then
        local i = 1
            while i<=challenge do
                local Wc = math.random(12)
                if Wc==1 then
                    failure = failure+0
                elseif Wc==2 then
                    failure = failure+1
                elseif Wc==3 then
                    failure = failure+1
                elseif Wc==4 then
                    failure = failure+2
                elseif Wc==5 then
                    failure = failure+2
                elseif Wc==6 then
                    threat = threat+1
                elseif Wc==7 then
                    threat = threat+1
                elseif Wc==8 then
                    failure = failure+1
                    threat = threat+1
                elseif Wc==9 then
                    failure = failure+1
                    threat = threat+1
                elseif Wc==10 then
                    threat = threat+2
                elseif Wc==11 then
                    threat = threat+2
                elseif Wc==12 then
                    despair = despair+1
                else
                    print("błąd")
                end

            i = i + 1

        end
    end
    if succes>=failure and advantage>=threat then
        Wsucces = succes - failure
        Wadvantage = advantage - threat
        message.channel:send("Success: "..succes.."   ".."Failure: "..failure.."\n".."Advantages: "..advantage.."   ".."Threats: "..threat.."\n".."----------------------------------------\n".."**Success: "..Wsucces..", Advantages: "..Wadvantage..", Triumphs: "..triumph..", Despairs: "..despair.."**")
    elseif succes>=failure and threat>advantage then
        Wsucces = succes - failure
        Wthreat = threat - advantage
        message.channel:send("Success: "..succes.."   ".."Failure: "..failure.."\n".."Advantages: "..advantage.."   ".."Threats: "..threat.."\n".."----------------------------------------\n".."**Success: "..Wsucces..", Threats: "..Wthreat..", Triumphs: "..triumph..", Despairs: "..despair.."**")
    elseif failure>succes and threat>advantage then
        Wfailure = failure - succes
        Wthreat = threat - advantage
        message.channel:send("Success: "..succes.."   ".."Failure: "..failure.."\n".."Advantages: "..advantage.."   ".."Threats: "..threat.."\n".."----------------------------------------\n".."**Failures: "..Wfailure..", Threats: "..Wthreat..", Triumphs: "..triumph..", Despairs: "..despair.."**")
    elseif failure>succes and advantage>=threat then
            Wfailure = failure - succes
            Wadvantage = advantage - threat
            message.channel:send("Success: "..succes.."   ".."Failure: "..failure.."\n".."Advantages: "..advantage.."   ".."Threats: "..threat.."\n".."----------------------------------------\n".."**Failures: "..Wfailure..", Advantages: "..Wadvantage..", Triumphs: "..triumph..", Despairs: "..despair.."**")
        else
            print("błąd")
    end
    else
        message.channel:send("*Number of dice is incorrect*")
        end
    end
end)

client:run('Bot '..BOT_TOKEN)
