{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    tree-sitter

    #LSP
    lua-language-server
    stylua
    nil
    nixfmt
    pyright
    gopls
    typescript-language-server
    vscode-langservers-extracted
    bash-language-server
    intelephense
    vue-language-server
    tailwindcss-language-server

    # Formatters / linters
    prettier
    black
    isort
    shfmt
    shellcheck
    eslint_d

    #Languages
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
