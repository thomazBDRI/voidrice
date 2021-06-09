let mapleader =" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

<<<<<<< HEAD
map ,, :keepp /<++><CR>ca<
imap ,, <esc>:keepp /<++><CR>ca<

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
||||||| parent of 96a96c8 (added Ansible configuration)
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
=======
call plug#begin('~/.config/nvim/plugged')
" {{{ Quick Edits
>>>>>>> 96a96c8 (added Ansible configuration)
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
<<<<<<< HEAD
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
<<<<<<< HEAD
Plug 'vim-airline/vim-airline'
||||||| parent of bd603d9 (Added a lot of fzf stuff on zsh)
Plug 'bling/vim-airline'
=======
>>>>>>> bd603d9 (Added a lot of fzf stuff on zsh)
||||||| parent of 96a96c8 (added Ansible configuration)
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
=======
>>>>>>> 96a96c8 (added Ansible configuration)
Plug 'tpope/vim-commentary'
" }}}

" {{{ Syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'kovetskiy/sxhkd-vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'sheerun/vim-polyglot'
" }}}

" {{{ Motions and File/Buffer Motions
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'unblevable/quick-scope'
" {{{
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
"}}}

" }}}

" {{{ Visual
Plug 'ap/vim-css-color' " Try adding hex colors
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'
" {{{ Airline Configs
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='onedark'
" }}}

Plug 'joshdick/onedark.vim'
" {{{
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"}}}

Plug 'kshenoy/vim-signature'
" {{{
  let g:SignatureMarkerTextHL = 'Typedef'
  let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "m<Space>",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "",
    \ 'GotoPrevLineAlpha'  :  "",
    \ 'GotoNextSpotAlpha'  :  "",
    \ 'GotoPrevSpotAlpha'  :  "",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "]`",
    \ 'GotoPrevSpotByPos'  :  "[`",
    \ 'GotoNextMarker'     :  "[+",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListLocalMarks'     :  "m/",
    \ 'ListLocalMarkers'   :  "m?"
    \ }
" }}}

Plug 'airblade/vim-gitgutter'
" {{{
  let g:gitgutter_map_keys = 0
  let g:gitgutter_max_signs = 200
  let g:gitgutter_realtime = 1
  let g:gitgutter_eager = 1
  let g:gitgutter_sign_removed = '–'
  let g:gitgutter_diff_args = '--ignore-space-at-eol'
  nmap <silent> ]h :GitGutterNextHunk<CR>
  nmap <silent> [h :GitGutterPrevHunk<CR>
  nnoremap <silent> <Leader>gu :GitGutterUndoHunk<CR>
  nnoremap <silent> <Leader>gp :GitGutterPreviewHunk<CR><c-w>j
  nnoremap cog :GitGutterToggle<CR>
  nnoremap <Leader>gt :GitGutterAll<CR>
" }}}

" }}}

" {{{ Auto Complete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     ## I Believe i don't need this anymore as i use tabnine
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" {{{ LSP Configs

"   let g:LanguageClient_serverCommands = {
"       \ 'dart': ['/usr/bin/dart', '/opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp', '--client-id', 'vim', '--client-version', '1.2'],
"       \ 'java': ['/usr/bin/jdtls', '-data', getcwd()],
"       \ 'scala': ['/usr/bin/metals-vim'],
"       \ 'bash': ['/usr/bin/bash-language-server', 'start' ],
"       \ 'zsh': ['/usr/bin/bash-language-server', 'start' ],
"       \ 'sh': ['/usr/bin/bash-language-server', 'start' ],
"       \ 'dockerfile': ['/usr/bin/docker-langserver', '--stdio' ],
"       \ 'typescript': ['/usr/bin/typescript-language-server', '--stdio'],
"       \ 'javascript': ['/usr/bin/typescript-language-server', '--stdio'],
"       \ 'javascriptreact': ['/usr/bin/typescript-language-server', '--stdio'],
"       \ 'typescript.tsx': ['/usr/bin/typescript-language-server', '--stdio'],
"       \ 'javascript.jsx': ['/usr/bin/typescript-language-server', '--stdio'],
"       \ 'python': ['/usr/bin/pyls'],
"       \ 'make': ['/usr/bin/cmake-language-server'],
"       \ 'groovy': ['/usr/bin/java', '-jar', '/usr/share/java/groovy-language-server/groovy-language-server.jar'],
"       \ 'php': ['/usr/bin/php-language-server'],
"       \ 'c': ['/usr/bin/ccls'],
"       \ 'cpp': ['/usr/bin/ccls'],
"       \ 'cuda': ['/usr/bin/ccls'],
"       \ 'objc': ['/usr/bin/ccls'],
"       \ 'xml': ['/usr/bin/xml-language-server'],
"       \ 'yaml': ['/usr/bin/yaml-language-server', '--stdio'],
"       \ }

"   let g:LanguageClient_windowLogMessageLevel = 'Log'
"   let g:LanguageClient_hoverPreview = 'Always'

"   nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"   nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"   nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"   nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"   nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"   nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"   nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"   nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"   nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"   nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" " }}}

