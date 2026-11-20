# Osi's dotfiles

My Arch Linux desktop: [Hyprland](https://hyprland.org) on top of
[HyDE](https://github.com/HyDE-Project/HyDE). This repo holds only what I've written or changed
on top of HyDE (keybindings, window rules, my waybar layout and its "island", hyprlock, kitty,
starship, zsh and fastfetch), plus the small scripts those configs call. Everything else, and all
the theming, comes from HyDE itself.

## Use it

1. Install Arch, then [HyDE](https://github.com/HyDE-Project/HyDE).
2. `git clone https://github.com/OsirumijiIhude/dotfiles ~/dotfiles && ~/dotfiles/install`
3. Log out and back in.

`install` links each file into place (anything already there is kept as `<name>.before-dotfiles`).

## Keep it up to date

`./sync` copies the files listed in `FILES` from the system into the repo and shows what changed.
To track another file, add its path to `FILES`.

## Credit and licence

Built on HyDE by the HyDE Project, and like HyDE, licensed under the GNU GPL v3 (see `LICENSE`).
Files that started as HyDE's own are HyDE's work with my changes.
