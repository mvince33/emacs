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
    (if (< (rand) 0.5) (setq num (* -1 num)) num)
    (insert (number-to-string num))))



(defun gcd (a b)
  "Function to compute the greatest
common divisor for integers a and b."
  ; We require the first argumnet to be the larger one.
  (if (< a b) (gcd b a))
  ; The Euclidean Algorithm.
  (if (= b 0) a (gcd b (mod a b))))
