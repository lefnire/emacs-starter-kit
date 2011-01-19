;;; --------- Misc ---------------- ;;;

;;; Fix junk characters in shell mode
(add-hook 'shell-mode-hook
         'ansi-color-for-comint-mode-on)

;;; Don't automatically create ~ files
(setq make-backup-files nil)

;;; Geben
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(global-font-lock-mode 1)
(setq warning-suppress-types nil)

;;; --------- Egg ---------------- ;;;
(add-to-list 'load-path (concat user-specific-dir "/egg"))
(require 'egg)

;;; --------- Tip of the Day ---------------- ;;;
; (require 'cl)
; (defun totd ()
;  (interactive)
;  (with-output-to-temp-buffer "*Tip of the day*"
;    (let* ((commands (loop for s being the symbols
;                          when (commandp s) collect s))
;          (command (nth (random (length commands)) commands)))
;     (princ
;      (concat "Your tip for the day is:\n========================\n\n"
;              (describe-function command)
;              "\n\nInvoke with:\n\n"
;              (with-temp-buffer
;                (where-is command t)
;                (buffer-string)))))))
; (totd)


;;; --------- Org Mode ---------------- ;;;
(setq load-path (cons (concat user-specific-dir "/org-mode/lisp") load-path))
(setq load-path (cons (concat user-specific-dir "/org-mode/contrib/lisp") load-path))
(require 'org-install)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;;Custom
(setq org-todo-keywords '((sequence "TODO" "WAITING" "|" "DONE")))

;;; MobileOrg
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files (quote ("~/org/main.org")))
(setq org-mobile-files (quote (org-agenda-files "~/org/main.org")))

;;; --------- ECB ---------------- ;;;

;;; CEDET
(load-file (concat user-specific-dir "/cedet/common/cedet.el"))
(global-ede-mode 1)                      ; Enable the Project management system
(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)
;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;;; ECB
(add-to-list 'load-path (concat user-specific-dir "/ecb"))
(require 'ecb) ;; load everything at startup
;(require 'ecb-autoloads) ;; if too slow, load everything dynamically

;;; --------- Macros ---------------- ;;;
(fset 'ocdevel-add-subtask
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote (" [%]MOC" 0 "%d")) arg)))
(global-set-key "\C-x\C-k1" 'ocdevel-add-subtask)


;;; --------- Don't Touch ---------------- ;;;
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
