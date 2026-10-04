{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mango-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";
  console.keyMap = "br-abnt2";

  services.xserver.xkb = {
    layout = "br";
    variant = "abnt2";
  };

  services.getty.autologinUser = "tfsr";

  users.users.tfsr = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.shells = with pkgs; [
    zsh
  ];

  programs.google-chrome.enable = true;
  programs.mango.enable = true;
  programs.xwayland.enable = true;
  programs.zsh.enable = true;
  programs.bash.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    vim
    wget

    # Terminais
    foot
    ghostty

    # Wayland / desktop
    waybar
    swaybg
    swaylock
    swayimg
    xrdb
    xdg-desktop-portal-wlr

    # Clipboard
    wl-clip-persist
    wl-clipboard
    cliphist

    # Áudio / idle
    sway-audio-idle-inhibit

    # Input method
    fcitx5

    # Git
    git
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
