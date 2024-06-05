-- Vertical split
vim.keymap.set({ "n", "v" }, "<leader>vs", function()
    vim.cmd("vsplit")
  end,
  { desc = "Vertical split" }
)

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find existing buffers" })
vim.keymap.set("n", "<leader>fs", function()
    require("telescope.builtin").current_buffer_fuzzy_find({
      layout_strategy = "horizontal",
    })
  end,
  { desc = "Search current buffer" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>fo", function()
    require("telescope.builtin").oldfiles({ cwd_only = true })
  end,
  { desc = "Find local history" }
)
vim.keymap.set("n", "<leader>lD", require("telescope.builtin").diagnostics, { desc = "Seach diagnostics" })
vim.keymap.set("n", "<leader>lr", require("telescope.builtin").lsp_references, { desc = "Find references" })


-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Avoid yank-on-paste and yank-on-edit (yank-on-delete remains)
vim.keymap.set("v", "p", '"_dP', { noremap = true })
vim.keymap.set("v", "c", '"_c', { noremap = true })
vim.keymap.set("v", "x", '"_x', { noremap = true })
vim.keymap.set("v", "<", "<gv", { desc = "unindent line" })
vim.keymap.set("v", ">", ">gv", { desc = "indent line" })


-- Pounce
vim.keymap.set({ "n", "v" }, "f", require("pounce").pounce, { desc = "Fuzzy hop with pounce" })

-- -- Useful for editing -- popular move in insert mode.
-- vim.keymap.set("i", "jj", "<esc>la", { desc = "Move one symbol right" })
-- vim.keymap.set("i", "jl", "<esc>A", { desc = "Move to the end and continue edit" })
-- vim.keymap.set("i", "jh", "<esc>^i", { desc = "Move to the begin and continue edit" })

-- Buffer navigation and manipulation
vim.keymap.set("n", "<S-l>", function() require("bufferline.commands").cycle(1) end, { desc = "Move right" })
vim.keymap.set("n", "<S-h>", function() require("bufferline.commands").cycle(-1) end, { desc = "Move left" })
vim.keymap.set("n", "<leader>c", function() require("bufdelete").bufdelete(0, true) end,
  { desc = "Close buffer" })
-- Delete all invisible buffers ([b]uffer-[o]nly)
vim.keymap.set("n", "<leader>bo", function()
  local bufinfos = vim.fn.getbufinfo({ buflisted = true })
  vim.tbl_map(function(bufinfo)
    if bufinfo.changed == 0 and (not bufinfo.windows or #bufinfo.windows == 0) then
      require("bufdelete").bufdelete(bufinfo.bufnr, true)
    end
  end, bufinfos)
end, { desc = 'Keep only visible buffers' })

-- `F` for `Focus`: it moves to the leftmost split and keeps only it, closing all the other
-- buffers. Useful for a round of exploration in the code.
vim.keymap.set("n", "<leader>F",
  function()
    for _ = 1, 7 do
      vim.cmd("wincmd h")
    end
    require("bufferline.commands").close_others()
    vim.cmd("only")
  end,
  { desc = "Move left and focus" }
)

-- Avoid yank-on-edit
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true })
vim.keymap.set("n", "C", '"_C', { noremap = true })
-- Line deletion without yank (quite often used)
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })
-- Avoid yank-on-paste
vim.keymap.set("v", "p", '"_dP', { noremap = true })

-- Very convenient to have semicolon starting the colon
vim.keymap.set("n", ";", ":")
