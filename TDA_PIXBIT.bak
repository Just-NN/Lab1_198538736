#lang racket


(provide (all-defined-out))


(define (bitmap? pix)
  (if (eq? "pixbit-d" (car pix)) #t #f))

(define (pixmap? pix)
  (if (eq? "pixrgb-d" (car pix))#t #f))

(define (hexmap? pix)
  (if (eq? "pixhex-d" (car pix))#t #f))



(define (image w h . pix) (list pix))