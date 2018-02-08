;; --------------
;; Math functions
;; --------------


(defun rand ()
  "Function to return pseudo-random numbers 
between 0 inclusive, and 1 exclusive"
  (interactive)
  ; Generate a random nonnegative integer and scale it 
  ; so that we return a float on the interval [0,1).
  (/ (float (random most-positive-fixnum)) (float most-positive-fixnum)))


  
(defun rand-non-zero-int (limit)
  "Function to generate a random integer on the 
interval [-limit, limit]."
  (interactive "p")
  (let (num)
    (setq num (+ (random limit) 1))
    (if (< (rand) 0.5) (setq num (* -1 num)) num)))



(defun gcd (a b)
  "Function to compute the greatest
common divisor for integers a and b."
  ; We require the first argumnet to be the larger one.
  (if (< a b) (gcd b a))
  ; The Euclidean Algorithm.
  (if (= b 0) a (gcd b (mod a b))))

;; INCOMPLETE
(defun sieve-eratosthenes (n)
  "Function to find all prime numbers up to n."
  (interactive "p")
  (setq primes (number-sequence 2 n))
  (setq markers (cons t (make-list (- n 1) nil))))



(defun multiplication-table (symbols)
  "Function to produce LaTeX code for a multiplication table using the 
list symbols. The base will be the number of symbols in the list. The 
first symmbol reprents 0, the second represents 1, and so on and so forth."
  ; Initialize the table
  (insert "\n\\begin{tabular}")
  ; Set the indexing list and use it to determine the size of the table.
  (setq n (cdr symbols))
  (insert "{|c||")
  (while n
    (insert "c|")
    (setq n (cdr n)))
  (insert "c|}\n")
  (insert "  \\hline\n")

  ; Build the first row of the table.
  (insert "  \$ \\times \$ \& ")
  (setq n (cdr symbols))
  (while n
    (insert (car n) " \& ")
    (setq n (cdr n)))
  ; Finish the first row.
  (insert (cadr symbols)  (car symbols))
  (insert "  \\\\\n  \\hline\n  \\hline\n")

  ; Set the base of the number system
  (setq base (length symbols))

  ; Build the multiplication table by row.
  (setq row 1)
  (while (< row (length symbols))
    (setq col 1)
    (setq num row)
    (insert "  " (car (nthcdr row symbols)) " & ")
    (while (< col (length symbols))
      (if (> (/ num base) 0) (insert (car (nthcdr (/ num base) symbols))))
      (insert (car (nthcdr (% num base) symbols)))
      (insert " \& ")
      (setq col (+ 1 col))
      (setq num (+ num row))
    )
    (insert (car (nthcdr row symbols)) (car symbols))
    (insert " \\\\\n")
    (insert "  \\hline\n")
    (setq row (+ 1 row))
    )

  ; Build the last row
  (insert "  " (car (cdr symbols)) (car symbols) " \& ")
  (setq col 1)
  (while (< col (length symbols))
    (insert (car (nthcdr col symbols)) (car symbols) " \& ") 
    (setq col (+ 1 col)))
  (insert (car (cdr symbols)) (car symbols) (car symbols) "\\\\\n  \\hline")

  ; Close the table
  (insert "\n\\end{tabular}")
  )
