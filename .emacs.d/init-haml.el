(eval-after-load
    "haml-mode"
  (progn
    (defun my-haml-mode-hook ()
      (setq indent-tabs-mode nil)
      (setq haml-indent-offset 2)
      (define-key haml-mode-map "\C-m" 'newline-and-indent))
    (add-hook 'haml-mode-hook 'my-haml-mode-hook)))
