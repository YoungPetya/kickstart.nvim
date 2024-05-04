-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   "lervag/vimtex",
  --   lazy = false,     -- we don't want to lazy load VimTeX
  --   -- tag = "v2.15", -- uncomment to pin to a specific release
  --   init = function()
  --     -- VimTeX configuration goes here
  --   end
  -- },

  'ThePrimeagen/vim-be-good',
  {
    'R-nvim/R.nvim',
    config = function()
      -- Create a table with the options to be passed to setup()
      local opts = {
        R_path = 'R',
        R_app = 'R',
        R_cmd = 'R',
        pdfviewer = 'C:\\Program Files (x86)\\Foxit Software\\Foxit PDF Reader\\FoxitPDFReader.exe',
        R_args = { '--quiet', '--no-save' },
        hook = {
          after_config = function()
            -- This function will be called at the FileType event
            -- of files supported by R.nvim. This is an
            -- opportunity to create mappings local to buffers.
            if vim.o.syntax ~= 'rbrowser' then
              vim.api.nvim_buf_set_keymap(0, 'n', '<Enter>', '<Plug>RDSendLine', {})
              vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})
            end
          end,
        },
        min_editor_width = 72,
        rconsole_width = 78,
        disable_cmds = {
          'RClearConsole',
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 1
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
    lazy = false,
  },
}
