#lang racket

(require "TDA_pixel.rkt")

(provide pixbit-d)

(provide get_bit)
(provide get_depth_bit)
(provide bitmapp?)



; pixel de prueba
(define pixtest '("pixbit-d" 0 0 0 1))


; pixbit-d consistirá en id posx posy bit(0|1) depth

(define (pixbit-d id pos_x pos_y bit depth)
  (list id pos_x pos_y bit depth))



(define (get_bit pix)
  (fourth pix))
(define (get_depth_bit pix)
  (fifth pix))

; predicado
(define (bitmapp? pix)
  (if(eq? (get_type pix) "pixbit-d") #t #f))

