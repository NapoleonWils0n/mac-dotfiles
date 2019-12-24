; melpa rackages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)
;(elpy-enable)

; org capture
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "org-protocol-capture-html")

;mac
(require 'cl)
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

; load theme
(add-hook 'after-init-hook (lambda () (load-theme 'solarized-dark)))

; start server
(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; fixing elpy keybinding
;(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;(define-key global-map (kbd "C-c o") 'iedit-mode)
;; For elpy
;(setq elpy-rpc-python-command "python3")
;; For interactive shell
;(setq python-shell-interpreter "python3")

;(tramp-set-completion-function "ssh"
;                               '((tramp-parse-sconfig "/etc/ssh_config")
;                                 (tramp-parse-sconfig "~/.ssh/config")))

;(setq tramp-default-method "ssh")

;(add-to-list 'backup-directory-alist
;				 (cons tramp-file-name-regexp nil))

;(setq tramp-ssh-controlmaster-options
;                (concat
;                  "-o ControlPath=/tmp/ssh-ControlPath-%%r@%%h:%%p "
;                  "-o ControlMaster=auto -o ControlPersist=yes"))


;Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "org-protocol-capture-html")

; hide start up screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
; hide toolbar
(tool-bar-mode -1)
; hide scrollbar
(scroll-bar-mode -1)

; visual line mode
(add-hook 'text-mode-hook 'visual-line-mode)

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
(setq markdown-command "pandoc -f markdown -t html -s -S --mathjax --highlight-style=pygments -c ~/git/pandoc-css/pandoc.css")

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
(setq org-agenda-files '("~/git/org/"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

; dont show images full size
(setq org-image-actual-width nil)

;; prevent demoting heading also shifting text inside sections
(setq org-adapt-indentation nil)

; org-capture
(global-set-key "\C-cc" 'org-capture)

(defadvice org-capture
    (after make-full-window-frame activate)
  "Advise capture to be the only window when used as a popup"
  (if (equal "emacs-capture" (frame-parameter nil 'name))
      (delete-other-windows)))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "emacs-capture" (frame-parameter nil 'name))
      (delete-frame)))

; org capture templates
(setq org-capture-templates
    '(("t" "todo" entry
      (file+headline "~/git/org/todo.org" "Tasks")
      (file "~/git/org/templates/tpl-todo.txt")
      :empty-lines-before 1)
      ("w" "web site" entry (file+olp "~/git/org/web.org" "sites")
      (file "~/git/org/templates/tpl-web.txt")
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
 '(menu ((t (:background "black" :foreground "white"))))
 '(org-document-title ((t (:foreground "#93a1a1" :weight bold :height 1.0))))
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16" :height 1.0))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#859900" :height 1.0))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#268bd2" :height 1.0))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#b58900" :height 1.0))))
 '(org-level-5 ((t (:inherit variable-pitch :foreground "#2aa198"))))
 '(org-level-6 ((t (:inherit variable-pitch))))
 '(org-level-7 ((t (:inherit variable-pitch))))
 '(org-level-8 ((t (:inherit variable-pitch))))
 '(org-link ((t (:inherit link :underline nil)))))

; Prepare stuff for org-export-backends
(setq org-export-backends '(org md html latex icalendar odt ascii))

; org hide markup
(setq org-hide-emphasis-markers t)

; org spacing
;(setq org-cycle-separator-lines 1)

; org column spacing for tags
(setq org-tags-column 0)

; todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t@/!)" "IN-PROGRESS(p/!)" "WAITING(w@/!)" "|" "DONE(d@)")))
(setq org-log-done t)

; Fast Todo Selection - Changing a task state is done with C-c C-t KEY
(setq org-use-fast-todo-selection t)

; org todo logbook
(setq org-log-into-drawer t)

; org-babel graphviz
(org-babel-do-load-languages
'org-babel-load-languages
'((dot . t)
  (shell . t))) ; this line activates bash shell script

; powerline-evil
(require 'powerline)
(powerline-default-theme)
(display-time-mode t)

; magit 
(global-set-key (kbd "C-x g") 'magit-status)

; git-auto-commit-mode auto push to head
;(setq-default gac-automatically-push-p t)

; undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)

; ox-pandoc export
(setq org-pandoc-options-for-markdown '((atx-headers . t)))
(setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "5dbdb4a71a0e834318ae868143bb4329be492dd04bdf8b398fb103ba1b8c681a" "a68670dce845d18af9ec87716b4d4c2ea071271eccc80242be4d232c58b3cca2" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (ob-async elfeed elfeed-goodies elfeed-org exec-path-from-shell flycheck solarized-theme w3m json-mode graphviz-dot-mode elpy powerline ox-pandoc markdown-mode magit git-auto-commit-mode evil-surround evil-leader emmet-mode))))


;(setq org-latex-listings 'minted)
(setq org-latex-listings 'minted
    org-latex-packages-alist '(("" "minted"))
    org-latex-pdf-process
    '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-minted-options
    '(("frame" "lines") ("linenos=true")) )
;(setq org-latex-listings 'minted)
(setq org-latex-listings 'minted
    org-latex-packages-alist '(("" "minted"))
    org-latex-pdf-process
    '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-minted-options
    '(("frame" "lines") ("linenos=true")) )

; always follow symlinks
(setq vc-follow-symlinks t)

; flycheck syntax highlighting
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(add-hook 'sh-mode-hook 'flycheck-mode)

; dont indent src block for export
(setq org-src-preserve-indentation t)

; dired ls
(setq dired-use-ls-dired nil)

; dired directory listing options for ls
(setq dired-listing-switches "-ahl")

; dired hide aync output buffer
(add-to-list 'display-buffer-alist (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

; elfeed
(require 'elfeed)
(require 'elfeed-org)
(elfeed-org)
(setq rmh-elfeed-org-files (list "~/git/org/feeds.org"))
(global-set-key (kbd "C-x w") 'elfeed)


; Mark all YouTube entries
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :feed-url "youtube\\.com"
                              :add '(video youtube)))

; elfeed goodies
(require 'elfeed-goodies)
(elfeed-goodies/setup)

; elfeed evil
(add-to-list 'evil-motion-state-modes 'elfeed-search-mode)
(add-to-list 'evil-motion-state-modes 'elfeed-show-mode)

; l show entry
(define-key elfeed-search-mode-map (kbd "l") 'elfeed-search-show-entry)

; elfeed face for tags
(defface youtube-elfeed-entry
  '((t :foreground "#268bd2"))
  "Marks an youtube Elfeed entry.")

(push '(youtube youtube-elfeed-entry)
      elfeed-search-face-alist)

(defface freebsd-elfeed-entry
  '((t :foreground "#b58900"))
  "Marks an freensd Elfeed entry.")

(push '(freebsd freebsd-elfeed-entry)
      elfeed-search-face-alist)

(defface nufc-elfeed-entry
  '((t :foreground "#2aa198"))
  "Marks an nufc Elfeed entry.")

(push '(nufc nufc-elfeed-entry)
      elfeed-search-face-alist)

; mpv elfeed
(setq mpv-path "/usr/local/bin/mpv")

; play video when viewing the entry
(defun elfeed-show-mpv ()
  "Playing video with mpv"
  (interactive)
    (let ((link (elfeed-entry-link elfeed-show-entry)))
      (when link
        (message "Opening video: %s" link)
        (async-shell-command (format "%s '%s'"
                                      mpv-path
                                      (elfeed-entry-link elfeed-show-entry))))))

; play the selected video
(defun elfeed-search-mpv ()
  (interactive)
  (let ((entry (elfeed-search-selected :single)))
   (when entry
     (message "Opening video")
     (async-shell-command (format "%s '%s'"
                                   mpv-path
                                   (elfeed-entry-link entry))))))

; mpv keymaps
(define-key elfeed-search-mode-map (kbd "x") 'elfeed-search-mpv)
(define-key elfeed-show-mode-map (kbd "x") 'elfeed-show-mpv)

; elfeed search filter 
(setq-default elfeed-search-filter "@1-week-ago +unread")

; mark all as read
(defun elfeed-mark-all-as-read ()
      (interactive)
      (mark-whole-buffer)
      (elfeed-search-untag-all-unread))
      
(define-key elfeed-search-mode-map (kbd "R") 'elfeed-mark-all-as-read)

(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)

; ob-async
(require 'ob-async)
