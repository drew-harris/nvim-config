# Drews Vim Config

Based off of
[Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python
and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I
recommend a node manager like [fnm](https://github.com/Schniz/fnm).

### Upgrade to latest release

## Mac Key Repeat Command

`defaults write -g KeyRepeat -int 1.6`

- Default is 2

addming more
add for pr test
