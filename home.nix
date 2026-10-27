{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  symlink = config.lib.file.mkOutOfStoreSymlink;

  configs = {
    mango = "mango";
    nvim = "nvim";
    foot = "foot";
    waybar = "waybar";
    ghostty = "ghostty";
    yazi = "yazi";
    swaylock = "swaylock";
  };
in
{
  imports = [
    ./modules/development.nix
  ];
  home.username = "tfsr";
  home.homeDirectory = "/home/tfsr";
  home.stateVersion = "26.05";

  programs.zsh = {
    enable = true;

    shellAliases = {
      btw = "echo i use mango btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#mango-btw";
      nup = "cd ~/nixos-dotfiles && nix flake update && sudo nixos-rebuild switch --flake .#mango-btw";
      vi = "nvim";
      gitok = "git add . && git commit -m 'ok' && git push";
      ls = "eza --icons";
      ll = "eza -lah --icons";
      la = "eza -a --icons";
      lt = "eza --tree --level=2 --icons";
    };

    sessionVariables = {
      PATH = "$HOME/.config/herd-lite/bin:$PATH";
    };

    initContent = ''
      # Se estiver usando o zsh-vi-mode, ajuste para o método recomendado:
      # source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      if [[ -z "$WAYLAND_DISPLAY" && "$(tty)" == /dev/tty1 ]]; then
        exec mango
      fi
    '';
  };

  programs.git.enable = true;
  programs.starship.enable = true;

  home.packages = with pkgs; [
    # Development
    gcc
    git
    github-cli
    opencode
    antigravity-ide
    antigravity-cli
    vscode

    # Terminal utilities
    wget
    unzip
    psmisc
    htop
    imagemagick
    yazi
    eza
    jq
    lazygit
    yq-go
    strace
    lsof

    # Terminal emulators
    foot
    ghostty

    # Desktop applications
    onlyoffice-desktopeditors
    thunar
    rofi

    # Wayland
    waybar
    swaybg
    swayimg
    sway-audio-idle-inhibit
    wayfreeze
    dunst

    # Screenshots
    grim
    slurp
    satty

    # Clipboard
    wl-clipboard
    wl-clip-persist
    cliphist

    # Other utilities
    brightnessctl
    docker-compose
    xrdb

    # Audio / media
    pavucontrol
    playerctl

    # Security
    keepassxc
  ];
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = symlink "${dotfiles}/${subpath}";
  }) configs;

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Sans";
      size = 10;
    };
  };
}
