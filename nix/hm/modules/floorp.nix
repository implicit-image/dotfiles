{ config, pkgs, ... }:
{
  programs.floorp = {
    enable = true;
    languagePacks = [ "en-US" "pl"];
    profiles = {
      "std" = {
        userChrome = builtins.readFile "${config.home.sessionVariables.DOTFILES}/firefox/userChrome.css";
        # parse user.js options
        settings = builtins.listToAttrs (
          builtins.map
            (line: let
              option = builtins.match
                "^user_pref\\(\"(.+)\", (,+)\\)"
                (if (builtins.isList line)
                then (if (builtins.length line > 0) then builtins.head line else "")
                else line);
            in
              if (builtins.isList option && (builtins.length option >= 3)) then
              {
                name = builtins.elemAt option 1;
                value = builtins.elemAt option 2;
              }
              else { name = ""; value = ""; })
              (builtins.split "\n" (builtins.readFile "${config.home.sessionVariables.DOTFILES}/firefox/user.js"))
        );
      };
    };
  };
}
