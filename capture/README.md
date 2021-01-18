# Capture
A library that lets you capture the terminal lines like a screenshot, and redraw them later on.

## Example
Capture, draw unwanted stuff on the terminal, redraw back.
```lua
local capture = require("capture")

-- Take a "screenshot"
local lines = capture.capture()

--[[
  Alter the screen here in any way...
]]

-- Redraw the screen back on
capture.redraw(lines)
```
The `example.lua` file provides some more code using that feature.

## Limitations
Capture only works on computers running multishell. It is not possible to use Capture when redirected to monitors.
To check if Capture is supported on a specific term object, call `capture.isCompatible(targetTerm)` with the term object to check as the first parameter. If the function returns `true`, the target term object can be used with Capture.

## Common uses
Use `capture` when you need to save what's on the screen before altering one or multiple lines, and restore it right after, without calling the expensive function that renders your visuals.