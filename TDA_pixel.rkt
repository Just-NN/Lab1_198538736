#lang racket




(provide (all-defined-out))


(define pixtest '("pixbit-d" 0 0 0 1))
(define pixtest2 '("pixrgb-d" 0 0 255 3 16 0))
(define pixtest3 '("pixhex-d" 0 0 "#FF00C0" 0))


; selectores
(define (get_type pix)
  (first pix))
(define (get_x pix)
  (second pix))
(define (get_y pix)
  (third pix))
(define (get_values pix)
  (cond
    [(or (eq? (get_type pix) "pixbit-d") (eq? (get_type pix) "pixhex-d")) (list (cadddr pix))]
    [(eq? (get_type pix) "pixrgb-d") (get_eregebe pix)]))


; modificadores
(define (replace_x px x)
  (append (list (get_type px) x) (cddr px)))

(define (replace_y px y)
  (append (list (get_type px) (get_x px) y)  (cdddr px)))


;; otro
(define (get_a pix)
  (fourth pix))
(define (get_e pix)
  (fifth pix))
(define (get_i pix)
  (sixth pix))


(define (get_eregebe pix)
  (list (get_a pix) (get_e pix) (get_i pix)))


;(get_values pixtest)
;(get_values pixtest2)
;(get_values pixtest3)