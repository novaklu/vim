README - popis nastavení pro použití ve Windows a git
===============================================================================

Vytvoření hardliku - adresář .vim a vimfiles
-------------------------------------------------------------------------------
V případě používání vim na Windows a zároveň v gitu je možné sloučit adresář .vim a vimfiles.
Provádí se to z prostředí Windows CMD pomocí sloučení adesářů.

mklink /J C:\Users\novakl1\.vim C:\Users\novakl1\vimfiles

Přesun konfiguračního adresáře git
-------------------------------------------------------------------------------
Přesuneme i konfigurační adresář gitu pro možnost verzování v gitu.

mklink /J C:\Users\novakl1\vimfiles\.config C:\Users\novakl1\.config

Vytvoření hardlinku - konfigurační soubory
-------------------------------------------------------------------------------
Následně je možné vytvořit hardlinky na konfigurační soubory vim, git a bash.
Provádí se to následujícími příkazy:

mklink /H C:\Users\novakl1\.bash_history  C:\Users\novakl1\vimfiles\.bash_history
mklink /H C:\Users\novakl1\.bash_profile  C:\Users\novakl1\vimfiles\.bash_profile
mklink /H C:\Users\novakl1\.bashrc  C:\Users\novakl1\vimfiles\.bashrc
mklink /H C:\Users\novakl1\.gitconfig  C:\Users\novakl1\vimfiles\.gitconfig
mklink /H C:\Users\novakl1\.viminfo  C:\Users\novakl1\vimfiles\.viminfo
mklink /H C:\Users\novakl1\.vimrc  C:\Users\novakl1\vimfiles\.vimrc
mklink /H C:\Users\novakl1\_viminfo  C:\Users\novakl1\vimfiles\_viminfo

Rozlišení Windows alinux prostředí
------------------------------------------------------------------------------
Následně je možné používat společnou konfiguraci.
Rozlišení cest pro Windows a Linux je možné provádět pomocí této konstruce:
macunix                 Macintosh version of Vim, using Unix files (OS-X).
unix                    Unix version of Vim.
win32                   Win32 version of Vim (MS-Windows 95 and later, 32 or
                         64 bits)
win32unix               Win32 version of Vim, using Unix files (Cygwin)

And some older (semi-deprecated) systems:

amiga                   Amiga version of Vim.
os2                     OS/2 version of Vim.
win16                   Win16 version of Vim (MS-Windows 3.1).
win32                   Win32 version of Vim (MS-Windows 32 bit).
win64                   Win64 version of Vim (MS-Windows 64 bit).
win95                   Win32 version for MS-Windows 95/98/ME.

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

Termux - prostředí bash na telefonu s androidem
-------------------------------------------------------------------------------
Při použití na androidu bohužel nefungují hardlinky. Je nutné soubory kopírovat.
K tomu slouží dva připravené skripty v adresáři skript.
    1. install_termux.sh - nakopíruje soubory do domovského adresáře
    2. backup_termux.sh - nakopíruje soubory do adresáře /vimfiles
        a. spuštěním je možné zkopírovat soubory
        b. následně je možné pomocí git diff porovnat změny

Použitá literatura:
-------------------------------------------------------------------------------
1) http://www.jiribrejcha.net/2010/08/naucte-se-pracovat-se-symbolickymi-a-pevnymi-odkazy/
2) https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript
3) https://github.com/termux/termux-app/issues/513
4) https://www.zdrojak.cz/clanky/vs-code-pracujeme-s-gitem/
5) https://www.zdrojak.cz/clanky/jasne-umim-git/ 
6) https://stackoverflow.com/questions/32186840/git-for-windows-doesnt-execute-my-bashrc-file
7) https://www.root.cz/clanky/barvy-pro-shell/
