do
shared.LoaderTitle="";shared.LoaderKeyFrames={[1]={1,10},[2]={2,30},[3]={3,60},[4]={2,100}}
local a={LoaderData={Name=shared.LoaderTitle or"A Loader",Colors=shared.LoaderColors or{Main=Color3.fromRGB(0,0,0),Topic=Color3.fromRGB(200,200,200),Title=Color3.fromRGB(255,255,255),LoaderBackground=Color3.fromRGB(40,40,40),LoaderSplash=Color3.fromRGB(3,252,3)}},Keyframes=shared.LoaderKeyFrames or{[1]={1,10},[2]={2,30},[3]={3,60},[4]={2,100}}}
local b={[1]="",[2]="",[3]="",[4]=""}
local function t(o,d,p) game.TweenService:Create(o,TweenInfo.new(d,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),p):Play() end
local function c(cls,props)
 local obj=Instance.new(cls)
 local par
 for k,v in pairs(props) do
  if k~="Parent" then obj[k]=v else par=v end
 end
 obj.Parent=par
 return obj
end
local function u(r,x) local uc=Instance.new("UICorner") uc.CornerRadius=UDim.new(0,r) uc.Parent=x end
local g=c("ScreenGui",{Name="Core",Parent=game.CoreGui})
local f=c("Frame",{Name="Main",Parent=g,BackgroundColor3=a.LoaderData.Colors.Main,BorderSizePixel=0,ClipsDescendants=true,Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.new(0,0,0,0)})
u(12,f)
local i=c("ImageLabel",{Name="UserImage",Parent=f,BackgroundTransparency=1,Image="rbxassetid://130379077525916",Position=UDim2.new(0,15,0,10),Size=UDim2.new(0,50,0,50)})
u(25,i)
local n=c("TextLabel",{Name="UserName",Parent=f,BackgroundTransparency=1,Text="Duy Android Hub",Position=UDim2.new(0,75,0,10),Size=UDim2.new(0,200,0,50),Font=Enum.Font.GothamBold,TextColor3=a.LoaderData.Colors.Title,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left})
local top=c("TextLabel",{Name="Top",TextTransparency=1,Parent=f,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Position=UDim2.new(0,30,0,70),Size=UDim2.new(0,301,0,20),Font=Enum.Font.Gotham,Text="Loader",TextColor3=a.LoaderData.Colors.Topic,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left})
local title=c("TextLabel",{Name="Title",Parent=f,TextTransparency=1,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Position=UDim2.new(0,30,0,90),Size=UDim2.new(0,301,0,46),Font=Enum.Font.Gotham,RichText=true,Text="<b>"..a.LoaderData.Name.."</b>",TextColor3=a.LoaderData.Colors.Title,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left})
local bg=c("Frame",{Name="BG",Parent=f,AnchorPoint=Vector2.new(0.5,0),BackgroundTransparency=1,BackgroundColor3=a.LoaderData.Colors.LoaderBackground,BorderSizePixel=0,Position=UDim2.new(0.5,0,0,70),Size=UDim2.new(0.8500000238418579,0,0,24)})
u(8,bg)
local p=c("Frame",{Name="Progress",Parent=bg,BackgroundColor3=a.LoaderData.Colors.LoaderSplash,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(0,0,0,24)})
u(8,p)
local stepLabel=c("TextLabel",{Name="StepLabel",Parent=f,BackgroundTransparency=1,Position=UDim2.new(0.5,0,1,-25),Size=UDim2.new(1,-20,0,20),Font=Enum.Font.Gotham,Text="",TextColor3=a.LoaderData.Colors.Topic,TextSize=14,TextXAlignment=Enum.TextXAlignment.Center,AnchorPoint=Vector2.new(0.5,0.5)})
local function s(i) stepLabel.Text=b[i] or "" end
local function pct(v,idx) t(p,0.5,{Size=UDim2.new(v/100,0,0,24)}) s(idx) end
t(f,0.25,{Size=UDim2.new(0,346,0,121)})
wait()
t(top,0.5,{TextTransparency=0})
t(title,0.5,{TextTransparency=0})
t(bg,0.5,{BackgroundTransparency=0})
t(p,0.5,{BackgroundTransparency=0})
for idx,kv in pairs(a.Keyframes) do
 wait(kv[1])
 pct(kv[2],idx)
end
pct(100,4)
t(top,0.5,{TextTransparency=1})
t(title,0.5,{TextTransparency=1})
t(bg,0.5,{BackgroundTransparency=1})
t(p,0.5,{BackgroundTransparency=1})
wait(0.5)
t(f,0.25,{Size=UDim2.new(0,0,0,0)})
wait(0.25)
g:Destroy()
end