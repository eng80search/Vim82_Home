
"----------------------------------------
" 2024年01月19日版
" Kaoriya対策
"----------------------------------------


"--------------------------------------------------------------------------------
"vim-fzf Setting
"--------------------------------------------------------------------------------
" Empty value to disable preview window altogether
" let g:fzf_preview_window = ''
" let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
" デフォルトではpreview windowを表示しない。切り替えスイッチはCtrl -
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" 使用例1： :Rg 202[01]/\d{2}/\d{2} -g *.vb ../AcuvueCoomon/ ← (一つ上のディレクトリを指定)
" 使用例2： :Rg 202[01]/\d{2}/\d{2} --no-ignore  ./js  ←（現在のディレクトリの下の特定のサブフォルダを指定）
" よく使うoption : --no-ignore  (gitignoreに登録されているフォルダ、ファイルを検索対象にする際に使う)
" 検索文字 Abc -> 大文字小文字区分あり abc -> 大文字小文字区分なし

" ripgrep setting in fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case  --sort path '.<q-args>, 1,
  \   fzf#vim#with_preview(), <bang>0)

" rgがあれば:grepでrgを使う
" 使用例：Session("acuvuePC.freeword")を検索する際に
" grep!session.\"acuvuepc\.freeword\".
" 注意点：
" 1.エスケープする際には\を使う
" 2.なぜか「(」と「)」は検索できないため、「.」で代用する
 if executable('rg')
   " set grepprg=rg\ --vimgrep
   let &grepprg= 'rg --vimgrep --smart-case'
   set grepformat=%f:%l:%c:%m
 endif

" 自動QuickFix
augroup GrepCmd
    autocmd!
    autocmd QuickFixCmdPost vim,grep,make if len(getqflist()) != 0 | copen | endif
augroup END

"--------------------------------------------------------------------------------
"MRU Setting
"--------------------------------------------------------------------------------
nnoremap <silent><C-h> :MRU<CR>


"remember file Count
let MRU_Max_Entries = 1000

"Change the ListWindow height
let MRU_Window_Height = 15

let g:MRU_Use_CursorLine = 1


"--------------------------------------------------------------------------------
"vim-session Setting
"--------------------------------------------------------------------------------
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'

"--------------------------------------------------------------------------------
"Tagbarの設定
"--------------------------------------------------------------------------------
nnoremap <silent><C-a> :TagbarToggle<CR>
" ソートは不要にする
let g:tagbar_sort = 0

"--------------------------------------------------------------------------------
"現在のウィンドウのカレントディレクトリを開いたファイルのパスで設定する
"--------------------------------------------------------------------------------
nnoremap <silent> ,cd :lcd %:h<CR>
"
"--------------------------------------------------------------------------------
"SQL整形ツールプラグインキーマッピング
"--------------------------------------------------------------------------------
vmap <silent>,sf        :SQLUFormatter<CR>
nmap <silent>,scl       :SQLU_CreateColumnList<CR>
nmap <silent>,scd       :SQLU_GetColumnDef<CR>
nmap <silent>,scdt      :SQLU_GetColumnDataType<CR>
nmap <silent>,scp       :SQLU_CreateProcedure<CR>


