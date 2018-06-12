(eval-after-load
    "elixir-mode"
  (progn
    (defun my-elixir-mode-hook ()
      (subword-mode 1)
      (local-set-key (kbd "C-c C-f") 'exunit-run-test-file)
      (local-set-key (kbd "C-c C-t") 'exunit-run-test-at-point)
      (add-hook 'before-save-hook 'elixir-format nil t))
    (add-hook 'elixir-mode-hook 'my-elixir-mode-hook)))
