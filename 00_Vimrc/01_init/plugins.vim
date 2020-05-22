
"----------------------------------------
" 2017年5月25日版
" Kaoriya対策
"----------------------------------------

"--------------------------------------------------------------------------------
"NERDTree Setting
"--------------------------------------------------------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1 "ファイルを開いたら閉じる場合は1
let g:NERDTreeShowBookmarks=1 "ブックマーク初期表示
let NERDTreeWinSize = 40 "Windowsサイズ設定
let g:NERDTreeCopycmd= 'cp -r '
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" lightlineを使うのでnerdtree自前のstatuslineを無効にする
let g:NERDTreeStatusline = -1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('vim',    'yellow',    'none', '#390088', '#282c34')
call NERDTreeHighlightFile('java',   'yellow',    'none', '#fcdb79', '#282c34')
call NERDTreeHighlightFile('json',   'blue',      'none', '#8a2be2', '#282c34')
call NERDTreeHighlightFile('py',     'yellow',    'none', '#fcdb79', '#282c34')
call NERDTreeHighlightFile('asp',    'yellow',    'none', '#B9B069', '#282c34')
call NERDTreeHighlightFile('cs',     'yellow',    'none', '#c4f74f', '#282c34')
call NERDTreeHighlightFile('js',     'Red',       'none', '#f0e68c', '#282c34')
call NERDTreeHighlightFile('vue',    'Red',       'none', '#00CC99', '#282c34')
call NERDTreeHighlightFile('htm',    'brown',     'none', '#ff7f50', '#282c34')
call NERDTreeHighlightFile('html',   'brown',     'none', '#ff7f50', '#282c34')
call NERDTreeHighlightFile('css',    'yellow',    'none', '#1e90ff', '#282c34')
call NERDTreeHighlightFile('xml',    'brown',     'none', '#627009', '#282c34')
call NERDTreeHighlightFile('htm',    'brown',     'none', '#dfb5f2', '#282c34')
call NERDTreeHighlightFile('sql',    'blue',      'none', '#9bf76a', '#282c34')
call NERDTreeHighlightFile('log',    'yellow',    'none', '#876712', '#282c34')
call NERDTreeHighlightFile('vim',    'yellow',    'none', '#876712', '#282c34')
call NERDTreeHighlightFile('xlsx',   'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('xls',    'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('xlsm',   'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('doc',    'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('docx',   'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('jpg',    'yellow',    'none', '#ffffe0', '#282c34')
call NERDTreeHighlightFile('JPG',    'yellow',    'none', '#ffffe0', '#282c34')
call NERDTreeHighlightFile('png',    'yellow',    'none', '#ffffe0', '#282c34')
call NERDTreeHighlightFile('PNG',    'yellow',    'none', '#ffffe0', '#282c34')
call NERDTreeHighlightFile('gif',    'yellow',    'none', '#A4A4A4', '#282c34')
call NERDTreeHighlightFile('GIF',    'yellow',    'none', '#A4A4A4', '#282c34')
call NERDTreeHighlightFile('config', 'yellow',    'none', '#fc3737', '#282c34')

"--------------------------------------------------------------------------------
"NERDTree FilePath AutoRefresh
"--------------------------------------------------------------------------------
function! NERDTreeAutoUpdate()
    try

        "処理対象がNERDTreeウィンドウ自分自分の場合は更新処理を行わない。
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
            return
        endif

        " Detect which plugins are open
        if exists('t:NERDTreeBufName')
            let s:nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
        else
            let s:nerdtree_open = 0
        endif

        if s:nerdtree_open
            NERDTree
        else
            return
        endif

        "ウィンドウを戻す
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
            wincmd w
        endif

        NERDTreeFind

        "ウィンドウを戻す
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
        wincmd w
        endif

    catch
        echo "Error Happend!"
    endtry

endfunction

autocmd BufWinEnter * call NERDTreeAutoUpdate()

"close vim if the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"--------------------------------------------------------------------------------
"vim-fzf Setting
"--------------------------------------------------------------------------------
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''


"--------------------------------------------------------------------------------
"vim-nerdtree-syntax-highlight
"--------------------------------------------------------------------------------
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

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
"NerdTreeとTagbarの合体設定
"--------------------------------------------------------------------------------
" nmap <silent><C-s> :ToggleNERDTreeAndTagbar<CR>


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
"プラグインAlignのメニュー非表示
:let g:DrChipTopLvlMenu = ""
"--------------------------------------------------------------------------------
"プラグインsqlutilのメニュー非表示
:let  g:sqlutil_default_menu_mode = 0


""--------------------------------------------------------------------------------
""データベースアクセス用設定（dbext.vim）
""--------------------------------------------------------------------------------
"let dbext_default_profile=""
"let dbext_default_type="SQLSRV"
"let dbext_default_user="sa"
"let dbext_default_passwd="JA@dmin06"
"let dbext_default_dbname="Temp"
"let dbext_default_srvname="localhost\\SQLEXPRESS2014"

"vimに表示する行数設定
"let dbext_default_buffer_lines=80
"
"--------------------------------------------------------------------------------
"【tagbar.vim】プラグイン 関数一覧を表示する
"--------------------------------------------------------------------------------
"vbプログラムを認識できるように設定する
" nmap <F12> :TagbarToggle<CR>

"--------------------------------------------------------------------------------
"【toggletagbar.vim】TagbarとNerdTreeプラグインを上下に配置するプラグイン
"--------------------------------------------------------------------------------
nmap <F8> :ToggleNERDTreeAndTagbar<CR>

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
      let branchName = gitbranch#name()
      return (branchName == '' ? '' : 
            \ &filetype == 'nerdtree' ? '' :
            \ &filetype == '' ? '' : ''.branchName 
            \)
    endfunction

    " function! LightlineMode()
    "     return winwidth(0) > 60 ? lightline#mode() : ''
    " endfunction

   function! LightlineBuffername()
     return  &filetype =~ 'help\|nerdtree' ? '' : 'Buf:['.bufnr('%').'] '
     " return ('' != expand('%:p') ? expand('%:p') : '(No Name)')
   endfunction

   function! LightlineFilename()
     " return ('' != expand('%:p') ? expand('%:p') : '(No Name)')
     return ('' == expand('%:p') ? '(No Name)' : 
                            \ &filetype == 'nerdtree' ? '' :
                            \ &filetype == '' ? '' :
                            \ winwidth(0) <=120 ? expand('%:t') : 
                            \ winwidth(0) >120  ? expand('%:p') : ''
            \)
   endfunction

   " バッファ編集禁止のときに鍵マークを表示 Terminalモードでは表示しない
    function! LightlineModifiable()
      " return (&readonly || !&modifiable) && &filetype !=# 'help' ? '' : ''
      let fname = expand('%:t')
      return !&modifiable && &filetype !=# 'help' && 
             \ fname !~ 'NERD_tree' && 
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
        return &ft != 'nerdtree'
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
          \               ['gitbranch','modifiable','readonly','modified','buffername','filename'] 
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
          \        'gitbranch':    'LightlineGitbranch',
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


" let g:lightline.component_type = {
"           \     'linter_checking': 'right',
"           \     'linter_infos':    'right',
"           \     'linter_warnings': 'warning',
"           \     'linter_errors':   'error',
"           \     'linter_ok':       'right',
"           \ }


"--------------------------------------------------------------------------------
"【lightline-ale.vim】
"--------------------------------------------------------------------------------
let g:lightline.component_expand = {
          \  'linter_checking': 'lightline#ale#checking',
          \  'linter_infos':    'lightline#ale#infos',
          \  'linter_warnings': 'lightline#ale#warnings',
          \  'linter_errors':   'lightline#ale#errors',
          \  'linter_ok':       'lightline#ale#ok',
          \ }

let g:lightline.component_type = {
          \  'linter_checking': 'right',
          \  'linter_infos':    'right',
          \  'linter_warnings': 'warning',
          \  'linter_errors':   'error',
          \  'linter_ok':       'ok',
          \ }

let g:lightline#ale#indicator_checking = "\uf110"
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


"--------------------------------------------------------------------------------
"pt Setting
"--------------------------------------------------------------------------------
 let g:pt_prg="pt  --smart-case"
 let g:pt_highlight=1
 

"--------------------------------------------------------------------------------
"vim-easy-align Setting
"--------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)



"--------------------------------------------------------------------------------
"vim-bookmarks Setting
"--------------------------------------------------------------------------------
"マークの色設定

let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'

let g:bookmark_location_list = 1
let g:bookmark_disable_ctrlp = 1

let g:bookmark_no_default_key_mappings = 1


nmap ml <Plug>BookmarkShowAll
nmap md <Plug>BookmarkClear
nmap mm <Plug>BookmarkToggle
nmap mi <Plug>BookmarkAnnotate
nmap mn <Plug>BookmarkNext
nmap mp <Plug>BookmarkPrev
nmap mx <Plug>BookmarkClearAll

"--------------------------------------------------------------------------------
"vim-python/python-syntax Setting
"--------------------------------------------------------------------------------
let g:python_highlight_all = 1

"--------------------------------------------------------------------------------
"nerdcommenter Setting
"--------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


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
autocmd FileType python noremap <silent><F9>  :AsyncRun python %<CR>
autocmd FileType python noremap <silent><F10> :vert term  python -m ipdb %<CR>
autocmd FileType python noremap <silent><F12> :AsyncStop <CR>

autocmd FileType cs noremap <silent><F9>  :AsyncRun msbuild<CR>
autocmd FileType cs noremap <silent><F12> :AsyncStop <CR>
autocmd FileType cs let g:asyncrun_encs = "cp932"


autocmd FileType java noremap <silent><F8>  :AsyncRun javac  -encoding UTF-8 %<CR>
autocmd FileType java noremap <silent><F9>  :AsyncRun java %:t:r<CR>
autocmd FileType java noremap <silent><F12> :AsyncStop <CR>
autocmd FileType java let g:asyncrun_encs = "cp932"

" "--------------------------------------------------------------------------------
" "Python3 Setting
" "--------------------------------------------------------------------------------
" " python3.7にアップしたあと、PluginのYouCompleteMeを実行すると、
" " 警告メッセージが出たのでそれが出ないように追加
" if has('python3')
"     silent! python3 1
" endif

"--------------------------------------------------------------------------------
"Markdown-preview setting
"--------------------------------------------------------------------------------
autocmd FileType markdown noremap <silent><C-p>  :MarkdownPreview<CR>

"--------------------------------------------------------------------------------
"vim-easydebugger
"--------------------------------------------------------------------------------
" Vim-EasyDebugger 快捷键配置
" 启动 NodeJS/Python/Go 调试
nmap <S-R>  <Plug>EasyDebuggerInspect
" 启动 NodeJS 的 Web 调试模式
nmap <S-W>  <Plug>EasyDebuggerWebInspect
" 关闭调试
nmap <S-E>  <Plug>EasyDebuggerExit
" 暂停程序
nmap <F6>   <Plug>EasyDebuggerPause
tmap <F6>   <Plug>EasyDebuggerPause
" 跳出函数
nmap <F7>   <Plug>EasyDebuggerStepOut
tmap <F7>   <Plug>EasyDebuggerStepOut
" 进入函数
nmap <F8>   <Plug>EasyDebuggerStepIn
tmap <F8>   <Plug>EasyDebuggerStepIn
" 单步执行
nmap <F9>   <Plug>EasyDebuggerNext
tmap <F9>   <Plug>EasyDebuggerNext
" Continue
nmap <F10>  <Plug>EasyDebuggerContinue
tmap <F10>  <Plug>EasyDebuggerContinue
" 设置断点
nmap <F12>  <Plug>EasyDebuggerSetBreakPoint



"--------------------------------------------------------------------------------
"ryanoasis/vim-devicons setting
"--------------------------------------------------------------------------------
" フォルダアイコンを表示
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
" " アイコン入力方法 : `[Ctrl+V]` > `[u]` > `e905`
" let g:NERDTreeExtensionHighlightColor = {}
" let g:NERDTreeExtensionHighlightColor['vue'] = '42B983'

"--------------------------------------------------------------------------------
" vim-indentLine setting
"--------------------------------------------------------------------------------
" " Disable the plugin on Vim startUp
" let g:indent_guides_enable_on_vim_startup = 0
"
" set ts=4 sw=4 et
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1

let g:indentLine_enabled = 0
let g:indentLine_char_list = ['│', '┊', '┆', '¦']

autocmd FileType html,js,javascript,python IndentLinesEnable
" autocmd FileType js IndentGuidesEnable

" Vim8でvim-lspとasyncomplete関連でvue-language-serverを使う(細かいオプションは省略)
" [asyncomplete] Force refresh completion
imap <C-x><C-u> <Plug>(asyncomplete_force_refresh)

"
" Vue
"
" [install]
" npm i -g vue-language-server
"
" [command]
" vls
"

" if executable('vls')
"   augroup LspVls
"     au!
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'vue-language-server',
"         \ 'cmd': {server_info->['vls']},
"         \ 'whitelist': ['vue'],
"         \ 'initialization_options': {
"         \         'config': {
"         \             'html': {},
"         \              'vetur': {
"         \                  'validation': {}
"         \              }
"         \         }
"         \     }
"         \ })
"
"     " omnifunc
"     au FileType vue setlocal omnifunc=lsp#complete
"     " map
"     au FileType vue nnoremap <buffer><silent> gd :<C-u>LspDefinition<CR>
"     au FileType vue nnoremap <buffer><silent> gD :<C-u>LspReferences<CR>
"     au FileType vue nnoremap <buffer><silent> gs :<C-u>LspDocumentSymbol<CR>
"     au FileType vue nnoremap <buffer><silent> gS :<C-u>LspWorkspaceSymbol<CR>
"     au FileType vue nnoremap <buffer><silent> gQ :<C-u>LspDocumentFormat<CR>
"     au FileType vue vnoremap <buffer><silent> gQ :LspDocumentRangeFormat<CR>
"     au FileType vue nnoremap <buffer><silent> K :<C-u>LspHover<CR>
"     au FileType vue nnoremap <buffer><silent> <F1> :<C-u>LspImplementation<CR>
"     au FileType vue nnoremap <buffer><silent> <F2> :<C-u>LspRename<CR>
"   augroup end
" endif
"
" " deoplete Setting
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" " 補完したあとに下に出てしまうWindowを表示しないようにする
" set completeopt-=preview
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ------------------------------------------------------------------
" vim-lsp Setting

" augroup MyLsp
"      autocmd!
"      if executable('pyls')
"          autocmd User lsp_setup call lsp#register_server({
"              \ 'name': 'pyls',
"              \ 'cmd': { servier_info -> ['pyls'] },
"              \ 'whitelist': ['python'],
"              \ 'workspace_config': {
"              \   'pyls': {
"              \       'plugins': {
"              \           'jedi_definition': {
"              \               'follow_imports': v:true,
"              \               'follow_builtin_imports': v:true
"              \           },
"              \ }}}
"              \})
"      endif
"  augroup END
 
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
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" let g:ale_change_sign_column_color = 1
" シンボルを変更する
let g:ale_sign_error = '󿙘'
let g:ale_sign_warning = '󿔥'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s '
" Bind F8 to fixing problems with ALE
nmap <F5> :ALELint<CR>
nmap <F6> <Plug>(ale_fix)

let g:lightline#ale#indicator_errors = '󿙘:'
let g:lightline#ale#indicator_warnings = '󿔥:'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%code%]: %s [%severity%]'

nmap <silent> gK <Plug>(ale_previous_wrap)
nmap <silent> gJ <Plug>(ale_next_wrap)
autocmd VimEnter * :highlight! ALEErrorSign ctermfg=9 ctermbg=8 guifg=#444444 guibg=#FA8072
autocmd VimEnter * :highlight! ALEWarningSign ctermfg=11 ctermbg=8 guifg=#444444 guibg=#CCCC66
" autocmd VimEnter * :highlight! ALESignColumnWithErrors ctermfg=0 ctermbg=8 guifg=#A5A5A5 guibg=#F5F5F5
" autocmd VimEnter * :highlight! ALESignColumnWithoutErrors ctermfg=0 ctermbg=0 guifg=#A5A5A5 guibg=#F5F5F5
" autocmd VimEnter * :highlight! ALEInfoSign   ctermfg=14 ctermbg=8 guifg=#ED6237 guibg=#FF9999
" autocmd VimEnter * :highlight! ALEError ctermfg=9 ctermbg=8 guifg=#C30500 guibg=#FF9999
" autocmd VimEnter * :highlight! ALEWarning ctermfg=11 ctermbg=8 guifg=#ED6237 guibg=#FF9999
" autocmd VimEnter * :highlight! ALEInfo   ctermfg=14 ctermbg=8 guifg=#ED6237 guibg=#FF9999

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
    \    'max_buffer_size': 5000000,
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
" アイコン入力方法 : `[Ctrl+V]` > `[u]` > `e905`
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42B983'
let g:webdevicons_conceal_nerdtree_brackets = 1
