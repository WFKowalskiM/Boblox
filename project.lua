local u = game:GetService("UserInputService")
local store = game:GetService("ReplicatedStorage")
local me = game:GetService("Players").LocalPlayer
local value1 = me.Stats.Skill1.cooldown
local value2 = me.Stats.Skill2.cooldown
local value3 = me.Stats.Skill3.cooldown
local loopattack = false
local loopskills = true
local bb = game:GetService("VirtualUser")
print("Hello there")

syn.queue_on_teleport[[
repeat wait() until game:IsLoaded()
wait(5)
print('Loading scripto')
loadstring(game:HttpGet('https://raw.githubusercontent.com/WFKowalskiM/Boblox/main/project.lua', true))()]]

function attack()
    store.Events.attack:FireServer("Slash")
end

game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
wait(2)
end)

u.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.L then
			loopattack = not loopattack
		elseif input.KeyCode == Enum.KeyCode.O then
		    loopskills = not loopskills
		elseif input.KeyCode == Enum.KeyCode.J then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight + 1
		elseif input.KeyCode == Enum.KeyCode.K then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight - 1
		elseif input.KeyCode == Enum.KeyCode.N then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight + 10
		elseif input.KeyCode == Enum.KeyCode.M then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight - 10
		elseif input.KeyCode == Enum.KeyCode.V then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight + 80	
		elseif input.KeyCode == Enum.KeyCode.B then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight - 80
		end
end
end)


value1:GetPropertyChangedSignal("Value"):Connect(function()
    if loopskills then 
        if value1.Value == 0 then
	    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight - 60
		task.wait(0.5)
            store.Events.attack:FireServer("Skill", "Skill1", "Attack")
		task.wait(0.5)
	    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight + 60
        end
    end
end)
value2:GetPropertyChangedSignal("Value"):Connect(function()
    if loopskills then 
        if value2.Value == 0 then
            store.Events.attack:FireServer("Skill", "Skill2", "Attack")
        end
    end
end)
value3:GetPropertyChangedSignal("Value"):Connect(function()
    if loopskills then 
        if value3.Value == 0 then
            store.Events.attack:FireServer("Skill", "Skill3", "Attack")
        end
    end
end)

print("General Kenobi")
while(task.wait(2)) do
    while(loopattack) do
        task.wait(0.3)
        attack()
    end
end
