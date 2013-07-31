(setq load-path (append load-path (list "/home/santiago/.emacs.d/vendor")))

;;; MELPA
(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; direx-el

(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;;; jedi-direx
(require 'jedi-direx)
(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))

;;; Line numbers

;;;(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
;;;(global-set-key (kbd "C-<f5>") 'linum-mode)
;;;(global-linum-mode t)

(global-unset-key (kbd "S-SPC"))
(global-set-key (kbd "<C-return>") 'dabbrev-expand)
(define-key global-map [f9] 'bookmark-jump)
(define-key global-map [f10] 'bookmark-set)

;;; Fiplr
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (
                                files (
                                        "*.jpg" "*.png" "*.zip" "*~" "*.pyc"
                                )
                            )))

;;(iswitchb-mode t)

(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;;; Custom functions
;;; Smarter move beginning of line
;;; http://emacsredux.com/blog/page/2/

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;;; Custom key bindings
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

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
