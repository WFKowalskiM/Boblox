local u = game:GetService("UserInputService")
print("Hello there")
local store = game:GetService("ReplicatedStorage")
print("Hello there")
local me = game:GetService("Players").LocalPlayer
print("Hello there")
local value1 = me.Stats.Skill1.cooldown
local value2 = me.Stats.Skill2.cooldown
local value3 = me.Stats.Skill3.cooldown
print("Hello there")
local loopy = false
print("Hello there")

syn.queue_on_teleport[[
repeat wait() until game:IsLoaded()
wait(5)
print('Loading scripto')
loadstring(game:HttpGet('https://raw.githubusercontent.com/WFKowalskiM/Boblox/main/project.lua', true))()]]

function attack()
    store.Events.attack:FireServer("Slash")
end

u.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.L then
			loopy = not loopy
		elseif input.KeyCode == Enum.KeyCode.J then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight + 1
		elseif input.KeyCode == Enum.KeyCode.K then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight - 1
		elseif input.KeyCode == Enum.KeyCode.N then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight + 10
		elseif input.KeyCode == Enum.KeyCode.M then
		    me.Character.Humanoid.HipHeight = me.Character.Humanoid.HipHeight - 10
		end
end
end)


value1:GetPropertyChangedSignal("Value"):Connect(function()
    if loopy then 
        if value1.Value == 0 then
            store.Events.attack:FireServer("Skill", "Skill1", "Attack")
        end
    end
end)
value2:GetPropertyChangedSignal("Value"):Connect(function()
    if loopy then 
        if value2.Value == 0 then
            store.Events.attack:FireServer("Skill", "Skill2", "Attack")
        end
    end
end)
value3:GetPropertyChangedSignal("Value"):Connect(function()
    if loopy then 
        if value3.Value == 0 then
            store.Events.attack:FireServer("Skill", "Skill3", "Attack")
        end
    end
end)

print("General Kenobi")
while(task.wait(2)) do
    while(loopy) do
        task.wait(0.3)
        attack()
    end
end
