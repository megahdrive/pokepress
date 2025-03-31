console:log("INFO: Loaded file")

local first_buff = true

local target = 1000 -- Change to the frame you want 
local offset = 101 -- Change to your desired offset [(frame - offset) = the frame that A will be pressed on]

local last_frame = 0

local key_release_time = 1
local key_press_frames = 0
local key_press = false

function out(t)
    console:log(tostring(t))
end

function key()
    emu:addKey(C.GBA_KEY.A)
    key_press = true
    out("INFO: Added key to buffer")
end

function reset_key()
    if key_press and key_press_frames > key_release_time then
        key_press = false
        key_press_frames = 0
        -- clear key.
        emu:clearKey(C.GBA_KEY.A)
        out("INFO: Cleared key buffer")
    end
end

function buffer()
    local frame = emu:currentFrame()

    if first_buff then
        out("INFO: First buffer run")
        out("INFO: Frame: " .. tostring(frame))
        out("INFO: Target: " .. tostring(target))
        out("INFO: Offset: " .. tostring(offset))
        out("INFO: Key release time: " .. tostring(key_release_time))
        first_buff = false
    end

    if key_press then
        key_press_frames = key_press_frames + 1
        reset_key()
    end

    if frame ~= (last_frame + 1) then
        warn("Processor dropped frame " .. tostring(last_frame + 1) .. ". Skipped to " .. tostring(frame))
    end

    last_frame = frame

    if frame == (target - offset) then
        out("INFO: Hit target")
        out("INFO: Frame: " .. tostring(frame))
        key()
    end
end

callbacks:add("frame", buffer)
