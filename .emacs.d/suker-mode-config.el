(add-hook 'suker-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'suker-mode-hook (lambda () (setq sh-basic-offset 8)))
(add-hook 'suker-mode-hook (lambda () (setq sh-indentation 8)))

(provide 'suker-mode-config)
