set autoindent
set cindent
set smartindent
set nocompatible
set visualbell
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set tabstop=4
set shiftwidth=4
set number
set nobackup
set smartindent
set incsearch
set hlsearch

"utf-8 support
set enc=utf-8
set fenc=utf-8

set ts=8 "set ts=4"//old
set sw=4
set sts=4 
set sm
set nu
set bg=dark

if has("syntax")
syntax on
endif

"=setup easy to write program="
filetype plugin on
set tags+=/usr/include/tags,/tags

"============setup for ctags=============="
"set tags=~/tags/tags


"============setup for cscope ============"
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

"============suker setting================"
map <F2> :tabnew<CR>
map <F3> :tabn<CR>
map <F4> :tabclose<CR>

"if filereadable("./cscope.out")
"	cs add cscope.out
"else
"	cs add ~/tags/cscope.out
"endif
set csverb

"source ~/.vim/plugin/cscope_maps.vim


"=============setup for tag list=========="
filetype on
nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"============setup for NERDTree============="
let NERTreeWinPos = "left"
nmap <F9> :NERDTreeToggle<CR>

"============Setup for Source Exploer====================="
nmap <F8> :SrcExplToggle<CR>
"nmap <C-H> <C-W>h
"nmap <C-J> <C-W>j
"nmap <C-K> <C-W>k
"nmap <C-K> <C-W>l

let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0



" Vim color file
" Maintainer:   Li Jingyu <lijingyu1985@gmail.com>   
" Last Change:  9 December 2012


hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "codeschool"
hi Comment  term=bold ctermfg=5 guifg=SlateBlue
hi Keyword term=standout ctermfg=2 guifg=Brown    
hi Normal guibg=#CAE8F0 guifg=Black
hi Comment  gui=italic
hi cStatement term=standout ctermfg=2 guifg=Brown cterm=bold
hi Identifier term=underline ctermfg=3 guifg=Cyan gui=bold
hi PreProc term=bold ctermfg=red guifg=Red

hi! def link cLabel	    	Statement
hi! def link cConditional   Statement
hi! def link cRepeat		Statement
hi! def link cStatement     Statement

hi User1 guifg=white  guibg=black  
hi User2 guifg=white  guibg=black  
hi User3 guifg=white  guibg=black  
hi User4 guifg=white  guibg=black  
hi User5 guifg=white  guibg=black  

func! Css()
	let css = expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,css :call Css( )<cr>

func! Csc()
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csc :call Csc( )<cr>

func! Csd()
	let csd = expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csd :call Csd( )<cr>

func! Csg()
	let csg = expand("<cword>")
	new
	exe "cs find g ".csg
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csg :call Csg( )<cr>

func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>


ia mymark	<C-R>=strftime("%Y-%m-%d")<CR>, choonghyun.jeon@lge.com
