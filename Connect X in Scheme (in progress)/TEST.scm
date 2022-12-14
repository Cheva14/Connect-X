(require 'list-lib)


(define (update-map key value map)

  (reverse (fold 
    (lambda (item partial)
      (if (equal? (car item) key)
        (cons (list key value) partial)
        (cons item partial)
      )
    )
    '()
    map
  ))
)
(display (update-map 'Germany 'Berlin '((Germany Bonn) (France Paris) (Poland Warsaw))))
;should return '((Germany Berlin) (France Paris) (Poland Warsaw))
(newline)
(display (update-map 'Mexico 'Warsaw '((Germany Berlin) (France Paris) (Poland Krakow))))
;should return '((Germany Berlin) (France Paris) (Poland Warsaw))
(newline)

; (define (last-occurrence key value)
;   (if (null? (fold 
;   (lambda (item partial)
;     (if (equal? (car item) key)
;       (cons (cdr item) partial)
;       ()
;     )
;   )
;   '()
;   value
; ))
;     '() 
;   (car(car(fold 
;   (lambda (item partial)
;     (if (equal? (car item) key)
;       (cons (cdr item) partial)
;       ()
;     )
;   )
;   '()
;   value
; )))
;   )
; )

(define (last-occurrence key value)

(fold 
  (lambda (item partial)
    (if (equal? (car item) key)
      (cons (cdr item) partial)
      ()
    )
  )
  '()
  value
))

(display (last-occurrence 'Germany '((Germany Bonn) (Germany Berlin))))
;should return 'Berlin
(newline)
(display (last-occurrence 'Poland '((France Paris) (Poland Bonn) (Germany Berlin))))
;should return '()
(newline)
(display (last-occurrence 'Poland '()))
;should return '()
(newline)
(display (last-occurrence 'Germany '((Germany Lansing) (Test Cheva))))
;FAILED Two items found first Expected Lansing observed ()
(newline)
