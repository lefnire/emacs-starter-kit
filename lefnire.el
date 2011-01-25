;;; Fix junk characters in shell mode
(add-hook 'shell-mode-hook
         'ansi-color-for-comint-mode-on)

;;; Don't automatically create ~ files
(setq make-backup-files nil)

(global-font-lock-mode 1)
(setq warning-suppress-types nil)

;;; --------- Egg ---------------- ;;;
;(add-to-list 'load-path (concat user-specific-dir "/egg"))
;(require 'egg)

;;; --------- Macros ---------------- ;;;
(fset 'ocdevel-add-subtask
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote (" [%]MOC" 0 "%d")) arg)))
(global-set-key "\C-x\C-k1" 'ocdevel-add-subtask)

;;; --------- Emacs Custom Variables ---------------- ;;;
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-auto-activate nil)
 '(ecb-layout-name "left7")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-source-path (quote ("/FILES/workspace/goingon/drupal" "~/mybash" ("/" "/"))))
 '(ecb-tree-indent 1)
 '(egg-buffer-hide-sub-blocks-on-start (quote (egg-file-log-buffer-mode egg-diff-buffer-mode)))
 '(egg-enable-tooltip t)
 '(mumamo-chunk-coloring 2))
