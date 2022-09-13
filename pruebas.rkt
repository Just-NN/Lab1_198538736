#lang racket
(define lista '(1 2 3))
(define (sum lista)
  (if (null? lista)0
             (+ (car lista) (sum (cdr lista)))))

(define (sumacola l n)
  (if (null? l)0
      (+ (car l) (sumacola (cdr l) n))))

(define (sumapply l)
  (apply + l))
(define (sumapp l)
  (map add1 l))
(define (filtro l)
  (filter odd? l))

(define (mifiltro l)
  (if (odd? (car l))#t
      ()))