-- =========================================================================
--       HỆ THỐNG GETKEY SOLIX HUB - BẢN COMPACT GỌN GÀNG CHO MOBILE/PC
-- =========================================================================

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local KeyUrl = "https://link4m.org/96zx2"
local ValidKey = "Solix-stealaneggfreemium"
local KeySavePath = "SolixHub_SavedKey.txt"

-- Hàm khởi chạy Script chính
local function LaunchMainScript()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/bao8jl/solixhub/main/loader"))()
end

-- Tự động kiểm tra Key vĩnh viễn đã lưu
if isfile and isfile(KeySavePath) then
    local saved = readfile(KeySavePath)
    if saved == ValidKey then
        LaunchMainScript()
        return
    end
end

-- Xóa UI cũ
if CoreGui:FindFirstChild("SolixHub_GetKeyUI") then
    CoreGui.SolixHub_GetKeyUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SolixHub_GetKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Khung chính: Kích thước tối ưu 390x295 (Căn giữa hoàn hảo, không bị tràn màn hình)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 390, 0, 295)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 8, 19) -- #0B0813
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Khung viền cầu vồng nháy màu chuyển động mượt
local RainbowStroke = Instance.new("UIStroke")
RainbowStroke.Thickness = 1.8
RainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
RainbowStroke.Parent = MainFrame

RunService.RenderStepped:Connect(function()
    local hue = (tick() * 0.2) % 1
    RainbowStroke.Color = Color3.fromHSV(hue, 0.75, 1)
end)

-- Tiêu đề chính
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -30, 0, 22)
TitleLabel.Position = UDim2.new(0, 15, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "★ HỆ THỐNG GETKEY SOLIX HUB ★"
TitleLabel.TextColor3 = Color3.fromRGB(245, 245, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame

-- Ô nhập Key gọn gàng
local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -30, 0, 36)
InputBox.Position = UDim2.new(0, 15, 0, 36)
InputBox.BackgroundColor3 = Color3.fromRGB(22, 18, 36) -- #161224
InputBox.TextColor3 = Color3.fromRGB(245, 245, 255)
InputBox.PlaceholderColor3 = Color3.fromRGB(120, 115, 140)
InputBox.PlaceholderText = "Nhập Key xác thực vào đây..."
InputBox.Text = ""
InputBox.TextSize = 12
InputBox.Font = Enum.Font.GothamMedium
InputBox.ClearTextOnFocus = false
InputBox.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputBox

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(45, 38, 70)
InputStroke.Thickness = 1
InputStroke.Parent = InputBox

-- Hàng chứa 2 nút bấm song song (Tiết kiệm tối đa chiều dọc)
local ButtonsRow = Instance.new("Frame")
ButtonsRow.Size = UDim2.new(1, -30, 0, 36)
ButtonsRow.Position = UDim2.new(0, 15, 0, 78)
ButtonsRow.BackgroundTransparency = 1
ButtonsRow.Parent = MainFrame

-- Nút GET KEY (Cyan Neon #00F0FF)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.5, -5, 1, 0)
GetKeyBtn.Position = UDim2.new(0, 0, 0, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
GetKeyBtn.Text = "🔗 LẤY LINK KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(8, 8, 12)
GetKeyBtn.TextSize = 12
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.Parent = ButtonsRow

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

-- Nút KIỂM TRA KEY
local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Size = UDim2.new(0.5, -5, 1, 0)
CheckKeyBtn.Position = UDim2.new(0.5, 5, 0, 0)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(38, 30, 62)
CheckKeyBtn.Text = "✔ KIỂM TRA KEY"
CheckKeyBtn.TextColor3 = Color3.fromRGB(245, 245, 255)
CheckKeyBtn.TextSize = 12
CheckKeyBtn.Font = Enum.Font.GothamBold
CheckKeyBtn.AutoButtonColor = false
CheckKeyBtn.Parent = ButtonsRow

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = CheckKeyBtn

-- Thanh trạng thái & Hướng dẫn (Gọn gàng)
local StatusBanner = Instance.new("Frame")
StatusBanner.Size = UDim2.new(1, -30, 0, 24)
StatusBanner.Position = UDim2.new(0, 15, 0, 120)
StatusBanner.BackgroundColor3 = Color3.fromRGB(16, 12, 28)
StatusBanner.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 6)
StatusCorner.Parent = StatusBanner

local StatusMsg = Instance.new("TextLabel")
StatusMsg.Size = UDim2.new(1, -10, 1, 0)
StatusMsg.Position = UDim2.new(0, 5, 0, 0)
StatusMsg.BackgroundTransparency = 1
StatusMsg.Text = "⚡ Nhấn 'LẤY LINK KEY' để sao chép link"
StatusMsg.TextColor3 = Color3.fromRGB(180, 175, 205)
StatusMsg.TextSize = 10.5
StatusMsg.Font = Enum.Font.GothamMedium
StatusMsg.Parent = StatusBanner

-- Card Lưu ý bên dưới (Vàng đỏ dịu mắt, không lãng phí khoảng trống)
local NoteCard = Instance.new("Frame")
NoteCard.Size = UDim2.new(1, -30, 0, 135)
NoteCard.Position = UDim2.new(0, 15, 0, 149)
NoteCard.BackgroundColor3 = Color3.fromRGB(17, 13, 29)
NoteCard.Parent = MainFrame

local NoteCardCorner = Instance.new("UICorner")
NoteCardCorner.CornerRadius = UDim.new(0, 8)
NoteCardCorner.Parent = NoteCard

local NoteStroke = Instance.new("UIStroke")
NoteStroke.Color = Color3.fromRGB(55, 40, 45)
NoteStroke.Thickness = 1
NoteStroke.Parent = NoteCard

local NoteLabel = Instance.new("TextLabel")
NoteLabel.Size = UDim2.new(1, -16, 1, -10)
NoteLabel.Position = UDim2.new(0, 8, 0, 5)
NoteLabel.BackgroundTransparency = 1
NoteLabel.TextColor3 = Color3.fromRGB(242, 160, 120) -- Vàng đỏ nhẹ, êm mắt
NoteLabel.TextSize = 10
NoteLabel.Font = Enum.Font.Gotham
NoteLabel.TextWrapped = true
NoteLabel.TextYAlignment = Enum.TextYAlignment.Top
NoteLabel.TextXAlignment = Enum.TextXAlignment.Left
NoteLabel.Text = "📌 Lưu ý:\n• script chỉ nokey trong 2 tiếng từ khi video được đăng lên đã quá 2 tiếng kể từ khi video được đăng lên nên mình xin phép được thêm key vào nhé\n• Việc lấy Key Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!\n• Tự động lưu key vĩnh viễn ∞ sau khi xác thực."
NoteLabel.Parent = NoteCard

-- =========================================================================
--                     HIỆU ỨNG NẢY NÚT & LOGIC TƯƠNG TÁC
-- =========================================================================

local function PlayBounce(btn)
    local origSize = btn.Size
    local origPos = btn.Position
    local shrinkSize = UDim2.new(origSize.X.Scale, origSize.X.Offset - 4, origSize.Y.Scale, origSize.Y.Offset - 4)
    local shrinkPos = UDim2.new(origPos.X.Scale, origPos.X.Offset + 2, origPos.Y.Scale, origPos.Y.Offset + 2)
    
    local t1 = TweenService:Create(btn, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = shrinkSize, Position = shrinkPos})
    local t2 = TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = origSize, Position = origPos})
    
    t1:Play()
    t1.Completed:Connect(function() t2:Play() end)
