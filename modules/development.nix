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
    uv
    go
    cargo
    zvm
    python3
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    sideloadInitLua = true;
  };
}
