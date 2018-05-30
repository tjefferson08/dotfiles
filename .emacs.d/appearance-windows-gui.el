(require 'fringe)

;;kill menubars and scroll bar
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; scrolling

;; keep current line the same relative to screen pos.
(setq scroll-preserve-screen-position t)

;; lots of context lines to make scrolling 'jump' less (smaller hops)
(setq next-screen-context-lines 10)

;; set line spacing to add a smidge more than the
;; default value (1)
(setq default-line-spacing 2)

;; activate winner mode ( C-c left/right to 'switch workspaces' ),
;; which basically gives you undo/redo for window configurations
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; windmove - Shift + arrows instead of C-x o
;; (moving point to different windows on screen)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;;; y is yes and n is no. always.
(defalias 'yes-or-no-p 'y-or-n-p)

;;;; add confirmation to exit
(setq confirm-kill-emacs 'y-or-n-p)

;; cursor shape
(setq-default cursor-type 'box)

;; CMD on mac -> Meta key
(setq mac-command-modifier 'meta)

;; delete trailing whitespace on save, but not empty newlines,
;; because we like those for UNIX-y reasons
(setq delete-trailing-lines nil)
(setq delete-trailing-whitespace-on-save t)
(defun my-delete-trailing-whitespace ()
  (interactive)
  (when (and
         (boundp 'delete-trailing-whitespace-on-save)
         delete-trailing-whitespace-on-save)
    (delete-trailing-whitespace (point-min) (point-max))))
(add-hook 'before-save-hook 'my-delete-trailing-whitespace)

(setq untabify-on-save t)
(defun my-untabify ()
  (interactive)
  (when (and
         (not (derived-mode-p 'go-mode))
         (boundp 'untabify-on-save)
         untabify-on-save)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'my-untabify)


;; turn off fringe strips (might want a minimal one on left, we will see)
(fringe-mode '(0 . 0))

;; auto-load color theme
(if window-system
    ;; (load-theme 'zenburn)
    (load-theme 'monokai)
  (load-theme 'wombat))

;; don't enable globally, just set it when you want it with
;; M-x fci-mode
(when (fboundp 'fill-column-indicator)
  (require 'fill-column-indicator))

;; make sure column number is in status bar
(column-number-mode)

(setq inhibit-splash-screen t)
(setq use-dialog-box nil)

;; OSX issue: graphic artifact
;; (setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq initial-scratch-message nil)
(tooltip-mode -1)
;; (sml/setup) ;; smart-mode-line
(setq sml/theme 'respectful)

(require 'diminish) ;; remove/shorten pesky minor modes in modeline
(diminish 'abbrev-mode)

(setq helm-dash-browser-func 'eww)

;; starts emacsclient fullscreen
;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; only hl-line in active window
(setq hl-line-sticky-flag nil)

;; only split vertically if you can fit 200 columns
(setq split-width-threshold 200)

;; only split horizontally if you can fit 9999 columns (i.e. NEVER)
(setq split-height-threshold 9999)

(toggle-truncate-lines 1)

;; no extra frame for ediff control buffer
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(defun set-truncate-lines ()
  (toggle-truncate-lines 1))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'set-truncate-lines)

(add-hook 'fundamental-mode-hook 'set-truncate-lines)

(global-hl-line-mode 1)

(global-anzu-mode 1)
