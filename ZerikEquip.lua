local ZerikEquipFrame = CreateFrame("Frame", "ZerikEquipFrame", UIParent)
ZerikEquipFrame:SetWidth(240)
ZerikEquipFrame:SetHeight(100) 
ZerikEquipFrame:SetPoint("CENTER")
ZerikEquipFrame:SetMovable(true)
ZerikEquipFrame:EnableMouse(true)
ZerikEquipFrame:RegisterForDrag("LeftButton")
ZerikEquipFrame:SetScript("OnDragStart", ZerikEquipFrame.StartMoving)
ZerikEquipFrame:SetScript("OnDragStop", ZerikEquipFrame.StopMovingOrSizing)

local FrameBorder = CreateFrame("Frame", "ZerikEquipFrameBorder", ZerikEquipFrame)
FrameBorder:SetPoint("TOPLEFT", -5, 5) 
FrameBorder:SetPoint("BOTTOMRIGHT", 5, -5) 
FrameBorder:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
})
FrameBorder:SetBackdropColor(0, 0, 0, 1) 
FrameBorder:SetBackdropBorderColor(1, 1, 1, 1) 
FrameBorder:SetFrameLevel(ZerikEquipFrame:GetFrameLevel() - 1) 

local Background = ZerikEquipFrame:CreateTexture(nil, "BACKGROUND")
Background:SetAllPoints(ZerikEquipFrame)
Background:SetTexture(0, 0, 0, 0.8) 

local Dropdown = CreateFrame("Frame", "ZerikEquipDropdown", ZerikEquipFrame, "UIDropDownMenuTemplate")
Dropdown:SetPoint("TOPLEFT", ZerikEquipFrame, "TOPLEFT", 10, -18) 
UIDropDownMenu_SetWidth(Dropdown, 150)


local TitleText = ZerikEquipFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
TitleText:SetPoint("TOP", 0, -5)
TitleText:SetText("ZerikEquip")

