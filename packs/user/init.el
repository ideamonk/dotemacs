(setq user-full-name "Abhishek Mishra")
(setq user-mail-address "ideamonk@gmail.com")
(set-default-font "Menlo-12")

;; modeline changes
(set-face-background 'modeline          "#472a43")
(set-face-foreground 'modeline-inactive          "#777777")

(desktop-save-mode 1)

(set-face-background 'default "#161718")

;; enable user and host specific configs
(load (concat user-emacs-directory system-name ".el"))
