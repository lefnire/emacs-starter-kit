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
