local utils = require("emoji.utils")
local config = require("emoji.config")

local Main = {}

function Main.setup(opts)
  if not utils.is_neovim_version_satisfied(9) then
    utils.error("Emoji needs Neovim >= 0.9.0")
    return
  end
  config.setup(opts)

  if config.options.enable_cmp_integration then
    if not utils.is_module_available("cmp") then
      utils.error("cannot load nvim-cmp for emoji completion")
      return
    end
    require("cmp").register_source("emoji", require("cmp_emoji.init").new())
  end
end

Main.insert = function()
  local data = utils.load_from_json(config.options.plugin_path .. config.paths.emoji)
  local options = utils.create_emoji_options(data)
  require("emoji.ui").select_and_insert(options)
end
Main.insert_by_group = function()
  local data = utils.load_from_json(config.options.plugin_path .. config.paths.emoji)
  local groups = utils.get_groups(data)
  require("emoji.ui").select_and_insert_emoji_by_group(data, groups)
end

Main.insert_kaomoji = function()
  local data = require("emoji.kaomoji").normalized_data(config.options.plugin_path .. config.paths.kaomoji)
  local options = utils.create_kaomoji_options(data)
  require("emoji.ui").select_and_insert(options)
end

Main.insert_kaomoji_by_group = function()
  local data = require("emoji.kaomoji").normalized_data(config.options.plugin_path .. config.paths.kaomoji)
  local groups = utils.get_groups(data)
  require("emoji.ui").select_and_insert_kaomoji_by_group(data, groups)
end

return Main
