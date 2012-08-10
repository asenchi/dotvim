" File: dot.vimrc
" Author: Curt Micol
" Email: asenchi@asenchi.com

" -----------------------------------------------------------------------------
" LICENSE
" -----------------------------------------------------------------------------
" Copyright (c) 2011, Curt Micol <asenchi@asenchi.com>
" 
" Permission to use, copy, modify, and/or distribute this software for any
" purpose with or without fee is hereby granted, provided that the above
" copyright notice and this permission notice appear in all copies.
" 
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
" WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
" MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
" ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
" WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
" ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
" OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------
set nocompatible                " a must
set ffs=unix,dos,mac
set hidden
set history=1000                " remember 1000 commands
set visualbell
set ruler
set title
set showcmd
set laststatus=2                " statusline tweaks
set ch=1
set textwidth=78                " 78 columns
set scrolloff=8
set sidescrolloff=20
set sidescroll=1
set showmatch                   " show matches
set linebreak
set backspace=indent,eol,start  " backspace across lines and indents
set whichwrap+=<,>,[,],h,l      " allow us to move across lines
set pastetoggle=<C-p>            " Turn off formatting when pasting
set matchpairs+=<:>

" -----------------------------------------------------------------------------
" Pathogen
" -----------------------------------------------------------------------------
filetype off
let s:bundles = tr(globpath(&runtimepath, 'bundle/*/'), "\n", ',')
let s:afters = tr(globpath(s:bundles, 'after/'), "\n", ',')
let &runtimepath = join([s:bundles, &runtimepath, s:afters], ',')
filetype plugin indent on

" -----------------------------------------------------------------------------
" PATH
" -----------------------------------------------------------------------------
if system('uname') =~ 'Darwin'
    let $PATH = '~/Developer/bin:' .
        \ '~/Developer/share/python:' .
        \ '/usr/local/bin:/usr/local/sbin:' .
        \ $PATH
endif

" -----------------------------------------------------------------------------
" Map leader key (',')
" -----------------------------------------------------------------------------
let mapleader = ","             " leader key map
let g:mapleader = ","
let maplocalleader = "\\"

" -----------------------------------------------------------------------------
" Indentation
" -----------------------------------------------------------------------------
set autoindent                  " indentation
set smartindent                 " smart indentation on new line
set tabstop=8                   " number of spaces a <tab> counts for
set shiftwidth=4                " We default to 4 spaces
set softtabstop=4               " "feels" like tabs are being inserted
set showtabline=2               " display tab page
set expandtab                   " use appropriate number of spaces insert-mode
set shellcmdflag=-c
set shell=/usr/bin/env\ zsh\ -l

" -----------------------------------------------------------------------------
" Search
" -----------------------------------------------------------------------------
set hlsearch                    " highlight search
set incsearch                   " show pattern as search is typed
set ignorecase                  " ignore case on searches

" -----------------------------------------------------------------------------
" Backups and swap
" -----------------------------------------------------------------------------
set backupdir=~/tmp/sessions    " backups

set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set noswapfile

" -----------------------------------------------------------------------------
" Wildmenu items
" -----------------------------------------------------------------------------
set wildmenu                    " enhanced command-line completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,.DS_Store,*.jpg,*.png,*.gif

" -----------------------------------------------------------------------------
" misc
" -----------------------------------------------------------------------------
set grepprg=git\ grep\ -n
let $MANPAGER = '/usr/bin/less -is'

colorscheme desert
let g:Powerline_symbols = 'unicode'

" -----------------------------------------------------------------------------
" fugitive
" -----------------------------------------------------------------------------
let g:fugitive_git_executable = '~/Developer/bin/git'

" -----------------------------------------------------------------------------
" gist
" -----------------------------------------------------------------------------
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" -----------------------------------------------------------------------------
" ctrlp
" -----------------------------------------------------------------------------
let g:ctrlp_map = '<C-x>'
let g:ctrlp_working_path_mode = 1

" -----------------------------------------------------------------------------
" Completion
" -----------------------------------------------------------------------------
set completeopt=menuone,longest,preview

" -----------------------------------------------------------------------------
" ConqueTerm
" -----------------------------------------------------------------------------
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_TERM = 'xterm'

map <leader>E :ConqueTermTab zsh<CR>
if has('gui_macvim')
    map <D-e> :ConqueTermTab zsh<CR>
endif
if has("autocmd")
    augroup ct
        au!
        autocmd FileType conque_term set colorcolumn=0
        autocmd FileType conque_term set invlist
    augroup END
endif

" -----------------------------------------------------------------------------
" Color Column (only on insert)
" -----------------------------------------------------------------------------
if exists("&colorcolumn")
    autocmd InsertEnter * set colorcolumn=80
    autocmd InsertLeave * set colorcolumn=""
endif

