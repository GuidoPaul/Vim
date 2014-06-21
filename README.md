I use pathogen to Manage my `'runtimepath'` with ease and Vundle to management my vim plugins. 

You can refer to this link for more information: [Pathogen]( https://github.com/tpope/vim-pathogen  )
and [Vundle]( https://github.com/gmarik/vundle  )

# Preparation:
if you don't have vim.
	
	sudo apt-get install vim

If you have used the vim.

	mv ~/.vim ~/.vim_old
	mv ~/.vimrc ~/.vimrc_old

# Install with:

	git clone git@github.com:GuidoPaul/Vim.git ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

# Install plugins:

Launch `vim` and run `:PluginInstall`

To install from command line: `vim +PluginInstall +qall`

## About plugins:

### 1. clang_complete
you need install clang、libclang1 and libclang-dev (root)
				
	apt-get install clang libclang1 libclang-dev

### 2. javacomplete
You can refer to this link for more information : [javacomplete](https://github.com/vim-scripts/javacomplete)

