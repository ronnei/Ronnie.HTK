local sg = Instance.new("ScreenGui")
sg.Name = "RonneiNoKeyUI"
sg.ResetOnSpawn = false
sg.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 150)
frame.Position = UDim2.new(0.5, -175, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(15, 12, 28)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(0, 240, 255)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.35, 0)
label.Position = UDim2.new(0, 0, 0.1, 0)
label.BackgroundTransparency = 1
label.Text = "TIKTOK: ronnei7.htk"
label.TextColor3 = Color3.fromRGB(0, 255, 255)
label.Font = Enum.Font.GothamBold
label.TextSize = 22
label.TextStrokeTransparency = 0.5
label.Parent = frame

local noteLabel = Instance.new("TextLabel")
noteLabel.Size = UDim2.new(1, -20, 0.25, 0)
noteLabel.Position = UDim2.new(0, 10, 0.45, 0)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "script nokey mà chưa follow à :))"
noteLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
noteLabel.Font = Enum.Font.GothamMedium
noteLabel.TextSize = 15
noteLabel.TextWrapped = true
noteLabel.TextStrokeTransparency = 0.8
noteLabel.Parent = frame

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 0.2, 0)
timerLabel.Position = UDim2.new(0, 0, 0.75, 0)
timerLabel.BackgroundTransparency = 1
timerLabel.Text = "Khởi chạy sau 10 giây..."
timerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
timerLabel.Font = Enum.Font.Gotham
timerLabel.TextSize = 12
timerLabel.Parent = frame

-- Hiệu ứng viền đổi màu Neon
task.spawn(function()
    local counter = 0
    while sg and sg.Parent do
        counter = counter + 0.01
        stroke.Color = Color3.fromHSV(counter % 1, 0.9, 1)
        task.wait(0.01)
    end
end)

-- Đếm ngược 10 giây
for i = 10, 1, -1 do
    timerLabel.Text = "🔥 Khởi chạy sau " .. i .. " giây..."
    task.wait(1)
end

timerLabel.Text = "Đang tải Script..."

-- Hiệu ứng mờ dần (Fade out)
for opacity = 0, 1, 0.1 do
    frame.BackgroundTransparency = opacity
    label.TextTransparency = opacity
    noteLabel.TextTransparency = opacity
    timerLabel.TextTransparency = opacity
    stroke.Transparency = opacity
    task.wait(0.02)
end

sg:Destroy()

-- ==========================================
-- KHỞI CHẠY SCRIPT SOLIX HUB
-- ==========================================
loadstring(game:HttpGet("https://raw.githubusercontent.com/bao8jl/solixhub/main/loader"))()
