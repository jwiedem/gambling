-- decode_b64.lua
local function from_base64(data)
  local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  data = string.gsub(data, '[^'..b..'=]', '')
  return (data:gsub('.', function(c)
    if c == '=' then return '' end
    local idx = b:find(c) - 1
    return string.format('%06b', idx)
  end):gsub('%d%d%d%d%d%d%d%d', function(byte)
    return string.char(tonumber(byte,2))
  end))
end

if not fs.exists("image.b64") then
  error("image.b64 not found. Use pastebin get <code> image.b64 or download it first.")
end

local f = fs.open("image.b64", "r")
local b64 = f.readAll()
f.close()

local binary = from_base64(b64)

local out = fs.open("image.png", "w")
out.write(binary)
out.close()

print("Decoded to image.png (" .. #binary .. " bytes)")
