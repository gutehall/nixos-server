{ config, pkgs, ... }:

{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";

      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ 
            Vundle-vim
            vim-localvimrc
            zsh-autosuggestions
            zsh-syntax-highlighting
            vimPlugins.zenburn
        ];
        opt = [];
      };
      vimrcConfig.customRC = ''
          set nocompatible
          filetype off

          set rtp+=~/.vim/bundle/Vundle.vim
          call vundle#begin()

          Plugin 'VundleVim/Vundle.vim'

          Plugin 'preservim/nerdtree'

          call vundle#end()
          filetype plugin indent on

          set runtimepath+=~/.vim_runtime

          colors zenburn

          source ~/.vim_runtime/vimrcs/basic.vim
          source ~/.vim_runtime/vimrcs/filetypes.vim
          source ~/.vim_runtime/vimrcs/plugins_config.vim
          source ~/.vim_runtime/vimrcs/extended.vim

          try
          source ~/.vim_runtime/my_configs.vim
          catch
          endtry

          call pathogen#infect()
          syntax on
          filetype plugin indent on

          autocmd vimenter * NERDTree
          autocmd StdinReadPre * let s:std_in=1
          autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
          let g:NERDTreeWinPos = "left"
          map <C-n> :NERDTreeToggle<CR>
          let NERDTreeShowHidden=1

          nnoremap <C-Left> :tabprevious<CR>
          nnoremap <C-Right> :tabnext<CR>
          nnoremap <C-j> :tabprevious<CR>
          nnoremap <C-k> :tabnext<CR>
      '';
    }
  )];
}