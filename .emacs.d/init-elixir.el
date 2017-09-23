(eval-after-load
    "elixir-mode"
  (progn
    (defun my-elixir-mode-hook ()
      (subword-mode 1)
      (add-hook 'elixir-mode-hook 'my-elixir-mode-hook))))
