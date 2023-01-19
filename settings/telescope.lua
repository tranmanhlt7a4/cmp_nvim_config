local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
-- Undo tree
vim.api.nvim_set_keymap("n", "<leader>u", ":Telescope undo<CR>", opts)

-- Map file browser
vim.api.nvim_set_keymap("n", "<F5>", ":Telescope file_browser<CR>", opts)

-- NOTE: File browser actions
-- Insert / Normal    fb_actions            Description
-- <A-c>/c            create                Create file/folder at current path (trailing path separator creates folder)
-- <S-CR>             create_from_prompt    Create and open file/folder from prompt (trailing path separator creates folder)
-- <A-r>/r            rename                Rename multi-selected files/folders
-- <A-m>/m            move                  Move multi-selected files/folders to current path
-- <A-y>/y            copy                  Copy (multi-)selected files/folders to current path
-- <A-d>/d            remove                Delete (multi-)selected files/folders
-- <C-o>/o            open                  Open file/folder with default system application
-- <C-g>/g            goto_parent_dir       Go to parent directory
-- <C-e>/e            goto_home_dir         Go to home directory
-- <C-w>/w            goto_cwd              Go to current working directory (cwd)
-- <C-t>/t            change_cwd            Change nvim's cwd to selected folder/file(parent)
-- <C-f>/f            toggle_browser        Toggle between file and folder browser
-- <C-h>/h            toggle_hidden         Toggle hidden files/folders
-- <C-s>/s            toggle_all            Toggle all entries ignoring ./ and ../
-- <Tab>              see telescope.nvim    Toggle selection and move to next selection
-- <S-Tab>            see telescope.nvim    Toggle selection and move to prev selection

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                -- your custom insert mode mappings
                },
                ["n"] = {
                -- your custom normal mode mappings
                },
            },
        },

        undo = {
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = false,
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            mappings = {
                i = {
                    -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                    -- you want to replicate these defaults and use the following actions. This means
                    -- installing as a dependency of telescope in it's `requirements` and loading this
                    -- extension from there instead of having the separate plugin definition as outlined
                    -- above.
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-cr>"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
require("telescope").load_extension "undo"