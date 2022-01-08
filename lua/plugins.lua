-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'asvetliakov/vim-easymotion'
  use 'jacquesbh/vim-showmarks'
end)