"--------------------------------------------------------------------------------
"【lightline.vim】
"--------------------------------------------------------------------------------

    function! LightlineMode()
      let fname = expand('%:t')
      return fname == '__Tagbar__' ? 'Tagbar' :
            \ fname == 'ControlP' ? 'CtrlP' :
            \ fname == '__Gundo__' ? 'Gundo' :
            \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
            \ fname =~ 'NERD_tree' ?  'NERD_tree':
            \ &ft == 'unite' ? 'Unite' :
            \ &ft == 'vimfiler' ? 'VimFiler' :
            \ &ft == 'vimshell' ? 'VimShell' :
            \ winwidth(0) > 10 ? lightline#mode() : ''
    endfunction

    function! LightlineGitbranch()
      " return   gitbranch#name()
      let branchName = gitbranch#name()
      return (branchName == '' ? '' :
            \ &filetype == 'nerdtree' ? '' :
            \ &filetype == 'help' ? '' :
            \ &filetype =~ 'tagbar' ? '' :
            \ &filetype == '' ? '' : ''.branchName
            \)
    endfunction

    " function! LightlineMode()
    "     return winwidth(0) > 60 ? lightline#mode() : ''
    " endfunction

   function! LightlineBuffername()
     return  &filetype =~ 'help\|nerdtree\|tagbar' ? '' : 'Buf:['.bufnr('%').'] '
     " return ('' != expand('%:p') ? expand('%:p') : '(No Name)')
   endfunction

   function! LightlineFilename()
     " return ('' != expand('%:p') ? expand('%:p') : '(No Name)')
     return ('' == expand('%:p') ? '(No Name)' : 
                            \ &filetype == 'nerdtree' ? '' :
                            \ &filetype == '' ? '' :
                            \ winwidth(0) <=120 ? expand('%:t') : 
                            \ winwidth(0) >120 && winwidth(0) - strlen(expand('%:p')) < 85 ? expand('%:t') : 
                            \ winwidth(0) >120  ? expand('%:p') : ''
            \)
   endfunction

   " バッファ編集禁止のときに鍵マークを表示 Terminalモードでは表示しない
    function! LightlineModifiable()
      " return (&readonly || !&modifiable) && &filetype !=# 'help' ? '' : ''
      let fname = expand('%:t')
      return !&modifiable && &filetype !=# 'help' && 
             \ &filetype !~ 'nerdtree' && 
             \ &filetype !~ 'tagbar' && 
             \ &filetype != '' ? '' : ''
    endfunction

   " Readonlyモードの場合は目アイコンを表示
    function! LightlineReadonly()
      return &readonly && 
             \ &filetype !=# 'help' && &filetype !~ 'nerdtree' ? '' : ''
    endfunction

   " バッファ編集ありの場合の設定 Terminalモードでは表示しない
    function! LightlineModified()
        " return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        return &ft =~ 'help\|vimfiler\|gundo' || &filetype == '' ? '' : &modified ? '󿣪' : ''
    endfunction

   " filetypeによって一部の要素を隠す処理
    function! LightlineVisible()
        " return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        return &ft =~ 'nerdtree\|help\|tagbar' ? 0 : 1
    endfunction

   " filetypeによって一部の要素を隠す処理
    function! LightlineLineInfo()
        return LightlineVisible() ? printf("%3d:%-2d", line('.'), col('.')) : ''
    endfunction

   " filetypeによって一部の要素を隠す処理
    function! LightlinePercent()
        return LightlineVisible() ? (100 * line('.') / line('$')) . '%' : ''
    endfunction

   " filetypeによって一部の要素を隠す処理
    function! LightlineFileformat()
        " return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        return LightlineVisible() ? &ff : ''
    endfunction

   " filetypeによって一部の要素を隠す処理
    function! LightlineFileencoding()
        " return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        return LightlineVisible() ? &fenc : ''
    endfunction

   " filetypeによって一部の要素を隠す処理
    function! LightlineFiletype()
        " return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        return LightlineVisible() ? &ft : ''
    endfunction

