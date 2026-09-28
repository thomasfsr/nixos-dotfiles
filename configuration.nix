{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mango-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  # Teclado brasileiro ABNT2 no console
  console.keyMap = "br-abnt2";

  # Teclado brasileiro ABNT2 no ambiente gráfico
  services.xserver.xkb = {
    layout = "br";
    variant = "abnt2";
  };

  services.getty.autologinUser = "tfsr";

  users.users.tfsr = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    foot
    ghostty
    waybar
    git
    swaybg
    swayimg
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";
}
