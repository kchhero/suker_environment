;;------------SCHEME-----------------;;
; Always do syntax highlighting
(global-font-lock-mode 1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; This is the binary name of my scheme implementation
(setq scheme-program-name "scm")
;(set-variable (quote scheme-program-name) "stk")

(add-to-list 'load-path "~/.emacs.d/")
(load-file "~/.emacs.d/buffer-move.el")
(require 'buffer-move)
(global-set-key (kbd "C-c <up>")     'buf-move-up)
(global-set-key (kbd "C-c <down>")   'buf-move-down)
(global-set-key (kbd "C-c <left>")   'buf-move-left)
(global-set-key (kbd "C-c <right>")  'buf-move-right)

(load-file "~/.emacs.d/bb-mode.el")
(setq auto-mode-alist (cons '("\\.bb$" . bb-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.inc$" . bb-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.bbappend$" . bb-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.bbclass$" . bb-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.conf$" . bb-mode) auto-mode-alist))

(load-file "~/.emacs.d/init.el")
;(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;         (let* ((my-lisp-dir "~/elisp/")
;		              (default-directory my-lisp-dir))
;	             (setq load-path (cons my-lisp-dir load-path))
;		                (normal-top-level-add-subdirs-to-load-path)))

;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/themes")

;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-marine)
;(color-theme-autoloads)
;(color-theme-empty-void)

(add-to-list 'load-path "~/.emacs.d/nav/")
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
(global-set-key [f8] 'nav-toggle)
