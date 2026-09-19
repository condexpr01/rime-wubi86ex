---@diagnostic disable: undefined-global, lowercase-global, unused-local

-- 时间(ISO-8601)
time = function (input, seg)
	if (input == "time") then
		local z= os.date("%z") .. ""

		-- 本地时间, 符合ISO-8601规范
		yield(Candidate("time", seg.start, seg._end ,
			string.format("%s%s:%s",os.date("%Y-%m-%dT%H:%M:%S"),z:sub(1,3),z:sub(4,5)),
			"Local(ISO8601)"))

		-- 协调世界时UTC, 符合ISO-8601规范
		yield(Candidate("time", seg.start, seg._end ,os.date("!%Y-%m-%dT%H:%M:%SZ"), "UTC(ISO8601)"))

	end
end

-- unicode码点
utf8char = function (input, seg)
	if seg:has_tag("utf8char") and input:len() > 1 then
		local c = tonumber(input:sub(2))
		local ok = c and c >= 0 and c <= 0x10FFFF
		yield(Candidate("utf8char", seg.start, seg._end ,
			ok and utf8.char(c) or "" , ok and "unicode" or "unknown code"))
	end
end

-- pieces
-- 预期提供代码片，快捷用语，etc.

--[[
pieces = function (input, seg)

	if (input == "xxxx") then
	end

end
]]

