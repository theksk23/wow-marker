local frame = CreateFrame("Frame", "NpcMarkerFrame", UIParent, "BasicFrameTemplate")
frame:SetSize(260, 110)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
frame.title:SetPoint("TOP", 0, -6)
frame.title:SetText("NPC Marker")

-- Edit box
local editBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
editBox:SetSize(200, 20)
editBox:SetPoint("TOP", 0, -30)
editBox:SetAutoFocus(false)

-- Button
local button = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
button:SetSize(140, 25)
button:SetPoint("TOP", 0, -60)
button:SetText("Target + Skull")

button:SetScript("OnClick", function()
    local name = editBox:GetText()
    if name and name ~= "" then
        TargetByName(name, true)
        if UnitExists("target") then
            SetRaidTarget("target", 8) -- Skull
        end
    end
end)

-- Slash command to toggle
SLASH_NPCMARKER1 = "/npcmarker"
SlashCmdList["NPCMARKER"] = function()
    if frame:IsShown() then
        frame:Hide()
    else
        frame:Show()
    end
end

BINDING_HEADER_NPCMARKER = "NPC Marker"
BINDING_NAME_NPCMARKER_TARGET = "Target & Skull NPC"

function NpcMarker_Target()
    local name = editBox:GetText()
    if name and name ~= "" then
        TargetByName(name, true)
        if UnitExists("target") then
            SetRaidTarget("target", 8)
        end
    end
end
