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
      vi = "nvim";
      gac = "git add . && git commit -m 'ok' && git push";
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
    gcc
    rofi
    opencode
    yazi
    psmisc
    antigravity-ide
    antigravity-cli
    onlyoffice-desktopeditors
    htop
    imagemagick
    vscode
    github-cli
    thunar
    wayfreeze
    grim
    slurp
    satty
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
