(setq default-frame-alist '(
                (width . 270)
                (height . 73) ))

;; bookmarks location
(setq bookmark-default-file "~/.emacs.d/.bookmarks.amal")

;; save place in files between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.saved-places.amal")

