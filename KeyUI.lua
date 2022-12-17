local Keysys = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserId = game.Players.LocalPlayer.UserId
local uneverseId = game.GameId

local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/NotifyLib.lua"))()

local KeyUI = game:GetObjects("rbxassetid://11785006560")[1]

if gethui then
    KeyUI.Parent = gethui()
elseif syn.protect_gui then
    syn.protect_gui(KeyUI)
    KeyUI.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
    KeyUI.Parent = CoreGui:FindFirstChild("RobloxGui")
else
    KeyUI.Parent = CoreGui
end

local KeyMain = KeyUI.Main

local KeyMain = KeyUI.Main

local CheckKeyChild = KeyMain:WaitForChild("CheckKey") -- Input Box + Ui Corner + Ui Stroke
local CheckKeyChildGlow1 = KeyMain.CheckKey:WaitForChild("Glow")
local PlayerImageChild = KeyMain:WaitForChild("PlayerImage")
local KingIconChild = KeyMain:WaitForChild("KingIcon")
local DisplayNameChild = KeyMain:WaitForChild("DisplayName")
local TimeChild = KeyMain:WaitForChild("Time")
local VersionChild = KeyMain:WaitForChild("Version")
local UiStrokeChild = KeyMain.CheckKey:WaitForChild("UIStroke")

local ShadowsChild = KeyMain.Shadow:WaitForChild("Shadows")

local ShadowTransparent = ShadowsChild.ImageTransparency

local CheckKeyChildTransparent = CheckKeyChild.BackgroundTransparency
local CheckKeyChildTextTransparent = CheckKeyChild.TextTransparency
local CheckKeyChildTransparencyUi = CheckKeyChild.UIStroke.Transparency

local KingIconTransparent = KingIconChild.ImageTransparency
local DisplayNameTransparent = DisplayNameChild.TextTransparency

local TimeTransparent = TimeChild.TextTransparency
local VersionTransparent = VersionChild.TextTransparency

local PlayerImageTransparencyImage = PlayerImageChild.ImageTransparency

