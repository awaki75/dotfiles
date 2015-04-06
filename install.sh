sudo apt-get install -y curl git vim zsh

if [ ! -d ~/.oh-my-zsh ]; then
    curl -s https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    sudo chsh -s /bin/zsh $USER
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    curl -s https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

mkdir -p ~/.oh-my-zsh/custom/themes
url="https://raw.githubusercontent.com/awaki75/dotfiles/master"
curl -s $url/.vimrc -o ~/.vimrc
curl -s $url/.zshrc -o ~/.zshrc
curl -s $url/awaki.zsh-theme -o ~/.oh-my-zsh/custom/themes/awaki.zsh-theme

# cd ~/.vim/bundle/jedi-vim
# git submodule update --init

cat > ~/.gitattributes << EOF
*.c diff=cpp
*.h diff=cpp
*.cpp diff=cpp
*.hpp diff=cpp
*.m diff=objc
*.java diff=java
*.html diff=html
*.pl diff=perl
*.pm diff=perl
*.t diff=perl
*.php diff=php
*.py diff=python
*.rb diff=ruby
*.js diff=java
EOF
git config --global color.ui auto
git config --global core.attributesfile ~/.gitattributes
git config --global core.editor vim
