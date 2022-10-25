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
(display (update-map 'Poland 'Warsaw '((Germany Berlin) (France Paris) (Poland Krakow))))
;should return '((Germany Berlin) (France Paris) (Poland Warsaw))
