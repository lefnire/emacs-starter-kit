;;; --------- Tip of the Day ---------------- ;;;
(require 'cl)
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
