{ config, pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
  };
}
