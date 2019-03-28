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
Plug 'PotatoesMaster/i3-vim-syntax'
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
	set tabstop=4
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

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
"	map <leader>c :w! \| !compiler <c-r>%<CR><CR>
" Changing to my own
    map <leader>c :w! \| !run.sh <CR>

" Open corresponding .pdf/.html or preview
	map <leader>o :!opout <c-r>%<CR><CR>

" Toggle autocompiler
	map <leader>a :!setsid autocompiler % &<CR><CR>

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

	map <leader>p :CtrlP<CR>
	map <leader>pb :CtrlPBuffer<CR>
	map <leader>pt :CtrlPTag<CR>

" Tags config
	set tags=./tags;
	map <leader>ut :!ctags -R --exclude=@/home/thomaz/.ctagsignore .<CR><CR>

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


""" AUTORUNS
" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Auto compile tasksh when modified
	autocmd BufWritePost ~/repos/programs/taskshell/src/* !sudo make -C ~/repos/programs/taskshell install

" Auto compile st when modified
	autocmd BufWritePost ~/repos/programs/st/*.h,~/repos/programs/st/*.cpp !sudo make -C ~/repos/programs/st install

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Navigating with guides
	"inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	"vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	"map <Space><Tab> <Esc>/<++><Enter>"_c4l

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"""LATEX
	" Word count:
	"autocmd FileType tex map <leader><leader>o :w !detex \| wc -w<CR>
	" Code snippets
	"autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	"autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	"autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	"autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	"autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	"autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	"autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	"autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	"autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	"autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	"autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	"autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	"autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	"autocmd FileType tex inoremap ,li <Enter>\item<Space>
	"autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	"autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	"autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	"autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	"autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	"autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	"autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	"autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	"autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	"autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	"autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	"autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	"autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	"autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	"autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	"autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	"autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	"autocmd FileType tex inoremap ,bt {\blindtext}
	"autocmd FileType tex inoremap ,nu $\varnothing$
	"autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	"autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
	"autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	"autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	"autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	"autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	"autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	"autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	"autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	"autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	"autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	"autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	"autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	"autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	"autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	"autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	"autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	"autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	"autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	"autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	"autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	"autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	"autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	"autocmd FileType html inoremap &<space> &amp;<space>
	"autocmd FileType html inoremap á &aacute;
	"autocmd FileType html inoremap é &eacute;
	"autocmd FileType html inoremap í &iacute;
	"autocmd FileType html inoremap ó &oacute;
	"autocmd FileType html inoremap ú &uacute;
	"autocmd FileType html inoremap ä &auml;
	"autocmd FileType html inoremap ë &euml;
	"autocmd FileType html inoremap ï &iuml;
	"autocmd FileType html inoremap ö &ouml;
	"autocmd FileType html inoremap ü &uuml;
	"autocmd FileType html inoremap ã &atilde;
	"autocmd FileType html inoremap ẽ &etilde;
	"autocmd FileType html inoremap ĩ &itilde;
	"autocmd FileType html inoremap õ &otilde;
	"autocmd FileType html inoremap ũ &utilde;
	"autocmd FileType html inoremap ñ &ntilde;
	"autocmd FileType html inoremap à &agrave;
	"autocmd FileType html inoremap è &egrave;
	"autocmd FileType html inoremap ì &igrave;
	"autocmd FileType html inoremap ò &ograve;
	"autocmd FileType html inoremap ù &ugrave;


""".bib
	"autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	"autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	"autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
	"autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	"autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

