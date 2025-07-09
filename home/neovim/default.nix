{ ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = ''
      vim.opt.undofile = true
      vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
    '';
  };
}