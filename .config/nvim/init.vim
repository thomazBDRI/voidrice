"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-rooter'
call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set tabstop=2
	set softtabstop=0
	set expandtab
	set shiftwidth=2
	set smarttab

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Remove .viminfo from home
set viminfo+=n~/.config/nvim/viminfo

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Execute the run.sh file inside the repository
    map <leader>c :w! \| !run.sh <CR>

" Open corresponding .pdf/.html or preview
	map <leader>o :!opout <c-r>%<CR><CR>

" CtrlP config
	let g:ctrlp_working_path_mode = 'ra'

	" Hiding Useless CtrlP statusline
	let g:ctrlp_buffer_func = {
	  \ 'enter': 'HideStatusLine',
	  \ 'exit': 'RestoreStatusLine'
	  \ }

	function! HideStatusLine()
	  let g:laststatus_last_value=&laststatus
	  set laststatus=0
    	endfunction

    	function! RestoreStatusLine()
	      let &laststatus=g:laststatus_last_value
      	endfunction

	map <leader>pb :CtrlPBuffer<CR>
	map <leader>pt :CtrlPTag<CR>

" Tags config
	set tags=./.tags;
	map <leader>ut :!ctags -R --exclude=@~/.config/nvim/.ctagsignore .<CR><CR>

" Toggle Auto indent
	set pastetoggle=<F2>

" Jumps config
	function! GotoJump()
	  jumps
	  let j = input("Please select your jump: ")
	  if j != ''
	    let pattern = '\v\c^\+'
	    if j =~ pattern
	      let j = substitute(j, pattern, '', 'g')
	      execute "normal " . j . "\<c-i>"
      	    else
	      execute "normal " . j . "\<c-o>"
	    endif
	  endif
	endfunction

	nmap <leader>j :call GotoJump()<CR>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost *bmdirs,*bmfiles !shortcuts

" When suckless files are update, install then
  autocmd BufWritePost *dwm*,*dmenu*,*st*,*dwmstatus* !make install clean

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
