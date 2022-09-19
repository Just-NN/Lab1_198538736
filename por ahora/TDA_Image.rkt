#lang racket
;; TDA image

(require "TDA_PIXBIT.rkt")

;; image - constructor
;; Nombre:  image
;; Dominio: Width (int) X Height (int) X [pixbit-d* |  pixrgb-d* |  pixhex-d*]
;; Recorrido:  image
;; Descripción: Crea una matriz de ancho width, largo height y de tipo pixbit|pixrgb-d|pixhex-d

(define (image Width Height . pix)
  (cond
    [(bitmap? (list pix)) ; debo crear la lista antes
     (bitwrap Height Height Width Width (list pix))]
    ))



;;
;; Nombre: bitmap
;; Dominio: Width (int) X Height (int) X pixbit-d
;; Recorrido: image
;; Descripción: crea una image de manera recursiva



;;
;; Nombre: bitmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un bitmap-d




;;
;; Nombre: pixmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un pixmap-d



;;
;; Nombre: hexmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un hexmap-d


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

(define (flipH map)
  (if (null? map) map
      (cons (cons (car (car map)) (reverse (car (cdr map)))) (flipH cdr map))))



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