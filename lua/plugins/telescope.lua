return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('telescope').setup {
        defaults = {
          scroll_strategy = "limit",
          file_ignore_patterns = { ".git/[^h]" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }

      local actions = require('telescope.actions')
      -- Define a keymap for the lsp_definitions action
      vim.keymap.set('n', '<leader>fd', function()
        builtin.lsp_definitions({
          -- Set the action to perform when selecting an item
          attach_mappings = function(_, map)
            map('i', '<CR>', actions.select_default)
            map('n', '<CR>', actions.select_default)
            map('i', '<Esc>', actions.close)
            map('n', '<Esc>', actions.close)
            return true
          end
        })
      end, {})

      local builtin = require('telescope.builtin')
      -- File Picker
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})  -- Search file within whole projects
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})   -- Search git file within whole projects                                              -- search string in current file
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})   -- Search string within whole projects
      vim.keymap.set('n', '<leader>fs', builtin.grep_string, {}) -- Search string under cursor in current file

      -- Vim Picker
      vim.keymap.set('n', '<leader>fb', function()
        builtin.buffers({
          -- Set the action to perform when selecting an item
          attach_mappings = function(_, map)
            map('i', '<CR>', actions.select_default)
            map('n', '<CR>', actions.select_default)
            map('i', 'd', require('telescope.actions').delete_buffer)
            map('n', 'd', require('telescope.actions').delete_buffer)
            return true
          end
        })
      end, {})                                                                 -- Lists open buffers in current neovim instance
      vim.keymap.set('n', '<leader>fc', builtin.command_history, {})           -- Lists commands that were executed recently
      vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {}) -- LLive fuzzy search inside of the currently open buffer

      -- Neovim LSP Picker
      vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {}) -- Goto the implementation of the word under the cursor
      vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})     -- Goto the definition of the word under the cursor and go back

      -- Git Picker
      vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})  -- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
      vim.keymap.set('n', '<leader>fgb', builtin.git_bcommits, {}) -- Lists buffer's git commits with diff preview and checks them out on <cr>
      vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})   -- Lists current changes per file with diff preview
    end
  },
  -- File Browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    event = 'VeryLazy',
    config = function()
      local fb_actions = require "telescope._extensions.file_browser.actions"

      require("telescope").setup {
        extensions = {
          file_browser = {
            -- theme = "ivy",
            -- hijack_netrw = true,
          },
        },
      }

      -- Run it
      require("telescope").load_extension "file_browser"

      vim.api.nvim_set_keymap(
        "n",
        "<space>fe",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { noremap = true }
      )
    end
  }

  -- <A-c>/c	create	            Create file/folder at current path (trailing path separator creates folder)
  -- <S-CR>	create_from_prompt	Create and open file/folder from prompt (trailing path separator creates folder)
  -- <A-r>/r	rename	            Rename multi-selected files/folders
  -- <A-m>/m	move	            Move multi-selected files/folders to current path
  -- <A-y>/y	copy	            Copy (multi-)selected files/folders to current path
  -- <A-d>/d	remove	            Delete (multi-)selected files/folders
  -- <C-o>/o	open	            Open file/folder with default system application
  -- <C-g>/g	goto_parent_dir	    Go to parent directory
  -- <C-e>/e	goto_home_dir	    Go to home directory
  -- <C-w>/w	goto_cwd	        Go to current working directory (cwd)
  -- <C-t>/t	change_cwd	        Change nvim's cwd to selected folder/file(parent)
  -- <C-f>/f	toggle_browser	    Toggle between file and folder browser
  -- <C-h>/h	toggle_hidden	    Toggle hidden files/folders
  -- <C-s>/s	toggle_all	        Toggle all entries ignoring ./ and ../
  -- <Tab>	see telescope.nvim	Toggle selection and move to next selection
  -- <S-Tab>	see telescope.nvim	Toggle selection and move to prev selection
  -- <bs>/	backspace	        With an empty prompt, goes to parent dir. Otherwise acts normally
}
