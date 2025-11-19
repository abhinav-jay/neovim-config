return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = "Telescope",
    keys = {
      -- common useful keymaps
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "[F]ind [F]iles" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "[F]ind by [G]rep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "[F]ind [B]uffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "[F]ind [H]elp" },
      { "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "[F]ind [K]eymaps"},
    },
    opts = {
      defaults = {
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- enable fzf if installed
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
