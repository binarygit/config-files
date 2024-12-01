" Defaults {{{
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
" }}}

"make line numbers visible
set nu

"Xterm
if $COLORTERM == 'xterm'
  set t_Co=256
endif

"run aliases inside vim
let $BASH_ENV = "~/.bash_aliases"

" adds a newline at the end of file
set fixendofline

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

let mapleader= '-'

" make the ' work like ` for marks
nnoremap ' `

set rtp+=~/.fzf

nnoremap <silent> æ :Files<CR>
nnoremap <silent> ò :History:<CR>
nnoremap <silent> â :Buffers<CR>
nnoremap <silent> í :Marks<CR>

nnoremap ò :Rails<CR>

func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" set colorscheme
colo distinguished

set colorcolumn=72

" Mappings from Vimscript the hard way

" Uppercase the selected text
vnoremap \ U

" Convert current word to uppercase in insert mode
inoremap <c-u> <esc>bgUwA

" Open vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" abbreviate <leader>
" inoreabbrev lea <leader>

let maplocalleader= '('

" File Type specific settings ---------------------- {{{

" Check spelling when in text and markdown files
" autocmd FileType text,markdown setlocal spell spelllang=en_us

augroup filetype_javascript
  " Type function <cursor>() {
  " } for js files
  autocmd FileType javascript nnoremap <buffer> <localleader>fn ifunction <c-v>() <c-v>{<cr>}<esc>kf(i

  " mapping for console.log
  autocmd FileType javascript nnoremap <buffer> <localleader>ch oconsole.log<c-v>(<c-v>'hello<c-v>')<ESC>
  autocmd FileType javascript nnoremap <buffer> <localleader>c oconsole.log(
  autocmd FileType javascript nnoremap <buffer> <localleader>q odocument.querySelector('
  autocmd FileType javascript nnoremap <buffer> <localleader>qa odocument.querySelectorAll('
augroup END

augroup filetype_ruby
  " Find prev class definition and add an initialize method below it
  autocmd FileType ruby nnoremap <buffer> <localleader>in ?class<cr>odef initialize<cr>end<esc>O
  " Search for method definition
  autocmd FileType ruby nnoremap <buffer> <localleader>sd /def
  " Save SS to ~/hello.png
  autocmd FileType ruby nnoremap <buffer> <localleader>ss osave_screenshot('~/hello.png')<ESC>
  autocmd FileType ruby nnoremap <buffer> <localleader>re ggjOrequire '
  autocmd FileType ruby nnoremap <buffer> <localleader>an oconfig.action_view.annotate_rendered_view_with_filenames = true<ESC>
  " Create new ruby files with the specified skeleton
  autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb

  " Run tests easily
  " This is a wip
  "autocmd FileType ruby nnoremap <buffer> <localleader>rt ?test<cr>$V:normal! %:Rails<cr>
  "autocmd FileType ruby nnoremap <buffer> <localleader>rt ?test<cr>$V:normal! %<cr>:Rails<cr>
  "autocmd FileType ruby nnoremap <buffer> <localleader>rt :exe "?test"<cr>$V:exe "normal %"<cr>:Rails<cr>
  "autocmd FileType ruby nnoremap <buffer> <localleader>rt ?test<cr>$V%:Rails<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>sr oFile.write('/tmp/index.html', response.body)<esc>
  autocmd FileType ruby nnoremap <buffer> <localleader>tf :!r t %<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>cop :cop %<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>copa :cop -a %<cr>
augroup END

augroup filetype_eruby
  autocmd FileType eruby nnoremap <buffer> <localleader>de o<% debugger %><ESC>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Practicing creating new movements
" Works like <im> in ruby files
" onoremap in :<c-u>execute "normal! ?def\rjV/end\rk"<cr>

" Works to select the heading text in md files
" onoremap ih :<c-u>execute "normal! ?^\\(--\\\|==\\)$\r:noh\rkvg_"<cr>

" Works to select the heading text and the "--" or "==" which marks a heading in md files
" onoremap ah :<c-u>execute "normal! ?^\\(--\\\|==\\)$\r:noh\rg_vk0"<cr>

" Source current file
nnoremap <leader>sc :source %<cr>

" Use vim's very magic regex parsing mode which is similar to ruby, perl etc
nnoremap / /\v

" mappings
nnoremap <leader>ga :call AddAllAndCommit()<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gci :call AddCurrentAndAmend()<cr>
nnoremap <leader>gr :G restore %<cr>

" Indentation rules for ruby set per standardrb
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_hanging_elements = 0

let g:rails_projections = {
      \ "app/components/*_component.rb": {
      \ "type": "component",
      \ "related": "app/components/{}_component.html.erb"
      \ },
      \ "app/components/*_component.html.erb": {
      \ "type": "template",
      \ "related": "app/components/{}_component.rb"
      \ }}

" for feature

iab _n _Nilable
iab _b _Boolean
iab af Avo::Fields::BaseField
iab abr Avo::BaseResource
nnoremap <localleader>a oprop :args, Hash, :**, default: {}.freeze<esc>

nnoremap <leader>c :call GitMessage()<cr>
function! GitMessage() 
  execute "G add ."
  let l:message =  "G ci -m " . "'Remove after_initialize for " . @%  . "'"
  echo l:message
  execute l:message
endfunction

function! AddAllAndCommit() 
  execute "G add ."
  execute "G ci"
endfunction

function! AddCurrentAndAmend()
  execute "Gwrite"
  execute "G cine"
endfunction

" Better commits
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype vimwiki setlocal spell textwidth=72
