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

