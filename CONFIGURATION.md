## Nvim configuration

## How to install

- Install last nvim release
- Clone this repo in the neovim config folder should be `~/.config/nvim/`
- Install Alacritty Terminal
- Install Nerd Font (Symbols Nerd Font Mono)
- Install any monospaced font ("Consolas", "FiraCode", or else)
- Install fontconfig to make a virtual font 
- Install [ripgrep](https://github.com/BurntSushi/ripgrep)

## Make a virtual font for icons

```bash
touch ~/.config/fontconfig/fonts.conf
```

Inside the file copy this configuration (in this example we are using the "Consolas" font)
```xml fonts.conf
<fontconfig>
  <match target="font">
    <edit name="autohint" mode="assign">
      <bool>true</bool>
    </edit>
  </match>
  <alias>
    <family>Consolas</family>
    <prefer>
      <family>Symbols Nerd Font Mono</family>
      <family>Consolas</family>
    </prefer>
  </alias>
</fontconfig>
```
## Configure font for alacritty 

After the creation of the patched font is very easy to configure the terminal in order to use the font

```bash
touch ~/.config/alacritty/alacritty.toml
```

In the file configure the font that you previously used in the fonts.conf (for example Consolas)
```alacritty.toml
[font.normal]
family = "Consolas"
style = "Regular"
```

## Install some fundamental node packages to work in js/ts envs

NOTE : It's assumed that node/nvm is installed in order to install the following packages
```bash
npm i -g prettier eslint eslint_d
```

