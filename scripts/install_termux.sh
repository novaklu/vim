# install script for termux
# only copy file to home
cp -u ~/vimfiles/.bashrc ~/.bashrc
cp -u ~/vimfiles/.vimrc ~/.vimrc
cp -u ~/vimfiles/.gitconfig ~/.gitconfig
mkdir ~/.vim
cp -ru ~/vimfiles/autoload/ ~/.vim/autoload
cp -ru ~/vimfiles/backups/ ~/.vim/backups
cp -ru ~/vimfiles/bundle/ ~/.vim/bundle
cp -ru ~/vimfiles/spell/ ~/.vim/spell
cp -ru ~/vimfiles/swap/ ~/.vim/swap
cp -u ~/vimfiles/README ~/.vim/README
cp -u ~/vimfiles/README.md ~/.vim/README.md

