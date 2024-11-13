-- Load the Discordia library
local discordia = require('discordia')
local client = discordia.Client()

-- Prompt the user to enter the bot token
io.write("Please enter your bot token: ")
local token = io.read("*l")  -- Read the token input from the user

-- Event listener for when the bot is ready
client:on('ready', function()
	print('Logged in as ' .. client.user.username)
end)

-- Event listener for new messages
client:on('messageCreate', function(message)
    local mess = message.content  -- Store the message content for easier access

    -- Check if the message starts with "=g" to trigger the dice rolling logic
    if string.match(mess, "=g") then

        -- Parse each type of dice from the message, using patterns to capture numbers
        local setback = tonumber(string.match(mess, "s(%d+)"))
        if setback == nil then
            setback = tonumber(string.match(mess, "(%d+)s"))
        end

        local boost = tonumber(string.match(mess, "b(%d+)"))
        if boost == nil then
            boost = tonumber(string.match(mess, "(%d+)b"))
        end

        local ability = tonumber(string.match(mess, "a(%d+)"))
        if ability == nil then
            ability = tonumber(string.match(mess, "(%d+)a"))
        end

        local proficiency = tonumber(string.match(mess, "p(%d+)"))
        if proficiency == nil then
            proficiency = tonumber(string.match(mess, "(%d+)p"))
        end

        local difficulty = tonumber(string.match(mess, "d(%d+)"))
        if difficulty == nil then
            difficulty = tonumber(string.match(mess, "(%d+)d"))
        end

        local challenge = tonumber(string.match(mess, "c(%d+)"))
        if challenge == nil then
            challenge = tonumber(string.match(mess, "(%d+)c"))
        end

        -- Initialize counters for outcomes (successes, failures, etc.)
        local success = 0
        local advantage = 0
        local failure = 0
        local threat = 0
        local triumph = 0
        local despair = 0

        -- Variables to store final results after calculations
        local Wsuccess = 0
        local Wadvantage = 0
        local Wfailure = 0
        local Wthreat = 0

        -- Check if any dice types were provided
        if ability or proficiency or boost or difficulty or challenge or setback then
            -- Process ability dice if provided
            if ability then
                for i = 1, ability do
                    local roll = math.random(8)  -- Roll a d8 for ability dice
                    if roll == 2 or roll == 3 then
                        success = success + 1
                    elseif roll == 4 then
                        success = success + 2
                    elseif roll == 5 or roll == 6 then
                        advantage = advantage + 1
                    elseif roll == 7 then
                        success = success + 1
                        advantage = advantage + 1
                    elseif roll == 8 then
                        advantage = advantage + 2
                    end
                end
            end

            -- Process difficulty dice if provided
            if difficulty then
                for i = 1, difficulty do
                    local roll = math.random(8)  -- Roll a d8 for difficulty dice
                    if roll == 2 then
                        failure = failure + 1
                    elseif roll == 3 then
                        failure = failure + 2
                    elseif roll == 4 or roll == 5 or roll == 6 then
                        threat = threat + 1
                    elseif roll == 7 then
                        threat = threat + 2
                    elseif roll == 8 then
                        failure = failure + 1
                        threat = threat + 1
                    end
                end
            end

            -- Process other dice types (boost, setback, proficiency, and challenge) similarly
            -- Use similar `for` loops and conditions based on the roll results for each die type

            -- Calculate final results by comparing successes, failures, advantages, and threats
            if success >= failure and advantage >= threat then
                Wsuccess = success - failure
                Wadvantage = advantage - threat
                message.channel:send("**Success: " .. Wsuccess .. ", Advantages: " .. Wadvantage .. ", Triumphs: " .. triumph .. ", Despairs: " .. despair .. "**")
            elseif success >= failure then
                Wsuccess = success - failure
                Wthreat = threat - advantage
                message.channel:send("**Success: " .. Wsuccess .. ", Threats: " .. Wthreat .. ", Triumphs: " .. triumph .. ", Despairs: " .. despair .. "**")
            elseif failure > success and threat > advantage then
                Wfailure = failure - success
                Wthreat = threat - advantage
                message.channel:send("**Failures: " .. Wfailure .. ", Threats: " .. Wthreat .. ", Triumphs: " .. triumph .. ", Despairs: " .. despair .. "**")
            else
                Wfailure = failure - success
                Wadvantage = advantage - threat
                message.channel:send("**Failures: " .. Wfailure .. ", Advantages: " .. Wadvantage .. ", Triumphs: " .. triumph .. ", Despairs: " .. despair .. "**")
            end
        else
            -- Send an error message if no dice were provided
            message.channel:send("*Number of dice is incorrect*")
        end
    end
end)

-- Run the bot using the provided token
client:run('Bot ' .. token)
