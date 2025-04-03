local Util = require("lazyvim.util")

return {

  -- Add java to treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java" })
    end,
  },

  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          setup = {
            jdtls = function()
              require('java').setup({
                java_test = {
                  enable = Util.has("nvim-dap"),
                },
                java_debug_adapter = {
                  enable = Util.has("nvim-dap"),
                },
                spring_boot_tools = {
                  enable = false,
                },
                jdk = {
                  auto_install = false,
                },
              })
            end,
          },
        },
      },
    },
  },
}
