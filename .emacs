;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path "/usr/local/erlang-R16B02-basho6/lib/erlang/lib/eqc-1.32.1/emacs/")
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/usr/local/erlang-R16B02-basho6/lib/erlang/lib/eqc-1.32.1")
;; EQC Emacs Mode -- Configuration End

;; Display and term stuff
;; =====================
(setq display-time-day-and-date nil)
(display-time)
(line-number-mode t)
(column-number-mode t)
(setq visible-bell t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(set-time-zone-rule "US/Mountain")

;; Brett's Keybindings
;; ===================
(global-unset-key (kbd "<f1>"))
(global-unset-key (kbd "<f2>"))
(global-unset-key (kbd "<f3>"))
(global-unset-key (kbd "<f3>"))
(global-unset-key (kbd "<f4>"))
(global-unset-key (kbd "<f5>"))
(global-unset-key (kbd "<f6>"))
(global-unset-key (kbd "<f7>"))
(global-unset-key (kbd "<f8>"))
(global-unset-key (kbd "<f9>"))
(global-unset-key (kbd "<f10>"))
(global-unset-key (kbd "<f11>"))
(global-unset-key (kbd "<f12>"))
;; (make-keymap>") 'bretts-keymap)
(global-set-key (kbd "<f1>") 'undo)
(global-set-key (kbd "<f2>") 'repeat-complex-command)
(global-set-key (kbd "<f3>") 'call-last-kbd-macro)
(global-set-key (kbd "<f5>") 'kill-ring-save)
(global-set-key (kbd "<f6>") 'yank)
(global-set-key (kbd "<f7>") 'copy-to-register)
(global-set-key (kbd "<f8>") 'insert-register)
(global-set-key (kbd "<f9>") 'beginning-of-buffer)
(global-set-key (kbd "<f10>") 'end-of-buffer)
(global-set-key (kbd "<f11>") 'query-replace)
(global-set-key (kbd "<f12>") 'replace-string)

; SMEX
(add-to-list 'load-path "~/.emacs.d/smex/")
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; ERLANG
(setq erlang-root-dir "/usr/local/erlang-R16B02-basho5")
(add-to-list 'load-path (format "%s/%s" erlang-root-dir "lib/erlang/lib/tools-2.6.12/emacs"))
(add-to-list 'exec-path (format "%s/%s" erlang-root-dir "bin"))
;(setq load-path (cons  "/usr/local/erlang-R15B03/lib/erlang/lib/tools-2.6.8/emacs"
;(setq erlang-root-dir "/usr/local/erlang-R15B03")
;(setq exec-path (cons "/usr/local/erlang-R15B03/bin" exec-path))
(require 'erlang-start)

; MARKDOWN
(add-to-list 'load-path "~/.emacs.d/markdown-mode/")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; C MODE
(setq c-default-style "k&r")
;      c-basic-offset 4)
