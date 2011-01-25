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
;; Make sure this is NOT "index.org", it will override
;; ~/MobileOrg/index.org maybe obvious to some, but tripped
;; me up at for a long time
(setq org-agenda-files (quote ("~/org/main.org")))
(setq org-mobile-files (quote (org-agenda-files "~/org/main.org")))
