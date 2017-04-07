(defun use-python3 ()
  "Use the system python3 for `elpy-mode', `flycheck-mode', and `python-mode'."
  (interactive)
  (setq
    elpy-rpc-python-command "/usr/bin/python3.5"
    elpy-rpc-pythonpath "/usr/local/lib/python3.5/dist-packages"
    flycheck-python-flake8-executable "/usr/bin/flake8"
    python-check-command "/usr/bin/pyflakes3"
    python-shell-interpreter "/usr/bin/ipython3"))

(defun use-python2 ()
  "Use the system python2 for `elpy-mode', `flycheck-mode', and `python-mode'."
  (interactive)
  (setq
    elpy-rpc-python-command "/usr/bin/python2.7"
    elpy-rpc-pythonpath "/usr/local/lib/python2.7/dist-packages"
    flycheck-python-flake8-executable "/usr/bin/flake8"
    python-check-command "/usr/bin/pyflakes"
    python-shell-interpreter "/usr/bin/ipython"))

(defun toggle-comment ()
  "Toggle comments on the current line or highlighted region."
  (interactive)
  (if mark-active
    (let ((mark (mark))
	  (point (point)))
      (if (> (mark) (point))
	(comment-or-uncomment-region
	  point
	  mark)
	(comment-or-uncomment-region
	  mark
	  point)))
    (comment-or-uncomment-region
      (line-beginning-position)
      (line-end-position))))

(use-python2)
