#lang racket


(require "TDA_pixel.rkt")

(provide pixrgb-d)
(provide get_type)
(provide get_x_rgb)
(provide get_y_rgb)
(provide get_r)
(provide get_g)
(provide get_b)
(provide get_d_rgb)
(provide pixmap?)
(provide replace_x_rgb)
(provide replace_y_rgb)


;constructor
(define (pixrgb-d pos_x pos_y r g b d)
  (list pos_x pos_y r g b d))





; selectores

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

;modificadores

(define (replace_x_rgb px x)
  (pixrgb-d (get_type px) x (get_y_rgb px) (get_r px) (get_g px) (get_b px) (get_d_rgb px)))
(define (replace_y_rgb px y)
  (pixrgb-d (get_type px) (get_x_rgb px) y (get_r px) (get_g px) (get_b px) (get_d_rgb px)))
