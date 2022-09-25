#lang racket
(define wea (list 1 2 3 4 6 5656 1 3 4 1))

(define (filtro a lista output)
  (if (null? lista) (reverse output)
      (if (eq? a (car lista)) (filtro a (cdr lista) (cons a output))
          (filtro a (cdr lista) output))))

(length (filtro (car wea) wea '()))

(define (clean-list a lista)
  (remove* (filtro a lista '()) lista))

(define (filter-loop lista output)
  (if (null? lista) output
      (filter-loop (clean-list (car lista) lista) (cons  (cons (car lista) (length (filtro (car lista) lista '()))) output))))
(display wea)
(display "\n")
(filter-loop wea '())