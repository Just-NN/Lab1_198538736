#lang racket

(require "TDA_pixmap.rkt")

(provide pixbit-d)
(provide get_x_bit)
(provide get_y_bit)
(provide get_bit)
(provide get_depth_bit)
(provide bitmap?)

; pixbit-d consistirá en posx posy bit(0|1) depth

(define (pixbit-d pos_x pos_y bit depth)
  (list pos_x pos_y bit depth))


(define (get_x_bit pix)
  (second pix))
(define (get_y_bit pix)
  (third pix))
(define (get_bit pix)
  (fourth pix))
(define (get_depth_bit pix)
  (fifth pix))

(define (bitmap? pix)
  (if(eq? (get_type pix) "pixbit-d") #t #f))
(define (pixmap? pix)
  (if (eq? (get_type pix) "pixrgb-d") #t #f))
(define (hexmap? pix)
  (if (eq? (get_type pix) "pixhex-d") #t #f))

;(define (replace_x pixa pixb)
 ; (if (= (get_x_bit pixa) (get_x_bit pixb)) (pixbit-d "pixbit-d" (get_x_bit pixb) ))