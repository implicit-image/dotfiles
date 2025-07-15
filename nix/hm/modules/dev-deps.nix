{ config, pkgs, ... }:
{

  home.packages =
    let
      nixos-pkgs = with pkgs; [
        ripgrep
        # generic gnu stuff
        tree-sitter
        lsp-ai
        gcc
        cmake
        gnumake
        libtool
        file
        devenv
        # language servers
        nixd
        nixdoc
        ccls
        typescript-language-server
        jdt-language-server
        lua-language-server
        yaml-language-server
        bash-language-server
        astro-language-server
        kotlin-language-server
        svelte-language-server
        haskell-language-server
        vscode-langservers-extracted
        basedpyright
        # emace helpers
        emacs-lsp-booster
        nodejs
        yarn
        zellij
        # haskell
        ghc
        # haskellPackages.ghcup
        stack
        # rust
        rustc
        rust-code-analysis
        rust-analyzer
        rustfmt
        cargo
        # code
        ast-grep
        pnpm
        # d
        dmd
        vlang
      ];
      python-pkgs = with pkgs.python312Packages; [
        uv
        pip
        jedi-language-server
        numpy
        epc
        orjson
        sexpdata
        six
        setuptools
        paramiko
        rapidfuzz
        watchdog
        packaging
      ];
      cloud-pkgs = with pkgs; [
        azure-cli
      ];
      llm-pkgs = with pkgs; [
        aider-chat
      ];
    in
      nixos-pkgs
      ++ cloud-pkgs
      ++ llm-pkgs
      ++ python-pkgs;

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    lazygit = {
      enable = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    zed-editor = {
      enable = true;
      extensions = [
        "activitywatch"
        "ada"
        "amber"
        "asciidoc"
        "assembly"
        "astro"
        "autocorrect"
        "awk"
        "basedpyright"
        "gruber-darker"
        "bend"
        "brainfuck"
        "c3"
        "caddyfile"
        "cairo"
        "cargo-appraiser"
        "cargo-toml"
        "clojure"
        "cobol"
        "code-stats"
        "csv"
        "d"
        "dart"
        "docker-compose"
        "nix"
        "idris2"
      ];
      userKeymaps = [
        {
          context = "Workspace";
          bindings = {
            ctrl-shift-t = "workspace::NewTerminal";
          };
        }
      ];
      userSettings = {
        auto_install_extensions = true;
        autosave = "off";
        restore_on_startup = "last_workspace";
        features = {
          copilot = true;
        };
        telemetry = {
          metrics = false;
        };
        vim_mode = true;
        ui_font_size = 16;
        buffer_font_size = 16;
      };
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.asdf/shims/"
  ];
}
