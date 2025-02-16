
; add .emacs.d/init.d, .emacs.d/my-lisp to load-path
(dolist (dir '("~/.emacs.d/init.d/" "~/.emacs.d/my-lisp/"))
  (add-to-list 'load-path (expand-file-name dir)))

; add .emacs.d/elpa/ subdirectories to load-path
(let ((default-directory "~/.emacs.d/elpa/"))
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; directly require my library
(require 'pretty-jump-of-line)
(require 'switch-to-user-buffer)

;; customize
(require 'init-package)

(require 'init-misc)
(require 'init-keybind)

(require 'init-fido-vertical-mode)

(require 'init-html-mode)
(require 'init-js-mode)
(require 'init-python-mode)
(require 'init-auto-insert)
(require 'init-auto-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(auto-complete blacken)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