" -----------------------------------------------------------------------------
" vimrc hax
" -----------------------------------------------------------------------------
map <leader>v :call EditVimrc()<CR>

function! EditVimrc()
    execute ':tabedit ~/.vimrc'
endfunction

if has("autocmd")
    augroup vimrchooks
        au!
        autocmd bufwritepost .vimrc source ~/.vimrc
        autocmd bufwritepost dot.vimrc source ~/.vimrc
    augroup END
endif

" -----------------------------------------------------------------------------
" mappings!
" -----------------------------------------------------------------------------
" Edit a new file using current file's path
map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>
map <leader>te :tabe <C-R>=expand("%:p:h") . "/"<CR>

" Change path for all buffers or just locally
nmap <leader>cd :cd%:p:h<CR>
nmap <leader>.  :lcd%:p:h<CR>

" Quick write
nmap <leader>w :w<CR>
nmap <leader>W :w!<CR>

" New line
nmap <CR> o<Esc>

" Some <space> hacks
nnoremap <SPACE><SPACE> :!

" Some sane shortcuts
nmap F %
nmap Y y$
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

" Press '@h' and the character you want to use for heading (great for ReST)
let @h = "yypVr"

" Remove search hilight
nnoremap <leader><space> :nohlsearch<CR>

" Split line
nnoremap S i<cr><esc><right>

" Replace <ESC> functionality with easier to reach key cmds.
inoremap jj <ESC>

" Fill window with buffer
map <leader>F <C-W>_

" Move selection up and down
map  <C-Down> ddp
map  <C-Up>   ddkP
vmap <C-Down> xp`[V`]
vmap <C-Up>   x<Up>P`[V`]

" mimic some common emacs keys
map  <C-e> $
map  <C-a> 0
imap <C-a> <C-o>0
imap <C-e> <C-o>$

" For when I need to sudo a sandwich
cmap w!! %!sudo tee > /dev/null %

" date shortcuts
iab YMD <C-R>=strftime("%Y-%m-%d")<CR>
iab NOW <C-R>=strftime("%c")<CR>

" auto-indent according to surrounding code
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v']=
nnoremap P P'[v']=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L505
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if filereadable("script/test")
        exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
        exec ":!bundle exec rspec --color --format=documentation " . a:filename
    else
        exec ":!rspec --color --format=documentation " . a:filename
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>

" -----------------------------------------------------------------------------
" tabs!
" -----------------------------------------------------------------------------
map <leader>tn <ESC>:tabnext<CR>
map <leader>tp <ESC>:tabprev<CR>
map <leader>tc <ESC>:tabnew<CR>
map <leader>td <ESC>:tabclose<CR>
map <leader>tm <ESC>:tabmove<CR>

if &t_Co > 2 || has('gui_running')
    nmap <d-1> :tabn 1
    nmap <d-2> :tabn 2
    nmap <d-3> :tabn 3
    nmap <d-4> :tabn 4
    nmap <d-5> :tabn 5
    nmap <d-6> :tabn 6
    nmap <d-7> :tabn 7
    nmap <d-8> :tabn 8
    nmap <d-9> :tabn 9
    nmap <c-tab> :tabnext<cr>
    nmap <c-s-tab> :tabprevious<cr>

    if has('gui_macvim')
        map <D-1> :tabn 1<CR>
        map <D-2> :tabn 2<CR>
        map <D-3> :tabn 3<CR>
        map <D-4> :tabn 4<CR>
        map <D-5> :tabn 5<CR>
        map <D-6> :tabn 6<CR>
        map <D-7> :tabn 7<CR>
        map <D-8> :tabn 8<CR>
        map <D-9> :tabn 9<CR>
        map! <D-1> <C-O>:tabn 1<CR>
        map! <D-2> <C-O>:tabn 2<CR>
        map! <D-3> <C-O>:tabn 3<CR>
        map! <D-4> <C-O>:tabn 4<CR>
        map! <D-5> <C-O>:tabn 5<CR>
        map! <D-6> <C-O>:tabn 6<CR>
        map! <D-7> <C-O>:tabn 7<CR>
        map! <D-8> <C-O>:tabn 8<CR>
        map! <D-9> <C-O>:tabn 9<CR>
    endif
endif

" -----------------------------------------------------------------------------
" guioptions
" -----------------------------------------------------------------------------
if &t_Co > 2 || has('gui_running')
    syntax on
    set hlsearch
    let g:manpageview_pgm= 'man -P "/usr/bin/less -is"'
    set cursorline
    set encoding=utf-8
    set go+=c
    set go-=m
    set go-=r
    set go-=R
    set go-=l
    set go-=L
    set go-=T
    set go-=b
    set go-=h

    if has('gui_macvim')
        set guifont=Droid\ Sans\ Mono:h14
        set fuoptions=maxvert,maxhorz
        set background=dark
        set antialias
    endif
endif

