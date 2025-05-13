return {
  "AdiY00/copy-tree.nvim",
  cmd = { "CopyTree", "SaveTree" },
  config = function()
    require("copy-tree").setup()
  end,
}