end

local function SetClipboardSafe(text)
    if setclipboard then
        setclipboard(text)
    elseif toclipboard then
        toclipboard(text)
    end
end

-- Tương tác nút LẤY LINK
GetKeyBtn.MouseButton1Click:Connect(function()
    PlayBounce(GetKeyBtn)
    SetClipboardSafe(KeyUrl)
    
    StatusBanner.BackgroundColor3 = Color3.fromRGB(0, 50, 60)
    StatusMsg.TextColor3 = Color3.fromRGB(0, 240, 255)
    StatusMsg.Text = "📋 Đã sao chép! Hãy dán lên trình duyệt để getkey."
    
    GetKeyBtn.Text = "✔ ĐÃ SAO CHÉP"
    task.delay(2, function()
        if GetKeyBtn and GetKeyBtn.Parent then
            GetKeyBtn.Text = "🔗 LẤY LINK KEY"
        end
    end)
end)

-- Tương tác nút KIỂM TRA KEY
local isChecking = false
CheckKeyBtn.MouseButton1Click:Connect(function()
    if isChecking then return end
    isChecking = true
    PlayBounce(CheckKeyBtn)
    
    CheckKeyBtn.Text = "⏳ Đang duyệt..."
    StatusBanner.BackgroundColor3 = Color3.fromRGB(26, 20, 45)
    StatusMsg.TextColor3 = Color3.fromRGB(240, 240, 255)
    StatusMsg.Text = "Đang kiểm tra key..."
    
    task.wait(0.4)
    local enteredKey = string.gsub(InputBox.Text, "%s+", "")
    
    if enteredKey == ValidKey then
        StatusBanner.BackgroundColor3 = Color3.fromRGB(15, 60, 30)
        StatusMsg.TextColor3 = Color3.fromRGB(80, 255, 140)
        StatusMsg.Text = "✔ Key đúng! Đang mở Solix Hub..."
        CheckKeyBtn.Text = "✔ THÀNH CÔNG"
        CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 70)
        
        if writefile then
            writefile(KeySavePath, ValidKey)
        end
        
        task.wait(0.6)
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 1.2, 0),
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.3)
        ScreenGui:Destroy()
        LaunchMainScript()
    else
        isChecking = false
        CheckKeyBtn.Text = "✔ KIỂM TRA KEY"
        StatusBanner.BackgroundColor3 = Color3.fromRGB(60, 15, 20)
        StatusMsg.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusMsg.Text = "✖ Key sai! Hãy thử lại."
        
        InputStroke.Color = Color3.fromRGB(255, 70, 70)
        task.wait(0.5)
        InputStroke.Color = Color3.fromRGB(45, 38, 70)
    end
end)
