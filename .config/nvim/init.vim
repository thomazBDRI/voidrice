let mapleader =" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-unimpaired'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-rooter'
Plug 'chemzqm/vim-jsx-improve'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/echodoc.vim'
call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set cursorline

" Some basics:
  nnoremap c "_c
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number relativenumber

" Tab config
  set tabstop=4
  set expandtab
  set shiftwidth=2
  set autoindent

" Enable autocompletion:
  set wildmode=longest,list,full

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
  map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
  map <leader>o :setlocal spell! spelllang=en_us<CR>

" Signify configurations
  set updatetime=100

" Execute the run.sh file inside the repository
  map <leader>c :w! \| !./run.sh %<CR>

" Jsx config
  let g:jsx_improve_motion_disable = 0

" CtrlP config
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|tags))$'

	if executable('ag')
		let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
	endif

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

	map <leader>b :CtrlPBuffer<CR>
	map <leader>t :CtrlPTag<CR>

" LSP Configs
let g:LanguageClient_serverCommands = {
    \ 'java': ['/home/thomaz/.local/bin/jdtls', '-data', getcwd()],
    \ 'bash': ['/usr/bin/bash-language-server', 'start' ],
    \ 'dockerfile': ['/usr/bin/docker-langserver', '--stdio' ],
    \ 'typescript': ['/usr/bin/typescript-language-server', '--stdio'],
    \ 'javascript': ['/usr//bin/typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['/usr/bin/typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['/usr/bin/typescript-language-server', '--stdio'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'make': ['/usr/bin/cmake-language-server'],
    \ 'groovy': ['/usr/bin/java', '-jar', '/usr/share/java/groovy-language-server/groovy-language-server.jar'],
    \ 'php': ['/usr/bin/php-language-server'],
    \ 'c': ['/usr/bin/ccls'],
    \ 'cpp': ['/usr/binccls'],
    \ 'cuda': ['/usr/bin/ccls'],
    \ 'objc': ['/usr/bin/ccls'],
    \ 'xml': ['/usr/bin/xml-language-server'],
    \ 'yaml': ['/usr/bin/yaml-language-server', '--stdio'],
    \ }

let g:LanguageClient_loggingLevel = 'DEBUG'

nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

" Always draw the signcolumn.
set signcolumn=yes
set hidden


" echodoc
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Airline configurations
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='minimalist'

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Tags config
	set tags=./.tags;
	map <leader>ut :!ctags -R --exclude=@/home/thomaz/.config/nvim/ctagsignore .<CR><CR>

" Toggle Auto indent
	set pastetoggle=<F2>

" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" When suckless files are update, install then
" FIXME: Removing because it was trigeering on list.py file
" autocmd BufWritePost *dwmc,*dwm.*,*dmenu.*,*st.* !make install clean

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
