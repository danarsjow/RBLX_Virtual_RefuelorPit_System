local maxFuel = 35 --Liters of fuel

local car = script.Parent.Parent
local fuel = car:FindFirstChild('Fuel') or Instance.new('NumberValue', car)
fuel.Name = 'Fuel'
fuel.Value = maxFuel

script.Parent.OnServerEvent:Connect(function(plr, amount)
	if amount then
		fuel.Value = fuel.Value - amount
	else
		script.Parent:FireClient(plr, fuel.Value)
	end
end)

fuel.Changed:Connect(function(val)
	if car.DriveSeat.Occupant then
		script.Parent:FireClient(game.Players:GetPlayerFromCharacter(car.DriveSeat.Occupant.Parent), fuel.Value)
	end
end)