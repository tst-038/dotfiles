# tst-038 NeoVim Template

> [!WARNING]
> This template is part of a larger dotfiles repository that includes my entire system configuration. However, if you’re only
> interested in setting up Neovim with my custom configuration, this guide will help you extract and apply just the
> Neovim-related files.

## 🌟 Overview

This NeoVim configuration is designed to provide a modern development environment with a focus on usability. It includes:

- AstroNvim v4+: A robust and feature-rich NeoVim configuration framework.
- Modular Setup: Easily customizable modules to tailor the editor to your needs.
- Enhanced Productivity: Built-in tools like LSP, auto-completion, Treesitter and more for most common languages.

## 🛠️ Installation

> [!NOTE]
> ⚠️ Prerequisites
>
> - NeoVim: Ensure you have NeoVim v0.10.0 or higher installed.
> - ChezMoi: Install chezmoi by following the [official guide](https://www.chezmoi.io/install/).
> - Git: You'll need Git to clone this repository.

### 1. 📦 Isolated Installation

Ideal if you want to try out this configuration without affecting your existing NeoVim setup, you can use the NVIM_APPNAME environment variable:

#### Clone the repository

```bash
git clone https://github.com/tst-038/dotfiles.git ~/tst-dotfiles
mkdir -p ~/.config/tst-nvim && \
cp -r ~/tst-dotfiles/dot_config/nvim ~/.config/tst-nvim && \
mv ~/.config/tst-nvim/nvim/* ~/.config/tst-nvim && \
rmdir ~/.config/tst-nvim/nvim
```

#### Remove unnecessary files (optional but recommended)

If you're not interested in keeping the rest of my dotfiles...

```bash
rm -rf ~/tst-dotfiles
```

#### Start NeoVim with a custom configuration

You're done! That was easy init?! Launch NeoVim with the following command!

```bash
NVIM_APPNAME=tst-nvim nvim
```

### 2. 🔧 Install / Override current configuration

> [!CAUTION]
> This will override your current NeoVim setup!

#### Make a backup of your current nvim and shared folder

> [!TIP]
> Highly recommended in case you change your mind and would like to revert to your old setup.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

> [!WARNING]
> Make sure you do you do not have a folder with important data called "tst-dotfiles" in the ~ directory,
> This will override those files, move them and keep them safe!

```bash
git clone https://github.com/tst-038/dotfiles ~/tst-dotfiles
mkdir -p ~/.config/nvim
cp -r ~/tst-dotfiles/dot_config/nvim ~/.config/nvim
```

#### Remove unnecessary files (optional but recommended)

> [!TIP]
> This is optional but highly recommended if you are only interested in my NeoVim dotfiles
> If you're not interested in keeping the rest of my dotfiles...

```bash
rm -rf ~/tst-dotfiles
```

#### Start Neovim

You're done! That was easy init?! Launch NeoVim just like you did before!

```bash
nvim
```
