{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  security.pam.services.swaylock = { };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mango-btw";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 8000 ];

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
    extraGroups = [
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  virtualisation.docker.enable = true;

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
    swaylock-effects
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

    # Docker
    docker-compose

    unzip

    glib
  ];

  fonts = {
    packages = with pkgs; [
      inter
      noto-fonts
      openmoji-color
      nerd-fonts.jetbrains-mono
      nerd-fonts.terminess-ttf
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [
          "Inter"
          "Noto Sans"
        ];
        serif = [ "Noto Serif" ];
        monospace = [ "Terminess Nerd Font" ];
        emoji = [ "OpenMoji Color" ];
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  programs.dconf.enable = true;
  services.fwupd.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
