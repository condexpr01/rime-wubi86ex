---@diagnostic disable: undefined-global, lowercase-global, unused-local

-- 时间
time = function (input, seg)
	if (input == "time") then
		-- 世界范围内能懂的utc时间
		offset = tostring(os.date("%z"))
		utc = offset:sub(1,1)
		utc = utc == '+' and 'P' or utc == '-' and 'N' or ''
		utc = "UTC" .. utc .. offset:sub(2,5)
		yield(Candidate("time", seg.start, seg._end ,utc .. os.date(".%Y-%m-%dT%H:%M:%S"), "time"))
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

