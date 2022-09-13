#lang racket
;; TDA image



;; image - constructor
;; Nombre:  image
;; Dominio: Width (int) X Height (int) X [pixbit-d* |  pixrgb-d* |  pixhex-d*]
;; Recorrido:  image
;; Descripción: Crea una matriz de ancho width, largo height y de tipo pixbit|pixrgb-d|pixhex-d

(define (image Width Height . pix)
  (cond
    [(bitmap? (car pix))
     (bitwrap Height Height Width Width pix)]
    [(pixmap? (car pix))
     (bitwrap Height Height Width Width pix)]
    [(hexmap? (car pix))
     (bitwrap Height Height Width Width pix)]))



;;
;; Nombre: bitmap
;; Dominio: Width (int) X Height (int) X pixbit-d
;; Recorrido: image
;; Descripción: crea una image de manera recursiva

(define (bitwrap Height Width pixbit-d)
  (define (bitmap Height1 Height2 Width1 Width2 pixbit-d column map)
    (if
      (and (not(> Height1 0)) (not(> Width1 0))) map
      (if
        (> Height1 0) (bitmap (- Height1 1) Height2 Width1 Width2 (cdr pixbit-d) (cons column (car pixbit-d)) map)
        (bitmap (Height2) Height2 (- Width1 1) Width2 (cdr pixbit-d) '() (cons map column)))))
  (bitmap Height Height Width Width pixbit-d '() '()))




;;
;; Nombre: bitmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un bitmap-d

(define (bitmap? pix)
  (if (eq? "pixbit-d" pix)#t
      (#f)))


;;
;; Nombre: pixmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un pixmap-d

(define (pixmap? pix)
  (if (eq? "pixrgb-d" pix)#t
      (#f)))

;;
;; Nombre: hexmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un hexmap-d
(define (hexmap? pix)
  (if (eq? "pixhex-d" pix)#t
      (#f)))


;;
;; Nombre: compressed?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen está comprimida


;;
;; Nombre: flipH
;; Dominio: image
;; Recorrido: image
;; Descripción: permite invertir una imagen horizontalmente


;;
;; Nombre: flipV
;; Dominio: image
;; Recorrido: image
;; Descripción: permite invertir una imagen verticalmente


;;
;; Nombre: crop
;; Dominio: image X x1 (int) X y1 (int) X x2 (int) X y2 (int)
;; Recorrido: image
;; Descripción: permite recortar una imagen a partir de un cuadrante


;;
;; Nombre: imgRGB->imgHex
;; Dominio: image
;; Recorrido: image
;; Descripción: permite transformar una imagen desde RGB a HEX


;; este se debe mover al otro archivo de tda
;; Nombre: histogram
;; Dominio: image
;; Recorrido: histogram
;; Descripción: crea un histogram y lo muestra


;;------------------- Separaré hasta acá mientras tanto -----------------------------------------