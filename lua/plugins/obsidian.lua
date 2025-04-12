return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    notes_subdir = "notes",
    workspaces = {
      {
        name = "personal",
        path = "~/personal/sagamd",
      },
    },
    preferred_link_style = "wiki",
    disable_frontmatter = true,
    templates = {
      folder = "templates",
      -- date_format = "%Y-%m-%d",
      -- time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
