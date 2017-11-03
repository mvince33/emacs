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
(load-file "/home/work/Dropbox/questbank.el")

;; ------------------
;; Custom Keybindings
;; ------------------

(defun insert-brackets ()
  "Function to insert square brackets, and 
move the point inside the brackets."
  (interactive)
  (insert "[]")
  (backward-char))

;; Set a key binding for insert-brackets function.
(global-set-key (kbd "C-c b") 'insert-brackets)

(defun insert-curly-braces ()
  "Function to insert curly braces, and 
move the point inside the braces."
  (interactive)
  (insert "{}")
  (backward-char))

;; Set a key binding for insert-curly-braces function.
(global-set-key (kbd "C-c c") 'insert-curly-braces)

(defun insert-parens ()
  "Function to insert parantheses, and 
move the point inside the braces."
  (interactive)
  (insert "()")
  (backward-char))

;; Set a key binding for insert-curly-braces function.
(global-set-key (kbd "C-c p") 'insert-parens)



;; ---------------
;; LaTeX functions
;; ---------------

(defun pgf-setup ()
  "Setup a minimal pgfplots template"
  (interactive)
  (insert "  \\begin{tikzpicture} \n")
  (insert "    \\begin{axis}[ \n")
  (insert "      grid = both,  \n")
  (insert "      axis lines = center, \n") 
  (insert "      xmin = -8.6, xmax = 8.6, \n")
  (insert "      ymin = -8.6, ymax = 8.6, \n")
  (insert "      xtick={-8, -4, ..., 8}, \n")
  (insert "      ytick={-8, -4, ..., 8}, \n")
  (insert "      minor tick num = 3] \n \n")
  (insert "    \\addplot[samples = 101, \n")
  (insert "              domain = -7.5:7.5, \n")
  (insert "              thick, \n")
  (insert "               <->] \n")
  (insert "    {}; \n")
  (insert "    \\end{axis} \n")
  (insert "  \\end{tikzpicture} \n"))

(defun add-quest ()
  "Function to insert a comment and markup for a new 
question in the question environment for the exam class."
  (interactive)
  (insert "  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% New Question")
  (insert " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \n \n ")
  (insert " \\question \n ")
  (backward-char 2))



;; --------------
;; Math functions
;; --------------

;; Needs to be fixed. Function does not behave as
;; specified in the help comments.
(defun rand ()
  "Function to return pseudo-random numbers 
between 0 and 1 inclusive."
  (interactive)
  ; Generate a random nonnegative integer and scale it 
  ; so that we return a float between 0 and 1.
  (/ (float (+ (random (- most-positive-fixnum 1)) 1)) (float most-positive-fixnum)))

(defun rand-non-zero-int (limit)
  "Function to generate a random integer on the 
interval [-limit, limit]."
  (interactive "p")
  (let (num)
    (setq num (+ (random limit) 1))
    (if (< (rand) 0.5) (setq num (* -1 num)) num)
    (insert (number-to-string num))))

(defun gcd (a b)
  "Function to compute the greatest
common divisor for integers a and b."
  ; We require the first argumnet to be the larger one.
  (if (< a b) (gcd b a))
  ; The Euclidean Algorithm.
  (if (= b 0) a (gcd b (mod a b))))
