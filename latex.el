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

;; UNFINISHED
(defun latex-poly (coeffs vars &optional ascending)
  "Function to construct LaTeX code to display a polynomial function. This 
function will not insert math mode symbols.

The argument coeffs is the coefficients of the polynomial. 

The optional argument vars is a list containing the variables used in
the polynomial. vars can have 0, 1, or 2 elements. If vars is empty, 
the variable is assumed to be x.

Enter t for the optional argument ascending to list the powers of the 
variable in ascending order. "

  ; Construct the polynomial
  (while (car coeffs)
    (insert (number-to-string (car coeffs)))
    (setq coeffs (cdr coeffs)))
  )




(defun poly-vars (deg var)
  "Helper function to produce LaTeX code for 
polynomials. Function produces a list of the 
variable var in descending order starting with 
deg. deg needs to be a positive integer and var
needs to be a string. A list of strings is returned."
  (cond ((= deg 1) (cons var (cons "" nil)))
	(t (cons (concat var "^\{" (number-to-string deg) "\}") (geo-series (- deg 1) var)))))


(defun concat-elem (x y)
  "A function to concatenate the elements of x and y pair-wise.
The lists x and y need to be lists of strings, but need not
be the same length."
  (cond ((or (car x) (car y)) (cons (concat (car x) (car y)) (concat-elem (cdr x) (cdr y))))
	(t nil)))
