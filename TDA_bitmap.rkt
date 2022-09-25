#lang racket

(require "TDA_pixel.rkt")

(provide (all-defined-out))


; pixel de prueba



; pixbit-d consistirá en id posx posy bit(0|1) depth

(define (pixbit-d pos_x pos_y bit depth)
  (list "pixbit-d" pos_x pos_y bit depth))



(define (get_bit pix)
  (fourth pix))
(define (get_depth_bit pix)
  (fifth pix))

; predicado
(define (bitmapp? pix)
  (if(eq? (get_type pix) "pixbit-d") #t #f))

