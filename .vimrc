""" MY modifications
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif





set enc=utf-8
set expandtab sw=4 ts=4
" syntax with performance tips
syntax on
syn sync minlines=256
syn sync maxlines=512
au BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" set synmaxcol=256 " fait planter la coloration des lignes suivantes
set nocursorline
set nocursorcolumn
set number

" highlight non ascii, suspect characters
au VimEnter,BufWinEnter * syn match ErrorMsg '[^\x00-\x7F€àÀâÂéÉèÈêÊëËîÎïÏôÔöÖûÛùÙüÜçÇœŒæÆ]'

" =================================
" Statusline personnalisee (deluxe)
" =================================
if has('statusline')
    set statusline=[%n]\ %<%F\ \ %=%-19(\LINE\ %3l[%02c%03V]/%3L%)\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ %P
    set laststatus=2 " Statusline on all windows
    set ruler " Where am I
    set ch=4 " Make command line two lines high
    set shm="aAI" " What will be shown on the commandline
    set showcmd " show partial commands in status line and selected characters/lines in visual mode
endif

" source: https://github.com/sd65/MiniVim/blob/master/vimrc
" :W - To write with root rights.
command! SudoW :execute ':silent w !sudo tee % > /dev/null' | :edit!


" format JSON code
command! -range -nargs=0 -bar IndentJSON <line1>,<line2>!python -m json.tool
" format HTML code
command! -range -nargs=0 -bar IndentHTML <line1>,<line2>!tidy -q -f /dev/null -o /dev/stdout -w 0 -i --indent-spaces 2 -asxml 2> /dev/null

" nerdTree
" Ctrl + N pour Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>


" PLUGINS
source .vimrc_plugins
