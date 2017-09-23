(require 'css-mode)

(defun my-css-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq css-indent-offset 2)
  (subword-mode))

(add-hook 'css-mode-hook 'my-css-mode-hook)
