

(use-package zig-mode)

(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))
(autoload 'zig-mode "zig-mode" nil t)

(provide 'implicit-zig)
