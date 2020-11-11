" ---------------------------------
"  ALE Settings
" ---------------------------------
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Select flake8 and pylint, and ignore pylint, so only flake8 is run.
let b:ale_linters_ignore = ['pylint']
" let g:ale_python_flake8_options = ' --ignore=W503,E501'

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf', 'black']
" let b:ale_fixers = ['autopep8', 'yapf', 'isort']
" let b:ale_fixers = ['autopep8']
" let b:ale_fixers = [ 'yapf']
" let b:ale_fixers = ['isort']
" let b:ale_fixers = ['black']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

function! Debug()

    only
    " Tagbar
    vsplit
    term python -m ipdb %
    " vert term python -m ipdb %
endfunction

command! -nargs=0 Debug call Debug()

