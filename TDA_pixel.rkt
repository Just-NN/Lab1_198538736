#lang racket




(provide (all-defined-out))


;; Se define el TDA pixel para poder definir las funciones en común
;; que puedan existir entre los otros pixeles y, así, poder llevarlo
;; a las funciones principales del laboratorio
;;



; selectores

;;
;; Nombre: get_type
;; Dominio:  pix (pixbit-d|pixhex-d|pixrgb-d)
;; Recorrido: string
;; Descripción: Obtiene el tipo de pixel a partir de su primer elemento
;; Tipo de recursión: no tiene


(define (get_type pix)
  (first pix))

;; 
;; Nombre: get_x
;; Dominio:  pix (pixbit-d|pixhex-d|pixrgb-d)
;; Recorrido: int
;; Descripción: retorna el valor de pos_x del pixel
;; Tipo de recursión: no tiene


(define (get_x pix)
  (second pix))
;;
;; Nombre: get_y
;; Dominio:  pix (pixbit-d|pixhex-d|pixrgb-d)
;; Recorrido: int
;; Descripción: retorna el valor de pos_y del pixel
;; Tipo de recursión: no tiene


(define (get_y pix)
  (third pix))

;;
;; Nombre: get_values
;; Dominio:  pix (pixbit-d|pixhex-d|pixrgb-d)
;; Recorrido: int, string o lista de ints
;; Descripción: Retorna un valor o valores, dependiendo del caso para cada pixel
;; Tipo de recursión: no tiene


(define (get_values pix)
  (cond
    [(or (equal? (get_type pix) "pixbit-d") (equal? (get_type pix) "pixhex-d")) (list (fourth pix))]
    [(equal? (get_type pix) "pixrgb-d") (get_eregebe pix)]))


; modificadores

;;
;; Nombre: replace_x
;; Dominio:  px (pixbit-d|pixhex-d|pixrgb-d) X x (int)
;; Recorrido: (pixbit-d|pixhex-d|pixrgb-d)
;; Descripción: Toma un pixel y un valor, luego reemplaza dicho valor en la reconstrucción del pixel, cambiándolo
;; por pos_x
;; Tipo de recursión:  no tiene


(define (replace_x px x)
  (append (list (get_type px) x) (cddr px)))

;;
;; Nombre: replace_y
;; Dominio:  px (pixbit-d|pixhex-d|pixrgb-d) X y (int)
;; Recorrido: (pixbit-d|pixhex-d|pixrgb-d)
;; Descripción: Toma un pixel y un valor, luego reemplaza dicho valor en la reconstrucción del pixel, cambiándolo
;; por pos_y
;; Tipo de recursión:  no tiene


(define (replace_y px y)
  (append (list (get_type px) (get_x px) y)  (cdddr px)))

;;
;; Nombre: swap_positions
;; Dominio:  pix (pixbit-d|pixhex-d|pixrgb-d)
;; Recorrido:  (pixbit-d|pixhex-d|pixrgb-d)
;; Descripción: Intercambia pos_x con pos_y y retorna el pixel con los nuevos valores
;; Tipo de recursión: no tiene


(define (swap_positions pix)
  (cond
    [(equal? (car pix) "pixbit-d")
     (list "pixbit-d" (get_y pix) (get_x pix) (fourth pix) (fifth pix))]
    [(equal? (car pix) "pixhex-d")
     (list "pixhex-d" (get_y pix) (get_x pix) (fourth pix) (fifth pix))]
    [(equal? (car pix) "pixrgb-d")
     (list "pixrgb-d" (get_y pix) (get_x pix) (get_a pix) (get_e pix) (get_i pix) (seventh pix))]))


;; otro

;;
;; Nombre: get_a
;; Dominio:  pix (pixrgb-d)
;; Recorrido: int entre 0 y 255
;; Descripción: Toma un pixrgb-d y retorna su valor correspondiente para r
;; Tipo de recursión: no tiene


(define (get_a pix)
  (fourth pix))

;;
;; Nombre: get_e
;; Dominio:  pix (pixrgb-d)
;; Recorrido: int entre 0 y 255
;; Descripción: Toma un pixrgb-d y retorna su valor correspondiente para g
;; Tipo de recursión: no tiene


(define (get_e pix)
  (fifth pix))

;;
;; Nombre: get_a
;; Dominio:  pix (pixrgb-d)
;; Recorrido: int entre 0 y 255
;; Descripción: Toma un pixrgb-d y retorna su valor correspondiente para b
;; Tipo de recursión: no tiene


(define (get_i pix)
  (sixth pix))

;;
;; Nombre: get_eregebe
;; Dominio:  pix (pixrgb-d)
;; Recorrido: lista de enteros entre 0 y 255
;; Descripción: Toma un pixrgb-d y retorna una lista con sus valores r, g y b enlistados
;; Tipo de recursión: no tiene



(define (get_eregebe pix)
  (list (get_a pix) (get_e pix) (get_i pix)))

