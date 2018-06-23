(defun my-web-mode-hook ()
  (require 'prettier-js)
  (setq prettier-js-args '("--single-quote=true"))
  (interactive)
  (setq-local indent-tabs-mode nil) ;; tab indent inserts spaces
  (show-paren-mode 1) ;; highlight matching parens
  (subword-mode) ;; to make camelCase into 2 'words' instead of 1
  (hl-line-mode))
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'my-web-mode-hook)
