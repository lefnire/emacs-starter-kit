;;; --------- Speed Bar ---------------- ;;;
(require 'sr-speedbar)
(setq sr-speedbar-width 40)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "C-M-]") 'sr-speedbar-toggle)
(speedbar-add-supported-extension ".php") ; not necessarily required
(speedbar-add-supported-extension ".module") ; not necessarily required
(speedbar-add-supported-extension ".inc") ; not necessarily required
(speedbar-add-supported-extension ".install") ; not necessarily required
(speedbar-add-supported-extension ".engine") ; not necessarily required
(speedbar-add-supported-extension ".tpl.php") ; not necessarily required
(speedbar-add-supported-extension ".test") ; not necessarily required
