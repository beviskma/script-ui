local player = game.Players.LocalPlayer
local gui = script.Parent  -- Đảm bảo LocalScript nằm trong NotificationFrame

-- Lấy các thành phần giao diện
local usernameLabel = gui:WaitForChild("UsernameLabel")
local taskLabel = gui:WaitForChild("TaskLabel")
local timeFpsLabel = gui:WaitForChild("TimeFpsLabel")
local jobIdLabel = gui:WaitForChild("JobIdLabel")
local logoImage = gui:WaitForChild("LogoImage")

-- Thiết lập logo
logoImage.Image = "rbxassetid://1234567890"  -- Đổi ID này thành logo Jogbeviss bạn upload
logoImage.BackgroundTransparency = 1
logoImage.ScaleType = Enum.ScaleType.Fit

-- Hiển thị tên người chơi
usernameLabel.Text = "Username: " .. player.Name

-- Lấy task từ StringValue
local taskValue = player:FindFirstChild("CurrentTask")
if taskValue then
	taskLabel.Text = "Task: " .. taskValue.Value
else
	taskLabel.Text = "Task: Unknown"
end

-- Đồng hồ thời gian & FPS (giả lập đơn giản)
local startTime = tick()

game:GetService("RunService").RenderStepped:Connect(function()
	local currentTime = math.floor(tick() - startTime)
	local minutes = math.floor(currentTime / 60)
	local seconds = currentTime % 60
	local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
	timeFpsLabel.Text = string.format("Time: %dm %ds - FPS: %d", minutes, seconds, fps)
end)

-- Gán jobId nếu có
jobIdLabel.Text = "Job Id: " .. (game.JobId ~= "" and game.JobId or "N/A")
