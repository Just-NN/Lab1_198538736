#lang racket


(require "TDA_pixmap.rkt")
(require "TDA_bitmap.rkt")
(require "TDA_hexmap.rkt")


; probar con (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1))

(define (image Width Height . pix)
  (list Width Height pix))

; se prueba y se guarda para probar en el futuro

(define test (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1)))
(define test2 (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) ))


; compressed?

(define (compressed? p)
  (if (= (* (car p) (cadr p)) (contar (caddr p) 0)) #f #t))

(define (contar l contador)
  (if (null? l) contador
      (contar (cdr l) (+ contador 1))))