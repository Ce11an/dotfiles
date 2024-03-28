# dotfiles

Configuration for my dotfiles for MacOs.

## Requirements

Ensure that you have the following installed on your system.

## HomeBrew

Install [Homebrew](https://brew.sh)

### Git

```posh
brew install git
```

### Installation

First, clone this repo in your `$HOME` directory using Git.

```posh
git clone git@github.com:Ce11an/dotfiles.git
```

and install homebrew packages:

```posh
brew bundle install --file=~/dotfiles/.config/.desktop/Brewfile
```

---

A slim version for development can be installed with:

```posh
brew bundle install --file=~/dotfiles/.config/.developer/Brewfile
```

---

finally, run:

```posh
cd dotfiles
```

and

```posh
stow .
```

## Credits

- [Dreams of Autonomy](https://youtu.be/y6XCebnB9gs?si=DBYB0mw6psBMK4Xn)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [brew-bundle-brewfile-tips.md](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f#)