" -----------------------------------------------------------------------------
" Strip whitespace
" -----------------------------------------------------------------------------
map <leader>S :call StripWhitespace ()<CR>
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction

" -----------------------------------------------------------------------------
" toggle listchars
" -----------------------------------------------------------------------------
function! ToggleListChars()
    if &list
        set invlist
    else
        set list
        set listchars=tab:▸·,eol:¬,trail:·
    endif
endfunction
nmap <leader>' :call ToggleListChars()<CR>

" -----------------------------------------------------------------------------
" Open browser on the URL
" -----------------------------------------------------------------------------
map <leader>B :call Browser()<CR>
function! Browser()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ )]*")
    let line = escape (line, "#?&;|%")
    exec ':silent !open ' . "\"" . line . "\""
endfunction

" -----------------------------------------------------------------------------
" Hax
" -----------------------------------------------------------------------------
if has('autocmd')
    " Group these to make it easy to delete
    augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78

    " Jump to last known cursor position.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ end
    augroup END
else
    set autoindent
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" -----------------------------------------------------------------------------
" Functions
" -----------------------------------------------------------------------------
function! CurDir()
    let curdir = getcwd()
    let curdir_a = split(curdir, '/')
    let reldir = join([curdir_a[-2], curdir_a[-1]], '/')
    return reldir
endfunction

function! GuiTabLabel()
    " add the tab number
    let label = '[ '.tabpagenr()
    " modified since the last save?
    let buflist = tabpagebuflist(v:lnum)
    for bufnr in buflist
        if getbufvar(bufnr, '&modified')
            let label .= '*'
            break
        endif
    endfor
    " count number of open windows in the tab
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= ', '.wincount
    endif
    let label .= ' ] '
    " add the file name without path information
    let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
    let label .= fnamemodify(n, ':t')
    return label
endfunction

" nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

if has("autocmd")
" -----------------------------------------------------------------------------
" python
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.py       setlocal ft=python tw=80 ts=4 sw=4 et
    au FileType python setlocal complete+=k~/.vim/syntax/python.vim "isk+=.,(
" -----------------------------------------------------------------------------
" sql
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.sql      setlocal ft=pgsql
" -----------------------------------------------------------------------------
" markdown
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.md       setlocal ft=mkd tw=78 ts=2 sw=2 expandtab
    au BufRead,BufNewFile *.markdown setlocal ft=mkd tw=78 ts=2 sw=2 expandtab
" -----------------------------------------------------------------------------
" ReST
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.rst      setlocal ft=rst tw=78 ts=4 sw=4 expandtab
" -----------------------------------------------------------------------------
" CSV
" -----------------------------------------------------------------------------
    au BufNewFile,BufRead *.csv      setlocal ft=csv
" -----------------------------------------------------------------------------
" ruby
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile Gemfile    setlocal ft=ruby
    au BufRead,BufNewFile Rakefile   setlocal ft=ruby
    au BufRead,BufNewFile Thorfile   setlocal ft=ruby
    au BufRead,BufNewFile *.ru       setlocal ft=ruby
    au FileType ruby                 setlocal tw=80 ts=2 sts=2 sw=2 expandtab
" -----------------------------------------------------------------------------
" redo
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.do       setlocal ft=sh tw=80 ts=4 sw=4 expandtab
" -----------------------------------------------------------------------------
" golang
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.go       setlocal ft=go ts=8 sw=8 expandtab
" -----------------------------------------------------------------------------
" shell
" -----------------------------------------------------------------------------
    au BufRead,BufNewFile *.sh       setlocal ft=sh tw=80 ts=4 sw=4 expandtab
    au BufRead,BufNewFile *.zsh      setlocal ft=sh tw=80 ts=4 sw=4 expandtab
    au BufRead,BufNewFile *.bash     setlocal ft=sh tw=80 ts=4 sw=4 expandtab
" -----------------------------------------------------------------------------
" html/css
" -----------------------------------------------------------------------------
    au FileType html,css setlocal ts=2 sts=2 sw=2 expandtab
    let html_no_rendering=1
" -----------------------------------------------------------------------------
" javascript
" -----------------------------------------------------------------------------
    au FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
" -----------------------------------------------------------------------------
" git
" -----------------------------------------------------------------------------
    au FileType gitcommit setlocal tw=60
" -----------------------------------------------------------------------------
" make
" -----------------------------------------------------------------------------
    au FileType make setlocal noexpandtab
" -----------------------------------------------------------------------------
" perl
" -----------------------------------------------------------------------------
    au FileType perl setlocal mp=perl\ -c\ %\ $* errorformat=%f:%l:%m aw
" -----------------------------------------------------------------------------
endif

" -----------------------------------------------------------------------------
" statusline
" -----------------------------------------------------------------------------
set stl=%{fugitive#statusline()}[%l,%v\ %P%M]\ %f\ %r%h%w\ %r%{CurDir()}%h
