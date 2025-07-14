vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
  pattern = { ":" },
  callback = function()
    local mappings = vim.api.nvim_get_keymap "c"
    for _, v in pairs(mappings) do
      if v.desc == "cmp.utils.keymap.set_map" then vim.keymap.del("c", v.lhs) end
    end
  end,
})
