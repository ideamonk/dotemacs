(setq default-frame-alist '(
               (width . 201)
               (height . 60) ))

;; bookmarks location
(setq bookmark-default-file "~/.emacs.d/.bookmarks.ideamonk")

;; save place in files between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.saved-places.amal")