Plug 'Shougo/echodoc.vim'
" {{{  echodoc configs
  let g:echodoc_enable_at_startup = 1
" }}}

" Plug 'zxqfl/tabnine-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" {{{ Coc configs

  set updatetime=300
  set shortmess+=c

  " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  let g:coc_snippet_next = '<tab>'
  xmap <leader>x  <Plug>(coc-convert-snippet)

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> <leader>ld <Plug>(coc-definition)
  nmap <silent> <leader>ly <Plug>(coc-type-definition)
  nmap <silent> <leader>li <Plug>(coc-implementation)
  nmap <silent> <leader>le <Plug>(coc-references)
  nmap <leader>lr <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>lf  <Plug>(coc-format-selected)
  nmap <leader>lf  <Plug>(coc-format-selected)

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>la  <Plug>(coc-codeaction-selected)
  nmap <leader>la  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>lac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>lqf  <Plug>(coc-fix-current)

  " Show commands.
  nnoremap <silent><nowait> <leader>lc  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <leader>lo  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <leader>ls  :<C-u>CocList -I symbols<cr>

  augroup cocgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json,dart,python setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Use K to show documentation in preview window.
  nnoremap <silent> <leader>lK :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" }}}
" }}}

" {{{ Snippets
Plug 'honza/vim-snippets'
"}}}

" {{{ Integrations
Plug 'jreybert/vimagit'

Plug 'vimwiki/vimwiki'
" {{{
  let wiki_1 = {}
  let wiki_1.path = $VIMWIKI
  let wiki_1.path_html = $VIMWIKI_HTML
  let wiki_1.template_path = $VIMWIKI_TEMPLATE
  let g:vimwiki_list = [wiki_1]

  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" }}}

Plug 'tpope/vim-dispatch'

Plug 'janko-m/vim-test'
" {{{ Vim-Test configs
  " Languages tests
  let test#python#runner = 'pytest'

  let test#go#runner = 'gotest'
  let test#go#file_pattern = '.*'

  function! TerminalSplitStrategy(cmd) abort
    tabnew | call termopen(a:cmd) | startinsert
  endfunction
  let g:test#custom_strategies = get(g:, 'test#custom_strategies', {})
  let g:test#custom_strategies.terminal_split = function('TerminalSplitStrategy')
  "let test#strategy = 'terminal_split'
  let test#strategy = 'dispatch'

  nnoremap <silent> <leader>rf :TestFile<CR>
  nnoremap <silent> <leader>rn :TestNearest<CR>
  nnoremap <silent> <leader>rs :TestSuite<CR>
  nnoremap <silent> <leader>ra :TestLast<CR>
  nnoremap <silent> <leader>ro :TestVisit<CR>
" }}}

Plug 'tpope/vim-fugitive'
" {{{
  " Fix broken syntax highlight in gitcommit files
  " (https://github.com/tpope/vim-git/issues/12)
  let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gl :Gllog<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gp :Gpush<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  nnoremap <silent> <leader>gE :Gedit<space>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gR :Gread<space>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gW :Gwrite!<CR>
  nnoremap <silent> <leader>gq :Gwq<CR>
  nnoremap <silent> <leader>gQ :Gwq!<CR>
  nnoremap <silent> <leader>gB :!hub browse<CR>

  function! ReviewLastCommit()
    if exists('b:git_dir')
      Gtabedit HEAD^{}
      nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
    else
      echo 'No git a git repository:' expand('%:p')
    endif
  endfunction
  nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

  augroup fugitiveSettings
    autocmd!
    autocmd FileType gitcommit setlocal nolist
    autocmd BufReadPost fugitive://* setlocal bufhidden=delete
  augroup END
" }}}
" }}}

" {{{ Utilities
Plug 'tpope/vim-repeat'  " Add '.' repeat capacities for plugins mappings

Plug 'airblade/vim-rooter' " Move to root of the .git folder
" {{{
  let g:rooter_manual_only = 1
  map <leader>ch :Rooter<CR>
" }}}

Plug 'tpope/vim-obsession' " Saves current session of vim

" Nerdtree icons
Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'
" {{{ Nerdtree configurations
  nnoremap <leader>n :NERDTreeFocus<CR>
  nnoremap <F3> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>
"}}}

" }}}

" {{{ Augroups

  " {{{ Dart
  augroup filetype_dart
    autocmd!
    autocmd FileType dart nnoremap <buffer> <F5> :!kill -SIGUSR1 "$(pgrep -f flutter_tools.snapshot\ run)" &> /dev/null<CR>
  augroup END
  " }}}

" }}}
" TODO: Continue the folding configuration here to keep file clean

call plug#end()

set title
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set cursorline

colorscheme onedark


" Some basics:
  nnoremap c "_c
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number relativenumber
  set foldmethod=marker


" Tab config

  set tabstop=4
  set expandtab
  set shiftwidth=2
  set autoindent

" Enable autocompletion:
"  set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

<<<<<<< HEAD
<<<<<<< HEAD
" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>
||||||| parent of fcc145d (Added stuff for vim)
" vimling:
	nm <leader><leader>d :call ToggleDeadKeys()<CR>
	imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader><leader>i :call ToggleIPA()<CR>
	imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader><leader>q :call ToggleProse()<CR>
=======
||||||| parent of ebc9118 (Bring some files from backup to new module)
=======
" Signify configurations
  set updatetime=100

>>>>>>> ebc9118 (Bring some files from backup to new module)
" Execute the run.sh file inside the repository
" map <leader>c :w! \| !./run.sh %<CR>

" Terminal inside vim
" {{{
  tnoremap <C-w><C-h> <C-\><C-N><C-w>h
  tnoremap <C-w><C-j> <C-\><C-N><C-w>j
  tnoremap <C-w><C-k> <C-\><C-N><C-w>k
  tnoremap <C-w><C-l> <C-\><C-N><C-w>l
  inoremap <C-w><C-h> <C-\><C-N><C-w>h
  inoremap <C-w><C-j> <C-\><C-N><C-w>j
  inoremap <C-w><C-k> <C-\><C-N><C-w>k
  inoremap <C-w><C-l> <C-\><C-N><C-w>l

  " Open terminal below
  map <leader>t :w! \| split \| terminal <CR>

" Exit terminal window in human way Ctrl + N
  tnoremap <C-t> <C-\><C-n>:q<CR>
" }}}

" Zoom panel function
" {{{
  nnoremap <leader><leader>z :call ZoomToggle()<cr>

  let g:is_zoomed = 0

  function! ZoomToggle()
    if g:is_zoomed
      :normal =
      let g:is_zoomed = 0
    else
      :normal |
      :normal _
      let g:is_zoomed = 1
    endif
  endfunction
" }}}

" Jsx config
  let g:jsx_improve_motion_disable = 0

" FZF configuration
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space>lb :Files /home/thomaz/.local/bin<CR>
  nnoremap <silent> <leader><space>cf :Files /home/thomaz/.config<CR>
  nnoremap <silent> <leader><space>ez :Files /home/thomaz/envs/zoni<CR>
  nnoremap <silent> <leader><space>ezr :Files /home/thomaz/envs/zoni/repos<CR>
  nnoremap <silent> <leader><space>ezfl :Files /home/thomaz/envs/zoni/repos/em-rep-flutter<CR>
  nnoremap <silent> <leader><space>ezfle :Files /home/thomaz/envs/zoni/repos/getx_pattern<CR>
  nnoremap <silent> <leader><space>h :Files /home/thomaz<CR>
  nnoremap <silent> <leader><space>. :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>, :AgIn

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)


" Location and Quick list
noremap <F12> :ccl <bar> lcl <bar> pc<CR>
noremap <F11> :cw<CR>
noremap <F10> :lw<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<RIGHT>"
let g:UltiSnipsJumpBackwardTrigger="<LEFT>"

" Always draw the signcolumn.
set signcolumn=yes
set hidden

" echodoc
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Folding jump
nnoremap <silent> <leader>zj :<c-u>call RepeatCmd('call NextClosedFold("j")')<cr>
nnoremap <silent> <leader>zk :<c-u>call RepeatCmd('call NextClosedFold("k")')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! RepeatCmd(cmd) range abort
    let n = v:count < 1 ? 1 : v:count
    while n > 0
        exe a:cmd
        let n -= 1
    endwhile
endfunction

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

<<<<<<< HEAD
<<<<<<< HEAD
" Airline configurations
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='minimalist'
>>>>>>> fcc145d (Added stuff for vim)

||||||| parent of 96a96c8 (added Ansible configuration)
" Airline configurations
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='minimalist'

=======
>>>>>>> 96a96c8 (added Ansible configuration)
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
||||||| parent of 98e52fa (Added tasksync)
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
=======
" I like to use C-w :D
" " Shortcutting split navigation, saving a keypress:
" 	map <C-h> <C-w>h
" 	map <C-j> <C-w>j
" 	map <C-k> <C-w>k
" 	map <C-l> <C-w>l
>>>>>>> 98e52fa (Added tasksync)

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

<<<<<<< HEAD
<<<<<<< HEAD
" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex<CR>
	let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

||||||| parent of 9807dd1 (Added vimwiki configs)
" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

=======
>>>>>>> 9807dd1 (Added vimwiki configs)
||||||| parent of 9c1f369 (Added coc.nvim)
=======
" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

>>>>>>> 9c1f369 (Added coc.nvim)
" Save file as sudo on files that require root permission
	cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Toggle Auto indent
	set pastetoggle=<F2>

<<<<<<< HEAD
" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

<<<<<<< HEAD
<<<<<<< HEAD
" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
||||||| parent of fcc145d (Added stuff for vim)
" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
=======
" Enable Goyo by default for commit writting
	autocmd BufRead,BufNewFile COMMIT_EDITMSG let g:goyo_width=80
	autocmd BufRead,BufNewFile COMMIT_EDITMSG :Goyo | set bg=light
	autocmd BufRead,BufNewFile COMMIT_EDITMSG map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile COMMIT_EDITMSG map ZQ :Goyo\|q!<CR>

||||||| parent of ebc9118 (Bring some files from backup to new module)
" Enable Goyo by default for commit writting
	autocmd BufRead,BufNewFile COMMIT_EDITMSG let g:goyo_width=80
	autocmd BufRead,BufNewFile COMMIT_EDITMSG :Goyo | set bg=light
	autocmd BufRead,BufNewFile COMMIT_EDITMSG map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile COMMIT_EDITMSG map ZQ :Goyo\|q!<CR>

=======
>>>>>>> ebc9118 (Bring some files from backup to new module)
||||||| parent of 6de2081 (A lot of vim, zsh and dwmblocks modifications)
" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

=======
>>>>>>> 6de2081 (A lot of vim, zsh and dwmblocks modifications)
" Automatically deletes all trailing whitespace on save.
<<<<<<< HEAD
>>>>>>> fcc145d (Added stuff for vim)
	autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
  autocmd BufWritePre *neomutt* %s/^--$/-- /e " dash-dash-space signature delimiter in emails
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
||||||| parent of 7390e82 (Stuff added)
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
=======
	" autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
>>>>>>> 7390e82 (Stuff added)

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; make install && { killall -q dwmblocks;setsid -f dwmblocks }

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>
" Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
" Here leader is ";".
" So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
" if typed fast without the timeout.
silent! source ~/.config/nvim/shortcuts.vim
