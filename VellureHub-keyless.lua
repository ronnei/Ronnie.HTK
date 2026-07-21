-- [[ HỆ THỐNG GETKEY VELLURE HUB ]] --

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local parentUI = nil
local success, err = pcall(function()
    parentUI = CoreGui
end)
if not success or not parentUI then
    parentUI = LocalPlayer:WaitForChild("PlayerGui")
end

-- Xóa UI cũ nếu đang tồn tại
if parentUI:FindFirstChild("VellureHub_GetKey_System") then
    parentUI["VellureHub_GetKey_System"]:Destroy()
end

-- Hàm giải mã Hex bảo mật
local function decode(hex)
    local str = ""
    for i = 1, #hex, 2 do
        str = str .. string.char(tonumber(string.sub(hex, i, i+1), 16))
    end
    return str
end

-- Dữ liệu bảo mật (Đã mã hóa Hex)
local enc_key = "526f6e6e656948544b2d37475830" -- Key: RonneiHTK-7GX0
local enc_link = "68747470733a2f2f6c696e6b346d2e6e65742f3259583658" -- Link: https://link4m.net/2YX6X
local enc_script = "68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f4e79786153796c70682f56656c6c7572652f726566732f68656164732f6d61696e2f4c6f61646572" -- Loader Script

-- Tạo UI chính
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VellureHub_GetKey_System"
ScreenGui.Parent = parentUI
ScreenGui.ResetOnSpawn = false

-- Thông báo nổi (Notification) phông chữ rõ nét màu đỏ nhẹ
local function showNotify(text)
    local NotifyGui = Instance.new("ScreenGui")
    NotifyGui.Name = "VellureNotify"
    NotifyGui.Parent = parentUI
    
    local Label = Instance.new("TextLabel")
    Label.Parent = NotifyGui
    Label.Size = UDim2.new(0, 400, 0, 50)
    Label.Position = UDim2.new(0.5, -200, 0.18, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 110, 110) -- Màu đỏ nhẹ rõ nét
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 18
    Label.TextStrokeTransparency = 0.2
    Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    task.spawn(function()
        task.wait(3.5)
        NotifyGui:Destroy()
    end)
end

-- Khung Menu chính
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#0B0E14") -- Đen ánh xanh dương đậm
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -145)
MainFrame.Size = UDim2.new(0, 350, 0, 290)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Color = Color3.fromHex("#3A8DFF")
UIStroke.Transparency = 0.4
UIStroke.Parent = MainFrame

-- Tiêu đề Menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "Hệ Thống GetKey Vellure Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1

-- Ô nhập Key (Khung phụ)
local KeyInput = Instance.new("TextBox")
KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = "Nhập key tại đây..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromHex("#171B26") -- Xám xanh dương
KeyInput.Position = UDim2.new(0.08, 0, 0.18, 0)
KeyInput.Size = UDim2.new(0.84, 0, 0, 36)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 13

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = KeyInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromHex("#2A3142")
InputStroke.Parent = KeyInput

-- Nút GET KEY VĨNH VIỄN (Chuyển sắc Gradient)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Parent = MainFrame
GetKeyBtn.Text = "GET KEY VĨNH VIỄN"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 12
GetKeyBtn.TextColor3 = Color3.fromHex("#050811") -- Chữ xanh đen siêu tối
GetKeyBtn.Position = UDim2.new(0.08, 0, 0.35, 5)
GetKeyBtn.Size = UDim2.new(0.84, 0, 0, 34)

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = GetKeyBtn

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromHex("#3A8DFF")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#82C2FF"))
}
Gradient.Parent = GetKeyBtn

-- Nút XÁC NHẬN KEY
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = MainFrame
SubmitBtn.Text = "XÁC NHẬN KEY"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextColor3 = Color3.fromHex("#0B0E14")
SubmitBtn.Position = UDim2.new(0.08, 0, 0.51, 10)
SubmitBtn.Size = UDim2.new(0.84, 0, 0, 36)

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitBtn

-- Chữ Note nhỏ ở dưới (Màu vàng đỏ nhẹ)
local NoteLabel = Instance.new("TextLabel")
NoteLabel.Parent = MainFrame
NoteLabel.Text = "Việc lấy ( Key )giúp mình có thêm chút chi phí để duy trì và cập nhật script mỗi ngày. Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!"
NoteLabel.Font = Enum.Font.GothamMedium
NoteLabel.TextColor3 = Color3.fromHex("#E08B46") -- Màu vàng đỏ nhẹ
NoteLabel.Position = UDim2.new(0.06, 0, 0.71, 5)
NoteLabel.Size = UDim2.new(0.88, 0, 0, 65)
NoteLabel.BackgroundTransparency = 1
NoteLabel.TextWrapped = true
NoteLabel.TextYAlignment = Enum.TextYAlignment.Top
NoteLabel.TextSize = 10

-- Logic sao chép link khi bấm nút GET KEY
GetKeyBtn.MouseButton1Click:Connect(function()
    local textBefore = GetKeyBtn.Text
    GetKeyBtn.Text = "ĐÃ SAO CHÉP LINK!"
    
    setclipboard(decode(enc_link))
    showNotify("dán lên trình duyệt để getkey")
    
    task.wait(2)
    GetKeyBtn.Text = textBefore
end)

-- Logic kiểm tra Key và nạp Loader Script
SubmitBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text
    local correctKey = decode(enc_key)
    
    if input == correctKey then
        SubmitBtn.Text = "KÍCH HOẠT THÀNH CÔNG!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.wait(1)
        ScreenGui:Destroy()
        
        -- Khởi chạy script Blox tổng hợp (Vellure Hub Loader)
        local scriptUrl = decode(enc_script)
        local success, runErr = pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
        if not success then
            warn("Lỗi khi tải script chính: " .. tostring(runErr))
        end
    else
        SubmitBtn.Text = "SAI KEY! VUI LÒNG THỬ LẠI"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.wait(2)
        SubmitBtn.Text = "XÁC NHẬN KEY"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SubmitBtn.TextColor3 = Color3.fromHex("#0B0E14")
    end
end)
