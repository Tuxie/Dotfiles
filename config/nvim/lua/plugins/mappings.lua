return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                -- first key is the mode
                n = {
                    -- move old behavior to gJ and gK
                    ["gJ"] = { "J", desc = "Join lines (was J)" },
                    ["gK"] = { "K", desc = "Manual (was K)" },

                    -- remap J and K to scroll
                    ["J"] = { "<C-d>", desc = "Scroll half-page down" },
                    ["K"] = { "<C-u>", desc = "Scroll half-page up" },

                    -- second key is the lefthand side of the map
                    -- mappings seen under group name "Buffer"
                    --["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                    --[[
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
                    -- tables with just a `desc` key will be registered with which-key if it's installed
                    -- this is useful for naming menus
                    ["<Leader>b"] = { desc = "Buffers" },
                    -- quick save
                    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                    --]]
                },
                x = {
                    -- move old behavior to gJ
                    ["gJ"] = { "J", desc = "Join lines (was J)" },
                    -- remap J and K to scroll
                    ["J"] = { "<C-d>", desc = "Scroll half-page down" },
                    ["K"] = { "<C-u>", desc = "Scroll half-page up" },
                },
                t = {
                    -- setting a mapping to false will disable it
                    -- ["<esc>"] = false,
                },
            },
        },
    },
}
