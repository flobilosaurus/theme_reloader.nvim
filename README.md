# theme reloader
<p align="center">
<img src="./assets/theme_reloader_icon.png" style="max-height: 10em"/>
</p>
Plugin to toggle the colorscheme in all currently opened Neovim instances from everywhere.

https://github.com/flobilosaurus/theme_reloader.nvim/assets/36076146/4506af0e-2093-4702-b9d8-b221e9941a5b

---
## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{ "flobilosaurus/theme_reloader.nvim" }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use { "flobilosaurus/theme_reloader.nvim" }
```

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug "flobilosaurus/theme_reloader.nvim"
```

## Options

```lua
require("theme_reloader").setup({
  light = "catppuccin-latte",
  dark = "catppuccin-mocha"
})
```

Make sure the used themes are available before `theme_reloader` plugin setup is run.

---

## How to toggle themes

theme_reloader plugin watches the file `~/.config/nvim/theme` for content changes. 

A basic way to toggle the colorscheme from terminal:

```bash
echo "light" > ~/.config/nvim/theme
```

To toggle the colorscheme automatically based on daylight, you can use crontabs:

```bash
0 18 * * * echo "dark" > ~/.config/nvim/theme
0 8 * * * echo "light" > ~/.config/nvim/theme
```


As `theme_reloader` just watches for file changes, you are completely flexible to use different tools in combination with it...

---

## Credits

This plugin is inspired by: https://felix-kling.de/blog/2021/linux-toggle-dark-mode.html#neovim
