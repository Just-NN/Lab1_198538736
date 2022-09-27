#lang racket


(require "TDA_pixel.rkt")
(require "TDA_pixhex-d.rkt")

(provide (all-defined-out))

;; Se define el TDA pixmap para poder trabajar el tipo de pixel
;; mencionado, ya que es clave para poder generar una imagen.
;; Se definen constructor, selectores, modificadores, pertenencia y otros
;; para poder trabajar ciertas funciones en otros TDA
;;



;constructor

;;
;; Nombre: pixrgb-d
;; Dominio:  pos_x (int) X pos_y (int) X r (int entre 0 y 255) X g (int entre 0 y 255) X b (int entre 0 y 255) X d (int)
;; Recorrido: pixrgb-d
;; Descripción: Toma los valores y los enlista junto con un identificador para poder trabajarlo como pixel
;; Tipo de recursión: no tiene

(define (pixrgb-d pos_x pos_y r g b d)
  (list "pixrgb-d" pos_x pos_y r g b d))





; selectores


;;
;; Nombre: get_r
;; Dominio: pix (pixrgb-d)
;; Recorrido: int (entre 0 y 255)
;; Descripción: Recibe un pixrgb-d y retorna su 4to elemento, que corresponde a valor r
;; Tipo de recursión: no tiene

(define (get_r pix)
  (fourth pix))

;;
;; Nombre: get_g
;; Dominio: pix (pixrgb-d)
;; Recorrido: int (entre 0 y 255)
;; Descripción: Recibe un pixrgb-d y retorna su 5to elemento, que corresponde a valor g
;; Tipo de recursión: no tiene

(define (get_g pix)
  (fifth pix))

;;
;; Nombre: get_b
;; Dominio: pix (pixrgb-d)
;; Recorrido: int (entre 0 y 255)
;; Descripción: Recibe un pixrgb-d y retorna su 6to elemento, que corresponde a valor b
;; Tipo de recursión: no tiene

(define (get_b pix)
  (sixth pix))

;;
;; Nombre: get_d_rgb
;; Dominio: pix (pixrgb-d)
;; Recorrido: int
;; Descripción: Recibe un pixrgb-d y retorna su 7mo elemento, que corresponde a valor r
;; Tipo de recursión: no tiene

(define (get_d_rgb pix)
  (seventh pix))

;;
;; Nombre: get_rgb 
;; Dominio:  pixrgb-d
;; Recorrido: lista de enteros (cada uno entre 0 y 255)
;; Descripción: utiliza otros selectores para enlistar los valores de (r), (g) y (b). De este modo, se pueden trabajar como lista
;; Tipo de recursión: no tiene


(define (get_rgb pix)
  (list (get_r pix) (get_g pix) (get_b pix)))

; modificadores


;;
;; Nombre: replace_x_rgb
;; Dominio:  px (pixrgb-d) X x (int)
;; Recorrido: pixrgb-d
;; Descripción: Toma el pixel y el valor x, para luego reemplazarlo en la pos_x al momento de reconstruir dicho pixel
;; Tipo de recursión: no tiene


(define (replace_x_rgb px x)
  (pixrgb-d (get_type px) x (get_y px) (get_r px) (get_g px) (get_b px) (get_d_rgb px)))

;;
;; Nombre: replace_y_rgb
;; Dominio:  px (pixrgb-d) X y (int)
;; Recorrido: pixrgb-d
;; Descripción: Toma el pixel y el valor y, para luego reemplazarlo en la pos_y al momento de reconstruir dicho pixel
;; Tipo de recursión: no tiene

(define (replace_y_rgb px y)
  (pixrgb-d (get_type px) (get_x px) y (get_r px) (get_g px) (get_b px) (get_d_rgb px)))

;; pertenencia

;;
;; Nombre: pixmapp? 
;; Dominio:  lista
;; Recorrido: booleano
;; Descripción: Recibe una lista (en general, los pixeles son listas) y utiliza get_type para determinar si el pixel es rgb
;; Tipo de recursión: no tiene

