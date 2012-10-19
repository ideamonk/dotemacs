(require 'zencoding-mode)

(add-hook 'sgml-mode-hook 'zencoding-mode)

(add-hook 'zencoding-mode-hook
          (lambda ()
            (defvar zencoding-inline-tags
              (append zencoding-inline-tags
                      '( "header" "nav" "section" "article" "aside" "footer" )))))
