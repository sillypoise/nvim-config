local status_1, nord = pcall(require, "nord")
if (not status_1) then return end
local status_2, gh_theme = pcall(require, "github-theme")
if (not status_2) then print("errro") end

-- nord.set()
gh_theme.setup({
    theme_style = "dark"
})
