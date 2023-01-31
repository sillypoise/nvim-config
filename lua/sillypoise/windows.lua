-- Check if we're in WSL
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

-- Set WSL clipboard support
if in_wsl then
    vim.cmd("set clipboard=unnamedplus")
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy = { ["+"] = { "win32yank.exe" }, ["*"] = { "win32yank.exe" } },
        paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
        cache_enabled = true
    }
else
    vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
