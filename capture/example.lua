--[[
  This script captures the terminal, draws a big red box
  in the middle, and restores the previously saved screenshot.
]]

local capture = require("capture")
local w, h = term.getSize()

local function writeCentered(str, offset)
  term.setCursorPos(w/2 - #str/2, h/2 + (offset or 0))
  term.write(str)
end

-- Add some text on the screen, so we can se what's going on
local text = "Some text \127 "
local repeatedText = text:rep(w / #text + 1):sub(1, w)

for y=1, h do
  -- For each line, build a blit string
  local line = ""
  for x=1, w do
    local randomNumber = math.random(1, 16)
    local randomColor = ("0123456789abcdef"):sub(randomNumber, randomNumber)
    line = line..randomColor
  end
  
  -- Display it on said line
  term.setCursorPos(1, y)
  term.blit(repeatedText, line, ("f"):rep(#repeatedText))
end

-- Capture the lines
local snapshot = capture.capture()

term.setBackgroundColor(colors.red)
writeCentered(" Screen was captured. ", -1)
writeCentered(" = Press any key to clutter = ")
term.setBackgroundColor(colors.black)
os.pullEvent("key")

-- Draw a box onto the screen to clutter it.
paintutils.drawFilledBox(w/2-15, h/2-5, w/2+15, h/2+5, colors.red)

writeCentered(" Screen was cluttered.", -1)
writeCentered(" = Press any key to restore = ")
os.pullEvent("key")

-- Restore the captured screen.
capture.redraw(snapshot)

-- Set the cursor position to avoid terminal scroll
term.setCursorPos(1, h)