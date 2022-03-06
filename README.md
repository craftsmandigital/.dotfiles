# .dotfiles

1. Clone this repository
2. Run `bash <(curl -s https://raw.githubusercontent.com/craftsmandigital/.dotfiles/master/install.sh)`
3. Open up new window to initiate `zsh` shell

### Current issues

- installing `nvim` plugins in `--headless` causes error output, but doesn't break installation
- Would like to improve the install script
- Handle installation on different OS (MacOS, Linux, WSL2)

### This must be done after instalation
```zsh
# some mega hacks to get language servers to work in lvim. NPM is installed in this schript above
npm list -g @tailwindcss/language-server &> /dev/null
if [ $? -ne 0 ]; then
  nvm install 16
  npm install -g @tailwindcss/language-server
  npm install -g emmet-ls
fi
```
### Future optimizations

- Improve install script by automating step 3 above, initializing the `zsh` environment
