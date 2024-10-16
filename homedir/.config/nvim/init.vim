let g:python3_host_prog = '/opt/homebrew/bin/python3'
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

if filereadable(expand("~/.config/nvim/settings/config.vim"))
  source ~/.config/nvim/settings/config.vim
endif

if filereadable(expand("~/.config/nvim/settings/nerdtree.vim"))
  source ~/.config/nvim/settings/nerdtree.vim
endif

if filereadable(expand("~/.config/nvim/settings/mappings.vim"))
  source ~/.config/nvim/settings/mappings.vim
endif

if filereadable(expand("~/.config/nvim/settings/wildignore.vim"))
  source ~/.config/nvim/settings/wildignore.vim
endif

if filereadable(expand("~/.config/nvim/settings/javascript.vim"))
  source ~/.config/nvim/settings/javascript.vim
endif

if filereadable(expand("~/.config/nvim/settings/lsp_config.lua"))
  source ~/.config/nvim/settings/lsp_config.lua
endif
