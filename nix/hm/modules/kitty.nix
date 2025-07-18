{ config, pkgs, lib, ... }:
{
  home.sessionVariables.TERM = lib.mkDefault "kitty";

  programs = {
    alacritty = {
      enable = true;
    };
    kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      settings = {
        font_family = (import ./user-vars.nix).UI_FONT_FAMILY;
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = 14;
        shell = "${config.home.sessionVariables.SHELL}";
      };
      # for term-keys
      extraConfig = "
# emacs Kitty Keyboard Protocol keys
map CTRL+GRAVE_ACCENT                                       send_text all \x1b\x1f\x2a\x62\x1f
map SHIFT+CTRL+GRAVE_ACCENT                                 send_text all \x1b\x1f\x2a\x63\x1f
map CTRL+ALT+GRAVE_ACCENT                                   send_text all \x1b\x1f\x2a\x66\x1f
map SHIFT+CTRL+ALT+GRAVE_ACCENT                             send_text all \x1b\x1f\x2a\x67\x1f
map CTRL+1                                                  send_text all \x1b\x1f\x2b\x42\x1f
map SHIFT+CTRL+1                                            send_text all \x1b\x1f\x2b\x43\x1f
map CTRL+ALT+1                                              send_text all \x1b\x1f\x2b\x46\x1f
map SHIFT+CTRL+ALT+1                                        send_text all \x1b\x1f\x2b\x47\x1f
map CTRL+2                                                  send_text all \x1b\x1f\x2c\x22\x1f
map SHIFT+CTRL+2                                            send_text all \x1b\x1f\x2c\x23\x1f
map CTRL+ALT+2                                              send_text all \x1b\x1f\x2c\x26\x1f
map SHIFT+CTRL+ALT+2                                        send_text all \x1b\x1f\x2c\x27\x1f
map CTRL+3                                                  send_text all \x1b\x1f\x2c\x62\x1f
map SHIFT+CTRL+3                                            send_text all \x1b\x1f\x2c\x63\x1f
map CTRL+ALT+3                                              send_text all \x1b\x1f\x2c\x66\x1f
map SHIFT+CTRL+ALT+3                                        send_text all \x1b\x1f\x2c\x67\x1f
map CTRL+4                                                  send_text all \x1b\x1f\x2d\x42\x1f
map SHIFT+CTRL+4                                            send_text all \x1b\x1f\x2d\x43\x1f
map CTRL+ALT+4                                              send_text all \x1b\x1f\x2d\x46\x1f
map SHIFT+CTRL+ALT+4                                        send_text all \x1b\x1f\x2d\x47\x1f
map CTRL+5                                                  send_text all \x1b\x1f\x2e\x22\x1f
map SHIFT+CTRL+5                                            send_text all \x1b\x1f\x2e\x23\x1f
map CTRL+ALT+5                                              send_text all \x1b\x1f\x2e\x26\x1f
map SHIFT+CTRL+ALT+5                                        send_text all \x1b\x1f\x2e\x27\x1f
map CTRL+6                                                  send_text all \x1b\x1f\x2e\x62\x1f
map SHIFT+CTRL+6                                            send_text all \x1b\x1f\x2e\x63\x1f
map CTRL+ALT+6                                              send_text all \x1b\x1f\x2e\x66\x1f
map SHIFT+CTRL+ALT+6                                        send_text all \x1b\x1f\x2e\x67\x1f
map CTRL+7                                                  send_text all \x1b\x1f\x2f\x42\x1f
map SHIFT+CTRL+7                                            send_text all \x1b\x1f\x2f\x43\x1f
map CTRL+ALT+7                                              send_text all \x1b\x1f\x2f\x46\x1f
map SHIFT+CTRL+ALT+7                                        send_text all \x1b\x1f\x2f\x47\x1f
map CTRL+8                                                  send_text all \x1b\x1f\x30\x22\x1f
map SHIFT+CTRL+8                                            send_text all \x1b\x1f\x30\x23\x1f
map CTRL+ALT+8                                              send_text all \x1b\x1f\x30\x26\x1f
map SHIFT+CTRL+ALT+8                                        send_text all \x1b\x1f\x30\x27\x1f
map CTRL+9                                                  send_text all \x1b\x1f\x30\x62\x1f
map SHIFT+CTRL+9                                            send_text all \x1b\x1f\x30\x63\x1f
map CTRL+ALT+9                                              send_text all \x1b\x1f\x30\x66\x1f
map SHIFT+CTRL+ALT+9                                        send_text all \x1b\x1f\x30\x67\x1f
map CTRL+0                                                  send_text all \x1b\x1f\x31\x42\x1f
map SHIFT+CTRL+0                                            send_text all \x1b\x1f\x31\x43\x1f
map CTRL+ALT+0                                              send_text all \x1b\x1f\x31\x46\x1f
map SHIFT+CTRL+ALT+0                                        send_text all \x1b\x1f\x31\x47\x1f
map CTRL+MINUS                                              send_text all \x1b\x1f\x32\x22\x1f
map SHIFT+CTRL+MINUS                                        send_text all \x1b\x1f\x32\x23\x1f
map CTRL+ALT+MINUS                                          send_text all \x1b\x1f\x32\x26\x1f
map SHIFT+CTRL+ALT+MINUS                                    send_text all \x1b\x1f\x32\x27\x1f
map CTRL+EQUAL                                              send_text all \x1b\x1f\x32\x62\x1f
map SHIFT+CTRL+EQUAL                                        send_text all \x1b\x1f\x32\x63\x1f
map CTRL+ALT+EQUAL                                          send_text all \x1b\x1f\x32\x66\x1f
map SHIFT+CTRL+ALT+EQUAL                                    send_text all \x1b\x1f\x32\x67\x1f
map SHIFT+BACKSPACE                                         send_text all \x1b\x1f\x33\x41\x1f
map CTRL+BACKSPACE                                          send_text all \x1b\x1f\x33\x42\x1f
map SHIFT+CTRL+BACKSPACE                                    send_text all \x1b\x1f\x33\x43\x1f
map SHIFT+ALT+BACKSPACE                                     send_text all \x1b\x1f\x33\x45\x1f
map CTRL+ALT+BACKSPACE                                      send_text all \x1b\x1f\x33\x46\x1f
map SHIFT+CTRL+ALT+BACKSPACE                                send_text all \x1b\x1f\x33\x47\x1f
map CTRL+TAB                                                send_text all \x1b\x1f\x34\x22\x1f
map SHIFT+CTRL+TAB                                          send_text all \x1b\x1f\x34\x23\x1f
map CTRL+ALT+TAB                                            send_text all \x1b\x1f\x34\x26\x1f
map SHIFT+CTRL+ALT+TAB                                      send_text all \x1b\x1f\x34\x27\x1f
map SHIFT+CTRL+Q                                            send_text all \x1b\x1f\x34\x63\x1f
map SHIFT+CTRL+ALT+Q                                        send_text all \x1b\x1f\x34\x67\x1f
map SHIFT+CTRL+W                                            send_text all \x1b\x1f\x35\x43\x1f
map SHIFT+CTRL+ALT+W                                        send_text all \x1b\x1f\x35\x47\x1f
map SHIFT+CTRL+E                                            send_text all \x1b\x1f\x36\x23\x1f
map SHIFT+CTRL+ALT+E                                        send_text all \x1b\x1f\x36\x27\x1f
map SHIFT+CTRL+R                                            send_text all \x1b\x1f\x36\x63\x1f
map SHIFT+CTRL+ALT+R                                        send_text all \x1b\x1f\x36\x67\x1f
map SHIFT+CTRL+T                                            send_text all \x1b\x1f\x37\x43\x1f
map SHIFT+CTRL+ALT+T                                        send_text all \x1b\x1f\x37\x47\x1f
map SHIFT+CTRL+Y                                            send_text all \x1b\x1f\x38\x23\x1f
map SHIFT+CTRL+ALT+Y                                        send_text all \x1b\x1f\x38\x27\x1f
map SHIFT+CTRL+U                                            send_text all \x1b\x1f\x38\x63\x1f
map SHIFT+CTRL+ALT+U                                        send_text all \x1b\x1f\x38\x67\x1f
map SHIFT+CTRL+I                                            send_text all \x1b\x1f\x39\x43\x1f
map SHIFT+CTRL+ALT+I                                        send_text all \x1b\x1f\x39\x47\x1f
map SHIFT+CTRL+O                                            send_text all \x1b\x1f\x3a\x23\x1f
map SHIFT+CTRL+ALT+O                                        send_text all \x1b\x1f\x3a\x27\x1f
map SHIFT+CTRL+P                                            send_text all \x1b\x1f\x3a\x63\x1f
map SHIFT+CTRL+ALT+P                                        send_text all \x1b\x1f\x3a\x67\x1f
map CTRL+LEFT_BRACKET                                       send_text all \x1b\x1f\x3b\x42\x1f
map SHIFT+CTRL+LEFT_BRACKET                                 send_text all \x1b\x1f\x3b\x43\x1f
map CTRL+ALT+LEFT_BRACKET                                   send_text all \x1b\x1f\x3b\x46\x1f
map SHIFT+CTRL+ALT+LEFT_BRACKET                             send_text all \x1b\x1f\x3b\x47\x1f
map CTRL+RIGHT_BRACKET                                      send_text all \x1b\x1f\x3c\x22\x1f
map SHIFT+CTRL+RIGHT_BRACKET                                send_text all \x1b\x1f\x3c\x23\x1f
map CTRL+ALT+RIGHT_BRACKET                                  send_text all \x1b\x1f\x3c\x26\x1f
map SHIFT+CTRL+ALT+RIGHT_BRACKET                            send_text all \x1b\x1f\x3c\x27\x1f
map SHIFT+ENTER                                             send_text all \x1b\x1f\x3c\x61\x1f
map CTRL+ENTER                                              send_text all \x1b\x1f\x3c\x62\x1f
map SHIFT+CTRL+ENTER                                        send_text all \x1b\x1f\x3c\x63\x1f
map SHIFT+ALT+ENTER                                         send_text all \x1b\x1f\x3c\x65\x1f
map CTRL+ALT+ENTER                                          send_text all \x1b\x1f\x3c\x66\x1f
map SHIFT+CTRL+ALT+ENTER                                    send_text all \x1b\x1f\x3c\x67\x1f
map SHIFT+CTRL+A                                            send_text all \x1b\x1f\x3e\x23\x1f
map SHIFT+CTRL+ALT+A                                        send_text all \x1b\x1f\x3e\x27\x1f
map SHIFT+CTRL+S                                            send_text all \x1b\x1f\x3e\x63\x1f
map SHIFT+CTRL+ALT+S                                        send_text all \x1b\x1f\x3e\x67\x1f
map SHIFT+CTRL+D                                            send_text all \x1b\x1f\x3f\x43\x1f
map SHIFT+CTRL+ALT+D                                        send_text all \x1b\x1f\x3f\x47\x1f
map SHIFT+CTRL+F                                            send_text all \x1b\x1f\x40\x23\x1f
map SHIFT+CTRL+ALT+F                                        send_text all \x1b\x1f\x40\x27\x1f
map SHIFT+CTRL+G                                            send_text all \x1b\x1f\x40\x63\x1f
map CTRL+ALT+G                                              send_text all \x1b\x1f\x40\x66\x1f
map SHIFT+CTRL+ALT+G                                        send_text all \x1b\x1f\x40\x67\x1f
map SHIFT+CTRL+H                                            send_text all \x1b\x1f\x41\x43\x1f
map SHIFT+CTRL+ALT+H                                        send_text all \x1b\x1f\x41\x47\x1f
map SHIFT+CTRL+J                                            send_text all \x1b\x1f\x42\x23\x1f
map SHIFT+CTRL+ALT+J                                        send_text all \x1b\x1f\x42\x27\x1f
map SHIFT+CTRL+K                                            send_text all \x1b\x1f\x42\x63\x1f
map SHIFT+CTRL+ALT+K                                        send_text all \x1b\x1f\x42\x67\x1f
map SHIFT+CTRL+L                                            send_text all \x1b\x1f\x43\x43\x1f
map SHIFT+CTRL+ALT+L                                        send_text all \x1b\x1f\x43\x47\x1f
map CTRL+SEMICOLON                                          send_text all \x1b\x1f\x44\x22\x1f
map SHIFT+CTRL+SEMICOLON                                    send_text all \x1b\x1f\x44\x23\x1f
map CTRL+ALT+SEMICOLON                                      send_text all \x1b\x1f\x44\x26\x1f
map SHIFT+CTRL+ALT+SEMICOLON                                send_text all \x1b\x1f\x44\x27\x1f
map CTRL+APOSTROPHE                                         send_text all \x1b\x1f\x44\x62\x1f
map SHIFT+CTRL+APOSTROPHE                                   send_text all \x1b\x1f\x44\x63\x1f
map CTRL+ALT+APOSTROPHE                                     send_text all \x1b\x1f\x44\x66\x1f
map SHIFT+CTRL+ALT+APOSTROPHE                               send_text all \x1b\x1f\x44\x67\x1f
map CTRL+BACKSLASH                                          send_text all \x1b\x1f\x46\x22\x1f
map SHIFT+CTRL+BACKSLASH                                    send_text all \x1b\x1f\x46\x23\x1f
map CTRL+ALT+BACKSLASH                                      send_text all \x1b\x1f\x46\x26\x1f
map SHIFT+CTRL+ALT+BACKSLASH                                send_text all \x1b\x1f\x46\x27\x1f
map SHIFT+CTRL+Z                                            send_text all \x1b\x1f\x46\x63\x1f
map SHIFT+CTRL+ALT+Z                                        send_text all \x1b\x1f\x46\x67\x1f
map SHIFT+CTRL+X                                            send_text all \x1b\x1f\x47\x43\x1f
map SHIFT+CTRL+ALT+X                                        send_text all \x1b\x1f\x47\x47\x1f
map SHIFT+CTRL+C                                            send_text all \x1b\x1f\x48\x23\x1f
map SHIFT+CTRL+ALT+C                                        send_text all \x1b\x1f\x48\x27\x1f
map SHIFT+CTRL+V                                            send_text all \x1b\x1f\x48\x63\x1f
map SHIFT+CTRL+ALT+V                                        send_text all \x1b\x1f\x48\x67\x1f
map SHIFT+CTRL+B                                            send_text all \x1b\x1f\x49\x43\x1f
map SHIFT+CTRL+ALT+B                                        send_text all \x1b\x1f\x49\x47\x1f
map SHIFT+CTRL+N                                            send_text all \x1b\x1f\x4a\x23\x1f
map SHIFT+CTRL+ALT+N                                        send_text all \x1b\x1f\x4a\x27\x1f
map SHIFT+CTRL+M                                            send_text all \x1b\x1f\x4a\x63\x1f
map SHIFT+CTRL+ALT+M                                        send_text all \x1b\x1f\x4a\x67\x1f
map CTRL+COMMA                                              send_text all \x1b\x1f\x4b\x42\x1f
map SHIFT+CTRL+COMMA                                        send_text all \x1b\x1f\x4b\x43\x1f
map CTRL+ALT+COMMA                                          send_text all \x1b\x1f\x4b\x46\x1f
map SHIFT+CTRL+ALT+COMMA                                    send_text all \x1b\x1f\x4b\x47\x1f
map CTRL+PERIOD                                             send_text all \x1b\x1f\x4c\x22\x1f
map SHIFT+CTRL+PERIOD                                       send_text all \x1b\x1f\x4c\x23\x1f
map CTRL+ALT+PERIOD                                         send_text all \x1b\x1f\x4c\x26\x1f
map SHIFT+CTRL+ALT+PERIOD                                   send_text all \x1b\x1f\x4c\x27\x1f
map CTRL+SLASH                                              send_text all \x1b\x1f\x4c\x62\x1f
map SHIFT+CTRL+SLASH                                        send_text all \x1b\x1f\x4c\x63\x1f
map CTRL+ALT+SLASH                                          send_text all \x1b\x1f\x4c\x66\x1f
map SHIFT+CTRL+ALT+SLASH                                    send_text all \x1b\x1f\x4c\x67\x1f
map CTRL+SPACE                                              send_text all \x1b\x1f\x50\x22\x1f
map SHIFT+CTRL+SPACE                                        send_text all \x1b\x1f\x50\x23\x1f
map CTRL+ALT+SPACE                                          send_text all \x1b\x1f\x50\x26\x1f
map SHIFT+CTRL+ALT+SPACE                                    send_text all \x1b\x1f\x50\x27\x1f
map MENU                                                    send_text all \x1b\x1f\x52\x20\x1f
map SHIFT+MENU                                              send_text all \x1b\x1f\x52\x21\x1f
map CTRL+MENU                                               send_text all \x1b\x1f\x52\x22\x1f
map SHIFT+CTRL+MENU                                         send_text all \x1b\x1f\x52\x23\x1f
map ALT+MENU                                                send_text all \x1b\x1f\x52\x24\x1f
map SHIFT+ALT+MENU                                          send_text all \x1b\x1f\x52\x25\x1f
map CTRL+ALT+MENU                                           send_text all \x1b\x1f\x52\x26\x1f
map SHIFT+CTRL+ALT+MENU                                     send_text all \x1b\x1f\x52\x27\x1f
map SHIFT+CTRL+UP                                           send_text all \x1b\x1f\x53\x43\x1f
map ALT+UP                                                  send_text all \x1b\x1f\x53\x44\x1f
map SHIFT+ALT+UP                                            send_text all \x1b\x1f\x53\x45\x1f
map CTRL+ALT+UP                                             send_text all \x1b\x1f\x53\x46\x1f
map SHIFT+CTRL+ALT+UP                                       send_text all \x1b\x1f\x53\x47\x1f
map SHIFT+CTRL+DOWN                                         send_text all \x1b\x1f\x54\x23\x1f
map ALT+DOWN                                                send_text all \x1b\x1f\x54\x24\x1f
map SHIFT+ALT+DOWN                                          send_text all \x1b\x1f\x54\x25\x1f
map CTRL+ALT+DOWN                                           send_text all \x1b\x1f\x54\x26\x1f
map SHIFT+CTRL+ALT+DOWN                                     send_text all \x1b\x1f\x54\x27\x1f
map SHIFT+CTRL+LEFT                                         send_text all \x1b\x1f\x54\x63\x1f
map ALT+LEFT                                                send_text all \x1b\x1f\x54\x64\x1f
map SHIFT+ALT+LEFT                                          send_text all \x1b\x1f\x54\x65\x1f
map CTRL+ALT+LEFT                                           send_text all \x1b\x1f\x54\x66\x1f
map SHIFT+CTRL+ALT+LEFT                                     send_text all \x1b\x1f\x54\x67\x1f
map SHIFT+CTRL+RIGHT                                        send_text all \x1b\x1f\x55\x43\x1f
map ALT+RIGHT                                               send_text all \x1b\x1f\x55\x44\x1f
map SHIFT+ALT+RIGHT                                         send_text all \x1b\x1f\x55\x45\x1f
map CTRL+ALT+RIGHT                                          send_text all \x1b\x1f\x55\x46\x1f
map SHIFT+CTRL+ALT+RIGHT                                    send_text all \x1b\x1f\x55\x47\x1f
map SHIFT+CTRL+HOME                                         send_text all \x1b\x1f\x57\x43\x1f
map ALT+HOME                                                send_text all \x1b\x1f\x57\x44\x1f
map SHIFT+ALT+HOME                                          send_text all \x1b\x1f\x57\x45\x1f
map CTRL+ALT+HOME                                           send_text all \x1b\x1f\x57\x46\x1f
map SHIFT+CTRL+ALT+HOME                                     send_text all \x1b\x1f\x57\x47\x1f
map SHIFT+CTRL+END                                          send_text all \x1b\x1f\x58\x23\x1f
map ALT+END                                                 send_text all \x1b\x1f\x58\x24\x1f
map SHIFT+ALT+END                                           send_text all \x1b\x1f\x58\x25\x1f
map CTRL+ALT+END                                            send_text all \x1b\x1f\x58\x26\x1f
map SHIFT+CTRL+ALT+END                                      send_text all \x1b\x1f\x58\x27\x1f
map SHIFT+PAGE_UP                                           send_text all \x1b\x1f\x58\x61\x1f
map SHIFT+CTRL+PAGE_UP                                      send_text all \x1b\x1f\x58\x63\x1f
map ALT+PAGE_UP                                             send_text all \x1b\x1f\x58\x64\x1f
map SHIFT+ALT+PAGE_UP                                       send_text all \x1b\x1f\x58\x65\x1f
map CTRL+ALT+PAGE_UP                                        send_text all \x1b\x1f\x58\x66\x1f
map SHIFT+CTRL+ALT+PAGE_UP                                  send_text all \x1b\x1f\x58\x67\x1f
map SHIFT+PAGE_DOWN                                         send_text all \x1b\x1f\x59\x41\x1f
map SHIFT+CTRL+PAGE_DOWN                                    send_text all \x1b\x1f\x59\x43\x1f
map ALT+PAGE_DOWN                                           send_text all \x1b\x1f\x59\x44\x1f
map SHIFT+ALT+PAGE_DOWN                                     send_text all \x1b\x1f\x59\x45\x1f
map CTRL+ALT+PAGE_DOWN                                      send_text all \x1b\x1f\x59\x46\x1f
map SHIFT+CTRL+ALT+PAGE_DOWN                                send_text all \x1b\x1f\x59\x47\x1f
";
    };
  };
}
