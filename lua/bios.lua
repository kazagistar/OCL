--OCL 0.5 custom BIOS. Do whatever you want with it, no rights reserved, as per WTFPL (http://sam.zoy.org/wtfpl/COPYING)
local nVersion = 0.5

function write(sString)
	local sString = sString or ""
	local tWords = {}
	local nNextSeperator, nNextSeperatorEnd, nStart = nil, nil, nil
	local nLastSeperator, nSeperatorLength = 0, 0
	repeat
		nNextSeperator, nNextSeperatorEnd = string.find(sString, "%s", nLastSeperator + nSeperatorLength)
		if nNextSeperator ~= nil then
			nSeperatorLength = nNextSeperatorEnd - nNextSeperator + 1
			table.insert(tWords, string.sub(sString, nLastSeperator, nNextSeperator - 1))
			nLastSeperator = nNextSeperator
		end
	until nNextSeperator == nil
	if nLastSeperator < #sString then
		table.insert(tWords, string.sub(sString, nLastSeperator))
	end
	
	for nWord = 1, #tWords do
		local nWidth = term.getSize()
		local x, y = term.getCursorPos()
		if #tWords[nWord] > nWidth - x then
			term.setCursorPos(1, y + 1)
			term.write(string.sub(tWords[nWord], 2))
		else
			term.write(tWords[nWord])
		end
	end
end

function print(sString)
	write(sString)
	local x, y = term.getCursorPos()
	term.setCursorPos(1, y + 1)
end

function error(sError)
	print(sError)
	print("Press any key to continue")
	repeat
		local sEvent = coroutine.yield()
	until sEvent == "key"
	os.shutdown()
end

function boot(sPath)
    local hFile = fs.open(sPath, "r")
    if hFile then
        local fFunc, sError = loadstring(hFile.readAll(), fs.getName(sPath))
        hFile.close()
        if fFunc then
            return pcall(fFunc)
        else
            return false, sError
        end
    else
        return false, "Error opening file " .. sPath
    end
end

local sBoot = "/rom/OCL/CraftOS.os/bios"
if not fs.isDir("/rom/OCL") or not fs.exists("/rom/OCL/loader") or not fs.exists("/rom/OCL/CraftOS.os") or not fs.exists("/rom/OCL/CraftOS.os/bios") or not fs.exists("/rom/OCL/CraftOS.os/OCL") then
	error("Incorrect OCL installation detected! Please reinstall the OCL.")
end
if fs.isDir("/OCL") then
	if fs.exists("/OCL/current_os") and not fs.isDir("/OCL/current_os") then
		local hFile = fs.open("/OCL/current_os", "r")
		sBoot = hFile.readLine()
		hFile.close()
	end
else
	fs.makeDir("/OCL")
end
print("[F1]: Enter setup")
local setupTimer = os.startTimer(1)
local sEvent, p1 = nil
repeat
	sEvent, p1 = coroutine.yield()
until p1 == setupTimer or p1 == 59
term.clear()
term.setCursorPos(1, 1)
if p1 == 59 then sBoot = "/rom/OCL/loader" end
local bSuccess, sError = boot(sBoot)
if not bSuccess then
	error(sError)
end
os.shutdown()