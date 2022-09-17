#lang racket


(require "TDA_pixel.rkt")

(provide pixhex-d)
(provide get_x_hex)
(provide get_y_hex)
(provide get_hex)
(provide get_d_hex)
(provide hexmap?)


; constructor de pixhex-d
; Dominio: pos_x (int) X 

(define (pixhex-d pos_x pos_y hex d)
  (list pos_x pos_y hex d))


; selectores de pixhex


(define (get_x_hex pix)
  (second pix))
(define (get_y_hex pix)
  (third pix))
(define (get_hex pix)
  (fourth pix))
(define (get_d_hex pix)
  (fifth pix))


(define (hexmap? pix)
  (if (eq? (get_type pix) "pixhex-d") #t #f))

;modificadores

(define (replace_x_hex px x)
  (pixhex-d (get_type px) x (get_y_hex px) (get_hex px) (get_d_hex px)))

(define (replace_y_hex px y)
  (pixhex-d (get_type px) (get_x_hex px) y (get_hex px) (get_d_hex px)))
