mklink %HOMEPATH%"\.vimrc" %DOTFILEPATH%"\.vimrc"
mklink %HOMEPATH%"\.gvimrc" %DOTFILEPATH%"\.gvimrc"
mklink /D %HOMEPATH%"\.vim\ftdetect" %DOTFILEPATH%"\ftdetect"
mklink /D %HOMEPATH%"\.vim\indent" %DOTFILEPATH%"\indent"
mklink /D %HOMEPATH%"\.vim\colors" %DOTFILEPATH%"\colors"
mklink /D %HOMEPATH%"\.vim\autoload" %DOTFILEPATH%"\autoload"
mklink /D %HOMEPATH%"\.vim\bitmaps" %DOTFILEPATH%"\bitmaps"
exit 0