(define (pixmapp? pix)
  (if (eq? (get_type pix) "pixrgb-d") #t #f))


; otras (se usan para pixRGB->pixHEX)


;;
;; Nombre: divhex
;; Dominio:  a (int entre 0 y 255)
;; Recorrido: decimal
;; Descripción: Toma un valor entre 0 y 255, te retorna la división con decimales de a/16
;; Tipo de recursión: no tiene

(define (divhex a)
  (/ a 16.0))

;;
;; Nombre: to_int
;; Dominio:  a (decimal)
;; Recorrido: int
;; Descripción: Toma el valor decimal de (a) y lo trunca para tener su parte entera
;; Tipo de recursión: no tiene

(define (to_int a)
  (exact-floor a))

;;
;; Nombre: to_decimal
;; Dominio:  a (decimal)
;; Recorrido: a (decimal)
;; Descripción: Utilizando una recursión, resta 1 hasta que sólo quede la parte decimal de a
;; Tipo de recursión: Natural

(define (to_decimal a) 
  (if (> 1 a) a
      (to_decimal (- a 1))))

;;
;; Nombre: abcdef
;; Dominio:  a (int)
;; Recorrido: char en mayúscula desde la A hasta la F
;; Descripción: Evalúa el valor de (a) y retorna su conversión a hex
;; Tipo de recursión: no tiene

(define (abcdef a)
  (cond
    [(= a 10) "A"]
    [(= a 11) "B"]
    [(= a 12) "C"]
    [(= a 13) "D"]
    [(= a 14) "E"]
    [(= a 15) "F"]
    [else null]))


;;
;; Nombre: dec_to_int
;; Dominio:  a (decimal)
;; Recorrido: int
;; Descripción: Toma el valor (a) y lo multiplica por 16. En este contexto, retorna siempre un entero y recibe
;; la parte decimal obtenida de divhex
;; Tipo de recursión: no tiene


(define (dec_to_int a)
  (to_int (* a 16)))

;;
;; Nombre: str_abc 
;; Dominio:  a (int múltiplo de 16, mayor o igual que 160) X hex (string)
;; Recorrido: char
;; Descripción: Inserta el resultado de la conversión al final del string (hex)
;; Tipo de recursión: no tiene


(define (str_abc a hex)
  (string-append hex (abcdef (to_int (divhex a)))))

;;
;; Nombre: str_num
;; Dominio:  a (int) X hex (string)
;; Recorrido: (char)
;; Descripción: Toma un valor (a)y lo convierte en string 
;; Tipo de recursión: no tiene


(define (str_num a hex)
  (~a hex a))

;;
;; Nombre: conversor_elemento
;; Dominio:  a (int)
;; Recorrido: char
;; Descripción: Recibe un número entero y hace la conversión a char, dependiendo de su caso
;; Tipo de recursión: no tiene

(define (conversor_elemento a)
  (if (= (to_int a) 0) "0"
      (caja_negra a "")))
;;
;; Nombre: conversion_de_pares
;; Dominio:  a (int entre 0 y 255) X hx (string)
;; Recorrido: string
;; Descripción: Llama a las funciones definidas previamente para convertir (a) en su par hexadecimal 
;; Tipo de recursión: no tiene

(define (conversion_de_pares a hx)
  (string-append (conversor_elemento (to_int (divhex a))) (conversor_elemento (dec_to_int (to_decimal (divhex a))))))

;;
;; Nombre: caja_negra
;; Dominio:  a (int entre 0 y 15) X hex (string)
;; Recorrido: char
;; Descripción: Recibe un número y entrega el char correspondiente en hex
;; Tipo de recursión: no tiene


(define (caja_negra a hex)
  (if (< a 10) (str_num a hex)
      (str_abc (dec_to_int a) hex)))

;;
;; Nombre: wrap_rgb_to 
;; Dominio: rgb (lista de ints) 
;; Recorrido: string
;; Descripción: Utiliza un envoltorio para realizar una recursión, que toma los valores de rgb y, cada recursión,
;; inserta el par correspondiente al final del string original ("#") de modo que quede un valor hex
;; Tipo de recursión: Recursión de cola con envoltorio

(define (wrap_rgb_to rgb)
  (define (rgb_to_hex rgb hex)
    (if (null? rgb)
        hex
        (rgb_to_hex (cdr rgb) (string-append hex (conversion_de_pares (car rgb) "")))))
  (rgb_to_hex rgb "#"))

;;
;; Nombre: pix-rgb-to-hex
;; Dominio:  pixrgb-d
;; Recorrido: pixhex-d
;; Descripción: Reconstruye el pixel rgb como uno hex, tomando sus valores transformados de rgb a hex
;; Tipo de recursión: 

(define (pix-rgb-to-hex pixrgb)
  (pixhex-d (cadr pixrgb) (caddr pixrgb) (wrap_rgb_to (get_rgb pixrgb)) (seventh pixrgb)))

;;
;; Nombre: convertir_lista
;; Dominio:  lista (lista de pixrgb-d) X aux (lista de pixrgb-d)
;; Recorrido: lista de pixrgb-d
;; Descripción: Por medio de una recursión se aplica la conversión de rgb a hex y se inserta cada elemento
;; al final de una nueva lista, la cual, contiene pixhex-d y es retornada finalmente
;; Tipo de recursión: Natural

(define (convertir_lista lista aux)
  (if (null? lista) (reverse aux)
      (convertir_lista (cdr lista) (cons (pix-rgb-to-hex (car lista)) aux))))










