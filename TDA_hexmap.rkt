#lang racket


(require "TDA_pixel.rkt")

(provide pixhex-d)
(provide get_hex)
(provide get_d_hex)
(provide hexmapp?)



; constructor de pixhex-d
; Dominio: pos_x (int) X 

(define (pixhex-d id pos_x pos_y hex d)
  (list id pos_x pos_y hex d))


; selectores de pixhex


(define (get_hex pix)
  (fourth pix))
(define (get_d_hex pix)
  (fifth pix))


(define (hexmapp? pix)
  (if (eq? (get_type pix) "pixhex-d") #t #f))

