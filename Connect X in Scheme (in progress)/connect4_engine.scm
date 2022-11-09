(import (srfi 1))

;==========================================================
;                     Cheva's Library
;==========================================================
(define (my-list n)
  (define (build-list m)
    (cond ((<= m 2) '())
          (else (cons (- m 1)
                      (build-list (- m 1))
                )
          )
    )
  )
  (let ((matrix (reverse (build-list n))))
    (number-to-dot matrix)
  )
)
(define (split-by lst n)
(if (not (null? lst))
    (cons (take lst n) (split-by (drop lst n) n))
    '() )
)
(define (display-list lst)
  (for-each
    (lambda (i) (display i) (display " "))
    lst
  )
)
(define (letters c) ;return a list with c letters in it.
  (take '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) c)
)
(define (matrix size c)
  (for-each
    (lambda (i) (display-list i) (newline))
    (split-by (my-list size) c)
  )
)
(define (number-to-dot lst)
  (list-with lst 3 "\.")
)
(define (list-with lst idx val)
(if (null? lst)
  lst
  (cons
    val
    (list-with (cdr lst) (- idx 1) val))))

;==========================================================
;==========================================================

; set the right columns/rows/win-cond depending on user input
(define (start-game r c w)
  (board r c)
  (loop)
  (define (loop) 
    (choose)
    (board r c)
    (cond
      ((check "1") (display "Congratulations, Player 1. You win.\n"))
      ((check "2") (display "Congratulations, Player 2. You win.\n"))
     (else(display "call the loop again")) ;replace this line with (loop)
    )
  ) 
  (newline)
)


; function to print in terminal the board and its values
(define (board r c)
  (let ((size (+ (* r c) 2)))
    ;(display "\nA B C D E F G\n")
    (display-list (letters c))
    (newline)
    (matrix size c)

  )
)

; check for user input column is valid
(define (choose)
  (display "ask for input of player")
  (newline)
  (fill_bin)
)
; fill board with user input if input was valid
(define (fill_bin)
  (display "fill the bin with input")
  (newline)
)

;check for a winner
(define (check str)
  (string=? str "3")
)
