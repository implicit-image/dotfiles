{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git.overrideAttrs (final: prev: {
      configureFlags = (builtins.filter
        (option: !(option == "--with-cairo"))
        prev.configureFlags) ++ [ "--with-xwidgets=yes" ];
    });
    extraPackages = (epkgs: (with epkgs; [
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
      buildInputs = with pkgs; [ gcc mupdf gnumake pkg-config ];
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
    # djvu utils
    djvulibre
    # spellcheckers
    hunspell
    hunspellDicts.pl-pl
    hunspellDicts.en_US
    hunspellDicts.el_GR
  ];
}
