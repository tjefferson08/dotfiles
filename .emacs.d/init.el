;;;; travis's .emacs file

;;;; MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/") t)
   (add-to-list 'package-archives
                '("melpa-stable" . "http://stable.melpa.org/packages/") t)
   (package-initialize))

(setq gc-cons-threshold 100000000)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq debug-on-error nil)
(setq default-directory "/Users/travis")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 4)
 '(company-require-match nil)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "e297f54d0dc0575a9271bb0b64dad2c05cff50b510a518f5144925f627bb5832" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "9492cf1ac00c8a1f7130a867a97404dfeb6727801c6b2b40b853b91543f7af67" "ac16245796399c31a7c3ab6a4c0ecf88add866a988d2928248a260b8149ea4ad" "dbc36265f8078e5b36e907b7753cd5b538f702f9f1be398d17ff9c5b442fe8cf" "a49760e39bd7d7876c94ee4bf483760e064002830a63e24c2842a536c6a52756" "0b6cb9b19138f9a859ad1b7f753958d8a36a464c6d10550119b2838cedf92171" "235dc2dd925f492667232ead701c450d5c6fce978d5676e54ef9ca6dd37f6ceb" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "31b2145c933e41fbbda48b15278cdcce3779db7e92ca434ad3044b3392ad6ae3" "28130127bbf3072c1bbc7652fca7245f186bb417b3b385a5e4da57b895ffe9d8" "1dffeecd1565d04cd2059234e872cd80fcbe813488602d5c42b5c9e576924d9f" "f81a9aabc6a70441e4a742dfd6d10b2bae1088830dc7aba9c9922f4b1bd2ba50" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "1fc1fdf975c8c8c3767c29787a063eee50cbceef903644a0771fa66568ee8777" "c567c85efdb584afa78a1e45a6ca475f5b55f642dfcd6277050043a568d1ac6f" "70b51a849b665f50a97a028c44cec36b398398357d8f7c19d558fe832b91980f" "6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "5bcd0c26bad3303c0325d12dd6562e4f7892d39d390d7db194dd141ba971cad7" "1e3b2c9e7e84bb886739604eae91a9afbdfb2e269936ec5dd4a9d3b7a943af7f" "1b46826ed71b40396e3eee3a8a8adb0b4e2bf4edeff271116a1926e5c20eede0" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "0fb6369323495c40b31820ec59167ac4c40773c3b952c264dd8651a3b704f6b5" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "0a1a7f64f8785ffbf5b5fbe8bca1ee1d9e1fb5e505ad9a0f184499fe6747c1af" "30b7087fdd149a523aa614568dc6bacfab884145f4a67d64c80d6011d4c90837" "02e85018e62b35e67ff365c0d9cab58ef547519ff17f0c42521fb29074ffa1bf" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "a444b2e10bedc64e4c7f312a737271f9a2f2542c67caa13b04d525196562bf38" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(elixir-format-elixir-path "/usr/local/bin/elixir")
 '(elixir-format-mix-path "/usr/local/bin/mix")
 '(fci-rule-color "#49483E")
 '(global-company-mode t)
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(inhibit-startup-screen t)
 '(jdee-jdk-registry
   (quote
    (("1.8" . "/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home"))))
 '(jdee-server-dir "/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/")
 '(magit-branch-arguments nil)
 '(magit-cherry-pick-arguments (quote ("-x")))
 '(magit-diff-use-overlays nil)
 '(magit-pull-arguments nil)
 '(magit-refs-sections-hook
   (quote
    (magit-insert-error-header magit-insert-branch-description magit-insert-local-branches magit-insert-remote-branches)))
 '(magit-tag-arguments nil)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(prettier-args (quote ("--single-quote=true")))
 '(prettier-command "prettier")
 '(projectile-completion-system (quote helm))
 '(projectile-mode t)
 '(projectile-mode t nil (projectile))
 '(projectile-verbose t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(sml/replacer-regexp-list
   (quote
    (("^~/org" ":Org:")
     ("^~/\\.emacs\\.d/" ":ED:")
     ("^/sudo:.*:" ":SU:")
     ("^~/Documents/" ":Doc:")
     ("^~/Dropbox/" ":DB:")
     ("^:\\([^:]*\\):Documento?s/" ":\\1/Doc:")
     ("^~/[Gg]it/" ":Git:")
     ("^~/[Gg]it[Hh]ub/" ":Git:")
     ("^~/[Gg]it\\([Hh]ub\\|\\)-?[Pp]rojects/" ":Git:")
     ("^~/glaze-tjefferson08" ":GLAZE:"))))
 '(sql-connection-alist
   (quote
    (("localhost"
      (sql-product
       (quote mysql))
      (sql-user "core-RW")
      (sql-database "")
      (sql-server "localhost"))
     ("postgres-metro-local"
      (sql-product
       (quote postgres))
      (sql-user "metro")
      (sql-database "metro")
      (sql-server "localhost"))
     ("secretshopper_dev"
      (sql-product
       (quote postgres))
      (sql-user "travis")
      (sql-database "secretshopper_dev")
      (sql-server "")))))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(uniquify-strip-common-suffix t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Monaco"))))
 '(js2-error ((t (:background "tomato" :weight bold))))
 '(js2-external-variable ((t (:background "tomato" :foreground "#DFAF8F"))))
 '(js2-warning ((t (:background "DarkOrange3"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

;; CASK
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; load my custom init files
(load "~/prettier/editors/emacs/prettier-js.el" t)
(add-hook 'before-save-hook 'prettier-before-save)

(load "~/.emacs.d/appearance-windows-gui.el")
(load "~/.emacs.d/aliases-homemade.el")
(load "~/.emacs.d/keybindings.el")
(load "~/.emacs.d/init-javascript.el")
(load "~/.emacs.d/init-coffeescript.el")
(load "~/.emacs.d/init-haml.el")
(load "~/.emacs.d/init-yaml.el")
(load "~/.emacs.d/init-ruby.el")
(load "~/.emacs.d/init-org.el")
(load "~/.emacs.d/init-web.el")
(load "~/.emacs.d/init-css.el")
(load "~/.emacs.d/init-elixir.el")
(load "~/.emacs.d/hydras.el")
(load "~/.emacs.d/macros.el")
(load "~/.emacs.d/monokai-theme.el")
;; (load-library "fogbugz")
;; (when window-system
;;     (if (y-or-n-p "load secrets?")
;;         (require 'secrets)))

(require 'yasnippet)
(require 'projectile)
(require 'helm-projectile)
(helm-mode 1)
;; (global-projectile-mode 1)
(helm-projectile-on)
;; (add-hook 'projectile-after-switch-project-hook 'magit-status)
;; (setq projectile-after-switch-project-hook nil)
(setq projectile-switch-project-action 'magit-status)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq backup-by-copying t)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(setq initial-major-mode 'lisp-interaction-mode)
(setq echo-keystrokes 0.1)

;;;; abbrev mode (text expansion) C-xaig to define macro
(setq default-abbrev-mode t)

;;;; company-mode (text completion)

(global-company-mode)

(add-hook 'git-commit-mode 'my-git-commit-mode-hook)

(require 'uniquify)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(show-paren-mode 1)

;; this makes CMD-h go to emacs instead of OSX's hide fcn (CMD is meta, confusing, but I need it!)
(setq mac-pass-command-to-system nil)

;; parse filename, line, and column out of nodeunit's error reporting
(add-to-list 'compilation-error-regexp-alist
             '("^\\s-*at.*?\\(/.*\\):\\([0-9]+\\):\\([0-9]+\\)"
               1 2 3))

;; cryptic args-out-of-range error was happening, this seemed to fix
(setq vc-handled-backends nil)

;; yasnippet
(yas-reload-all)
(yas-minor-mode 1)

(setq org-log-done t)
(setq org-agenda-files (list "."))

(setq ispell-program-name "/usr/local/bin/aspell")

(add-hook 'jade-mode-hook 'my-jade-hook)

(defun my-shell-hook ()
  (global-company-mode -1)
  (yas-minor-mode -1))
(add-hook 'shell-mode-hook 'my-shell-hook)

(defun my-scss-hook ()
  (setq css-indent-offset 2))
(add-hook 'scss-mode-hook 'my-scss-hook)

(setq helm-echo-input-in-header-line t)
(defun helm-hide-minibuffer-maybe ()
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                              `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
(add-hook 'makefile-mode-hook 'my-makefile-hook)

;; persist history of search and kill ring(s) across sessions
;; (setq savehist-file (concat user-emacs-directory "savehist"))
;; (savehist-mode 1)
;; (setq savehist-save-minibuffer-history 1)
;; (setq savehist-additional-variables
;;       '(kill-ring
;;         search-ring
;;         regexp-search-ring))

;; alists
(add-hook 'web-mode-hook 'prettier-js-mode)
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
(add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.latex\\'" . latex-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.nghaml" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.glsl$" . c++-mode))
(add-hook 'emacs-lisp-mode-hook #'hl-line-mode)
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'nodejs-repl-mode-hook (lambda () (company-mode -1)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(remove-hook 'find-file-hooks 'vc-find-file-hook)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)


(defun my-sml-mode-hook()
  ;; disable abbrev-mode
  (abbrev-mode -1))
(add-hook 'sml-mode-hook 'my-sml-mode-hook)

(if (not (server-running-p))
    (server-start))
