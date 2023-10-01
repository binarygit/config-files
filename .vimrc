
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"check
if &t_Co > 1
   syntax enable
endif

"make line numbers visible
set nu

"extensions
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb
  augroup END
endif

"Xterm
if $COLORTERM == 'xterm'
  set t_Co=256
endif

"run aliases inside vim
let $BASH_ENV = "~/.bash_aliases"

" adds a newline at the end of file
set fixendofline

" auto close braces
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


filetype indent on

set expandtab
set shiftwidth=2
set softtabstop=2

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

packloadall

" set path to use find
set path+=**

" mapping for console.log
map \ch oconsole.log<c-v>(<c-v>'hello<c-v>')<ESC>
map \c oconsole.log(
map \q idocument.querySelector('
map \qa idocument.querySelectorAll('
map \ss isave_screenshot(~/hello.png
map \s :source $MYVIMRC<CR>

" Search for method definition
map \sd /def 

" make the ' work like `
map ' `

set rtp+=~/.fzf

nnoremap <silent> æ :Files<CR>
nnoremap <silent> ò :History:<CR>
nnoremap <silent> â :Buffers<CR>
nnoremap <silent> í :Marks<CR>

nnoremap ò :Rails<CR>

" def initialize end
map \in odef initialize<CR>end<ESC>O
