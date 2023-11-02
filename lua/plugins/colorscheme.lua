-- Or with configuration
return {
  -- "projekt0n/github-nvim-theme",
  "kepano/flexoki-neovim",
  opts = {
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "flexoki",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flexoki-dark",
    },
  },
}
