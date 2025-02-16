
(add-hook 'python-mode-hook
          (lambda ()
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             ))

(defvar init-python-mode-packages
  '(blacken
    )
  )

(dolist (pkg init-python-mode-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;;  black 
(if (= 0 (shell-command "which black 2>/dev/null 1> /dev/null"))
    (progn
      (require 'blacken)
      (add-hook 'python-mode-hook 'blacken-mode)
      )
  )


(provide 'init-python-mode)
