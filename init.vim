" ハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" コマンドモードへ移行する
noremap <C-j> :

" 行頭・行末へ移動する
noremap <C-h> 0
noremap <C-l> $

" アスタリスクを入力
noremap <C-k> *
noremap! <C-k> *

:lua require('plugins')