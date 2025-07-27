-- bootstrap lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
	"git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path})
    if vim.v.shell_error ~= 0 then
	vim.api.nvim_echo({
	    { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
	    { out, "WarningMsg" },
	    { "\nPress any key to exit..." },
	}, true, {})
	vim.fn.getchar()
	os.exit(1)
    end
end
vim.opt.rtp:prepend(lazy_path)


-- ensure mappings are correct before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    -- install = { colorscheme = { "..." } },
    checker = { enabled = true },
})
