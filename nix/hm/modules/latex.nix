{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic mylatexformat
      dvisvgm dvipng wrapfig amsmath ulem hyperref capt-of preview xcolor pgf tikz-network;
  });
in
{
  home.packages = with pkgs; [
    tex
    jupyter
  ];
}
