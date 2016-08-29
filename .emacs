; melpa rackages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "org-protocol-capture-html")

; mac osx start up
(require 'cl) 

; visual line mode
(add-hook 'text-mode-hook 'visual-line-mode)

; pandoc location
(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/pandoc"))

; server start
(server-start)

; hide start up screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
; hide toolbar
;(tool-bar-mode -1)
; hide scrollbar
(scroll-bar-mode -1)

; mac swap ctrl and cmd
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)

; backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

; change prompt from yes or no, to y or n
(fset 'yes-or-no-p 'y-or-n-p)

; case insensitive search
(setq read-file-name-completion-ignore-case t)
(setq pcomplete-ignore-case t)
; place headers on the left
(setq markdown-asymmetric-header t)

; markdown preview using pandoc
(setq markdown-command "/usr/local/bin/pandoc -f markdown -t html -s -S --mathjax --highlight-style=pygments")

; gfm mode
(setq auto-mode-alist (cons '("\\.mdt$" . gfm-mode) auto-mode-alist))
; fix tab in evil for org mode
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

; org mode
(require 'org)
(require 'org-protocol)
(require 'org-capture)
(require 'org-protocol-capture-html)
(setq org-agenda-files '("~/org/"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

; org-capture
(global-set-key "\C-cc" 'org-capture)

; org capture templates
(setq org-capture-templates
    '(("t" "Todo" entry
      (file+headline "~/org/todo.org" "Tasks")
      (file "~/org/templates/tpl-todo.txt")
      :empty-lines-before 1)
      ("w" "Web site" entry (file+olp "~/org/web.org" "Web")
      (file "~/org/templates/tpl-web.txt")
      :empty-lines-before 1)))

; refile
(setq org-refile-targets '((nil :maxlevel . 2)
                                (org-agenda-files :maxlevel . 2)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

; custom faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html md odt ascii))

; todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t@/!)" "IN-PROGRESS(p/!)" "WAITING(w@/!)" " | " "DONE(d@)")))
(setq org-log-done t)

; Fast Todo Selection - Changing a task state is done with C-c C-t KEY
(setq org-use-fast-todo-selection t)

; org todo logbook
(setq org-log-into-drawer t)

; org-babel graphviz
(org-babel-do-load-languages
'org-babel-load-languages
'((dot . t))) ; this line activates dot

; powerline-evil
(require 'powerline)
(powerline-default-theme)
(display-time-mode t)

; magit 
(global-set-key (kbd "C-x g") 'magit-status)

; git auto commit mode - auto push to head after commit
;(setq-default gac-automatically-push-p t)

; undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)