local comandos = {
    { nombre = "Paladin proteccion", comandos = { ".add 50640", ".add 50627", ".add 51269", ".add 50718", ".add 51265", ".add 50611", ".add 51267", ".add 50691", ".add 51268", ".add 54579", ".add 50622", ".add 50642", ".add 50364", ".add 54591", ".add 50738", ".add 50729", ".add 47661", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400",".learn 23161" , ".setskill 473 400" } },
	{ nombre = "Paladin Represion", comandos = { ".learn 23161", ".add 51227", ".add 54581", ".add 51229", ".add 47545", ".add 51225", ".add 50670", ".add 50675", ".add 50620", ".add 51228", ".add 54578", ".add 50402", ".add 50618", ".add 50363", ".add 54590", ".add 49623", ".add 50730", ".add 50733", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Paladin Sagrado", comandos = { ".learn 23161",  ".add 51272", ".add 50724", ".add 51273", ".add 54583", ".add 50680", ".add 54584", ".add 50650", ".add 54587", ".add 50694", ".add 54586", ".add 50400", ".add 50664", ".add 47059", ".add 54588", ".add 50732", ".add 50616", ".add 40705", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "DK Escarcha", comandos = { ".learn 23161", ".add 51312", ".add 54581", ".add 51314", ".add 50677", ".add 51310", ".add 50659", ".add 50690", ".add 50620", ".add 51313", ".add 54578", ".add 52572", ".add 50657", ".add 50363", ".add 54590", ".add 50737", ".add 47673", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "DK Profano", comandos = { ".learn 23161", ".add 51312", ".add 54581", ".add 51314", ".add 50677", ".add 51310", ".add 50659", ".add 50690", ".add 50620", ".add 51313", ".add 54578", ".add 52572", ".add 50657", ".add 50363", ".add 54590", ".add 49623", ".add 50459", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "DK Sangre", comandos = { ".learn 23161", ".add 51306", ".add 50682", ".add 51309", ".add 50718", ".add 51305", ".add 50611", ".add 51307", ".add 50691", ".add 50612", ".add 54579", ".add 50622", ".add 50642", ".add 50364", ".add 54591", ".add 50730", ".add 50462", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Druida Feral", comandos = { ".learn 23161", ".add 51296", ".add 50633", ".add 51299", ".add 50653", ".add 51298", ".add 54580", ".add 50675", ".add 50707", ".add 51297", ".add 50607", ".add 50402", ".add 54576", ".add 50363", ".add 54590", ".add 50735", ".add 47668", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Druida Feral Tank", comandos = { ".learn 23161", ".add 51296", ".add 50682", ".add 51299", ".add 50718", ".add 50656", ".add 54580", ".add 51295", ".add 50707", ".add 51297", ".add 50607", ".add 50402", ".add 54576", ".add 50364", ".add 54591", ".add 50735", ".add 50456", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Druida Equilibrio", comandos = { ".learn 23161", ".add 51290", ".add 50724", ".add 51292", ".add 54583", ".add 51294", ".add 54584", ".add 54582", ".add 51291", ".add 50719", ".add 50457", ".add 50734", ".add 50613", ".add 50699", ".add 50636", ".add 50664", ".add 50365", ".add 54588", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Druida Restauracion", comandos = { ".learn 23161", ".add 51302", ".add 50609", ".add 51304", ".add 54583", ".add 50717", ".add 54582", ".add 51301", ".add 50702", ".add 51303", ".add 50699", ".add 54585", ".add 50636", ".add 50366", ".add 54589", ".add 46017", ".add 50719", ".add 50454" } },
	{ nombre = "Guerrero Furia", comandos = { ".learn 23161", ".add 51227", ".add 54581", ".add 51229", ".add 47545", ".add 51225", ".add 50670", ".add 50675", ".add 50620", ".add 51228", ".add 54578", ".add 50402", ".add 50618", ".add 50363", ".add 54590", ".add 49623", ".add 50730", ".add 50733", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Mago Fuego", comandos = { ".learn 23161", ".add 51281", ".add 50724", ".add 51284", ".add 54583", ".add 50629", ".add 54582", ".add 51280", ".add 50613", ".add 51282", ".add 50699", ".add 50398", ".add 50664", ".add 50365", ".add 54588", ".add 50732", ".add 50719", ".add 50684", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Chaman Mejora", comandos = { ".learn 23161", ".add 51242", ".add 51890", ".add 51240", ".add 50653", ".add 51244", ".add 54580", ".add 50619", ".add 50688", ".add 51241", ".add 54577", ".add 50604", ".add 54576", ".add 50355", ".add 54590", ".add 50737", ".add 50737", ".add 50458", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Chaman Elemental", comandos = { ".learn 23161", ".add 51237", ".add 50724", ".add 50698", ".add 54583", ".add 51239", ".add 54582", ".add 51238", ".add 54587", ".add 51236", ".add 50699", ".add 50398", ".add 50664", ".add 50365", ".add 54588", ".add 50734", ".add 50616", ".add 50458", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Chaman Restauracion", comandos = { ".learn 23161", ".add 51247", ".add 50724", ".add 51245", ".add 54583", ".add 51249", ".add 54584", ".add 50703", ".add 54587", ".add 51246", ".add 50699", ".add 50400", ".add 50610", ".add 50664", ".add 54585", ".add 47059", ".add 54588", ".add 50734", ".add 50616", ".add 50464", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Sacerdote Sagrado", comandos = { ".learn 23161", ".add 51255", ".add 50724", ".add 51257", ".add 54583", ".add 51259", ".add 54582", ".add 51256", ".add 50613", ".add 50694", ".add 50699", ".add 50398", ".add 50664", ".add 50365", ".add 54588", ".add 50734", ".add 50719", ".add 50684", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Sacerdote Disciplina", comandos = { ".learn 23161", ".add 51261", ".add 50724", ".add 51264", ".add 54583", ".add 51263", ".add 54582", ".add 50722", ".add 50702", ".add 51262", ".add 50699", ".add 54585", ".add 50644", ".add 50366", ".add 54589", ".add 50734", ".add 50719", ".add 50631", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Picaro Combate", comandos = { ".learn 23161", ".add 51252", ".add 50633", ".add 51254", ".add 47545", ".add 50470", ".add 51250", ".add 50670", ".add 50675", ".add 50707", ".add 51253", ".add 50607", ".add 50402", ".add 54576", ".add 50363", ".add 54590", ".add 50737", ".add 50654", ".add 50733", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Cazador Punteria", comandos = { ".learn 23161", ".add 51286", ".add 50633", ".add 51288", ".add 47545", ".add 51289", ".add 50655", ".add 51285", ".add 50688", ".add 50645", ".add 54577", ".add 50402", ".add 50618", ".add 50363", ".add 54590", ".add 50735", ".add 50733", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	{ nombre = "Brujo Afliccion", comandos = { ".learn 23161", ".add 51231", ".add 50658", ".add 51234", ".add 54583", ".add 51233", ".add 54582", ".add 51230", ".add 50613", ".add 50694", ".add 50699", ".add 50398", ".add 50664", ".add 50365", ".add 54588", ".add 50732", ".add 50719", ".add 50684", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
	
    { nombre = "Druida Equilibrio", comandos = { ".learn 23161", ".add 51290", ".add 50724", ".add 51292", ".add 54583", ".add 51294", ".add 54584", ".add 54582", ".add 51291", ".add 50719", ".add 50457", ".add 50734", ".add 50613", ".add 50699", ".add 50636", ".add 50664", ".add 50365", ".add 54588", ".setskill 44 400", ".setskill 172 400", ".setskill 173 400", ".setskill 54 400", ".setskill 160 400", ".setskill 136 400", ".setskill 473 400", ".setskill 172", ".mod rep 1156 42999" } },
    
}

local function Dropdown_OnClick(self, arg1)
    local selectedCommands = comandos[arg1].comandos
    UIDropDownMenu_SetText(Dropdown, comandos[arg1].nombre)
    ZerikEquipFrame.selectedCommands = selectedCommands
end

UIDropDownMenu_Initialize(Dropdown, function()
    for index, comando in ipairs(comandos) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = comando.nombre
        info.func = Dropdown_OnClick
        info.arg1 = index
        UIDropDownMenu_AddButton(info)
    end
end)

local SendButton = CreateFrame("Button", "ZerikEquipSendButton", ZerikEquipFrame, "UIPanelButtonTemplate")
SendButton:SetPoint("TOPLEFT", Dropdown, "BOTTOMLEFT", 30, -10) 
SendButton:SetSize(140, 25)
SendButton:SetText("Enviar Comandos")

SendButton:SetScript("OnClick", function()
    local selectedCommands = ZerikEquipFrame.selectedCommands
    if selectedCommands then
        for _, command in ipairs(selectedCommands) do
            SendChatMessage(command, "SAY") 
        end
    end
end)

UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")

local HiddenErrorFrame = CreateFrame("Frame")
HiddenErrorFrame:RegisterEvent("UI_ERROR_MESSAGE")

HiddenErrorFrame:SetScript("OnEvent", function(self, event, messageType, message)
    if messageType == 1 then 
        return -- No hacer nada con los errores Lua, simplemente ignorarlos
    else
       
        DEFAULT_CHAT_FRAME:AddMessage(message, 1, 0, 0)
    end
end)


SlashCmdList["ZERIKEQUIP"] = function()
    if ZerikEquipFrame:IsShown() then
        ZerikEquipFrame:Hide()
    else
        ZerikEquipFrame:Show()
    end
end
SLASH_ZERIKEQUIP1 = "/zerikequip"
