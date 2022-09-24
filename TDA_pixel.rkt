#lang racket

(provide (all-defined-out))


(define pixtest '("pixbit-d" 0 0 0 1))
(define pixtest2 '("pixrgb-d" 0 0 0 0 0 0))
(define pixtest3 '("pixhex-d" 0 0 0 0))


; selectores
(define (get_type pix)
  (first pix))
(define (get_x pix)
  (second pix))
(define (get_y pix)
  (third pix))

; modificadores
(define (replace_x px x)
  (append (list (get_type px) x) (cddr px)))

(define (replace_y px y)
  (append (list (get_type px) (get_x px) y)  (cdddr px)))


