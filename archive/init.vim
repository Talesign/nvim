" old testing ground with .vim
" this is a comment
" set bg=light

" Highlights every single instance of a something searched with /?
set hlsearch
" highlights while searching
set incsearch

" Uses the default clipboard to yank and paste.
set clipboard=unnamedplus

" Tab indent - Follow this guidelines from Google:
" actually really important if you use Vim on the daily basis.
" https://developers.google.com/style/code-samples
set tabstop=2
set softtabstop=2
set shiftwidth=2

" This is used to convert tabs into spaces
set expandtab

" If you are programming in like JS, when you open a function and then hit
" enter it will automatically hit enter on new line.
set autoindent

" File formatting
" set fileformat=unix

" I don't really know what it does
set nocompatible 
" syntax highlight
syntax on

" sets numbers on the side and then it makes it relavive - quite impressive
" actually - btw I don't know how but it's auto indentig the shitty things
" that I write, I find it kinda of amousing!
set number relativenumber

" this is basically autocomplete in Vim, i dont know why it's not working
" tho... ah, okay, I have to use ctrl + n to make it work... which if fine I
" guess... i mean you kinda need to worki you're way up!! but its
" interesting.
set wildmode=longest,list,full

" autocommand, basically it gives you the ability to have autocomplete for
" commands
autocmd FileType * setlocal formatoptions-=C formatoptions-=r formatoptions-=o

" split windows - ctrl-w and then v - this spawns them on the left side, not
" below!
set splitbelow splitright

" REMAPS for split windows action - actually pretty interesting how it works
" and pretty usefull too!! just type one thing instead of another keypress is
" amazing. The more that I will use this editor, the more I will understand
" it's intricasies and the novelty of something like this!
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Global replacement - this is actually pretty interesting to use when workin
" with a big beafy file. Global replacement works like this: 
" :%s///g - how does it work - :s/something/somethingelse/g (search
" 'something' and replaces it with 'somethingelse') - but this is done only in
" one line, for doing in every single line you do
" :%s/something/somethingelse/g - You can map this into a key that you usually
" don't use to have a fast shortcut

" nnoremap S :%s//g<Left><Left>

" You can safely use the function keys and the shifted version of them as a
" way to add functionality to your vim experience!
map <F2> <ESC>:tabnew<CR>
map <F3> gT
map <F4> gt
" map <F5>
" map <F6>
" map <F7>
" map <F8>
" map <F9>
" map <F10>
" map <F11>

" an interesting thing add is maybe a prettier interaction that saves a file
" like with <F12> and fires the prettier extention
" map <F12>

" Automatically deletes all trailing whitespace on save
" autocmd BufWritePre * %s/\s\\+$//e

" How to do 90% of what plugins do (with just Vim) XA2WjJbmmoM
" enter the current millennium - because vim tries to load vi configurations
set nocompatible

" enabe syntax and plugins
syntax enable
filetype plugin on

" FINDING FILES: 

" Search down into subfolders 
" Provides tab-completion for all file-related tasks
" Basically what this dows is it appends to the path variable every single dir
" and sub dir from the working directory - it's basiically a easy file search
" set path+=**

" menu 
set wildmenu


