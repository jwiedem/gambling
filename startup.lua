--define digit maps

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


--map spaces to coords
local rouletteSpaces = {
    --upper left
    { index = 0, number = 00, digits = {zero, zero}, x = 4, y = 3 },
 
    --upper row
    { index = 1, number = 28, digits = {two, eight}, x = 7, y = 3 },
    { index = 2, number = 9, digits = {zero, nine}, x = 10, y = 3 },
    { index = 3, number = 26, digits = {two, six}, x = 13, y = 3 },
    { index = 4, number = 30, digits = {three, zero}, x = 16, y = 3 },
    { index = 5, number = 11, digits = {one, one}, x = 19, y = 3 },
    { index = 6, number = 7, digits = {zero, seven}, x = 22, y = 3 },
    { index = 7, number = 20, digits = {two, zero}, x = 25, y = 3 },
    { index = 8, number = 17, digits = {one, seven}, x = 28, y = 3 },

    --right side
    { index = 9, number = 5, digits = {zero, five}, x = 28, y = 5 },
    { index = 10, number = 22, digits = {two, two}, x = 28, y = 7 },
    { index = 11, number = 15, digits = {one, five}, x = 28, y = 9 },
    { index = 12, number = 3, digits = {zero, three}, x = 28, y = 11 },
    { index = 13, number = 24, digits = {two, four}, x = 28, y = 13 },
    { index = 14, number = 13, digits = {one, three}, x = 28, y = 15 },
    { index = 15, number = 1, digits = {zero, one}, x = 28, y = 17 },

    --bottom right
    { index = 16, number = 00, digits = {zero, zero}, x = 28, y = 19 },

    --bottom row
    { index = 17, number = 27, digits = {two, seven}, x = 25 , y = 19 },
    { index = 18, number = 10, digits = {one, zero}, x = 22, y = 19 },
    { index = 19, number = 25, digits = {two, five}, x = 19, y = 19 },
    { index = 20, number = 29, digits = {two, nine}, x = 16, y = 19 },
    { index = 21, number = 12, digits = {one, two}, x = 13, y = 19 },
    { index = 22, number = 8, digits = {zero, eight}, x = 10, y = 19 },
    { index = 23, number = 19, digits = {one, nine}, x = 7, y = 19 },
    { index = 24, number = 18, digits = {one, eight}, x = 4, y = 19},

    --left side
    { index = 25, number = 6, digits = {zero, six}, x = 4, y = 17 },
    { index = 26, number = 21, digits = {two, one}, x = 4, y = 15 },
    { index = 27, number = 16, digits = {one, six}, x = 4, y = 13 },
    { index = 28, number = 4, digits = {zero, four}, x = 4, y = 11 },
    { index = 29, number = 23, digits = {two, three}, x = 4, y = 9 },
    { index = 30, number = 14, digits = {one, four}, x = 4, y = 7 },
    { index = 31, number = 2, digits = {zero, two}, x = 4, y = 5 }
}


 
--init monitor
local monitor = peripheral.find("monitor")
monitor.setBackgroundColour(colors.brown)
monitor.clear()
monitor.setTextScale(1.5)

--init roulette wheel
local wheelX = 4
local wheelY = 3
local wheelWidth = 27
local wheelHeight = 18

local img = paintutils.loadImage("wheel_painted.nfp")
local board = window.create(monitor, wheelX, wheelY, wheelWidth, wheelHeight)
board.setBackgroundColour(colors.yellow)
board.clear()
term.redirect(board)
paintutils.drawImage(img, 1, 1)

--init number
local numX = 12
local numY = 9
local numWidth = 11
local numHeight = 5

current_num = window.create(monitor, numX, numY, numWidth, numHeight)
current_num.setBackgroundColor(colors.yellow)
current_num.clear()

--init marble
local marbleX = 4
local marbleY = 3
local marbleWidth = 3
local marbleHeight = 2

marble = window.create(monitor, marbleX, marbleY, marbleWidth, marbleHeight)
marble.setBackgroundColor(colors.orange)
marble.clear() 

local function displayCurrentNum(digits)
    local firstDigitX = 1
    local secondDigitX = 7
    local digitY = 1
 
    current_num.clear()
    term.redirect(current_num)
    paintutils.drawImage(digits[1], firstDigitX, digitY)
    paintutils.drawImage(digits[2], secondDigitX, digitY)
end

local function drawMarble(xPos, yPos)
    marble.reposition(xPos, yPos, marbleWidth, marbleHeight)
    board.redraw()
    marble.redraw()
end

for i = 1, #rouletteSpaces do
    local space = rouletteSpaces[i]

    displayCurrentNum(space.digits)
    drawMarble(space.x, space.y)
    os.sleep(0.5)
end
