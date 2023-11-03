#!/bin/bash

# Define the AppleScript code
read -r -d '' applescriptCode <<'EOF'
tell application "Google Chrome"
    make new window
    activate
    set newWindow to the front window
    set firstTab to first tab of newWindow
    repeat with i from 1 to 3
        if i is 1 then
            set URL of firstTab to "https://chat.openai.com/"
        else
            tell newWindow to make new tab with properties {URL:"https://chat.openai.com/"}
        end if
    end repeat
end tell
EOF

# Execute the AppleScript
osascript -e "$applescriptCode"
