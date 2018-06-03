(add-hook 'ruby-mode-hook 'my-ruby-hook)

(defun my-ruby-hook ()
  (setq ruby-insert-encoding-magic-comment nil)
  (flycheck-mode 1)
  (setq flycheck-command-wrapper-function
        (lambda (command)
          (append '("bundle" "exec") command)))

  (helm-dash-activate-docset "Ruby")
  (helm-dash-activate-docset "Ruby on Rails")
  (local-set-key "\C-c\C-f" 'rspec-run-test-file)
  (local-set-key "\C-c\C-t" 'rspec-run-test-at-point)
  (local-set-key "\r" 'newline-and-indent)
  (subword-mode 1))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'robe-mode)
