:lua require('settings')
:lua require('keymaps')
:lua require('plugins')

" easy-motion
let g:EasyMotion_leader_key = '<Space>'
map <Leader> <Plug>(easy-motion-prefix)

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

if !exists('g:vscode')

" Fernを呼び出す
noremap <C-y> :Fern . -reveal=%<CR>

" fzf
noremap gm :Marks<CR>
noremap gf :Files<CR>
noremap gb :Buffers<CR>

" showmarks
aug au-showmarks
au!
au VimEnter * DoShowMarks!
aug end

" treesitter
lua << EOF
  require'nvim-treesitter.configs'.setup {
    ignore_install = { "beancount", "fortran", "zig" },
    ensure_installed = "all",
    highlight = {
      enable = true,
      disable = { "beancount", "fortran", "zig" },
    },
  }
EOF

" fern
let g:fern#default_exclude = '\%(\.meta\)$'

let g:nvcode_termcolors=256

syntax on
colorscheme nvcode


if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

" coc
let g:coc_global_extensions = ['coc-flutter', 'coc-clangd', 'coc-omnisharp']

nmap gd <Plug>(coc-definition)
nmap <F2> <Plug>(coc-rename)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <C-.> <Plug>(coc-codeaction-cursor)

" fzf

" プレビューウィンドウを無効にする
let g:fzf_preview_window = []

aug au-insert
au!
  let zenhanPath = substitute($EXTERNAL_TOOLS . '\zenhan.exe 0', '\', '/', 'g')
  au InsertLeave * :call system(zenhanPath)

  " インサートモードの日本語入力の最中にアルファベット入力に切り替わってしまう場合があるので CmdlineLeave には設定しない
" au CmdlineLeave * :call system(zenhanPath)
aug end

end