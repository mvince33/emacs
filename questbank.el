;; Question bank 

;; This question bank is a collection 
;; of lisp functions to be used with 
;; with LaTeX's exam class. 

;; -----------------
;; Algebra Questions
;; -----------------

;; UNFINISHED
(defun lin-eqn-from-graph ()
  "Find the equation of the graph of a 
  random line."
  (interactive)
  
  ;; Write the question statement.
  (insert "  \\question[] What is the equation of the graph of the following line?")
  (insert "\n \n")

  ;; Draw the graph of the line.
  (insert "    \\begin{tikzpicture} \n")
  (insert "      \\begin{axis}[ \n")
  (insert "        grid = both, \n")
  (insert "        axis lines = center] \n \n")
  (insert "        \\addplot[samples = 101, thick, <->] {0}; \n")
  (insert "      \\end{axis} \n")
  (insert "    \\end{tikzpicture} \n")
  (insert "    \\vspace{96pt}"))

;; Unfinished
(defun solve-sys-int-sol ()
  "Solve a 2 x 2 system of equations with 
integer solutions."
  (interactive)
  (let (x y a b c d e f)
    ; Generate the solution to the system
    (setq x (+ 2 (random 7)))
    (setq y (+ 2 (random 7)))

    ; Generate the coefficients of the equations.
    (setq a (+ 2 (random 9)))
    (setq b (+ 2 (random 9)))
    (setq c (+ 2 (random 9)))
    (setq d (+ 2 (random 9)))
    
    ; Allow for the possibility for negative solutions 
    ; and coefficients
    (if (< 0.5 (rand)) (setq x (* -1 x)))
    (if (< 0.5 (rand)) (setq y (* -1 y)))
    (if (< 0.5 (rand)) (setq a (* -1 a)))
    (if (< 0.5 (rand)) (setq b (* -1 b)))
    (if (< 0.5 (rand)) (setq c (* -1 c)))
    (if (< 0.5 (rand)) (setq d (* -1 d)))

    ;; Generate the constants of the systems
    (setq e (+ (* a x) (* b y)))
    (setq f (+ (* c x) (* d y)))

    ;; Write the question statement
    (insert "Solve the following system of equations. \n \n")

    ;; Open math mode and the cases environment. White space
    ;; included for formatting purposes.
    (insert "    \\[ \\begin{cases} \n    ")

    ;; Display the system to solve.
    (insert (number-to-string a))
    (insert "x ")
))


(defun solve-fact-quad-level-2 ()
  "Solve a quadratic equation that factors into a monic binomial and
a non-monic binomial."
  (interactive)
  (let (a b c)
    ;; Generate the non-monic binomial.
    (setq a (+ 2 (random 4)))
    (setq b a)

    ;; Ensure that the monic results in a non-interger solution.
    (while (< 1 (gcd a b))
      (setq b (+ 1 (random 6))))

    ;; Generate the monic binomial
    (setq c (+ 1 (random 7)))

    ;; Make one of the solutions to the quadratic negative.
    (if (< (rand) 0.5) (setq b (* -1 b)) (setq c (* -1 c)))

    ;; Write the question statement.
    (insert "Solve the following quadratic equation. \n \n")

    ;; Open math mode and display the quadratic term.
    (insert "  \\[ ")
    (insert (number-to-string a))
    (insert "x^2 ")

    ;; Display the linear term.
    (if (< 0 (+ b (* a c))) (insert "- ") (insert "+ "))
    (insert (number-to-string (abs (+ b (* a c)))))
    (insert "x ")

    ;; Display the constant term
    (insert " - ")
    (insert (number-to-string (abs (* b c))))

    ;; Set quadratic equal to 0 and end math mode
    (insert " = 0 \\] \n \n")
    ))


;; --------------------
;; Calculus I Questions
;; --------------------

;; ---------------------
;; Calculus II Questions
;; ---------------------

;; ----------------------
;; Calculus III Questions
;; ----------------------

;; Unfinished
(defun angle-between-vectors ()
  "Find the angle between two vectors in R3"
  (interactive)

  ; Write the question statement
  (insert "  \\question[] Find an expression for the angle between the following two vectors. \n \n")
  (insert "    \\[ \\vec{a} = \\langle \\rangle \\]")
  (insert " \\quad \\vec{b} = \\langle \\rangle \\] \n"))
