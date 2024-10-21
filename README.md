<img src="./logo.png" alt="Clipbard Logo" width="100" height="100" align="right" />

# 📋 Clipbard.nvim

Clipbard is a minimal Neovim plugin that enhances your clipboard experience by automatically synchronizing (n)vim's internal registers with your system clipboard. TJ pointed me to :help after I did this, oh well. :) At least I have a better understanding of the plugins now?

## ✨ Features

- 🔄 Automatically copies yanked text to system clipboard
- 🎯 Works with `y`, `d`, `c`, and `x` operations
- ⚙️ Preserves Vim's existing editing capabilities
- 🚀 Lightweight and performant

## 🎯 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)


```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'admica/clipbard.nvim',
  config = function() require('clipbard').setup() end
}
```

## ⚙️ Configuration

Clipbard works out of the box with no additional configuration. However, if you want to customize its behavior, you can pass options to the setup function:

```lua
require('clipbard').setup({
  -- Options here, coming soon™
})
```

## 📖 Usage

Once installed and set up, Clipbard will automatically enhance your clipboard experience. Use Vim as you normally would, and enjoy the seamless integration with your system clipboard!

- `y` (yank) and yy
- `d` (delete)
- `c` (change)
- `x` (delete character)

All these operations will now also copy the affected text to your system clipboard.

## 🤝 Contributing

Contributions are welcome! Feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 💖 Support

If you find this plugin useful, please consider starring the repository on GitHub. It helps others discover the project and motivates further development.

---

Made with ❤️ by admica
