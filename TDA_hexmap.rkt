#lang racket


(require "TDA_pixel.rkt")

(provide (all-defined-out))


; constructor de pixhex-d
; Dominio: pos_x (int) X 

(define (pixhex-d pos_x pos_y hex d)
  (list "pixhex-d" pos_x pos_y hex d))


; selectores de pixhex


(define (get_hex pix)
  (fourth pix))
(define (get_d_hex pix)
  (fifth pix))


(define (hexmapp? pix)
  (if (eq? (get_type pix) "pixhex-d") #t #f))

