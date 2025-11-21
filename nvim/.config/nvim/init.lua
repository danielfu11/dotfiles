require("mangobay")

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- format-on-save
    if not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end

    local keymap = vim.keymap.set
    local opts = {
      noremap = true, -- prevent recursive mapping
      silent = true, -- don't print the command to the cli
      buffer = bufnr, -- restrict the keymap to the local buffer number
    }

    -- native neovim keymaps
    keymap("n", "<leader>gd", vim.lsp.buf.definition, opts) -- goto definition
    keymap("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- goto declaration
    keymap("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    keymap("n", "<leader>gS", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts) -- goto definition in split
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
    keymap("n", "<leader>D", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>", opts) -- Line diagnostics (float)
    keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- Cursor diagnostics
    keymap("n", "<leader>pd", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- previous diagnostic
    keymap("n", "<leader>nd", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- next diagnostic
    keymap("n", "K", vim.lsp.buf.hover, opts) -- hover documentation
    -- toggle inlay hints
    if client.server_capabilities.inlayHintProvider then
      keymap("n", "<leader>ti",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      )
    end

    -- fzf-lua keymaps
    keymap("n", "<leader>gd", "<cmd>FzfLua lsp_finder<CR>", opts) -- LSP Finder (definition + references)
    keymap("n", "<leader>gr", "<cmd>FzfLua lsp_references<CR>", opts) -- Show all references to the symbol under the cursor
    keymap("n", "<leader>gt", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- Jump to the type definition of the symbol under the cursor
    keymap("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>", opts) -- List all symbols (functions, classes, etc.) in the current file
    keymap("n", "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts) -- Search for any symbol across the entire project/workspace
    keymap("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Go to implementation

  end,
})

