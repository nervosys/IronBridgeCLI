# VHS Demo for IronBridge CLI
# https://github.com/charmbracelet/vhs

Output demo.gif

Set Shell pwsh
Set FontSize 16
Set Width 1000
Set Height 600
Set Theme Dracula
Set TypingSpeed 40ms

# Show version
Type "ironbridge --version"
Enter
Sleep 1500ms

# Show help
Type "ironbridge --help"
Enter
Sleep 3s

# List workspaces
Type "ironbridge list workspaces"
Enter
Sleep 3s

# Sync sessions
Type "ironbridge sync --pull --dry-run 2>&1 | Select-Object -First 20"
Enter
Sleep 4s

# Harvest scan
Type "ironbridge harvest scan"
Enter
Sleep 3s

Sleep 1s
