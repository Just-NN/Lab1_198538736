#lang racket



(define (image H W . pix)pix)

(define (pixbit-d . pix)
  (list pix))

(define (bitmap? pix)
  (if (eq? "pixbit-d" (car (car pix)))#t #f))

(define (pixmap? pix)
  (if (eq? "pixbrgb-d" (car (car pix)))#t #f))

(define (hexmap? pix)
  (if (eq? "pixhex-d" (car (car pix)))#t #f))

(define (change h w l)
  (define (change2 h h2 w l aux)
    (if (= w 0) aux
        (if (= h 0) (change2 h2 h2 (- w 1) l aux)
            (change2 (- h 1) h2 w (cdr l) (cons (car l) aux)))))
  (change2 h h w l '()))

(define (move a b)
  (if (null? a) b
      (move (cdr a) (cons (list b) (car a)))))


        