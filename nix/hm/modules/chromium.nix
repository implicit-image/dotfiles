{ config, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    # defaultSearchProviderEnabled = true;
    # defaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
    commandLineArgs = [
      "--allow-running-insecure-content"
      "--no-default-browser-check"
    ];
  };
}
