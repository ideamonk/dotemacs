;; TODO: organize into modules

(require 'package)
(add-to-list 'package-archives
                          '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-ruby starter-kit-bindings starter-kit-js
                                  scss-mode
                                  color-theme
                                  color-theme-solarized
                                  zencoding-mode 
                                  markdown-mode
                                  rvm
                                  clojure-mode
                                  nrepl
                                  )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; fix the PATH variable, source -  http://goo.gl/qeLnC
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))

;; keep buffers from last session
(desktop-save-mode 1)

;; Frame managements: resizing 'windows' (i.e., inside the frame) // flicked from http://goo.gl/V8ZVM
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; quick eval-buffer
(global-set-key (kbd "S-C-<return>") 'eval-buffer)

;; hack for html5 tags to zencoding
(defun add-html5-tags ()
  "Adds a few html5 tags to zencoding-mode"
  (defvar zencoding-inline-tags 
    (append zencoding-inline-tags 
          '( "header" "nav" "section" "article" "aside" "footer" ))))

(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
(add-hook 'zencoding-mode-hook 'add-html5-tags)

;; font
(set-frame-font "Menlo-12")

;; line-height close to sublime text 2
(setq-default line-spacing 1)

;; take ruby from rvm
(rvm-use-default)

;; make compass imports available
;; (setq scss-sass-options '("--compass" "-r susy"))
;; 
;; ^ since this isn't generic enough, I'd like to keep a compass watch
;; running elsewhere, scss-mode is quite good for scss+compass-only
;; projects then.

;; actually I just need to disable auto compilation
(setq scss-compile-at-save nil)

;; allow undo on layout/frame/window changes
(winner-mode)

;; misc third-party styff
(add-to-list 'load-path (concat "~/.emacs.d/misc"))

;;; setup revive
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
;; bindings for doing it manually
(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)
;; lets get some sublime text 2 pleasures back
;; save config before quitting
(add-hook 'kill-emacs-hook 'save-current-configuration)
;; restore config once up
(resume)
;; WARN - always save config before evaling init.el

;; auto set markdown-mode for .md files
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; setup sentence highlight for markdown mode
;; (require 'sentence-highlight)
;; (add-hook 'markdown-mode-hook 'sentence-highlight-mode)
;; TODO: with color-theme-is-global , new frames can be setup with different
;; color schemes, a markdown could be hooked to open in a distraction 
;; free super-big window with a color-theme in which normal text
;; remains dim, while highlighted text appears bright, also perhaps
;; one could hack some margins and paddings in that frame to make it
;; more like iA Writer, perhaps fonts too, if possible

;; delete complete line on kill
(global-set-key (kbd "C-k") 'kill-whole-line)

;; use the real(tm) tomorrow theme, not the sanytyinc package
(require 'color-theme-tomorrow)
(color-theme-tomorrow-real 'night)

;; a bit darker, to ditto match our tomorrow-night theme in sublime text 2
(set-face-background 'default "#161718")

;; real Emacs hackers don't use the arrow keys -  http://goo.gl/mZTL2
(global-unset-key [up])
(global-unset-key [down])
(global-unset-key [left])
(global-unset-key [right])
;; use M-f and M-b instead
(global-unset-key [M-left])
(global-unset-key [M-right])
;; don't need mail
(global-unset-key (kbd "C-x m"))

;; org mode for org files
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook (lambda () (setq flyspell-mode nil)))

;; start server
(server-start)

