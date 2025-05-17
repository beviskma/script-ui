local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)

local usernameLabel = Instance.new("TextLabel", screenGui)
usernameLabel.Position = UDim2.new(0, 10, 0, 10)
usernameLabel.Size = UDim2.new(0, 200, 0, 30)
usernameLabel.Text = "Username: " .. player.Name
usernameLabel.TextColor3 = Color3.new(1, 1, 1)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.SourceSansBold
usernameLabel.TextSize = 24

local fpsLabel = Instance.new("TextLabel", screenGui)
fpsLabel.Position = UDim2.new(0, 10, 0, 50)
fpsLabel.Size = UDim2.new(0, 200, 0, 30)
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextSize = 24

local runService = game:GetService("RunService")
local lastTime = tick()
local frameCount = 0

runService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        fpsLabel.Text = "FPS: " .. frameCount
        frameCount = 0
        lastTime = currentTime
    end
end)
