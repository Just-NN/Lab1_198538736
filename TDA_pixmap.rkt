#lang racket

(provide pixrgb-d)
(provide get_type)
(provide get_x_rgb)
(provide get_y_rgb)
(provide get_r)
(provide get_g)
(provide get_b)
(provide get_d_rgb)
(provide pixmap?)


(define (pixrgb-d pos_x pos_y r g b d)
  (list pos_x pos_y r g b d))


(define (get_type pix)
  (first pix))
(define (get_x_rgb pix)
  (second pix))
(define (get_y_rgb pix)
  (third pix))
(define (get_r pix)
  (fourth pix))
(define (get_g pix)
  (fifth pix))
(define (get_b pix)
  (sixth pix))
(define (get_d_rgb pix)
  (seventh pix))

(define (pixmap? pix)
  (if (eq? (get_type pix) "pixrgb-d") #t #f))
  