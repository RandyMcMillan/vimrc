Set Width 1200
Set Height 800
Set FontSize 18
Set Theme "Builtin Solarized Dark"

Hide
Type "nvim -u NONE --cmd 'set runtimepath+=./sources_non_forked/nerdtree,./my_plugins/mcmillan' --cmd 'filetype on' -c 'set termguicolors background=dark' -c 'syntax on' -c 'colorscheme mcmillan' -c 'runtime plugin/NERD_tree.vim' -c 'NERDTree' -c 'wincmd p' README.md"
Enter
Sleep 1s
Show

Type "G"
Sleep 500ms

Screenshot docs/nvim-screenshot.png
Sleep 500ms

Type ":qa"
Enter
