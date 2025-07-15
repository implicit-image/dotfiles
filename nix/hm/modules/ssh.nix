{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "~/.ssh/known_hosts";
    addKeysToAgent = "confirm";
    extraConfig="
    Host github.com
    IdentityFile ~/.ssh/git_key_ed25519
    ";
    package = pkgs.openssh;
  };

  services.ssh-agent = {
    enable = true;
  };
}
