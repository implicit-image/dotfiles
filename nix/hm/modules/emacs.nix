{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git;
    extraPackages = (epkgs: (with epkgs; [
    treesit-grammars.with-all-grammars
    (melpaBuild {
      ename = "reader";
      pname = "emacs-reader";
      version = "20250630";
      src = fetchFromGitea {
        domain = "codeberg.org";
        owner = "divyaranjan";
        repo = "emacs-reader";
        rev = "2d95199bbb0f2c488f8d5d1ae8e9dc2de937f430"; # replace with 'tag' for stable
        hash = "sha256-hkRa52PYfBG090jior3GPOeZyftwmpr2Q7jPKFHsR88=";
      };
      files = ''(:defaults "render-core.so")'';
      nativeBuildInputs = [ pkg-config ];
      buildInputs = [ gcc mupdf gnumake pkg-config ];
      preBuild = "make clean all";
    })
    ]));
  }
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
    # spellcheckers
    hunspell
    hunspellDicts.pl-pl
    hunspellDicts.en_US
    hunspellDicts.el_GR
  ];
}
