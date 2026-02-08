{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git.overrideAttrs (final: prev: {
      configureFlags = prev.configureFlags ++ [ "--with-cairo=yes" "--with-x-toolkit=gtk3"  "--with-pgtk=no" "--with-tree-sitter=yes" "--with-libotf" "--with-xtf"];
      buildInputs = (with pkgs; [ gtk3 libgccjit]) ++ prev.buildInputs;
      src = builtins.fetchGit {
        url = "https://github.com/emacs-mirror/emacs";
        rev = "ec5479f0b5a9622be9a0f7eb923c7ea738fe8b4a";
        ref = "master";
      };
    });
    extraPackages = (epkgs: (with epkgs; [
      lsp-bridge
      treesit-grammars.with-all-grammars
      (melpaBuild {
        ename = "reader";
        pname = "emacs-reader";
        version = "20250630";
        src = pkgs.fetchFromGitea {
          domain = "codeberg.org";
          owner = "divyaranjan";
          repo = "emacs-reader";
          rev = "9d62d26fe4ae63e5cecf57bc399b20f7feefb620"; # replace with 'tag' for stable
          hash = "sha256-hkRa52PYfBG090jior3GPOeZyftwmpr2Q7jPKFHsR88=";
        };
        files = ''(:defaults "render-core.so")'';
        nativeBuildInputs = [ pkgs.pkg-config ];
        buildInputs = with pkgs; [ gcc mupdf gnumake pkg-config gtk3 ];
        preBuild = "make clean all";
      })
    ]));
  };
  xdg.desktopEntries = {
    "emacs-pdf" = {
      name = "Emacs pdf";
      genericName = "PDF Reader";
      exec = "emacsclient -c %U";
      terminal = false;
      categories = [ "Application" ];
      mimeType = [ "application/pdf" ];
    };
  };
  home.packages = with pkgs; [
    # formatters
    cljfmt
    lha
    unar
    _7zz
    gnuplot
    # djvu utils
    djvulibre
    # spellcheckers
    hunspell
    hunspellDicts.pl-pl
    hunspellDicts.en_US
    hunspellDicts.el_GR
  ];
}
