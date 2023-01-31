-- Check if we're in WSL
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

-- Set WSL clipboard support
-- make sure you have nvim_paste executable in your $PATH
if in_wsl then
    vim.cmd("set clipboard=unnamedplus")
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
        paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
        cache_enabled = true
    }
else
    vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
