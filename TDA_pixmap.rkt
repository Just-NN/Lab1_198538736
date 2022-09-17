#lang racket


(require "TDA_pixel.rkt")

(provide pixrgb-d)
(provide get_type)
(provide get_r)
(provide get_g)
(provide get_b)
(provide get_d_rgb)
(provide pixmapp?)
(provide replace_x_rgb)
(provide replace_y_rgb)




;constructor
(define (pixrgb-d id pos_x pos_y r g b d)
  (list id pos_x pos_y r g b d))





; selectores

(define (get_r pix)
  (fourth pix))
(define (get_g pix)
  (fifth pix))
(define (get_b pix)
  (sixth pix))
(define (get_d_rgb pix)
  (seventh pix))

(define (pixmapp? pix)
  (if (eq? (get_type pix) "pixrgb-d") #t #f))

;modificadores

(define (replace_x_rgb px x)
  (pixrgb-d (get_type px) x (get_y px) (get_r px) (get_g px) (get_b px) (get_d_rgb px)))
(define (replace_y_rgb px y)
  (pixrgb-d (get_type px) (get_x px) y (get_r px) (get_g px) (get_b px) (get_d_rgb px)))

