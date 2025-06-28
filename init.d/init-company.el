
(use-package company
  :ensure t
  :bind (("M-<tab>" . company-complete) ;; Tabで自動補完を起動する
         :map company-active-map
         ;; C-n, C-pで補完候補を次/前の候補を選択
         ("M-n" . nil)                      ;; M-nで次の候補への移動をキャンセル
         ("M-p" . nil)                      ;; M-pでの前の候補への移動をキャンセル
         ("C-n" . company-select-next)      ;; 次の補完候補を選択
         ("C-p" . company-select-previous);; 前の補完候補を選択
         ("C-s" . company-filter-candidates) ;; C-sで絞り込む
         :map company-search-map
         ;; 検索候補の移動をC-nとC-pで移動する
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :init
  ;; 全バッファで有効にする
  (global-company-mode)
  :config
  (define-key emacs-lisp-mode-map (kbd "C-M-i") nil) ;; CUI版のためにemacs-lisp-modeでバインドされるC-M-iをアンバインド
  (global-set-key (kbd "C-M-i") 'company-complete)   ;; CUI版ではM-<tab>はC-M-iに変換されるのでそれを利用
  (setq company-require-match 'never)
  (setq completion-ignore-case t)
  (setq company-idle-delay 0)                    ;; 待ち時間を0秒にする
  (setq company-minimum-prefix-length 3)         ;; 補完できそうな文字が3文字以上入力されたら候補を表示
  (setq company-selection-wrap-around t)         ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
  )

;; company-same-mode-buffers
;; https://github.com/zk-phi/company-same-mode-buffers

(require 'company-same-mode-buffers)
(company-same-mode-buffers-initialize)
(push 'company-same-mode-buffers company-backends)

;; company-dwim
;; https://github.com/zk-phi/company-dwim

(require 'company-dwim)
(define-key company-active-map (kbd "TAB") 'company-dwim)
(setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-dwim-frontend
        company-echo-metadata-frontend))

(provide 'init-company)
