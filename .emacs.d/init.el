;;; init.el -- Entry point
;;https://github.com/gorakhargosh/emacs.d

;; Configuration root directory path.
(setq config-dir (file-name-directory
		                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path config-dir)
;;(progn (cd (concat config-dir "/themes"))
;;        (normal-top-level-add-subdirs-to-load-path))
;;(progn (cd (concat config-dir "/lib"))
;;        (normal-top-level-add-subdirs-to-load-path))
;;(progn (cd (concat config-dir "/lib/distel/elisp"))
;;        (normal-top-level-add-subdirs-to-load-path))
;;(progn (cd config-dir)
;;        (normal-top-level-add-subdirs-to-load-path))

;; Load initial configuration.
(when window-system
   (setq frame-title-format '(buffer-file-name "%f" ("%b")))
     (tooltip-mode -1)
       (mouse-wheel-mode t)
         (tool-bar-mode -1)
	   (when (not (equal system-type 'darwin))
	        (menu-bar-mode -1))
	     (blink-cursor-mode -1))


(require 'config-defuns)
;;(require 'config-colors)
;;(require 'config-completion)
;;(require 'config-preferences)
;;(require 'config-erc)
(require 'config-bindings)

;;(require 'config-less-mode)
(require 'config-python-mode)
;;(require 'config-clojure-mode)
;;(require 'go-mode-load)
;;(require 'config-go-mode)
;;(require 'config-coffeescript)
;;(require 'config-haskell-mode)
;;(require 'config-erlang-mode)

;;(require 'pastebin)
