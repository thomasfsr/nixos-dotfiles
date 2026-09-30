{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    mango = "mango";
    nvim = "nvim";
    foot = "foot";
    waybar = "waybar";
  };
in
{
  home.username = "tfsr";
  home.homeDirectory = "/home/tfsr";
  home.stateVersion = "25.05";
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use mango btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#mango-btw";
      vi = "nvim";
    };
  };
  programs.git.enable = true;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nixpkgs-fmt
    nodejs
    gcc
    rofi
  ];

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

}
