return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        dynamic_preview_title = true,
        results_title = false,
        prompt_title = false,
        layout_strategy = "bottom_pane",
        layout_config = {
          height = 0.3,
        },
      },
    },
    keys = {
      {
        "<leader>.",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find local files"
      },
      {
        "<leader>*",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Grep in local project"
      },
      {
        "<leader>b",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Browse buffers"
      },
      {
        "<leader>x",
        function()
          require("telescope.builtin").commands()
        end,
        desc = "Browse commands"
      },
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Browse repo files"
      },
      {
        "<leader>r",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Browse recent files"
      }
    }
  }
}
