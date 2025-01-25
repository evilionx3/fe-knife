-- made by evilionx3
loadstring(game:HttpGet("https://raw.githubusercontent.com/evilionx3/kawaii-magnet-part-claim-edition/refs/heads/main/discord-popup-without-webhook-cause-fuck-webhooks-i-hate-that-shit"))() -- discord invite

-- knife script
-- skidded as hell from nameless admin for walkfling and used chatgpt to play the animation
-- code will most likely look horrendous
local player = game.Players.LocalPlayer
local animationId = 96559159

-- Create and load the animation
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://" .. animationId

-- Function to create the knife tool and add it to the player's Backpack
local function createKnifeTool()
    -- Create the tool with an invisible handle
    local tool = Instance.new("Tool")
    tool.Name = "Knife Tool"
    tool.RequiresHandle = true  -- Handle is required for the tool to function

    -- Create a handle part
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 3)  -- Adjust the size to match your knife's handle
    handle.Anchored = false
    handle.CanCollide = false
    handle.Transparency = 1  -- Make the handle invisible
    handle.Parent = tool

    -- Set the tool's grip properties (for proper positioning when held)
    tool.GripForward = Vector3.new(0, 0, -1)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 1, 0)

    -- Parent the tool to the player's Backpack (for personal use)
    tool.Parent = player.Backpack

    -- Clone the tool to StarterPack so other players can access it too
    local starterPackTool = tool:Clone()
    starterPackTool.Parent = game:GetService("StarterPack")

    -- Play the animation when the tool is activated
    local humanoid = player.Character:WaitForChild("Humanoid")
    local animationTrack = humanoid:LoadAnimation(animation)

    tool.Activated:Connect(function()
        animationTrack:Play()
    end)

    return tool
end

-- Handle when the player's character respawns
player.CharacterAdded:Connect(function(newCharacter)
    -- Wait for the humanoid to be added to the new character
    local humanoid = newCharacter:WaitForChild("Humanoid")
    
    -- Create the knife tool and add it to the player's Backpack
    createKnifeTool()
end)

-- Initial creation of the knife tool when the player first joins
if player.Character then
    createKnifeTool()
end
-- Walkfling Script (Standalone)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local NA_storage = game:GetService("ReplicatedStorage") -- assuming storage is in ReplicatedStorage, adjust as needed
local hiddenfling = false

-- Function to send notifications (just a simple print for now)
local function DoNotif(message, duration)
    print(message)
    wait(duration)
end

-- Detect if Walkfling has already been initialized in storage
if NA_storage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    hiddenfling = true
else
    hiddenfling = true
    local detection = Instance.new("Decal")
    detection.Name = "juisdfj0i32i0eidsuf0iok"
    detection.Parent = NA_storage

    -- Function to apply the fling effect
    local function fling()
        local hrp, c, vel, movel = nil, nil, nil, 0.1
        while true do
            RunService.Heartbeat:Wait()

            if hiddenfling then
                local lp = Players.LocalPlayer
                -- Wait until the character and its HumanoidRootPart exist
                while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                    RunService.Heartbeat:Wait()
                    c = lp.Character
                    hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                end

                -- Apply the fling if valid parts exist
                if hiddenfling then
                    vel = hrp.Velocity
                    hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)

                    RunService.RenderStepped:Wait()
                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel
                    end

                    RunService.Stepped:Wait()
                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel + Vector3.new(0, movel, 0)
                        movel = movel * -1
                    end
                end
            end
        end
    end

    -- Notify user that Walkfling is enabled
    DoNotif("Walkfling enabled", 5)

    -- Start the fling function
    fling()
end
