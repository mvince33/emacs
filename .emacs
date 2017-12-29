;; .emacs


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-via-dvips-ps2pdf t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(diff-switches "-u")
 '(package-selected-packages (quote (auctex))))

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Have flyspell mode on by default for latex.
(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)

;; Load question bank for writing exams.
(add-to-list 'load-path "/home/work/.emacs.d/elisp")
(load-file "questbank.el")
(load-file "math.el")
(load-file "keybindings.el")
(load-file "latex.el")
