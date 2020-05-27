local CTM={}
CTM.frame = CreateFrame("Frame","uutools", UIParent)
CTM.frame:RegisterEvent("TRADE_SHOW")


CTM.frame:RegisterEvent("MAIL_SHOW")
CTM.frame:RegisterEvent("MAIL_CLOSED")



-- CTM.frame:RegisterEvent("BANKFRAME_OPENED")
-- CTM.frame:RegisterEvent("BANKFRAME_CLOSED")



CTM.frame:SetScript("OnEvent", function(self, event, ...)
	return CTM[event] and CTM[event](CTM, event, ...)
end)


function CTM:TRADE_SHOW(...)
    local name = GetUnitName("NPC");
    local targetName = GetUnitName("target");
    local level = UnitLevel("NPC");

    if (UnitInParty("NPC") ~= 1 and name ~= targetName and level < 5) then
            print("阻止了一次低于5级的交易. 目标是:"..name)
            CloseTrade();
            CloseAllBags();
    end
end


function CTM:MAIL_SHOW(...)
    SetCVar("blockTrades",1)
    print("打开邮箱期间,阻止交易")
end


function CTM:MAIL_CLOSED(...)
    SetCVar("blockTrades",0)
    print("恢复交易")
end

-- function CTM:BANKFRAME_OPENED(...)
--     SetCVar("blockTrades",1)
--     print("打开银行期间,阻止交易")
-- end


-- function CTM:BANKFRAME_CLOSED(...)
--     SetCVar("blockTrades",0)
--     print("恢复交易")
-- end

