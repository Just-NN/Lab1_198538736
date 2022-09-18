#lang racket


(require "TDA_pixmap.rkt")
(require "TDA_bitmap.rkt")
(require "TDA_hexmap.rkt")
(require "TDA_pixel.rkt")


; probar con (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1))


;; image - constructor
;; Nombre:  image
;; Dominio: Width (int) X Height (int) X [pixbit-d* |  pixrgb-d* |  pixhex-d*]
;; Recorrido:  image
;; Descripción: Crea una lista con el ancho, largo y una lista de pixeles 

(define (image Width Height . pix)
  (list Width Height pix))



; selectores

(define (get_w img)
  (car img))
(define (get_h img)
  (cadr img))
(define (get_pixlist img)
  (caddr img))

; se prueba y se guarda para probar en el futuro

(define test (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1)))
(define test2 (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) ))
(define testhex (image 2 2 pixtest3 pixtest3 pixtest3 pixtest3))
(define testrgb (image 2 2 pixtest2 pixtest2 pixtest2 pixtest2))



; predicados

;;
;; Nombre: bitmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un bitmap-d

(define (bitmap? img)
  (bitmapp? (car (get_pixlist img))))

;;
;; Nombre: pixmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un pixmap-d

(define (hexmap? img)
  (hexmapp? (car (get_pixlist img))))

;;
;; Nombre: hexmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un hexmap-d

(define (pixmap? img)
  (pixmapp? (car (get_pixlist img))))

;;
;; Nombre: compressed?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen está comprimida a partir de la cantidad de elementos que
;; debiera tener según filas*columnas y la que realmente tiene

(define (compressed? p)
  (if (= (* (car p) (cadr p)) (contar (caddr p) 0)) #f #t))

(define (contar l contador)
  (if (null? l) contador
      (contar (cdr l) (+ contador 1))))

;;
;; Nombre: flipH
;; Dominio: image
;; Recorrido: image
;; Descripción: permite invertir una imagen horizontalmente cambiando los valores x de cada pixel

(define (flipH img)
  (define (flipHH W W2 pixlist aux)
    (if (null? pixlist) (image (get_h img) (get_w img) (reverse aux))
        (if (= W -1) (flipHH W2 W2 pixlist aux)
            (flipHH (- W 1) W2 (cdr pixlist) (cons (replace_x (car pixlist) W) aux)))))
    (flipHH (- (get_w img) 1) (- (get_w img) 1) (get_pixlist img) '()))

;;
;; Nombre: flipV
;; Dominio: image
;; Recorrido: image
;; Descripción: permite invertir una imagen verticalmente los valores y de cada pixel

(define (flipV img)
  (define (flipVV H H2 pixlist aux)
    (if (null? pixlist) (image (get_h img) (get_w img) (reverse aux))
        (if (= H -1) (flipVV H2 H2 pixlist aux)
            (flipVV (- H 1) H2 (cdr pixlist) (cons (replace_y (car pixlist) H) aux)))))
    (flipVV (- (get_w img) 1) (- (get_w img) 1) (get_pixlist img) '()))



;(flipo 2 (get_pixlist test) '())
;(flipH test)
;(display "------------\n")
;(flipH testhex)
;(display "------------\n")
;(flipH testrgb)
;(display "------------\n")
;(flipV test)
;(display "------------\n")
;(flipV testhex)
;(display "------------\n")
;(flipV testrgb)
;(display "------------\n")



(define (dentro_x? p x1 x2)
  (if (or (and (> (get_x p) x1) (< (get_x p) x2))
          (or (= (get_x p) x1) (= (get_x p) x2))) #t #f))
(define (dentro_y? p x1 x2)
  (if (or (and (> (get_y p) x1) (< (get_y p) x2))
          (or (= (get_y p) x1) (= (get_y p) x2))) #t #f))
(display "\n---\n")
(dentro_x? (car (get_pixlist test)) 1 1)
(display "\n---\n")

;;
;; Nombre: crop
;; Dominio: image X x1 (int) X y1 (int) X x2 (int) X y2 (int)
;; Recorrido: image
;; Descripción: permite recortar una imagen a partir de 2 coordenadas, entregando una imagen con su lista de pixeles recortada
;; conteniendo sólo los pixeles dentro de los valores solicitados

(define (crop img x1 y1 x2 y2)
  (define (cropaux x1 y1 x2 y2 pl aux)
    (if (null? pl) (image (get_w img) (get_h img) (reverse aux))
        (if (and (dentro_x? (car pl) x1 x2) (dentro_y? (car pl) y1 y2)) (cropaux x1 y1 x2 y2 (cdr pl) (cons (car pl) aux))
            (cropaux x1 y1 x2 y2 (cdr pl) aux))))
  (cropaux x1 y1 x2 y2 (get_pixlist img) '()))

;(display (get_pixlist test))
;(display "\n---\n")
(crop test 0 0 1 0)
