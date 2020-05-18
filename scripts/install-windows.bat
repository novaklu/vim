@ECHO OFF

mklink /J %HOMEDRIVE%%HOMEPATH%\.vim %HOMEDRIVE%%HOMEPATH%\vimfiles

mklink /J %HOMEDRIVE%%HOMEPATH%\vimfiles\.config %HOMEDRIVE%%HOMEPATH%\.config
mklink /H %HOMEDRIVE%%HOMEPATH%\vimfiles\.config\git\git-prompt.sh  %HOMEDRIVE%%HOMEPATH%\vimfiles\.prompt.sh

mklink /H %HOMEDRIVE%%HOMEPATH%\.bash_profile  %HOMEDRIVE%%HOMEPATH%\vimfiles\.bash_profile
mklink /H %HOMEDRIVE%%HOMEPATH%\.bashrc  %HOMEDRIVE%%HOMEPATH%\vimfiles\.bashrc
mklink /H %HOMEDRIVE%%HOMEPATH%\.gitconfig  %HOMEDRIVE%%HOMEPATH%\vimfiles\.gitconfig
mklink /H %HOMEDRIVE%%HOMEPATH%\.vimrc  %HOMEDRIVE%%HOMEPATH%\vimfiles\.vimrc
mklink /H %HOMEDRIVE%%HOMEPATH%\.minttyrc  %HOMEDRIVE%%HOMEPATH%\vimfiles\.minttyrc

