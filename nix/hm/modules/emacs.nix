{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git.overrideAttrs (final: prev: {
      configureFlags = prev.configureFlags ++ [ "--with-cairo=no" "--with-x-toolkit=gtk3"  "--with-pgtk=no" "--with-tree-sitter=yes" ];
      buildInputs = (with pkgs; [ gtk3 libgccjit]) ++ prev.buildInputs;
    });

    #   # configureFlags = (builtins.filter
    #   #   (option: !(option == "--with-cairo"))
    #   #   prev.configureFlags) ++ [ "--with-x-toolkit=gtk3" "--with-xwidgets=yes" ];
    #   src = builtins.fetchGit {
    #     url = "https://github.com/emacs-mirror/emacs";
    #     rev = "42dab7e7855348abf2665acabddf737c3aec5de6";
    #     ref = "master";
    #   };
    #   buildInputs = with pkgs; [
    #     gtk3
    #     (webkitgtk_6_0.overrideAttrs (final: prev: {
    #       version = "2.41.90";
    #       src = fetchurl {
    #         url = "https://webkitgtk.org/releases/webkitgtk-2.41.90.tar.xz";
    #         hash = "sha256-0frBmcORsOq8X58OK5DeTbOhSFtAKEhHsYD8apVjT+k=";
    #       };
    #       # buildInputs = with pkgs; [ pcre2 libxdmcp ];
    #       buildInputs = (with pkgs; [ gtk3 pcre2 xorg.libXdmcp libgcrypt libgpg-error libsysprof-capture harfbuzzFull libepoxy libwpe libwpe-fdo xorg.libXt openjpeg libunicode ]) ++ prev.buildInputs;
    #     }))
    #   ];
    # });
    # package.emacs-git;
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
    # djvu utils
    djvulibre
    # spellcheckers
    hunspell
    hunspellDicts.pl-pl
    hunspellDicts.en_US
    hunspellDicts.el_GR
  ];
}
