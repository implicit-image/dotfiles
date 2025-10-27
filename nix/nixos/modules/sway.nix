{ config, pkgs }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    xwayland.enable = true;
    extraOptions = [
    ];
    extraPackages = with pkgs; [
      i3status
      i3status-rust
      rofi
      wofi
    ]
  };
}
