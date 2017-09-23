(require 'coffee-mode)
(defun my-coffee-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq coffee-tab-width 2)
  (subword-mode))

(add-hook 'coffee-mode-hook 'my-coffee-mode-hook)
