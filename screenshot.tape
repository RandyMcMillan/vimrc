# Set terminal window dimensions
Set Width 1200
Set Height 800
Set FontSize 18
Set Theme "Builtin Solarized Dark"

# Hide the initial setup typing
Hide
Type "nvim README.md"
Enter
Sleep 500ms
Show

# Perform actions inside Vim
Type "G"          # Go to the bottom of the file
Sleep 300ms
Type "o"          # Open a new line in insert mode
Sleep 200ms
Type "# Automated documentation update via GitHub Actions"
Escape
Sleep 500ms
Type ":wq"        # Save and quit
Enter

# Save the output as a PNG screenshot (or .gif)
Screenshot docs/vim-screenshot.png