" lightlineの全部の設定
let g:lightline = {
          \ 'active': {
          \   'left':   [ 
          \               ['mode','paste'],
          \               ['gitbranch','modifiable','readonly','modified','buffername'], 
          \               ['filename'] 
          \             ],
          \  'right':   [
          \               [ 'lineinfo' ],
          \               [ 'percent' ],
          \               [ 'fileformat', 'fileencoding', 'filetype' ],
          \               [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
          \             ] 
          \           },
          \  'component_function': {
          \        'mode':         'LightlineMode',
          \        'modified':     'LightlineModified',
          \        'buffername':   'LightlineBuffername',
          \        'filename':     'LightlineFilename',
          \        'modifiable':   'LightlineModifiable',
          \        'lineinfo':     'LightlineLineInfo',
          \        'readonly':     'LightlineReadonly',
          \        'percent':      'LightlinePercent',
          \        'fileformat':   'LightlineFileformat',
          \        'fileencoding': 'LightlineFileencoding',
          \        'filetype':     'LightlineFiletype',
          \  },
          \  'separator': { 'left': '', 'right': '' },
          \  'subseparator': { 'left': '', 'right': '' },
          \  'colorscheme': 'myWombat',
          \  'enable': {
          \    'tabline': 0
          \  },
          \ }


"--------------------------------------------------------------------------------
"【lightline-ale.vim】
"--------------------------------------------------------------------------------
let g:lightline.component_expand = {
          \  'linter_checking': 'lightline#ale#checking',
          \  'linter_infos':    'lightline#ale#infos',
          \  'linter_warnings': 'lightline#ale#warnings',
          \  'linter_errors':   'lightline#ale#errors',
          \  'linter_ok':       'lightline#ale#ok',
          \  'gitbranch':       'LightlineGitbranch',
          \ }

let g:lightline.component_type = {
          \  'linter_checking': 'right',
          \  'linter_infos':    'right',
          \  'linter_warnings': 'warning',
          \  'linter_errors':   'error',
          \  'linter_ok':       'ok',
          \  'gitbranch':       'gitbranch_name',
          \ }

let g:lightline#ale#indicator_checking = ""
" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

"--------------------------------------------------------------------------------
"Singleton Setting
"--------------------------------------------------------------------------------
"インスタンスを一つにするために
call singleton#enable()

"--------------------------------------------------------------------------------
"incsearch Setting
"--------------------------------------------------------------------------------
"デフォルト検索では一つの検索結果しかハイライトできない問題を解決
let g:incsearch#magic = '\v'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" "--------------------------------------------------------------------------------
" "pt Setting
" "--------------------------------------------------------------------------------
"  let g:pt_prg="pt  --smart-case"
"  let g:pt_highlight=1
" " Ptで正規表現 Pt! session\(.+\.tenpack\)
" " Session("acuuePC.freeWord")を検索する場合は
" " Pt! session.\"acuvuepc\.freeword\".
" " 注意：括弧は「.」で検索する。なぜか\でエスケープできない


"--------------------------------------------------------------------------------
"vim-python/python-syntax Setting
"--------------------------------------------------------------------------------
let g:python_highlight_all = 1

"--------------------------------------------------------------------------------
"andymass/vim-matchup Setting
"--------------------------------------------------------------------------------
let g:matchup_matchparen_offscreen = {}
" 入れ子探しの深さを3500にする
let g:matchup_delim_stopline       = 3500 

"--------------------------------------------------------------------------------
"vim 8.1 terminal Setting
"--------------------------------------------------------------------------------
function! GitBash()
    " 日本語Windowsの場合`ja`が設定されるので、入力ロケールに合わせたUTF-8に設定しなおす
    let l:env = {
                \ 'LANG': systemlist('"C:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                \ }

    " remote連携のための設定
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif

    " term_startでgit for windowsのbashを実行する
    call term_start(['C:/Program Files/Git/bin/bash.exe', '-l'], {
                \ 'term_finish': 'close',
                \ 'cwd': expand('%:p:h'),
                \ 'env': {'LANG':'ja_JP.UTF-8'}
                \ })

endfunction

command! Gbash call GitBash()
" nnoremap <Leader>g :<C-u>call GitBash()<CR>


"--------------------------------------------------------------------------------
"AsyncRun Setting
"--------------------------------------------------------------------------------
let g:asyncrun_open = 15
let $PYTHONUNBUFFERED=1
" autocmd FileType python noremap <silent><F9>  :AsyncRun python %<CR>
" autocmd FileType python noremap <silent><F10> :vert term  python -m ipdb %<CR>
" autocmd FileType python noremap <silent><F12> :AsyncStop <CR>
" 文字化け対策用：quickfixのencodingに合わせる
autocmd FileType python let g:asyncrun_encs = "cp932"

" autocmd FileType cs noremap <silent><F9>  :AsyncRun msbuild<CR>
" autocmd FileType cs noremap <silent><F12> :AsyncStop <CR>
autocmd FileType cs let g:asyncrun_encs = "cp932"


" autocmd FileType java noremap <silent><F8>  :AsyncRun javac  -encoding UTF-8 %<CR>
" autocmd FileType java noremap <silent><F9>  :AsyncRun java %:t:r<CR>
" autocmd FileType java noremap <silent><F12> :AsyncStop <CR>
autocmd FileType java let g:asyncrun_encs = "cp932"



let g:indentLine_enabled = 0
" let g:indentLine_char_list = ['│', '┊', '┆', '¦']

autocmd FileType html,js,javascript,python,vb,c IndentLinesEnable
" autocmd FileType js IndentGuidesEnable

" Vim8でvim-lspとasyncomplete関連でvue-language-serverを使う(細かいオプションは省略)
" [asyncomplete] Force refresh completion
imap <C-x><C-u> <Plug>(asyncomplete_force_refresh)

" sign の表示を無効化 ( ALE で行うため )
let g:lsp_diagnostics_enabled = 0
" ショットカットキー
nmap <F1> :LspHover<CR>
nmap <F3> :LspReferences<CR>
nmap <F4> :LspDefinition<CR>

" ------------------------------------------------------------------
"Ale plugin Setting that Check syntax in Vim asynchronously and fix files 
"To use this plugin, need install checkTool like flake8.
" 左端のシンボルカラムを表示したままにする
" let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" let g:ale_change_sign_column_color = 1
" シンボルを変更する
let g:ale_sign_error = '󿙘'
" let g:ale_sign_error = ''
let g:ale_sign_warning = '󿔥'
" let g:ale_sign_warning = ''
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1

" grepの検索結果もquickfixに表示されるので、ファイルを開いた瞬間にlintをすると
" grepの結果がクリアされるので、これを防ぐために無効化する
let g:ale_lint_on_enter = 0

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s '
" Bind F8 to fixing problems with ALE
" nmap <F5> :ALELint<CR>
" nmap <F8> :ALEFix<CR>
" nmap <F6> <Plug>(ale_fix)

let g:lightline#ale#indicator_errors = '󿙘:'
let g:lightline#ale#indicator_warnings = '󿔥:'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%code%]: %s [%severity%]'

nmap <silent> gK <Plug>(ale_previous_wrap)
nmap <silent> gJ <Plug>(ale_next_wrap)
autocmd VimEnter * :highlight! ALEErrorSign ctermfg=9 ctermbg=8 guifg=#FA8072
autocmd VimEnter * :highlight! ALEWarningSign ctermfg=11 ctermbg=8 guifg=#CCCC66
" autocmd VimEnter * :highlight! ALEErrorSign ctermfg=9 ctermbg=8 guifg=#444444 guibg=#FA8072
" autocmd VimEnter * :highlight! ALEWarningSign ctermfg=11 ctermbg=8 guifg=#444444 guibg=#CCCC66

" asyncomplete plugin setting
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
set completeopt-=preview

" asyncomplete buffer setting
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': -1,
    \  },
    \ }))
