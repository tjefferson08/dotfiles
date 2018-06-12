(require 's)
(require 'popup)
(require 'helm)
;;(require 'helm-dash)

;;;; Aliases
(defalias 'br 'browse-url-of-buffer)
(defalias 'eb 'eval-buffer)
(defalias 'gho (lambda () (interactive) (github-link "tjefferson08" nil)))
(defalias 'ghu (lambda () (interactive) (github-link nil nil)))
(defalias 'le (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(defalias 'pgm 'projectile-global-mode)
(defalias 'qr 'query-replace)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rb 'revert-buffer)
(defalias 'rr 'replace-regexp)
(defalias 'ttl 'toggle-truncate-lines)
(defalias 'tws 'toggle-window-split)

;; home-grown (or stolen) elisp
(defun clean-function-definitions-and-blocks ()
  "Replace any instances of 'function(...' with 'function (...'.
Don't move point."
  (interactive)
  (set-mark-command nil) ;; sets and pushes mark
  (replace-regexp "function(" "function (" nil (point-min) (point-max))
  (replace-regexp "){" ") {" nil (point-min) (point-max))
  (replace-regexp "\\(if\\|for\\)(" "\\1 (" nil (point-min) (point-max))
  (set-mark-command 1) ;; pop and jump to mark
  (set-mark-command 1)) ;; pop twice, since replace-regexp pushes an add'l mark on the ring

(defun duplicate-line()
  "Duplicate line under point and insert it on the next line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

;; 'bubble' line up/down
;; (defun move-line-down ()
;;   (interactive)
;;   (let ((col (current-column)))
;;     (forward-line 1)
;;     (transpose-lines 1)
;;     (forward-line -1)
;;     (move-to-column col)))

;; (defun move-line-up ()
;;   (interactive)
;;   (when (not (= (point-at-bol) (point-min)))
;;     (let ((col (current-column)))
;;       (forward-line)
;;       (transpose-lines -1)
;;       (forward-line -1)
;;       (message (number-to-string col))
;;       (move-to-column (min col (point-at-eol))))))

(defun tidy-html ()
  "Tidies the HTML content in the buffer using `tidy'"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of buffer
   (point-min)
   (point-max)
   ;; command and parameters
   "tidy -i -w 120 -q"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Tidy Error Buffer*"
   ;; show error buffer?
   nil))

;; requires current branch to track from PR target branch, and when
;; you push your local, you need to push to origin, otherwise it'll
;; push up to the tracked remote (upstream) by default, and we don't
;; want to pollute with a bunch of PR branches
(defun pull-request-url ()
  "Build the URL for the pull request on GitHub corresponding
to the current branch. Uses Magit."
  (interactive)
  (let* ((extract-app-and-remote-re ".*github.com[:/]\\(.*\\)/\\(.*\\)")
         (full-remote-url (magit-get "remote" (magit-get-remote) "url"))
         (remote-url (if (s-suffix? ".git" full-remote-url)
                         (substring full-remote-url 0 -4)
                       full-remote-url)))
    (string-match extract-app-and-remote-re remote-url 0)
    (message extract-app-and-remote-re full-remote-url remote-url)
    (let* ((remote (match-string-no-properties 1 remote-url))
           (app-name (match-string-no-properties 2 remote-url))
           (current-branch (magit-get-current-branch))
           (tracked-remote-and-branch (split-string (magit-get-upstream-branch) "/"))
           (tracked-remote (nth 0 tracked-remote-and-branch))
           (tracked-branch (nth 1 tracked-remote-and-branch)))

      (let ((url (format "https://github.com/%s/%s/compare/%s...%s:%s"
                         remote
                         app-name
                         tracked-branch
                         (if (string-equal tracked-remote "origin")
                           remote
                           "tjefferson08")
                         current-branch)))
        (message url)
        (kill-new url)
        (browse-url url)))))

(defun github-link (remote branch)
  "Link to current line on github.com"
  (interactive)

  (if (eq branch nil)
      (setq branch "master"))

  ;; git@github.com:signpost/core.git/tree/master/apps/API.js#L250
  (let* ((remote-url (magit-get "remote" (magit-get-remote) "url"))
         (remote-name (progn
                        (string-match "github\\.com[:/]\\([-_a-z0-9]+\\)" remote-url)
                        (match-string 1 remote-url)))

         (app-name (progn
                     (string-match "[/]\\([-_a-z0-9]+\\)\\(?:\\.git\\)?$" remote-url)
                     (match-string 1 remote-url)))
         (target-url (concat
                      "https://github.com/"
                      (or remote-name "signpost")
                      "/"
                      app-name
                      "/tree/"
                      branch
                      "/"
                      (file-relative-name (buffer-file-name) (projectile-project-root))
                      "#L"
                      (int-to-string (line-number-at-pos)))))
    (message target-url)
    (browse-url target-url)
    (kill-new target-url)))

(defun get-current-test-name (regexp)
  "Get first matching group of regexp and store in test-name variable"
  (save-excursion
    (let ((pos)
          (test-name))
      (re-search-backward regexp)
      (setq test-name (buffer-substring-no-properties (match-beginning 1) (match-end 1))))))

;; use inside a buffer visiting a nodeunit test file
;; search backwards for nearest testname, then run it
(defun nodeunit-run-test-at-point ()
  (interactive)
  (compile
   (format "cd %s && ALLOW_CONFIG_MUTATIONS=y NODE_ENV=test nodeunit --reporter nested %s -t %s"
           (projectile-project-root)
           (expand-file-name (buffer-file-name))
           (get-current-test-name "^\\(.+\\):[ ]?function[ ]?([ ]?test[ ]?)"))
   t))

;; use inside a buffer visiting a nodeunit test file
;; run all tests in current buffer
(defun nodeunit-run-test-file ()
  (interactive)
  (compile
   (format "cd %s && ALLOW_CONFIG_MUTATIONS=y NODE_ENV=test nodeunit --reporter nested %s"
           (projectile-project-root)
           (expand-file-name (buffer-file-name)))
   t))

;; use inside a buffer visiting a nodeunit test file
;; run all tests in current buffer WITH COVERAGE
(defun nodeunit-run-test-file-and-report-coverage ()
  (interactive)
  (compile
   (format "cd %s && ALLOW_CONFIG_MUTATIONS=y NODE_ENV=test istanbul cover nodeunit %s --print detail && exit 1"
           (projectile-project-root)
           (expand-file-name (buffer-file-name)))
   t))

;; use inside a buffer visiting an rspec test file
;; run spec at current line number (watch out for rvm <-> emacs issues)
(defun rspec-run-test-at-point ()
  "E.g. 'rspec ./spec/models/tap_spec.rb:36'"
  (interactive)
  (compile
   (format "cd %s && bundle exec rspec %s"
           (projectile-project-root)
           (concat
            (expand-file-name (buffer-file-name))
            ":"
            (number-to-string (line-number-at-pos))))
   t))

;; use inside a buffer visiting an rspec file
;; run all specs in current buffer
(defun rspec-run-test-file ()
  (interactive)
  (compile
   (format "cd %s && bundle exec rspec %s"
           (projectile-project-root)
           (expand-file-name (buffer-file-name))) t))

(defun exunit-run-test-at-point ()
  (interactive)
  (compile
   (format "cd %s && mix test %s"
           (projectile-project-root)
           (concat
            (expand-file-name (buffer-file-name))
            ":"
            (number-to-string (line-number-at-pos))))
   t))

(defun exunit-run-test-file ()
  (interactive)
  (compile
   (format "cd %s && mix test %s"
           (projectile-project-root)
            (expand-file-name (buffer-file-name)))
   t))


(defun notify-compilation-result (buffer msg)
  "Notify that the compilation is finished,
close the *compilation* buffer if the compilation is successful,
and set the focus back to Emacs frame"
  (if (string-match "^finished" msg)
      (quit-windows-on buffer)))

(add-to-list 'compilation-finish-functions
             'notify-compilation-result)

;; comment-dwim improvement.
(defun comment-eclipse ()
  "With a region, comment or uncomment entire region, where each comment
token is inserted at the same column. Without a region, insert comment
token one space prior to first (non-whitespace) character, or (when
uncommenting) remove any comment tokens prior to first (non-whitespace)
character on current line (in any case, move to next line)."

  (interactive)
  (let ((start (if (region-active-p) (region-beginning) (point-at-bol)))
        (end (if (region-active-p) (region-end) (point-at-eol))))
    (comment-or-uncomment-region start end)
    (next-line)))

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     haskell-mode
                                                     ruby-mode
                                                     rspec-mode
                                                     python-mode
                                                     js2-mode
                                                     c-mode
                                                     c++-mode
                                                     objc-mode
                                                     latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

;; someday might want to rotate windows if more than 2 of them
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive) (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
                      (t
                       (let* ((w1 (first (window-list)))
                              (w2 (second (window-list)))
                              (b1 (window-buffer w1))
                              (b2 (window-buffer w2))
                              (s1 (window-start w1))
                              (s2 (window-start w2)))
                         (set-window-buffer w1 b2)
                         (set-window-buffer w2 b1)
                         (set-window-start w1 s2)
                         (set-window-start w2 s1)))))

;; Or these two, which I consider serious omissions in the lineup of standard file-manipulation functions:
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn   (rename-file name new-name 1)   (rename-buffer new-name)        (set-visited-file-name new-name)        (set-buffer-modified-p nil)))))) ;;

;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
         (newname (concat dir "/" name)))

    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (progn    (copy-file filename newname 1)  (delete-file filename)  (set-visited-file-name newname)         (set-buffer-modified-p nil)     t))))

