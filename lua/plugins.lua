-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'easymotion/vim-easymotion'
  use 'jacquesbh/vim-showmarks'
  use 'lambdalisue/fern.vim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
end)
