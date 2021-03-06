(defun my-js2-mode-hook ()
  (require 'flycheck)
  (require 'yasnippet)
  (require 'company)
  (require 'prettier-js)

  (setq prettier-js-args '("--single-quote=true"))
  (interactive)
  ;; (flycheck-select-checker 'javascript-eslint)
  ;; (flycheck-mode 1)
  (helm-dash-activate-docset "Javascript")
  (helm-dash-activate-docset "NodeJS")
  (helm-dash-activate-docset "React")
  (company-mode-on)
  ;; (flyspell-prog-mode)
  (setq-local indent-tabs-mode nil) ;; tab indent inserts spaces
  (show-paren-mode 1) ;; highlight matching parens
  (subword-mode) ;; to make camelCase into 2 'words' instead of 1
  (hl-line-mode)
  (yas-minor-mode-on)
  (setq mode-name "JS")
  (setq js2-basic-offset 2)
  (setq js2-highlight-level 3)
  (setq js2-include-node-externs t)
  (setq js2-indent-switch-body t)
  (setq js2-pretty-multiline-declarations t)
  (setq js2-basic-offset 2)
  (setq js2-strict-inconsistent-return-warning nil))

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(add-hook 'js2-init-hook
          (lambda ()
            (add-to-list 'js2-additional-externs "$")
            (add-to-list 'js2-additional-externs "jQuery")
            (add-to-list 'js2-additional-externs "__dirname")
            (add-to-list 'js2-additional-externs "require")
            (add-to-list 'js2-additional-externs "test")
            (add-to-list 'js2-additional-externs "exports")
            (add-to-list 'js2-additional-externs "module")
            (add-to-list 'js2-additional-externs "expect")
            (add-to-list 'js2-additional-externs "describe")
            (add-to-list 'js2-additional-externs "it")
            (add-to-list 'js2-additional-externs "beforeEach")
            (add-to-list 'js2-additional-externs "_")
            (add-to-list 'js2-additional-externs "inject")
            (add-to-list 'js2-additional-externs "$injector")
            (add-to-list 'js2-additional-externs "spyOn")
            (add-to-list 'js2-additional-externs "jasmine")
            (add-to-list 'js2-additional-externs "mixpanel")
            (add-to-list 'js2-additional-externs "chrome")
            (add-to-list 'js2-additional-externs "angular")))

(defun my-js-mode-hook ()
  (interactive)
  ;; (flycheck-select-checker 'javascript-eslint)
  ;; (flycheck-mode 1)
  (company-mode-on)
  ;; (flyspell-prog-mode)
  (setq-local indent-tabs-mode nil) ;; tab indent inserts spaces
  (show-paren-mode 1) ;; highlight matching parens
  (subword-mode) ;; to make camelCase into 2 'words' instead of 1
  (hl-line-mode)
  (yas-minor-mode-on)
  (setq mode-name "JS")
  (setq js-indent-level 2))
(add-hook 'js-mode-hook 'my-js-mode-hook)


