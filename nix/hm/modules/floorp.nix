{ config, pkgs, ... }:
{
  programs.floorp = {
    enable = true;
    languagePacks = [ "en-US" "pl"];
    profiles = {
      "std" = {
        userChrome = builtins.readFile "${config.home.sessionVariables.DOTFILES}/firefox/userChrome.css";
        # parse user.js options
        settings = builtins.listToAttr (
          builtins.map
            (line: let
              option = builtins.match "^user_pref\\(\"(.+)\", (,+)\\)" line;
            in
              if (builtins.isList option && (builtins.length option >= 3)) then
              {
                name = builtins.elemAt option 1;
                value = builtins.elemAt option 2;
              }
              else null)
            (builtins.filter
              (builtins.split "\n" (builtins.readFile "${config.home.sessionVariables.DOTFILES}/firefox/user.js")))
        );
      };
    };
  };
}
