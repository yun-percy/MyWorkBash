" My .vimrc
" I use vundle(https://github.com/gmarik/vundle) as my Vim plugin manager.
"
" anscoral

set nocompatible              " be iMproved
filetype on                  " required!

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set hlsearch
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth=50
let g:Tlist_Show_One_File=1

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap <F9> :WMToggle<CR>
noremap <silent> <F8> :BufExplorer<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My bundles here:

" original repos on GitHub
Bundle 'anscoral/winmanager.vim'
Bundle 'anscoral/taglist.vim'
Bundle 'anscoral/nerdtree.vim'
Bundle 'anscoral/vim-latex'

Bundle 'ervandew/supertab'

Bundle 'aklt/plantuml-syntax'

" vim-scripts repos
" Bundle 'taglist.vim'
Bundle 'cscope_macros.vim'
Bundle 'bufexplorer.zip'
Bundle 'Colour-Sampler-Pack'
Bundle 'vcscommand.vim'
Bundle 'DrawIt'

" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'

" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

colorscheme fruity
let g:winManagerWindowLayout = "FileExplorer,BufExplorer"
let g:AutoOpenWinManager = 1
let g:winManagerWidth = 30
nmap <silent> <F8> :WMToggle<cr>
"-- Cscope setting --
if has("cscope")
set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
set cst " 同时搜索cscope数据库和标签文件
set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
set nocsverb
if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
cs add cscope.out
elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
cs add $CSCOPE_DB
else 
    cs add /home/yun/code/cm11/cscope.out
endif
set csverb
endif
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
set tags=/home/yun/code/cm11/tags
"行号设置
set nu!
hi linenr ctermfg=Darkgray
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'ervandew/supertab'
"解决youCompeleteMe和UltiSnips快捷键冲突的问题
"let g:ycm_key_list_select_completion = ['<c-n>','<Down>']
"let g:ycm_key_list_previous_completion = ['<c-n>','<Up>']
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["addition_snippets",'UltiSnips/snippets']
"let g:UltiSnipsSnippetDirectories=["snippets"]
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
