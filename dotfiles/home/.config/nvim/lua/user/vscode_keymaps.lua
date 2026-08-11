local opts = { noremap = true, silent = true }

-- remap leader key
vim.keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- move text up and down
vim.keymap.set("v", "J", ":m .+1<CR>==", opts)
vim.keymap.set("v", "K", ":m .-2<CR>==", opts)
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
vim.keymap.set("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim
local keymaps = {
	{ { "n", "v" }, "<leader>pr", "code-runner.run" },
	{ { "n", "v" }, "<leader>fd", "editor.action.formatDocument" },
	{ { "n", "v" }, "<leader>a", "editor.action.quickFix" },
	{ { "n", "v" }, "<leader>d", "editor.action.showHover" },
	{ { "n", "v" }, "<leader>b", "editor.debug.action.toggleBreakpoint" },
	{ { "n", "v" }, "<leader>cn", "notifications.clearAll" },
	{ { "n", "v" }, "<C-r>", "workbench.action.openRecent" },
	{ { "n", "v" }, "<leader>ff", "workbench.action.quickOpen" },
	{ { "n", "v" }, "<leader>cp", "workbench.action.showCommands" },
	{ { "n", "v" }, "<leader>t", "workbench.action.terminal.toggleTerminal" },
	{ { "n", "v" }, "<leader>sp", "workbench.actions.view.problems" },
}

for _, keymap in ipairs(keymaps) do
	local mode, binding, action = keymap[1], keymap[2], keymap[3]
	vim.keymap.set(mode, binding, "<cmd>lua require('vscode').action('" .. action .. "')<CR>")
end
