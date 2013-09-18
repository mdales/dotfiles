
;; --- General Settings -------------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(line-number-mode 't)
(column-number-mode 't)               ;;; Sometimes handy
(setq make-backup-files nil)

(set-face-attribute 'default nil :family "Inconsolata")
(set-face-attribute 'default nil :height 125)
(load-theme 'solarized-dark t)

(tool-bar-mode -1)

(setq transient-mark-mode t)

(setq next-line-add-newlines nil)
(setq search-highlight t)
(setq auto-save-interval 0)        ;;; I hate NFS autosave on linux
(setq vc-follow-symlinks nil)      ;;; kill that damn annoying question


;;; Tabs vs spaces
(setq-default c-default-style "cc-mode"
              c-basic-offset 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
 (require 'cc-mode)
    (add-to-list 'c-mode-common-hook
      (lambda () (setq c-syntactic-indentation nil)))

(add-to-list 'load-path "/folder/containing/file")  ;; if it's not already in `load-path'
(require 'python)


;;; Turn those ~/.saves-* files off.  Takes too long over NFS
(setq auto-save-list-file-prefix nil)
(setq auto-save-list-file-name nil)

;;;
;;; Sensible buffer names 
;;; (adds part of dirname to keep buffer names unique rather than using
;;; Makefile<2> etc.)
;;;
(require 'uniquify)
(setq mnemonic-buffer-names t)
(setq minimum-buffer-name-dir-content 0)


;; --- Key Bindings -----------------------------------------------------------
(global-set-key "\C-xg" 'goto-line)




;; --- Various modes ----------------------------------------------------------
;;
(autoload 'python-mode "python-mode" "Python mode" 'interactive)
(autoload 'perl-mode   "perl-mode"   "Perl mode" 'interactive)
(autoload 'tcl-mode    "tcl-mode"    "TCL mode" 'interactive)


;(setq auto-mode-alist (cons '("\\.html$" . html-mode)   auto-mode-alist))
(setq auto-mode-alist (cons '("\\.dpl$"  . c-mode)      auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ih$"   . c-mode)      auto-mode-alist))
(setq auto-mode-alist (cons '("\\.txt$"  . text-mode)   auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tcl$"  . tcl-mode)    auto-mode-alist))
(setq auto-mode-alist (cons '("\\.itcl$" . tcl-mode)    auto-mode-alist))    
(setq auto-mode-alist (cons '("\\.pl$"   . perl-mode)   auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cls$"  . latex-mode)  auto-mode-alist))
(setq auto-mode-alist (cons '("\\.if$"   . middl-mode)  auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ps$"   . postscript-mode)  auto-mode-alist))
(setq auto-mode-alist (cons '("\\.py$"   . python-mode) auto-mode-alist))
(setq py-indent-offset 4)



;; --- Paren matching ---------------------------------------------------------
(make-face 'paren-mismatch)
(make-face 'paren-match)
(set-face-background 'paren-match "grey50")
(show-paren-mode 1)
(setq show-paren-face 'paren-match)
