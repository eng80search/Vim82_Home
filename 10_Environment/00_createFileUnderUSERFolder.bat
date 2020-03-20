REM  ユーザーフォルダにVim用ファイルを作成する
REM  Vimを最初にインストールした場合は、このバッチを実行する

echo ユーザーフォルダにVim用ファイルを作成を開始します。。

mkdir %USERPROFILE%\_vim\backUp
mkdir %USERPROFILE%\_vim\swp
mkdir %USERPROFILE%\_vim\undo
mkdir %USERPROFILE%\_vim\viminfo

echo 必要なファイルをコピーしています。。。
REM  00_Vimrcはフォルダごとにコピーする
echo D | xcopy 00_Vimrc\*.* ..\ /d /y /c /s /e /h /r
copy 01_Plugin\plug.vim ..\vim82\autoload
copy 02_Exe\*.* ..\
copy 03_Git\.gitignore ..\

echo ユーザーフォルダにVim用ファイルを作成が完了しました。
pause
