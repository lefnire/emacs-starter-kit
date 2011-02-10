; ########  Misc.  ########
; #########################
(require 'cl)

;;; Basic configs
(setq scroll-step 1)
(global-hl-line-mode 1)

;; Show lines & columns
(line-number-mode 1)
(column-number-mode 1)

;;; w3m web browser
;(require 'w3m-load)

;;; Fix junk characters in shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; Don't automatically create ~ files
(setq make-backup-files nil)

;;; Geben
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

;;; Goto Last Change
(require 'goto-last-change)
(global-set-key "\C-x\C-\\" 'goto-last-change)

;;; Todochiku
;(require 'todochiku)

(global-font-lock-mode 1)
(setq warning-suppress-types nil)

; ########  Macros  ########
; ##########################
(fset 'ocdevel-add-subtask
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote (" [%]MOC" 0 "%d")) arg)))
(global-set-key "\C-x\C-k1" 'ocdevel-add-subtask)

; ########  Project Managment  ########
; #####################################
; NOTE: emacs 23.2+ has CEDET, removed the cedet-loading lines
;;; ECB
(add-to-list 'load-path (concat user-specific-dir "/ecb"))
(require 'ecb) ;; load everything at startup
;(require 'ecb-autoloads) ;; if too slow, load everything dynamically
(ecb-activate)

; ########  PHP ###########
; #########################
(load (concat user-specific-dir "/nxhtml/autostart.el"))
(define-derived-mode drupal-mode php-mode "Drupal"
  "Major mode for Drupal coding.\n\n\\{drupal-mode-map}"
  (setq c-basic-offset 2)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq show-trailing-whitespace t)
;  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-close 'c-lineup-arglist-operators)
  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
  (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
  (run-hooks 'drupal-mode-hook)
)
(provide 'drupal-mode)

(add-to-list 'auto-mode-alist '("\\.php$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.test$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

; ########  Yasnippet ###########
; ###############################
(add-to-list 'load-path (concat user-specific-dir "/yasnippet"))
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat user-specific-dir "/yasnippet/snippets"))


; ########  Speed Bar  ########
; #############################
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

; ########  Anything  ########
; ############################
;(add-to-list 'load-path (concat user-specific-dir "/anything"))
;(require 'anything-config)
;;Note that if you don't require
;;anything-match-plugin, you can enable/disable it afterward with M-x anything-c-toggle-match-plugin
;;(require 'anything-match-plugin)

; ########  Version Control  ##########
; #####################################
;(add-to-list 'load-path (concat user-specific-dir "/egg"))
;(require 'egg)



; ########  Org Mode  ########
; ############################
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
;; Make sure this is NOT "index.org", it will override
;; ~/MobileOrg/index.org maybe obvious to some, but tripped
;; me up at for a long time
(setq org-agenda-files (quote ("~/org/main.org")))
(setq org-mobile-files (quote (org-agenda-files "~/org/main.org")))

; ########  Tip of the Day  ########
; ##################################
(defun totd ()
 (interactive)
 (with-output-to-temp-buffer "*Tip of the day*"
   (let* ((commands (loop for s being the symbols
                         when (commandp s) collect s))
         (command (nth (random (length commands)) commands)))
    (princ
     (concat "Your tip for the day is:\n========================\n\n"
             (describe-function command)
             "\n\nInvoke with:\n\n"
             (with-temp-buffer
               (where-is command t)
               (buffer-string)))))))
(totd)

; ########  Custom Variables  ########
; ####################################
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
