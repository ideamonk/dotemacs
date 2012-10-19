(setq user-full-name "Abhishek Mishra")
(setq user-mail-address "ideamonk@gmail.com")
(set-default-font "Menlo-12")

;; modeline changes
(set-face-background 'modeline          "#472a43")
(set-face-foreground 'modeline-inactive          "#777777")

(desktop-save-mode 1)

(set-face-background 'default "#161718")

;; fix the PATH variable, source -  http://goo.gl/qeLnC
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))
;; (if window-system (set-exec-path-from-shell-PATH))

;; enable user and host specific configs
(load (concat user-emacs-directory system-name ".el"))
