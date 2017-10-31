(require 'coffee-mode)
(require 'company)
(require 'dired+)
(require 'expand-region)
(require 'flycheck)
(require 'gnus)
(require 'helm)
(require 'helm-config)
(require 'helm-dash)
(require 'helm-files)
(require 'iy-go-to-char)
(require 'js2-mode)
(require 'key-chord)
(require 'magit)
(require 'multiple-cursors)
(require 'nxml-mode)
(require 'org)
(require 'term)
(require 'web-mode)
(require 'dockerfile-mode)
(require 'move-text)
(require 'compile)

(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-x\m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-x k") (lambda () (interactive) (kill-buffer))) ;; no more asking which buffer!
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key (kbd "M-;") 'comment-eclipse)
(global-set-key (kbd "C-x C-d") 'duplicate-line)
(global-set-key "\C-co" 'switch-to-minibuffer)
(global-set-key (kbd "C-c m") 'magit-status)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(global-set-key (kbd "C-c C-o") 'occur)
(global-set-key (kbd "C-\\")
                (lambda ()
                  (interactive)
                  (just-one-space -1))) ;; that's C-\ (elisp string escaping), -1 kills newlines :)
(global-set-key (kbd "M-\\")
                (lambda ()
                  (interactive)
                  (just-one-space -1)
                  (delete-char -1)))
(global-set-key (kbd "C-a") 'back-to-indentation) ;; swap C-a and M-m (since we usually want beginning of indent
(global-set-key (kbd "M-m") 'move-beginning-of-line)
(global-set-key (kbd "C-?") 'help-command)
(define-key help-map (kbd "C-f") 'find-function)
(define-key help-map (kbd "C-v") 'find-variable)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key company-active-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "M-o") 'other-frame)
(global-set-key (kbd "C-x g") 'google-this)

(global-set-key (kbd "C-'") 'er/mark-outside-quotes)


(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-command-map (kbd "d") 'helm-dash-at-point)
(define-key helm-command-map (kbd "o") 'helm-occur)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-;") 'helm-mini)

(if (not (window-system))
    (progn
      (global-set-key (kbd "C-[ [ s;") 'helm-mini)
      (global-set-key (kbd "C-[ [ s'") 'er/mark-outside-quotes)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(define-key helm-find-files-map (kbd "C-h") 'helm-ff-delete-char-backward)

(define-key compilation-mode-map (kbd "C-M-e") 'compilation-display-error)
(define-key compilation-mode-map (kbd "C-o") 'other-window)

(define-key dired-mode-map (kbd "C-o") 'other-window)
(define-key gnus-summary-mode-map (kbd "C-o") 'other-window)
(define-key occur-mode-map (kbd "C-o") 'other-window)
(define-key term-mode-map (kbd "C-o") 'other-window)


(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-2") 'er/expand-region)

(key-chord-mode 1)

(global-set-key (kbd "C-M-j") 'iy-go-to-char)
(define-key java-mode-map (kbd "C-M-j") 'iy-go-to-char)
(key-chord-define js2-mode-map "jk" 'iy-go-to-char)
(key-chord-define js2-mode-map "df" 'iy-go-to-char-backward)

(define-key org-mode-map (kbd "M-h") 'backward-kill-word)

(define-key comint-mode-map (kbd "C-M-q") 'quit-window)
(define-key comint-mode-map (kbd "C-M-g") 'recompile)

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "C-<") 'goto-top-line)
(global-set-key (kbd "C->") 'goto-bottom-line)

(define-key js2-mode-map (kbd "C-c i") 'js-doc-insert-function-doc)
(define-key js2-mode-map (kbd "C-c n") 'js2-next-error)
(define-key js2-mode-map (kbd "C-c C-t") (lambda () (interactive) (nodeunit-run-test-at-point)))
(define-key js2-mode-map (kbd "C-c t") (lambda () (interactive) (nodeunit-run-test-at-point)))
(define-key js2-mode-map (kbd "C-c f") (lambda () (interactive) (nodeunit-run-test-file)))
(define-key js2-mode-map "@" 'js-doc-insert-tag)

(global-set-key (kbd "C-M-s") 'helm-swoop)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

(define-key gnus-summary-mode-map (kbd "C-o") 'other-window)

(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w t") 'toggle-window-split)

(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(define-key flycheck-mode-map (kbd "C-c l") flycheck-command-map)

(global-set-key (kbd "M-Y") 'yank-pop-forward)

(global-set-key (kbd "C-M-m") 'mc/mark-next-like-this)

(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-x\m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-x k") (lambda () (interactive) (kill-buffer))) ;; no more asking which buffer!
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key (kbd "M-;") 'comment-eclipse)
(global-set-key (kbd "C-x C-d") 'duplicate-line)
(global-set-key "\C-co" 'switch-to-minibuffer)
(global-set-key (kbd "C-c m") 'magit-status)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(global-set-key (kbd "C-c C-o") 'occur)
(global-set-key (kbd "C-\\")
                (lambda ()
                  (interactive)
                  (just-one-space -1))) ;; that's C-\ (elisp string escaping), -1 kills newlines :)
(global-set-key (kbd "M-\\")
                (lambda ()
                  (interactive)
                  (just-one-space -1)
                  (delete-char -1)))
(global-set-key (kbd "C-a") 'back-to-indentation) ;; swap C-a and M-m (since we usually want beginning of indent
(global-set-key (kbd "M-m") 'move-beginning-of-line)
(global-set-key (kbd "C-?") 'help-command)
(define-key help-map (kbd "C-f") 'find-function)
(define-key help-map (kbd "C-v") 'find-variable)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key company-active-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-x g") 'google-this)

(global-set-key (kbd "C-'") 'er/mark-outside-quotes)


(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-command-map (kbd "d") 'helm-dash-at-point)
(define-key helm-command-map (kbd "o") 'helm-occur)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-;") 'helm-mini)

(if (not (window-system))
    (progn
      (global-set-key (kbd "C-[ [ s;") 'helm-mini)
      (global-set-key (kbd "C-[ [ s'") 'er/mark-outside-quotes)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(define-key helm-find-files-map (kbd "C-h") 'helm-ff-delete-char-backward)

(define-key compilation-mode-map (kbd "C-M-e") 'compilation-display-error)
(define-key compilation-mode-map (kbd "C-o") 'other-window)

(define-key dired-mode-map (kbd "C-o") 'other-window)
(define-key gnus-summary-mode-map (kbd "C-o") 'other-window)
(define-key occur-mode-map (kbd "C-o") 'other-window)
(define-key term-mode-map (kbd "C-o") 'other-window)


(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-2") 'er/expand-region)

(key-chord-mode 1)

(global-set-key (kbd "C-M-j") 'iy-go-to-char)
(key-chord-define js2-mode-map "jk" 'iy-go-to-char)
(key-chord-define js2-mode-map "df" 'iy-go-to-char-backward)

(define-key org-mode-map (kbd "M-h") 'backward-kill-word)

(define-key comint-mode-map (kbd "C-M-q") 'quit-window)
(define-key comint-mode-map (kbd "C-M-g") 'recompile)

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "C-<") 'goto-top-line)
(global-set-key (kbd "C->") 'goto-bottom-line)

(define-key js2-mode-map (kbd "C-c i") 'js-doc-insert-function-doc)
(define-key js2-mode-map (kbd "C-c n") 'js2-next-error)
(define-key js2-mode-map (kbd "C-c C-t") (lambda () (interactive) (nodeunit-run-test-at-point)))
(define-key js2-mode-map (kbd "C-c t") (lambda () (interactive) (nodeunit-run-test-at-point)))
(define-key js2-mode-map (kbd "C-c f") (lambda () (interactive) (nodeunit-run-test-file)))
(define-key js2-mode-map "@" 'js-doc-insert-tag)

(global-set-key (kbd "C-M-s") 'helm-swoop)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

(define-key gnus-summary-mode-map (kbd "C-o") 'other-window)

(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w t") 'toggle-window-split)

(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(define-key flycheck-mode-map (kbd "C-c l") flycheck-command-map)

(global-set-key (kbd "M-Y") 'yank-pop-forward)

(global-set-key (kbd "C-M-m") 'mc/mark-next-like-this)

;; keybindings
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-x\m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-x k") (lambda () (interactive) (kill-buffer))) ;; no more asking which buffer!
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key (kbd "M-;") 'comment-eclipse)
(global-set-key (kbd "C-x C-d") 'duplicate-line)
(global-set-key "\C-co" 'switch-to-minibuffer)
(global-set-key (kbd "C-c m") 'magit-status)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(global-set-key (kbd "C-c C-o") 'occur)
(global-set-key (kbd "C-\\")
                (lambda ()
                  (interactive)
                  (just-one-space -1))) ;; that's C-\ (elisp string escaping), -1 kills newlines :)
(global-set-key (kbd "M-\\")
                (lambda ()
                  (interactive)
                  (just-one-space -1)
                  (delete-char -1)))
(global-set-key (kbd "C-a") 'back-to-indentation) ;; swap C-a and M-m (since we usually want beginning of indent
(global-set-key (kbd "M-m") 'move-beginning-of-line)
(global-set-key (kbd "C-?") 'help-command)
(define-key help-map (kbd "C-f") 'find-function)
(define-key help-map (kbd "C-v") 'find-variable)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key company-active-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-x g") 'google-this)
;; (global-set-key [remap isearch-forward] 'isearch-forward-regexp)
;; (global-set-key [remap isearch-backward] 'isearch-backward-regexp)

(global-set-key (kbd "C-'") 'er/mark-outside-quotes)


(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-command-map (kbd "d") 'helm-dash-at-point)
(define-key helm-command-map (kbd "o") 'helm-occur)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-;") 'helm-mini)

;; sc for semicolon lol, workaround to get C-; and C-' working in iterm2
(if (not (window-system))
    (progn
      (global-set-key (kbd "C-[ [ s;") 'helm-mini)
      (global-set-key (kbd "C-[ [ s'") 'er/mark-outside-quotes)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(define-key helm-find-files-map (kbd "C-h") 'helm-ff-delete-char-backward)

;; Need C-o to be `other-window' in compilation mode, so rebind
;; `compilation-display-error' to C-e instead
(define-key compilation-mode-map (kbd "C-M-e") 'compilation-display-error)
(define-key compilation-mode-map (kbd "C-o") 'other-window)

;; ditto for dired-mode, occur-mode
(define-key dired-mode-map (kbd "C-o") 'other-window)
(define-key gnus-summary-mode-map (kbd "C-o") 'other-window)
(define-key occur-mode-map (kbd "C-o") 'other-window)
(define-key term-mode-map (kbd "C-o") 'other-window)


;; let's try expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-2") 'er/expand-region)

(key-chord-mode 1)
;; (key-chord-define js2-mode-map ";;" (kbd "C-e ;"))

(global-set-key (kbd "C-M-j") 'iy-go-to-char)
(key-chord-define js2-mode-map "jk" 'iy-go-to-char)
(key-chord-define js2-mode-map "df" 'iy-go-to-char-backward)

(define-key org-mode-map (kbd "M-h") 'backward-kill-word)

;; comint mode for compilation is prettier, but needs better defaults
(define-key comint-mode-map (kbd "C-M-q") 'quit-window)
(define-key comint-mode-map (kbd "C-M-g") 'recompile)

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "C-<") 'goto-top-line)
(global-set-key (kbd "C->") 'goto-bottom-line)

;; js2-mode
;; (define-key js2-mode-map "\C-ctc" 'js2-mode-toggle-hide-comments)
(define-key js2-mode-map (kbd "C-c i") 'js-doc-insert-function-doc)
(define-key js2-mode-map (kbd "C-c n") 'js2-next-error)
(define-key js2-mode-map (kbd "C-c C-t") (lambda () (interactive) (nodeunit-run-test-at-point)))
(define-key js2-mode-map (kbd "C-c t") (lambda () (interactive) (nodeunit-run-test-at-point)))
(define-key js2-mode-map (kbd "C-c f") (lambda () (interactive) (nodeunit-run-test-file)))
(define-key js2-mode-map "@" 'js-doc-insert-tag)

(global-set-key (kbd "C-M-s") 'helm-swoop)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; nXML modes
(define-key nxml-mode-map (kbd "M-h") 'backward-kill-word)

;; gnus
(define-key gnus-summary-mode-map (kbd "C-o") 'other-window)

;; window namespace
(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w t") 'toggle-window-split)
(global-set-key (kbd "C-j") 'newline-above)

;; move flycheck keymap prefix to C-c l (for lint!)
(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(define-key flycheck-mode-map (kbd "C-c l") flycheck-command-map)

(global-set-key (kbd "M-Y") 'yank-pop-forward)

(global-set-key (kbd "C-M-m") 'mc/mark-next-like-this)

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(define-key web-mode-map (kbd "M-j") 'newline-and-indent)

(define-key coffee-mode-map (kbd "C->") 'coffee-indent-shift-right)
(define-key coffee-mode-map (kbd "C-<") 'coffee-indent-shift-left)

;; (define-key dockerfile-mode-map (kbd "M-p") 'move-line-up)
;; (define-key dockerfile-mode-map (kbd "M-n") 'move-line-down)
