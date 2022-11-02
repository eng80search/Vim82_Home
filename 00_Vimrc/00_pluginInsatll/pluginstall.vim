call plug#begin('$VIM/plugins')

" Make sure you use single quotes

    " Adds file type icons to Vim plugins
    Plug 'ryanoasis/vim-devicons'

    " NERD Tree
    Plug 'scrooloose/nerdtree'

    "" nerdtree-execute
    " Plug 'ivalkeen/nerdtree-execute'

    " NERD commenter
    " Plug 'scrooloose/nerdcommenter'

    " vim-session
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'

    "tagbar
    Plug 'majutsushi/tagbar'

    " " MRU
    Plug 'yegappan/mru'

    " SQL Formatting
    Plug 'mattn/vim-sqlfmt'

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " vim-bufonly.vim Delete all the buffers except the current buffer
    Plug 'schickling/vim-bufonly'

    " vim-singleton.vim Uses Vim with singleton
    Plug 'thinca/vim-singleton'

    " vim-surround.vim Vim plugin for Improved incremental search
    Plug 'tpope/vim-surround'

    "" python3 Plugin :automatically formats Python code need Install jedi  Labrary from pip
    Plug 'tell-k/vim-autopep8'

    "" python3 Plugin :Syntax highlighting
    Plug 'vim-python/python-syntax'

    "" Typescript syntax files for Vim
    Plug 'leafgarland/typescript-vim'

    "" lexima Plugin :Auto close parentheses 
    Plug 'cohama/lexima.vim'

    "extended % matching for Many Fromats
    " Plug 'tmhedberg/matchit'
    Plug 'andymass/vim-matchup'

    "A Vim plugin for Windows PowerShell support
    " Plug 'PProvost/vim-ps1'

    "improved Javascript indentation and syntax support in Vim
    Plug 'pangloss/vim-javascript'

    "input support in written HTML &CSS 
    Plug 'mattn/emmet-vim'

    "fuzzy finder Plugin If have some error in vim please remove directory and reinstall this plugin
    "this plugin necessary .but may be  get an error during installation. But don't worry.
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " A light and configurable statusline/tabline plugin for vim
    Plug 'itchyny/lightline.vim'

    " Provides the branch name of the current git repository
    Plug 'itchyny/vim-gitbranch'

    " A dark vim color scheme inspired by Atoms One Dark syntax theme
    Plug 'joshdick/onedark.vim'

    " incsearch
    Plug 'haya14busa/incsearch.vim'

    " Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window
    Plug 'skywind3000/asyncrun.vim'

    " Markdown Plugins
    " if you don't have nodejs and yarn
    " use pre build
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

    " have nodejs and yarn
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " " Syntax checking Plugin
    " Plug 'vim-syntastic/syntastic'

    " PluginのYouCompleteMeと衝突するため、無効化
    " " python3 Plugin : autocompletion need Install jedi Labrary from pip
    " Plug 'davidhalter/jedi-vim'

    " pt.vim Vim plugin for the platinum_search
    Plug 'nazo/pt.vim'


    " A VIM multi-language debugger plugin
    " Plug 'jayli/vim-easydebugger'

    " " visually displaying indent levels in Vim
    " Plug 'nathanaelkane/vim-indent-guides'

    " A vim plugin to display the indention levels with thin vertical lines
    Plug 'Yggdroot/indentLine'

    " vim-lsp plugin
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " add syntax check feature in vim
    Plug 'dense-analysis/ale'
    Plug 'maximbaz/lightline-ale'

    " add snippet feature in vim
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/asyncomplete-ultisnips.vim'


    " Viewer&Finder for LSP symbols and tags
    Plug 'liuchengxu/vista.vim'

    " add autocompletion feature in vim
    Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'eng80search/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    " Plug 'prabirshrestha/asyncomplete-buffer.vim'
    Plug 'eng80search/asyncomplete-buffer.vim'
    Plug 'prabirshrestha/asyncomplete-file.vim'


    " Vim syntax highlighting for Vue components
    " And also work in ALE with install eslint and eslint-plugin-vue using npm
    Plug 'posva/vim-vue'

    " Plug 'puremourning/vimspector'

    " A Vim plugin for Prettier
    Plug 'prettier/vim-prettier'
    " post install (yarn install | npm install) then load plugin only for editing supported files
    Plug 'prettier/vim-prettier', {
                \ 'do': 'yarn install',
                \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


    " Japanese Vim Help
    Plug 'vim-jp/vimdoc-ja'
    
    " Display and vavigate marks
    Plug 'kshenoy/vim-signature'

    " jsonformat plugin 
    Plug 'eng80search/jsonformat.vim'

    " vim_current_word plugin 
    Plug 'dominikduda/vim_current_word'

    " vim_startify plugin
    Plug 'mhinz/vim-startify'

    " vim_startify plugin
    Plug 'vim-scripts/vim-auto-save'

call plug#end()
