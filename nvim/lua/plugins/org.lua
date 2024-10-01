return {
  {
    "nvim-orgmode/orgmode",
    event = 'VeryLazy',
    ft = { 'org' },
    config =
        function()
          -- Setup orgmode
          require('orgmode').setup({
            org_agenda_files = '~/orgfiles/**/*',
            org_default_notes_file = '~/orgfiles/refile.org',
          })

          -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
          -- add ~org~ to ignore_install
          -- require('nvim-treesitter.configs').setup({
          --   ensure_installed = 'all',
          --   ignore_install = { 'org' },
          -- })
        end,
  },
  {
    "nvim-orgmode/org-bullets.nvim",
    opts = {}
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
    }
  },
  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.0",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.4",
      },
    },
    opts = {
      directory = "~/org/roam"
    }
  }
}
