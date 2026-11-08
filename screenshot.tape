# Set terminal window dimensions
Set Width 1200
Set Height 800
Set FontSize 18
Set Theme "Builtin Solarized Dark"

# Hide the initial setup typing
Hide
Type "vim -u NONE --cmd 'set runtimepath+=./sources_non_forked/nerdtree,./my_plugins/mcmillan' --cmd 'filetype on' -c 'set termguicolors background=dark' -c 'syntax on' -c 'colorscheme mcmillan' -c 'runtime plugin/NERD_tree.vim' -c 'NERDTree' -c 'wincmd p' my_configs.vim"
Enter
Sleep 1s
Show

# Show the configuration without modifying it
Type "gg"
Sleep 500ms

# Save the Vim frame before exiting
Screenshot docs/vim-screenshot.png
Sleep 500ms

Type ":qa"        # Quit both windows
Enter