function Keysys:MakeUI(KeySettings)
    -- Title, KeyLink, DiscordLink, ScriptLink
    KeySettings.Title = KeySettings.Title or "Title"
    KeySettings.DiscordLink = KeySettings.DiscordLink or "Not Have"
    KeySettings.ScriptLink = KeySettings.ScriptLink or ""
    KeySettings.FileKey = KeySettings.FileKey or "KeySystem.lua"

    KeyMain.Size = UDim2.new(0, 467, 0, 175)
    KeyMain.BackgroundTransparency = 1
    KeyMain.CheckKey.BackgroundTransparency = 1
    KeyMain.Shadow.Shadows.ImageTransparency = 1
    KeyMain.CheckKey.TextTransparency = 1
    KeyMain.CheckKey.UIStroke.Transparency = 1
    KeyMain.KingIcon.ImageTransparency = 1
    KeyMain.DisplayName.TextTransparency = 1
    KeyMain.Title.TextTransparency = 1
    KeyMain.Subtitle.TextTransparency = 1
    KeyMain.KeyNote.TextTransparency = 1
    KeyMain.PlayerImage.ImageTransparency = 1
    KeyMain.Input.BackgroundTransparency = 1
    KeyMain.Input.UIStroke.Transparency = 1
    KeyMain.Input.InputBox.TextTransparency = 1
    KeyMain.NoteTitle.TextTransparency = 1
    KeyMain.NoteMessage.TextTransparency = 1
    KeyMain.NoteMessage.DiscordBtn.TextTransparency = 1
    KeyMain.Time.TextTransparency = 1
    KeyMain.Hide.ImageTransparency = 1

    KeyMain.NoteMessage.DiscordBtn.Text = KeySettings.DiscordLink

    local function AddDraggingFunctionality(DragPoint, Main)
        pcall(function()
            local Dragging, DragInput, MousePos, FramePos = false
            DragPoint.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                    MousePos = Input.Position
                    FramePos = Main.Position

                    Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end)
                end
            end)
            DragPoint.InputChanged:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement then
                    DragInput = Input
                end
            end)
            UserInputService.InputChanged:Connect(function(Input)
                if Input == DragInput and Dragging then
                    local Delta = Input.Position - MousePos
                    TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale,
                            FramePos.Y.Offset + Delta.Y) }):Play()
                end
            end)
        end)
    end

    -- open ui
    TweenService:Create(ShadowsChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { ImageTransparency = ShadowTransparent }):Play()
    wait(0.04)
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 618,0, 293) }):Play()
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 0 }):Play()
    wait(0.05)
    TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = KingIconTransparent}):Play()
    TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = DisplayNameTransparent }):Play()
    wait(1.50)
    TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = CheckKeyChildTransparent }):Play()
    TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = CheckKeyChildTextTransparent }):Play()
    TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = CheckKeyChildTransparencyUi }):Play()
    TweenService:Create(KeyMain.Shadow.Shadows, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 0.5 }):Play()
    wait(0.05)
    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    wait(0.05)
    TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = PlayerImageTransparencyImage }):Play()
    wait(0.05)
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 0 }):Play()
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 0 }):Play()
    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    wait(0.05)
    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint),{ TextTransparency = 0 }):Play()
    TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = TimeTransparent }):Play()
    wait(0.15)
    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 0.3 }):Play()

    -- hide
    KeyMain.Hide.MouseButton1Click:Connect(function()
        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
        TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
        TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
        TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
        TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
        TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        wait(0.51)
        KeyUI:Destroy()
    end)


    -- copy dicord server
    KeyMain.NoteMessage.DiscordBtn.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/" .. KeySettings.DiscordID)
    end)

    KeyMain.NoteMessage.DiscordBtn.MouseEnter:Connect(function()
        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { TextColor3 = Color3.fromRGB(162, 210, 223) }):Play()
    end)

    KeyMain.NoteMessage.DiscordBtn.MouseLeave:Connect(function()
        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { TextColor3 = Color3.fromRGB(240, 240, 240) }):Play()
    end)

    
            -- Valid key button
            KeyMain.CheckKey.MouseButton1Click:Connect(function()
                local j = pcall(function()
                    if KeyMain.Input.InputBox.Text == game:HttpGet("https://1.kelprepl.repl.co/verify/"..keyName.."?verify_key="..KeyMain.Input.InputBox.Text) then
                        KeyMain.CheckKey.Text = "Key Is Valid!"
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
                        TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
                        TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play() 
                        task.wait(1.2) 
                        KeyMain.CheckKey.Text = "Check Key" 
                        wait(0.5) 
                        KeyUI:Destroy()
                    else
                        KeyMain.CheckKey.Text = "Key is invalid!" 
                        task.wait(1.2) 
                        KeyMain.CheckKey.Text = "Check Key" 
                    end
                end)
            end)

                                        -- Image

                                        PlayerImageChild.Image = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)

                                        -- Time
            
                                        local Time = KeyMain.Time
            
                                        local Data = os.date("*t")
            
                                        Time.Text = Data.hour..":"..Data.min
            
                                         -- DisplayName
            
                                         local Player = game:GetService("Players")
            
                                         local TextLabel = KeyMain.DisplayName
            
                                         TextLabel.Text = Player.LocalPlayer.DisplayName

    --key valid
    KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
        local is_key_present = isfile(KeySettings.FileKey);
        if is_key_present == true then
            local kery = readfile(KeySettings.FileKey);
            local onl_key = game:HttpGet("https://1.kelprepl.repl.co/verify/" ..
                KeySettings.KeyLinkName .. "?verify_key=" .. kery)
            if kery == onl_key then
                notif:Notification("Sucefful", "Key valid lets start", 3)
                loadstring(game:HttpGet(KeySettings.ScriptLink))()
                TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
                TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
                TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                wait(0.51)
                KeyUI:Destroy()
            else
                notif:Notification("Warning", "Key not valid try again", 3)
            end
        else
            if KeyMain.Input.InputBox.Text ==
                game:HttpGet("https://1.kelprepl.repl.co/verify/" ..
                    KeySettings.KeyLinkName .. "?verify_key=" .. KeyMain.Input.InputBox.Text) then
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
                        TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
                        TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                wait(0.51)
                writefile(KeySettings.FileKey, KeyMain.Input.InputBox.Text)
                local readfilekey = readfile(KeySettings.FileKey);
                if KeyMain.Input.InputBox.Text ==
                    game:HttpGet("https://1.kelprepl.repl.co/verify/" ..
                        KeySettings.KeyLinkName .. "?verify_key=" .. KeyMain.Input.InputBox.Text) then -- checkkey no have file
                    loadstring(game:HttpGet(KeySettings.ScriptLink))()
                    appendfile(KeySettings.FileKey, KeyMain.Input.InputBox.Text);
                    notif:Notification("Sucefful", "Key valid lets start", 3)
                            TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
                        TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
                        TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                        TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                        TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                        TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                    wait(0.51)
                    KeyUI:Destroy()
                else -- wrong key
                    notif:Notification("Warning", "Key not valid try again", 3)
                end
                if game:HttpGet("https://1.kelprepl.repl.co/verify/" ..
                    KeySettings.KeyLinkName .. "?verify_key=" .. KeyMain.Input.InputBox.Text)
                    ==
                    readfilekey then -- check key on maked file
                    loadstring(game:HttpGet(KeySettings.ScriptLink))()
                    notif:Notification("Sucefful", "Key valid lets start", 3)
                    appendfile(KeySettings.Title .. ".txt", KeyMain.Input.InputBox.Text);
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
                    TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
                    TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                    TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                    TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                    TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                    TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
                    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
                    wait(0.51)
                    KeyUI:Destroy()
                else -- wrong key
                    notif:Notification("Warning", "Key not valid try again", 3)
                end
            end
        end
    end)

    KeyUI.Main.Input.MouseEnter:Connect(function()
        TweenService:Create(KeyUI.Main.Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { Color = Color3.fromRGB(114, 1, 184) }):Play()
    end)

    KeyUI.Main.Input.MouseLeave:Connect(function()
        TweenService:Create(KeyUI.Main.Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { Color = Color3.fromRGB(35, 35, 35) }):Play()
    end)

    local is_key_present = isfile(KeySettings.Title .. ".txt");
    if is_key_present == true then
        local kery = readfile(KeySettings.Title .. ".txt");
        local onl_key = game:HttpGet("https://1.kelprepl.repl.co/verify/" ..
            KeySettings.KeyLinkName .. "?verify_key=" .. kery)
        if kery == onl_key then
            notif:Notification("Sucefful", "Key valid lets start", 3)
            loadstring(game:HttpGet(KeySettings.ScriptLink))()
            TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):Play()
            TweenService:Create(KingIconChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1}):Play()
            TweenService:Create(DisplayNameChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(ShadowsChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
            TweenService:Create(UiStrokeChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
            TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(CheckKeyChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(CheckKeyChild, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
            TweenService:Create(CheckKeyChildGlow1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
            TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(PlayerImageChild, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
            TweenService:Create(PlayerImageChild.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
            TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(VersionChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(TimeChild, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
            wait(0.51)
            KeyUI:Destroy()
        else
            notif:Notification("Warning", "Key not valid try again", 3)
        end
    end

    AddDraggingFunctionality(KeyMain, KeyUI.Main)
end

return Keysys
