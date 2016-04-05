I use pathogen to Manage my `'runtimepath'` with ease and Vundle to management my vim plugins.

You can refer to this link for more information: [Pathogen]( https://github.com/tpope/vim-pathogen  )
and [Vundle]( https://github.com/gmarik/vundle  )

# Preparation:
if you don't have vim, you need to go to install it. For example:

Install vim-gnome in Debian

    $ sudo pacman -S vim gvim

If you have used the vim.

	$ mv ~/.vim ~/.vim_old
	$ mv ~/.vimrc ~/.vimrc_old

# Install with:

	$ git clone https://github.com/GuidoPaul/Vim.git ~/.vim
    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	$ ln -s ~/.vim/vimrc ~/.vimrc

# Install plugins:

Launch `vim` and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`

## About plugins:

### 1. ack.vim

    $ sudo pacman -S ack

### 2. tagbar

    $ sudo pacman -S ctags


### 3. vim-instant-markdown

    $ sudo pacman -S xdg-utils nodejs npm

NPM behind a proxy then install instant-markdown-d

    $ sudo npm config set proxy=http://127.0.0.1:10801
    $ sudo npm -g install instant-markdown-d

### 4. YouCompleteMe

you must read [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) carefully.

#### C-family support

Install clang libclang1 libclang-dev in Debian

    $ sudo pacman -S clang cmake
    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --clang-completer --system-libclang

#### Go support

    $ sudo pacman -S go
    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --gocode-completer

#### JavaScript support

    $ sudo pacman -S nodejs npm
    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --tern-completer

#### In a word

    $ ./install.py --clang-completer --system-libclang --gocode-completer --tern-completer

### 5. javacomplete
You can refer to this link for more information : [javacomplete](https://github.com/vim-scripts/javacomplete)

