" File: dot.vimrc
" Author: curt micol
" Email: asenchi@asenchi.com

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

" A must for all VIM's
set nocompatible                " a must
set hidden
set ruler
set title
set showcmd
set laststatus=2                " statusline tweaks
set ch=1
set ffs=unix,dos,mac
set history=1000                " remember 1000 commands
set visualbell
set autoindent                  " indentation
set smartindent
set scrolloff=3
set hlsearch                    " highlight search
set showmatch                   " show matches
set incsearch
set ignorecase                  " ignore case on searches
set tabstop=8                   " whitespace
set shiftwidth=4                " We default to 4 spaces
set softtabstop=4
set showtabline=2
set expandtab
set linebreak
set textwidth=78                " 78 columns
set backspace=indent,eol,start  " backspace across lines and indents
set whichwrap+=<,>,[,],h,l      " allow us to move across lines
set pastetoggle=<F6>            " Turn off formatting when pasting
set backupdir=~/tmp/sessions    " backups
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set noswapfile

set wildmenu                    " tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,.DS_Store,*.jpg,*.png,*.gif

filetype off
let s:bundles = tr(globpath(&runtimepath, 'bundle/*/'), "\n", ',')
let s:afters = tr(globpath(s:bundles, 'after/'), "\n", ',')
let &runtimepath = join([s:bundles, &runtimepath, s:afters], ',')
filetype plugin indent on

set background=light
colorscheme solarized

let mapleader = ","             " leader key map
let g:mapleader = ","
let maplocalleader = "\\"

" fugitive
let g:fugitive_git_executable = '~/Developer/bin/git'
" manpages
let $MANPAGER = '/usr/bin/less -is'

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" TaskList
map <leader>tl :TaskList<CR>

" Gundo
map <leader>g :GundoToggle<CR>

let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

if exists("&colorcolumn")
    set colorcolumn=80
endif

" rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" py.test
" Execute the tests
nmap <silent><Leader>pf <Esc>:Pytest file<CR>
nmap <silent><Leader>pc <Esc>:Pytest class<CR>
nmap <silent><Leader>pm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>pn <Esc>:Pytest next<CR>
nmap <silent><Leader>pp <Esc>:Pytest previous<CR>
nmap <silent><Leader>pe <Esc>:Pytest error<CR>

" I work mostly on a laptop, f1 gets in the ways sometimes.
map <F1> <Esc>
map <leader>n :set number<CR>
map <leader>N :set nonumber<CR>

" shortcuts for appending local path
map <leader>e :e <C-R>=expand("%:p:h") . "/"<CR>
map <leader>te :tabe <C-R>=expand("%:p:h") . "/"<CR>

" conque term
map <leader>E :call StartTerm()<CR>

" ctags
let Tlist_Ctags_Cmd = '/Users/asenchi/Developer/bin/ctags'
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <leader>c :TlistToggle<CR>

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$']
map <F5> :NERDTreeToggle<CR>

" Some neat rc file tweaks
map <leader>v :call EditVimrc()<CR>
function! EditVimrc()
    execute ':split ~/.vimrc'
endfunction

if has("autocmd")
    augroup vimrchooks
        au!
        autocmd bufwritepost .vimrc source ~/.vimrc
        autocmd bufwritepost dot.vimrc source ~/.vimrc
    augroup END
endif

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" change path across all windows
nmap <leader>cd :cd%:p:h<CR>
" change path locally
nmap <leader>. :lcd%:p:h<CR>
" quick write
nmap <leader>w :w<CR>
nmap <leader>W :w!<CR>
" new line
nmap <CR> o<Esc>
" Some sane shortcuts
nmap F %
nmap Y y$

" Press '@h' and the character you want to use for heading
let @h = "yypVr"

" remove search hilight
nnoremap <leader><space> :nohlsearch<CR>
" replace <ESC> functionality with easier to reach key cmds.
inoremap jj <ESC>

" tab for brackets
nnoremap <tab> %
vnoremap <tab> %

" fill window with buffer
map <leader>F <C-W>_
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move selection up and down
map <C-Down> ddp
map <C-Up> dd<Up>P
vmap <C-Down> xp`[V`]
vmap <C-Up> x<Up>P`[V`]

" mimic some common emacs keys
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" tabs!
map tn <Esc>:tabnext<cr>
map tp <Esc>:tabprev<cr>
map tc <Esc>:tabnew<cr>
map td <Esc>:tabclose<cr>
map tm <Esc>:tabmove<cr>

if has("ruby") || version > 700
    map <C-b> :LustyBufferExplorer<cr>
    map <leader>b :LustyBufferExplorer<cr>
    map <leader>lg :LustyBufferGrep<cr>
    map <leader>f :LustyFilesystemExplorerFromHere<cr>
endif

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
    set guifont=Inconsolata:h12

    " C-# switches to tab
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
        set guifont=Menlo\ Bold:h16
        set fuoptions=maxvert,maxhorz
        set background=light
        colorscheme solarized

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
        set antialias

        map <D-E> :call StartTerm()<CR>

        nmap <D-[> <<
        nmap <D-]> >>
        vmap <D-[> <gv
        vmap <D-]> >gv
    endif
endif

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

    " Spell check on when entering insert mode
    "autocmd InsertEnter * setlocal spell
    " No spell check when leaving insert mode
    "autocmd InsertLeave * setlocal nospell
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

" date shortcuts
iab YMD <C-R>=strftime("%Y-%m-%d")<CR>
iab NOW <C-R>=strftime("%c")<CR>

" toggle between number and relative number on ,l
if v:version >= 703
    set number
    nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>
endif

function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction

function! CurDir()
    let curdir = getcwd()
    return curdir
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

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <leader>S :call StripWhitespace ()<CR>

function! StartTerm()
    ConqueTermTab zsh --login
    setlocal listchars=tab:\ \
endfunction

function! Touch(file)
    execute "!touch " . a:file
    call s:UpdateNERDTree(1)
endfunction

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! Browser()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ )]*")
    let line = escape (line, "#?&;|%")
    exec ':silent !open ' . "\"" . line . "\""
endfunction
map <leader>B :call Browser()<CR>

set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ %r%{CurDir()}%h\ %{fugitive#statusline()}

if has("autocmd")
    au BufRead,BufNewFile *.sql         setlocal ft=pgsql
    au BufRead,BufNewFile *.md          setlocal ft=mkd tw=78 ts=2 sw=2 expandtab
    au BufRead,BufNewFile *.markdown    setlocal ft=mkd tw=78 ts=2 sw=2 expandtab
    au BufRead,BufNewFile *.rst         setlocal ft=rst tw=78 ts=4 sw=4 expandtab
    au BufNewFile,BufRead *.csv         setlocal ft=csv
    au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby
    au BufRead,BufNewFile *.py          setlocal ft=python tw=80 ts=4 sw=4 expandtab
    au BufRead,BufNewFile *.do          setlocal ft=sh tw=80 ts=4 sw=4 expandtab

    au FileType html,css,ruby setlocal ts=2 sts=2 sw=2 expandtab
    au FileType html set ft=html.django
    au FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    au FileType gitcommit setlocal tw=60
    au FileType make setlocal noexpandtab
    au FileType 
        \ perl setlocal makeprg=perl\ -c\ %\ $* errorformat=%f:%l:%m autowrite
    au FileType python setlocal complete+=k~/.vim/syntax/python.vim "isk+=.,(
    au FileType python set ft=python.django
    let html_no_rendering=1
endif
