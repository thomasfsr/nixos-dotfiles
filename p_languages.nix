{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    tree-sitter

    lua-language-server
    nil
    nixpkgs-fmt # nix formatter

    nodejs
    bun
    python3
    uv
    go
    cargo
    zvm
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
