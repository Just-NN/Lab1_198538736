#lang racket

(require "TDA_pixel.rkt")

(provide (all-defined-out))


;; Se define el TDA pixbit-d para utilizarlo en otras funciones mayores
;; puesto que este tipo de pixel es uno de los ejes del lab
;;
;;


;; constructor

;;
;; Nombre: pixbit-d
;; Dominio:  pos_x (int) X pos_y (int) X bit (0|1) X depth (int)
;; Recorrido: pixbit-d
;; Descripción: Recibe los valores y los enlista con su debido id ("pixbit-d") al inicio
;; Tipo de recursión: no tiene

(define (pixbit-d pos_x pos_y bit depth)
  (list "pixbit-d" pos_x pos_y bit depth))

;;
;; Nombre: get_bit
;; Dominio:  pix (pixbit-d)
;; Recorrido: 0|1
;; Descripción: toma un pixbit-d y retorna el valor de su bit
;; Tipo de recursión: no tiene

(define (get_bit pix)
  (fourth pix))

;;
;; Nombre: get_depth_bit
;; Dominio:  pix (pixbit-d)
;; Recorrido: int
;; Descripción: Toma un pixbit-d y retorna su profundidad
;; Tipo de recursión: no tiene

(define (get_depth_bit pix)
  (fifth pix))

; pertenencia

;;
;; Nombre: bitmapp?
;; Dominio:  pix (pixbit-d)
;; Recorrido: booleano
;; Descripción: Recibe un pixbit-d y retorna #t si get_type es igual a "pixbit-d", sino, #f
;; Tipo de recursión: 

(define (bitmapp? pix)
  (if(equal? (get_type pix) "pixbit-d") #t #f))

