{ config, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--allow-running-insecure-content"
      "--no-default-browser-check"
    ];
  };
}
