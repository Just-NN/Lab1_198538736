#lang racket


(require "TDA_pixel.rkt")

(provide (all-defined-out))

;; Se define el TDA pixel para poder generalizar algunas funciones
;; que no varían entre los 3 casos o que, derechamente, los engloban
;; a los 3.
;;



;; constructor 

;;
;; Nombre: pixhex-d
;; Dominio: pos_x (int) X pos_y (int) X hex (string) X d (int)
;; Recorrido: pixhex-d
;; Descripción: Toma los elementos entregados y los enlista junto con el identificador adecuado ("pixhex-d") al inicio
;; Tipo de recursión: no tiene 

(define (pixhex-d pos_x pos_y hex d)
  (list "pixhex-d" pos_x pos_y hex d))


; selectores de pixhex


;;
;; Nombre: get_hex
;; Dominio:  pix (pixhex-d)
;; Recorrido: string
;; Descripción: Obtiene el valor hex (es un string) y lo retorna
;; Tipo de recursión: no tiene

(define (get_hex pix)
  (fourth pix))

;;
;; Nombre: get_d_hex
;; Dominio:  pix (pixhex-d)
;; Recorrido: int
;; Descripción: Toma un pixhex-d y retorna su profundidad
;; Tipo de recursión: mp toeme

(define (get_d_hex pix)
  (fifth pix))


; pertenencia

;;
;; Nombre: hexmapp?
;; Dominio:  pixhex-d
;; Recorrido: booleano
;; Descripción: Evalúa el identificador y retorna #t si es "pixhex-d", sino, #f
;; Tipo de recursión: no tiene

(define (hexmapp? pix)
  (if (equal? (get_type pix) "pixhex-d") #t #f))

