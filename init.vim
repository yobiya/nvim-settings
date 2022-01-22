
set number
set expandtab
set shiftwidth=4
set nowrap

" ハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" コマンドモードへ移行する
noremap <C-j> :

" 行頭・行末へ移動する
noremap <C-h> ^
noremap <C-l> $

" アスタリスクを入力
noremap <C-k> *
noremap! <C-k> *

" Fernを呼び出す
noremap <C-y> :Fern . -reveal=%<CR>

" fzf
noremap gm :Marks<CR>
noremap gf :Files<CR>
noremap gb :Buffers<CR>

" プラグインの読み込み
:lua require('plugins')

" easy-motion
let g:EasyMotion_leader_key = '<Space>'
map <Leader> <Plug>(easy-motion-prefix)

" showmarks
aug au-showmarks
au!
au VimEnter * DoShowMarks!
aug end

" treesitter
lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
  }
EOF

let g:nvcode_termcolors=256

syntax on
colorscheme nvcode


if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

" coc
let g:coc_global_extensions = ['coc-flutter']

nmap gd <Plug>(coc-definition)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
