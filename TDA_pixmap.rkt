#lang racket


(require "TDA_pixel.rkt")
(require "TDA_hexmap.rkt")

(provide (all-defined-out))






;constructor
(define (pixrgb-d pos_x pos_y r g b d)
  (list "pixrgb-d" pos_x pos_y r g b d))





; selectores



(define (get_r pix)
  (fourth pix))
(define (get_g pix)
  (fifth pix))
(define (get_b pix)
  (sixth pix))
(define (get_d_rgb pix)
  (seventh pix))


(define (get_rgb pix)
  (list (get_r pix) (get_g pix) (get_b pix)))

(define (pixmapp? pix)
  (if (eq? (get_type pix) "pixrgb-d") #t #f))

;modificadores

(define (replace_x_rgb px x)
  (pixrgb-d (get_type px) x (get_y px) (get_r px) (get_g px) (get_b px) (get_d_rgb px)))
(define (replace_y_rgb px y)
  (pixrgb-d (get_type px) (get_x px) y (get_r px) (get_g px) (get_b px) (get_d_rgb px)))

;(define (pixRGB->pixHEX px)
;  ())



(define (divhex a)
  (/ a 16.0))

(define (to_int a)
  (exact-floor a))

(define (to_decimal a)
  (if (> 1 a) a
      (to_decimal (- a 1))))

(define (abcdef a)
  (cond
    [(= a 10) "A"]
    [(= a 11) "B"]
    [(= a 12) "C"]
    [(= a 13) "D"]
    [(= a 14) "E"]
    [(= a 15) "F"]
    [else null]))

(define (dec_to_int a)
  (to_int (* a 16)))

(define (str_abc a hex)
  (string-append hex (abcdef (to_int (divhex a)))))

(define (str_num a hex)
  (~a hex a))

(define (conversor_elemento a)
  (if (= (to_int a) 0) "0"
      (caja_negra a "")))

(define (conversion_de_pares a hx)
  (string-append (conversor_elemento (to_int (divhex a))) (conversor_elemento (dec_to_int (to_decimal (divhex a))))))


(define (caja_negra a hex)
  (if (< a 10) (str_num a hex)
      (str_abc (dec_to_int a) hex)))



(define (wrap_rgb_to rgb)
  (define (rgb_to_hex rgb hex)
    (if (null? rgb)
        hex
        (rgb_to_hex (cdr rgb) (string-append hex (conversion_de_pares (car rgb) "")))))
  (rgb_to_hex rgb "#"))


(define (pix-rgb-to-hex pixrgb)
  (pixhex-d (cadr pixrgb) (caddr pixrgb) (wrap_rgb_to (get_rgb pixrgb)) (seventh pixrgb)))
(pix-rgb-to-hex pixtest2)

(define weaita (list pixtest2 pixtest2 pixtest2 pixtest2))

(define (convertir_lista lista aux)
  (if (null? lista) (reverse aux)
      (convertir_lista (cdr lista) (cons (pix-rgb-to-hex (car lista)) aux))))



;(define wea '(pixtest2 pixtest2 pixtest2 pixtest2))
;(map pix-rgb-to-hex wea)