let g:asyncomplete_buffer_clear_cache = 1

" asyncomplete file setting
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))


" asyncomplete ultisnips setting
if has('python3')
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    " let g:ultisnipsjumpbackwardtrigger="<c-k>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif

" vim-vue highlight setting
autocmd FileType vue syntax sync fromstart

" vim-devicons Setting with Cica Font
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''

" mark操作
" m.-> マーク追加削除 m(space)->すべてのマークを削除 m/->マークリスト一覧表示 `[ ->次のマークへジャンプ`

" Disable The word under cursor:
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#highlight_only_in_focused_window = 1
hi CurrentWordTwins guibg=#696969

"----------------------------------------
" AutoSave plugin Setting
"----------------------------------------
" disable AutoSave on Vim startup
let g:auto_save = 0
" do not save while in insert mode
let g:auto_save_in_insert_mode = 0
" do not display auto-save time
" let g:auto_save_silent = 1


"----------------------------------------
" Vim commentary Setting
"----------------------------------------
augroup comment
    autocmd!
    autocmd FileType vb setlocal commentstring='\ %s
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType asp setlocal commentstring=<%--\ %s\ --%>
    autocmd FileType aspvbs setlocal commentstring=<%--\ %s\ --%>
    autocmd FileType dosbatch setlocal commentstring=rem\ %s
    autocmd FileType gitconfig setlocal commentstring=#\ %s
augroup END

" augroup sessionStart
"     autocmd!
"     autocmd SessionLoadPost * so $VIM\_vimrc
" augroup END
