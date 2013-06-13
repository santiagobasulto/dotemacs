(setq load-path (append load-path (list "/home/santiago/.emacs.d/vendor")))

(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; Line numbers
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)

(global-linum-mode t)

(global-unset-key (kbd "S-SPC"))
(global-set-key (kbd "<C-return>") 'dabbrev-expand)
(define-key global-map [f9] 'bookmark-jump)
(define-key global-map [f10] 'bookmark-set)

;;(iswitchb-mode t)

(require 'highlight-symbol)


(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((python-shell-interpreter-args . "/home/santiago/code/python/tecnocial/manage.py shell") (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
") (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
") (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion") (python-shell-interpreter-args . "/home/santiago/code/python/athlete/src/manage.py shell") (python-shell-interpreter . "python")))))
