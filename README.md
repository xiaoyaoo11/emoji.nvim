<h1 align="center">emoji.nvim 😀</h1>

<div align="center">
  <p>
    <img src="https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim"/>
    <img src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white" alt="Lua"/>
  </p>
</div>
<div align="center">
  <p>
    <img src="https://github.com/Allaman/emoji.nvim/actions/workflows/ci.yml/badge.svg" alt="CI"/>
    <img src="https://github.com/Allaman/emoji.nvim/actions/workflows/update-emojis.yml/badge.svg" alt="Update-emojis"/>
    <img src="https://img.shields.io/github/repo-size/Allaman/emoji.nvim" alt="size"/>
    <img src="https://img.shields.io/github/issues/Allaman/emoji.nvim.svg" alt="issues"/>
    <img src="https://img.shields.io/github/last-commit/Allaman/emoji.nvim" alt="last commit"/>
    <img src="https://img.shields.io/github/license/Allaman/emoji.nvim" alt="license"/>
    <img src="https://img.shields.io/github/v/release/Allaman/emoji.nvim?sort=semver" alt="release"/>
  </p>
</div>

## ❓ Why

This plugin allows you to easily search and insert emojis in your current buffer.

Jokes aside, I could not find a plugin that fulfills my wish for both telescope and cmp integration, so why not write a plugin myself?

## 💫 Features

- Automatic updates of available emojis via GitHub actions ([emojis-api.com](https://emoji-api.com/) as source).
- No dependencies (relies on `vim.ui.select`).
- (Optional) [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) integration (emojis only).
- (Optional) [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) integration (emojis only).

## 🖼️ Screenshots

<details>
<summary>emojis via vim.ui</summary

[![ui.png](https://s9.gifyu.com/images/SFndT.png)](https://gifyu.com/image/SFndT)

Please note that I use [dressing.nvim](https://github.com/stevearc/dressing.nvim) in this picture so your UI might look different!

</details>

<details>
<summary>telescope (emojis)</summary

[![telescope.png](https://s9.gifyu.com/images/SFndw.png)](https://gifyu.com/image/SFndw)

</details>

<details>
<summary>cmp (emojis)</summary

[![cmp.png](https://s9.gifyu.com/images/SFnd3.png)](https://gifyu.com/image/SFnd3)

</details>

## 🔧 Installation

With [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "xiaoyaoo11/emoji.nvim",
  version = "1.0.0", -- optionally pin to a tag
  ft = "markdown", -- adjust to your needs
  dependencies = {
    -- util for handling paths
    "nvim-lua/plenary.nvim",
    -- optional for nvim-cmp integration
    "hrsh7th/nvim-cmp",
    -- optional for telescope integration
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    -- default is false, also needed for blink.cmp integration!
    enable_cmp_integration = true,
    -- optional if your plugin installation directory
    -- is not vim.fn.stdpath("data") .. "/lazy/
    plugin_path = vim.fn.expand("$HOME/plugins/"),
  },
  config = function(_, opts)
    require("emoji").setup(opts)
  end,
}
```

For nvim-cmp integration add `emoji` to your list of sources:

```lua
local sources = {
  { name = "emoji" },
}
```

For telescope integration load the extension via:

```lua
require("telescope").load_extension("emoji")
```

## 💻 Use

### Emojis

1. `:Emoji` and `:Emoji insert` respective `lua require("emoji").insert()` or `:Emoji by-group` respective `lua require("emoji").insert_by_group()` allows you to select an emoji that is inserted at your cursor's current position.
2. `:Telescope emoji` does the same but invokes Telescope instead of `vim.ui.select`. (if telescope.nvim is installed and the extension loaded).
3. While in insert mode typing `:` triggers the auto-completion of nvim-cmp. (if nvim-cmp integration is enabled and configured).

You can also create key bindings to your liking.

Auto-completion in command mode is supported.

## 💡 Similar plugins and inspiration

- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji)
- [nerdy.nvim](https://github.com/2KAbhishek/nerdy.nvim)
- [nerdicons.nvim](https://github.com/nvimdev/nerdicons.nvim)
- [telescope-emoji](https://github.com/xiyaowong/telescope-emoji.nvim)
- [emoji_picker-nvim](https://github.com/WilsonOh/emoji_picker-nvim)
- [telescope-symbols](https://github.com/nvim-telescope/telescope-symbols.nvim)

## ♥️ Credits

Thanks to ([emojis-api.com](https://emoji-api.com/) for providing its emoji API that is used in GitHub Actions to automatically update emojis.

