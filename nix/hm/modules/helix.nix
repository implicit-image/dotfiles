{ config, pkgs, lib, ... }:
{

  home.sessionVariables.EDITOR = lib.mkDefault "hx";


  home.file = {
    "helix-config" = {
      target = "${config.xdg.configHome}/helix/config.toml";
      source = "${config.home.sessionVariables.DOTFILES}/helix/config.toml";
    };
    "helix-themes" = {
      recursive = true;
      target = "${config.xdg.configHome}/helix/themes";
      source = "${config.home.sessionVariables.DOTFILES}/helix/themes";
    };
    "helix-lang" = {
      target = "${config.xdg.configHome}/helix/languages.toml";
      source = "${config.home.sessionVariables.DOTFILES}/helix/languages.toml";
    };
  };

  programs.helix = {
    enable = true;
    # extraPackages = [
    #   steel.packages."${pkgs.system}".steel
    # ];
    # languages = {
    #   language = [
    #     {
    #       name = "c";
    #       language-servers = [ "ccls" ];
    #     }
    #     {
    #       name = "nwscript";
    #       scope = "source.nwscript";
    #       file-types = ["nss"];
    #       indent = {
    #         tab-width = 4;
    #         unit = "    ";
    #       };
    #       comment-tokens = "//";
    #       block-comment-tokens = {
    #         start = "/*";
    #         end = "*/";
    #       };
    #       # manually linking queries required for now
    #       grammar = "c";
    #     }
    #     {
    #       name = "2da";
    #       scope = "text.2da";
    #       file-types = ["2da" "2DA"];
    #       soft-wrap = {
    #         enable = false;
    #       };
    #       grammar = "tsv";
    #     }
    #     {
    #       name = "csv";
    #       scope = "text.csv";
    #       file-types = ["csv"];
    #       grammar = "csv";
    #     }
    #   ];
    #   language-server = {
    #     ccls = {
    #       command = "ccls";
    #     };
    #     lsp-ai = {
    #       command = "lsp-ai";
    #     };
    #   };
    #   grammar = [
    #     {
    #       name = "csv";
    #       source = {
    #         git = "https://github.com/tree-sitter-grammars/tree-sitter-csv";
    #         rev = "7eb7297823605392d2bbcc4c09b1cd18d6fa9529";
    #         subpath = "csv/";
    #       };
    #     }
    #     {
    #       name = "tsv";
    #       source = {
    #         git = "https://github.com/tree-sitter-grammars/tree-sitter-csv";
    #         rev = "7eb7297823605392d2bbcc4c09b1cd18d6fa9529";
    #         subpath = "tsv/";
    #       };
    #     }
    #     {
    #       name = "psv";
    #       source = {
    #         git = "https://github.com/tree-sitter-grammars/tree-sitter-csv";
    #         rev = "7eb7297823605392d2bbcc4c09b1cd18d6fa9529";
    #         subpath = "psv/";
    #       };
    #     }
    #     {
    #       name = "nwscript";
    #       source = {
    #         git = "https://github.com/stuart/tree-sitter-nwscript";
    #         rev = "8a1cc0898cc8e9f0f7b2728fe6f3ba78ef613eb1";
    #       };
    #     }
    #   ];
    # };
    # settings = {
    #   theme = "custom-gruber-darker";
    #   keys = let
    #     #helper functions
    #     # hx-bind
    #     #commands
    #     ## git commands
    #     git-status = ":sh git status | column";
    #     git-branches = ":sh git branch -l";
    #     # selection command
    #     # helix helpers
    #     # hx-sh-bind = {};
    #     # hx-keys = { bind-sets };
    #     hx-do = commands: (builtins.concatMap (cmd: lib.lists.flatten cmd) commands);
    #     hx = cmd: [ cmd ];
    #     hx1 = cmd: arg1: [ "${cmd} ${arg1}" ];
    #     hx2 = cmd: arg1: arg2: [ "${cmd} ${arg1} ${arg2}" ];
    #     hxn = cmd: args: [ "${cmd} ${builtins.concatStringsSep " " args}"];
    #     with-vsplit = buffer: commands: hx-do [
    #       (hx1 ":vsplit" buffer)
    #       commands
    #     ];
    #     with-hsplit = buffer: commands: hx-do [
    #       (hx1 ":hsplit" buffer)
    #       commands
    #     ];
    #     with-temp-vsplit = buffer: commands: hx-do [
    #       (hx1 ":vsplit" buffer)
    #       commands
    #       (hx "goto_previous_buffer")
    #     ];
    #     with-temp-hsplit = buffer: commands: hx-do [
    #       (hx1 ":hsplit" buffer)
    #       commands
    #       (hx "goto_previous_buffer")
    #     ];
    #     cd-open-dir = dir: hx-do [
    #       (hx ":cd ${dir}")
    #       (hx ":open ${dir}")
    #     ];
    #     # temp buffer stuff
    #     update-buffer-from-shell = sh-updater: hx-do [
    #       clear-buffer
    #       (hx1 ":insert-output" sh-updater)
    #     ];
    #     # buffer content mannip
    #     clear-buffer = hx-do [
    #       (hx "select_all")
    #       (hx "delete_selection")
    #     ];
    #     indent-buffer = hx-do [
    #       (hx "select_all")
    #       (hx "indent")
    #     ];
    #     deindent-buffer = hx-do [
    #       (hx "select_all")
    #       (hx "unindent")
    #     ];
    #     # git
    #     open-git-buffer = hx-do [
    #       (with-vsplit "git" [
    #         (update-buffer-from-shell "git status")
    #         git-init-hook
    #       ])
    #     ];
    #     git-pipe-file-at-point = command: hx-do [
    #       (hx "goto_line_end")
    #       (hx "move_prev_long_word_start")
    #       (hx "extend_to_line_end")
    #       (hx1 ":pipe-to" command)
    #     ];
    #     git-init-hook = hx-do [
    #       (hx ":lang bash")
    #     ];
    #     git-finish-cmd-hook = hx-do [
    #       (update-buffer-from-shell "git status")
    #     ];
    #     git-stage-modified = hx-do [
    #       (hx-sh "git add .")
    #       git-finish-cmd-hook
    #     ];
    #     git-stage-file-at-point = hx-do [
    #       (hx-sh "git add")
    #     ];
    #     # command wrappers
    #     hx-sh = hx1 ":sh";
    #     ## formatting commands
    #     indent-line = ["extend_to_line_bounds" "indent"];
    #     select-word-at-point = [ "select_mode" "move_next_word_end" "move_prev_word_start"];
    #     select-long-word-at-point = [ "select_mode" "move_next_long_word_end" "extend_prev_long_word_start"];
    #     local-search-thing-at-point = hx-do [
    #       select-long-word-at-point
    #       (hx "search_selection")
    #       (hx "normal_mode")
    #       (hx "search")
    #     ];
    #     global-search-thing-at-point = hx-do [
    #       select-long-word-at-point
    #       (hx "search_selection")
    #       (hx "normal_mode")
    #       (hx "global_search")
    #     ];

#       in {
    #     #MODE: normal
    #     normal = {
    #       "G" = hx "goto_last_line";
    #       "`" = hx "select_register";
    #       #MAP: goto
    #       g = {
    #         c = hx "toggle_comments";
    #       };
    #       #MAP: leader keys
    #       space = {
    #       # testing
    #         "`" = ":buffer-previous";
    #         ":" = "command_mode";
    #         "." = "file_picker_in_current_buffer_directory";
    #         "*" = global-search-thing-at-point;
    #         space = "file_picker";
    #         b = {
    #           r = ":reload";
    #           R = ":reload-all";
    #           b = "buffer_picker";
    #         };
    #         f = {
    #           o = {
    #             p = cd-open-dir "${config.home.sessionVariables.PROJECTS}";
    #             r = cd-open-dir "${config.home.sessionVariables.REPOS}";
    #             P = cd-open-dir "${config.home.sessionVariables.PROGRAMMING}"                ;
    #           };
    #           c = {
    #             l = ":log-open";
    #             c = ":config-open";
    #             r = ":config-reload";
    #           };
    #         };
    #         q = {
    #           "a" = ":quit-all";
    #           "A" = ":quit-all!";
    #           "w" = ":write-quit-all";
    #           "W" = ":write-quit-all!";
    #         };
    #         #MAP: insert
    #         i = {
    #           "!" = "shell_insert_output";
    #           d = ":insert-output date +%d/%m/%Y";
    #         };
    #         #MAP: git
    #         g = {
    #           a = hx-sh "git add .";
    #           s = git-status;
    #           b = git-branches;
    #           g = open-git-buffer;
    #           x = (hx1 ":buffer-close" "git");
    #         };
    #         t = {
    #           w = ":toggle soft-wrap.enable";
    #           a = ":toggle auto-completion";
    #           i = ":toggle lsp.display-inlay-hints";
    #           l = ":toggle lsp.enable";
    #           h = ":toggle lsp.auto-signature-help";
    #           d = ":toggle lsp.display-signature-help-docs";
    #           f = ":toggle auto-format";
    #           b = ":toggle bufferline always never";
    #         };
    #         # notes
    #         n = {
    #           r = {
    #             f = ":open ~/org/roam";
    #           };
    #         };
    #       };
    #       "A-x" = hx "command_mode";
    #       "C-r" = hx "redo";
    #       K = hx "hover";
    #       #MAP: C-x
    #       "C-x" = {
    #         k = hx ":buffer-close";
    #         K = hx ":buffer-close!";
    #         tab = hx "indent";
    #         "S-tab" = hx "unindent";
    #       };
    #       # fast navigation
    #       "C-k" = hx "jump_view_up";
    #       "C-j" = hx "jump_view_down";
    #       "C-h" = hx "jump_view_left";
    #       "C-l" = hx "jump_view_right";
    #       #TODO: figure out how to write macros in nix config
    #       # reindent the file
    #       "=" = hx "format_selections";
    #       "V" = hx-do [
    #         (hx"extend_to_line_bounds")
    #         (hx "select_mode")
    #       ];
    #     };
    #     #MODE: insert
    #     insert = {
    #       #MAP: leader
    #       "A-space" = {
    #         "." = hx ":open";
    #         space = hx "file_picker";
    #         q = hx ":quit";
    #         #MAP: insert
    #         i = {
    #           "!" = hx "shell_insert_output";
    #           r = hx "insert_register";
    #         };
    #       };
    #       "A-x" = hx "command_mode";
    #       "C-space" = hx "completion";
    #       "C-r" = hx "redo";
    #       "C-\"" = hx "insert_register";
    #       #MAP: C-x
    #       "C-x" = {
    #         k = hx ":buffer-close";
    #         K = hx ":buffer-close!";
    #       };
    #     };
    #     #MODE: select
    #     select = {
    #       "A-x" = hx "command_mode";
    #       "tab" = hx "indent";
    #       "S-tab" = hx "unindent";
    #       "G" = hx "goto_last_line";
    #       g = {
    #         c = hx "toggle_comments";
    #       };
    #     };
    #   };
    #   editor = {
    #     color-modes = true;
    #     line-number = "relative";
    #     cursorline = true;
    #     gutters = {
    #       layout = [ "diagnostics" "spacer" "diff" "line-numbers" "spacer"];
    #       line-numbers.min-width = 2;
    #     };
    #     popup-border = "all";
    #     statusline = {
    #       left = [ "mode" "selections" "file-name" "position" ];
    #       right = [ "diagnostics" "file-encoding" "file-type" "version-control" ];
    #       separator = " ";
    #       mode.normal = "<N>";
    #       mode.insert = "<I>";
    #       mode.select = "<S>";
    #     };
    #     lsp = {
    #       display-inlay-hints = true;
    #       display-signature-help-docs = true;
    #       auto-signature-help = true;
    #     };
    #     cursor-shape = {
    #       normal = "block";
    #       insert = "bar";
    #       select = "underline";
    #     };
    #     file-picker = {
    #       hidden = true;
    #       git-ignore = true;
    #       ignore = true;
    #       parents = true;
    #     };
    #     whitespace = {
    #       render = {
    #         space = "all";
    #         tab = "all";
    #       };
    #       characters = {
    #         space = "·";
    #         tab = ">";
    #         tabpad = "·";
    #       };
    #     };
    #     indent-guides = {
    #       render = false;
    #     };
    #     soft-wrap = {
    #       enable = true;
    #     };
    #     smart-tab = {
    #       enable = true;
    #     };
    #   };
    # };
    # package = helix.packages."${pkgs.system}".helix;
    package = pkgs.helix;
    # themes = {
    #   custom-gruber-darker =
    #     let
    #       fg0 =      "#e4e4ef";
    #       fg1 =      "#f4f4ff";
    #       fg2 =      "#f5f5f5";
    #       fg3 =      "#a89984";
    #       bg0 =      "#181818";
    #       bg1 =      "#282828";
    #       bg2 =      "#453d41";
    #       bg4 =      "#52494e";
    #       bg5 =      "#454545";
    #       bg6 =      "#282828";
    #       bg7 =      "#3f3f3f";
    #       bg8 =      "#2c2c2c";
    #       red0 =     "#f43841";
    #       red1 =     "#ff4f58";
    #       red2 =     "#2B0A0B";
    #       red3 =     "#fb4934";
    #       green0 =   "#73c936";
    #       green1 =   "#b8bb26";
    #       yellow0 =  "#ffdd33";
    #       yellow1 =  "#655814";
    #       blue0 =    "#5292c8";
    #       orange0 =  "#d65d0e";
    #       orange1 =  "#fe8019";
    #       brown0 =   "#cc8c3c";
    #       quartz =   "#95a99f";
    #       niagara0 = "#96a6c8";
    #       niagara1 = "#303540";
    #       wisteria = "#9e95c7";
    #       aqua1 =    "#8ec07c";
    #       grey = "#858583";
    #       teal = "#81a2be";
    #     in {
    #       attribute = fg0;
    #       keyword = {
    #         fg = yellow0;
    #         modifiers = [ "bold" "italic" ];
    #       };
    #       "keyword.directive" = {
    #           fg = yellow0;
    #       };
    #       namespace = quartz;
    #       punctuation = {
    #         fg = fg0;
    #       };
    #       "punctuation.delimiter" = {
    #           fg = fg1;
    #       };
    #       "punctuation.bracket" = {
    #           fg = teal;
    #       };
    #       "punctuation.special"= {
    #           fg = fg3;
    #       };
    #       operator = {
    #         fg = fg1;
    #         modifiers = [ "italic" ];
    #       };
    #       special = {
    #         fg = yellow0;
    #         modifiers = ["bold"];
    #       };
    #       variable = {
    #         fg = fg0;
    #       };
    #       "variable.builtin "= {
    #           fg = yellow0;
    #           modifiers = [ "bold"];
    #       };
    #       type = {
    #         fg = quartz;
    #       };
    #       function = {
    #         fg = niagara0;
    #       };
    #       "function.builtin "= {
    #           fg = yellow0;
    #       };
    #       "function.method "= {
    #           fg = blue0;
    #       };
    #       "function.macro" = {
    #           fg = yellow0;
    #       };
    #       tag = quartz;
    #       comment = {
    #         fg = grey;
    #         modifiers = [ "italic" ];
    #       };
    #       "comment.block.documentation" = {
    #         bg = bg2;
    #       };
    #       "constant.builtin" = {
    #         fg = yellow0;
    #         modifiers = ["bold"];
    #       };
    #       "constant.character" = {
    #         fg = green0;
    #       };
    #       "constant.character.escape" = {
    #         fg = yellow0;
    #       };
    #       "constant.numeric" = {
    #         modifiers = [ "italic" ];
    #       };
    #       string = {
    #         fg = green0;
    #         modifiers = [ "italic" ];
    #       };
    #       "string.regexp"= {
    #         fg = yellow0;
    #       };
    #       "string.special.path" = {
    #         fg = green0;
    #       };
    #       "string.special.url" = {
    #         fg = green0;
    #       };
    #       label = fg0;
    #       module = aqua1;
    #       "diff.plus.gutter" = {
    #         fg = green1;
    #       };
    #       "diff.minus.gutter" = {
    #         fg = red1;
    #       };
    #       "diff.delta.gutter" = {
    #         fg = yellow0;
    #       };
    #       warning = {
    #         fg = orange1;
    #         modifiers = ["bold"];
    #       };
    #       error = {
    #         fg = red0;
    #         modifiers = ["bold"];
    #       };
    #       info = {
    #         fg = aqua1;
    #         modifiers = ["bold"];
    #       };
    #       hint = {
    #         fg = blue0;
    #         modifiers = ["bold"];
    #       };
    #       "ui.background" = {
    #         bg = bg0;
    #       };
    #       "ui.linenr" = {
    #         fg = bg4;
    #       };
    #       "ui.linenr.selected" = {
    #         fg = yellow0;
    #       };
    #       "ui.cursorline" = {
    #         bg = bg1;
    #       };
    #       "ui.statusline" = {
    #         fg = fg0;
    #         bg = bg1;
    #       };
    #       "ui.statusline.normal" = {
    #         fg = bg1;
    #         bg = yellow0;
    #         modifiers = ["bold"];
    #       };
    #       "ui.statusline.insert" = {
    #         fg = bg1;
    #         bg = blue0;
    #         modifiers = ["bold"];
    #       };
    #       "ui.statusline.select" = {
    #         fg = bg1;
    #         bg = wisteria;
    #         modifiers = ["bold"];
    #       };
    #       "ui.statusline.inactive" = {
    #         fg = fg3;
    #         bg = bg1;
    #       };
    #       "ui.bufferline" = {
    #         fg = fg3;
    #         bg = bg6;
    #       };
    #       "ui.bufferline.active" = {
    #         fg = fg0;
    #         bg = bg7;
    #       };
    #       "ui.popup" = {
    #         bg = bg1;
    #       };
    #       "ui.popup.info" = {
    #         bg = bg1;
    #       };
    #       "ui.window" = {
    #         fg = bg1;
    #       };
    #       "ui.help" = {
    #         bg = bg1;
    #         fg = fg0;
    #       };
    #       "ui.text" = {
    #         fg = fg0;
    #       };
    #       "ui.text.focus" = {
    #         bg = bg4;
    #       };
    #       "ui.selection" = {
    #         bg = bg2;
    #         modifiers = [ "reversed" ];
    #       };
    #       "ui.selection.primary" = {
    #         bg = bg5;
    #       };
    #       "ui.cursor.primary" = {
    #         bg = fg0;
    #         fg = niagara1;
    #       };
    #       "ui.cursor.match" = {
    #         bg = red1;
    #         modifiers = [ "bold" "rapid_blink" ];
    #       };
    #       "ui.menu" = {
    #         fg = fg0;
    #         bg = bg6;
    #       };
    #       "ui.menu.selected" = {
    #         fg = fg0;
    #         bg = bg5;
    #         modifiers = ["bold"];
    #       };
    #       "ui.virtual.whitespace" = {
    #         fg = bg5;
    #       };
    #       "ui.virtual.indent-guide" = {
    #         fg = bg5;
    #       };
    #       "ui.virtual.ruler" = {
    #         bg = bg1;
    #         fg = bg5;
    #       };
    #       "ui.virtual.wrap" = bg2;
    #       "ui.virtual.jump-label" = {
    #         bg = bg5;
    #         fg = blue0;
    #         modifiers = [ "bold" "slow_blink" ];
    #       };
    #       "ui.virtual.inlay-hint" = {
    #         fg = grey;
    #         modifiers = [ "dim" ];
    #       };
    #       "ui.virtual.inlay-hint.type" = {
    #         fg = quartz;
    #       };
    #       "ui.virtual.inlay-hint.parameter" = {
    #         fg = grey;
    #       };
    #       "ui.highlight" = {
    #         bg = bg2;
    #       };
    #       "diagnostic.unnecessary" = {
    #         modifiers = ["dim"];
    #       };
    #       "diagnostic.deprecated" = {
    #         fg = orange0;
    #         modifiers = ["crossed_out" "dim"];
    #       };
    #       "diagnostic.hint" = {
    #         underline = {
    #           color = blue0;
    #           style = "dashed";
    #         };
    #       };
    #       "diagnostic.info" = {
    #           underline = {
    #             color = green1;
    #             style = "dashed";
    #           };
    #       };
    #       "diagnostic.warning" = {
    #         underline = {
    #           color = orange1;
    #           style = "dashed";
    #         };
    #       };
    #       "diagnostic.error" = {
    #           fg = red0;
    #           modifiers = [ "crossed_out" ];
    #       };
    #       "markup.heading" = {
    #         modifiers = [ "bold" "italic" ];
    #       };
    #       "markup.heading.marker" = {
    #         fg = aqua1;
    #       };
    #       "markup.heading.1" = {
    #         fg = teal;
    #       };
    #       "markup.heading.2" = {
    #         fg = niagara0;
    #       };
    #       "markup.heading.3" = {
    #         fg = quartz;
    #       };
    #       "markup.heading.4" = {
    #         fg = grey;
    #       };
    #       "markup.heading.5" = {
    #         fg = wisteria;
    #       };
    #       "markup.heading.6" = {
    #         fg = aqua1;
    #       };
    #       "markup.list.unnumbered" = {
    #         fg = fg2;
          # };#
    #       "markup.list.numbered" = {
    #         fg = quartz;
    #       };
    #       "markup.list.checked" = {
    #         modifiers = [ "dim" ];
    #       };
    #       "markup.list.unchecked" = {
    #         modifiers = [ "bold" ];
    #       };
    #       "markup.bold" = {
    #         modifiers = [ "bold" ];
    #       };
    #       "markup.italic" = {
    #         modifiers = [ " italic" ];
    #       };
    #       "markup.strikethrough" = {
    #         modifiers = [ "crossed_out" ];
    #       };
    #       "markup.link.url" = {
    #         fg = green1;
    #         modifiers = [ "dim" ];
    #       };
    #       "markup.link.text" = {
    #         fg = aqua1;
    #       };
    #       "markup.link.label" = {
    #         fg = fg1;
    #       };
    #       "markup.quote" = {
    #         bg = bg8;
    #       };
    #       "markup.raw.inline" = {
    #         bg = bg1;
    #       };
    #       "markup.raw.block" = {
    #         bg = bg1;
    #       };
    #    };
    # };
  };
}
