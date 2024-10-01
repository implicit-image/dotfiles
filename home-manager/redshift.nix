{ config, lib, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    latitude = 20.0;
    longitude = 50.0;
    dawnTime = "7:00-7:45";
    duskTime = "19:00-20:00";
    tray = true;
    temperature = {
      day = 6000;
      night = 3300;
    };
    settings = {
      redshift = {
        adjustment-method = "randr";
      };
    };
  };
}
