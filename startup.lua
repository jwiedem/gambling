local monitor = peripheral.find("monitor")
monitor.setBackgroundColour(colors.brown)
monitor.clear()

local zero = paintutils.parseImage([[
eeeee
e444e
e444e
e444e
eeeee
]])
 
local one = paintutils.parseImage([[
44e44
4ee44
e4e44
44e44
eeeee
]])
 
local two = paintutils.parseImage([[
eeeee
4444e
eeeee
e4444
eeeee
]])

local three = paintutils.parseImage([[
eeeee
4444e
eeeee
4444e
eeeee
]])

local four = paintutils.parseImage([[
e444e
e444e
eeeee
4444e
4444e
]])

local five = paintutils.parseImage([[
eeeee
e4444
eeeee
4444e
eeeee
]])

local six = paintutils.parseImage([[
eeeee
e4444
eeeee
e444e
eeeee
]])

local seven = paintutils.parseImage([[
eeeee
4444e
4444e
4444e
4444e
]])

local eight = paintutils.parseImage([[
eeeee
e444e
eeeee
e444e
eeeee
]])

local nine = paintutils.parseImage([[
eeeee
e444e
eeeee
4444e
4444e
]])


local img = paintutils.loadImage("wheel_painted.nfp")
term.redirect(monitor)
monitor.setTextScale(1.5)
local board = window.create(monitor, 4, 3, 27, 18)
board.setBackgroundColour(colors.yellow)
board.clear()
term.redirect(board)
paintutils.drawImage(img,1,1)
 
current_num = window.create(monitor, 15, 9, 5, 6)
term.redirect(current_num)
paintutils.drawImage(one, 1, 1)