(defun toggle-window-split ()

  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(defun goto-bottom-line ()
  "Move point to bottom line of window."
  (interactive)
  (move-to-window-line -1))

(defun goto-top-line ()
  "Move point to top line of window."
  (interactive)
  (move-to-window-line 0))

(defun my-git-commit-mode-hook ()
  (interactive)
  (setq-local indent-tabs-mode nil)
  (setq-local current-fill-column 72)
  (auto-fill-mode 1))

(defun describe-thing-in-popup ()
  (interactive)
  (let* ((thing (symbol-at-point))
         (help-xref-following t)
         (description (with-temp-buffer
                        (help-mode)
                        (help-xref-interned thing)
                        (buffer-string))))
    (popup-tip description
               :point (point)
               :around t
               :height 30
               :scroll-bar t
               :margin t)))

(defun yank-pop-forward ()
  "Call yank-pop with -1 to switch directions when
  cycling through the kill ring options"
  (interactive)
  (yank-pop -1))

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(defun my-jade-hook ()
  (setq jade-tab-width 4)
  (hl-line-mode 1))

(defun my-web-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)


(defun convert-json-to-javascript (start end)
  (interactive "r")
  (save-excursion
    (replace-regexp "\"\\([a-zA-Z0-9-_]+\\)\":" "\\1: " nil start end)
    (replace-regexp ",\\([^ ]\\)" ", \\1" nil start end)
    (replace-regexp "{\\([^ ]\\)" "{ \\1" nil start end)
    (replace-regexp "\\([^ ]\\)}" "\\1 }" nil start end)))

(defun npm-test ()
  (interactive)
  (compile
   (format "cd %s && npm test" (projectile-project-root))
   t)

  ;; rename compilation buffer with a quick switch, then switch back
  (switch-to-buffer "*compilation*")
  (let ((kill-buffer-query-functions nil))
    (if (get-buffer "*npm-test*")
        (kill-buffer "*npm-test*")))
  (rename-buffer "*npm-test*")
  (switch-to-buffer (other-buffer)))

(defun get-latest-commit-hash ()
  (interactive)
  (with-current-buffer
      (let ((url-request-extra-headers
             '(("Content-Type" . "application/json"))))
        (url-retrieve-synchronously
         (concat
          "https://api.github.com/repos/signpost/"
          (read-from-minibuffer "App: " "toshokan")
          "/commits"
          "?access_token="
          github-commit-fetch-token)))
    (let ((latest-sha
           (progn (search-forward "\"sha\":\"")
                  (word-at-point))))
      (kill-new latest-sha)
      (message latest-sha))))

(defun my-makefile-hook ()
  (setq-local untabify-on-save nil))

(defun newline-above ()
  (interactive)
  (forward-line -1)
  (end-of-line)
  (insert "\n")
  (indent-for-tab-command))
