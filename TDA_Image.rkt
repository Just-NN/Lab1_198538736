#lang racket


(require "TDA_pixmap.rkt")
(require "TDA_bitmap.rkt")
(require "TDA_hexmap.rkt")
(require "TDA_pixel.rkt")


; probar con (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1))

(define (image Width Height . pix)
  (list Width Height pix))



; selectores
(define (get_h img)
  (car img))
(define (get_w img)
  (cadr img))
(define (get_pixlist img)
  (caddr img))

; se prueba y se guarda para probar en el futuro

(define test (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1)))
(define test2 (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) ))
(define testhex (image 2 2 pixtest3 pixtest3 pixtest3 pixtest3))
(define testrgb (image 2 2 pixtest2 pixtest2 pixtest2 pixtest2))



; predicados
(define (bitmap? img)
  (bitmapp? (car (get_pixlist img))))
(define (hexmap? img)
  (hexmapp? (car (get_pixlist img))))
(define (pixmap? img)
  (pixmapp? (car (get_pixlist img))))

; compressed?

(define (compressed? p)
  (if (= (* (car p) (cadr p)) (contar (caddr p) 0)) #f #t))

(define (contar l contador)
  (if (null? l) contador
      (contar (cdr l) (+ contador 1))))

; flipH




(define (flipH img)
  (define (flipHH W W2 pixlist aux)
    (if (null? pixlist) (image (get_h img) (get_w img) (reverse aux))
        (if (= W -1) (flipHH W2 W2 pixlist aux)
            (flipHH (- W 1) W2 (cdr pixlist) (cons (replace_x (car pixlist) W) aux)))))
    (flipHH (- (get_w img) 1) (- (get_w img) 1) (get_pixlist img) '()))

(define (flipV img)
  (define (flipVV H H2 pixlist aux)
    (if (null? pixlist) (image (get_h img) (get_w img) (reverse aux))
        (if (= H -1) (flipVV H2 H2 pixlist aux)
            (flipVV (- H 1) H2 (cdr pixlist) (cons (replace_y (car pixlist) H) aux)))))
    (flipVV (- (get_w img) 1) (- (get_w img) 1) (get_pixlist img) '()))



;(flipo 2 (get_pixlist test) '())
;(flipH test)
(display "------------\n")
(flipH testhex)
(display "------------\n")
(flipH testrgb)
(display "------------\n")
(flipV testrgb)
