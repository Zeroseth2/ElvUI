if not TukuiCF["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarBottomRight as bar #5
---------------------------------------------------------------------------

local TukuiBar5 = CreateFrame("Frame","TukuiBar5",TukuiActionBarBackground) -- MultiBarBottomRight
TukuiBar5:SetAllPoints(TukuiActionBarBackground)
MultiBarBottomRight:SetParent(TukuiBar5)

for i=1, 12 do
	local b = _G["MultiBarBottomRightButton"..i]
	local b2 = _G["MultiBarBottomRightButton"..i-1]
	b:ClearAllPoints()
	if i == 1 then
		if TukuiCF.actionbar.rightbars > 1 then
			b:SetPoint("TOPLEFT", TukuiActionBarBackgroundRight, "TOPLEFT", TukuiDB.buttonspacing, -TukuiDB.buttonspacing)
		else
			b:SetPoint("BOTTOM", ActionButton1, "TOP", 0, TukuiDB.buttonspacing)
		end
	else
		if TukuiCF.actionbar.rightbars > 1 then
			b:SetPoint("TOP", b2, "BOTTOM", 0, -TukuiDB.buttonspacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", TukuiDB.buttonspacing, 0)
		end
	end
end

-- hide it if needed
if TukuiCF.actionbar.rightbars < 2 then
	TukuiBar5:Hide()
end

--Setup Mouseover
if TukuiCF["actionbar"].rightbarmouseover == true then
	for i=1, 12 do
		local b = _G["MultiBarBottomRightButton"..i]
		b:SetAlpha(0)
		b:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		b:HookScript("OnLeave", function() RightBarMouseOver(0) end)
	end
end