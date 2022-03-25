"dein Scripts-----------------------------
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.config/nvim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
"End dein Scripts-------------------------

syntax enable
colorscheme tender

inoremap <silent> jj <ESC>
set tabstop=4
set shiftwidth=4
set clipboard+=unnamed

let mapleader = "\<Space>"

nnoremap <leader>w :w<cr>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>

" Fern Setting -----------------------------------------
nnoremap <leader>e <cmd>Fern . -reveal=% -toggle -drawer<cr>
let g:fern#default_hidden=1
" End --------------------------------------------------

set number
set expandtab
set hidden
nnoremap <c-j> :bprev<cr>
nnoremap <c-k> :bnext<cr>
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
}
EOF
