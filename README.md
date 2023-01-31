# Neovim

### Depends

```
brew install neovim;
brew install rg;  # ripgrep
brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font; # Nerd Font
```

### LSP

#### Python

*Depends*

```
npm install -g pyright; # global
poetry add --group lsp 'python-lsp-server[all]'; # local
poetry add --group lsp pylsp-mypy; # local
```

*pyproject.toml*

```
[tool.pylsp-mypy]
enabled = true
live_mode = true
strict = false
```
