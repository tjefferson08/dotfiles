(require 'hydra)

(defun reset-zoom ()
  (interactive)
  (text-scale-set 0))

(defhydra hydra-zoom (global-map "C-c z")
  "zoom"
  ("i" text-scale-increase "in")
  ("+" text-scale-increase "in")
  ("o" text-scale-decrease "out")
  ("-" text-scale-decrease "out")
  ("0" reset-zoom "reset")
  ("r" reset-zoom "reset"))

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (global-map "C-x P" :color teal)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
  _h_: helm            _a_: grep              _i_: Ibuffer           _c_: cache clear
                       _e_: eshell            _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur       _K_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   helm-projectile-grep)
  ("b"   helm-projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("e"   helm-projectile-switch-to-eshell)
  ("h"   helm-projectile)
  ("fd"  helm-projectile-find-dir)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   helm-occur)
  ("P"   helm-projectile-switch-project "switch project")
  ("p"   helm-projectile-switch-project)
  ("s"   helm-projectile-switch-project)
  ("r"   helm-projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

