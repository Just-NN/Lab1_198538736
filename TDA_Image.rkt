#lang racket


(require "TDA_pixrgb-d.rkt")
(require "TDA_pixbit-d.rkt")
(require "TDA_pixhex-d.rkt")
(require "TDA_pixel.rkt")
(provide (all-defined-out))


;; Defino el TDA image como mi TDA principal, todos los otros
;; fueron definidos para poder ser trabajados en este y cumplir con
;; lo solicitado por el laboratorio


; probar con (image 2 2 '("pixbit-d" 0 0 0 1) '("pixbit-d" 1 0 0 1) '("pixbit-d" 0 1 0 1) '("pixbit-d" 1 1 0 1))


;; image - constructor
;; Nombre:  image
;; Dominio: Width (int) X Height (int) X [pixbit-d* |  pixrgb-d* |  pixhex-d*]
;; Recorrido:  image
;; Descripción: Crea una lista con el ancho, largo y una lista de pixeles
;; Tipo de recursión: no tiene

(define (image Width Height . pix)
  (list Width Height pix))



(define (imageaux Width Height pix)
  (list Width Height pix))

;; image - constructor
;; Nombre:  imageaux
;; Dominio: Width (int) X Height (int) X [pixbit-d* |  pixrgb-d* |  pixhex-d*]
;; Recorrido:  image
;; Descripción: Crea una lista con el ancho, largo y una lista de pixeles, pero esta funciona
;; en los casos que se entregue una lista en vez de n argumentos (la uso en algunas funciones que
;; reconstruyo una imagen)
;; Tipo de recursión: no tiene

; selectores

;; Nombre:  get_w 
;; Dominio: image
;; Recorrido:  int
;; Descripción: Recibe una imagen y toma su primer elemento (su ancho) para retornarlo
;; Tipo de recursión: no tiene

(define (get_w img)
  (car img))

;; Nombre: get_h 
;; Dominio: image
;; Recorrido:  int
;; Descripción: Recibe una imagen y toma su primer elemento (su alto) para retornarlo
;; Tipo de recursión: no tiene

(define (get_h img)
  (cadr img))

;; Nombre:  get_pixlist
;; Dominio: image
;; Recorrido:  lista de pixeles (pixbit-d|pixhex-d|pixrgb-d)
;; Descripción: Recibe una imagen y toma su lista de pixeles para retornarla
;; Tipo de recursión: no tiene

(define (get_pixlist img)
  (caddr img))

;; pertenencia

;;
;; Nombre: bitmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un bitmap-d
;; Tipo de recursión: no tiene

(define (bitmap? img)
  (bitmapp? (car (get_pixlist img))))

;;
;; Nombre: pixmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un pixmap-d
;; Tipo de recursión: no tiene

(define (hexmap? img)
  (hexmapp? (car (get_pixlist img))))

;;
;; Nombre: hexmap?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen corresponde a un hexmap-d
;; Tipo de recursión: no tiene

(define (pixmap? img)
  (pixmapp? (car (get_pixlist img))))

;;
;; Nombre: compressed?
;; Dominio: image
;; Recorrido: boolean
;; Descripción: permite determinar si la imagen está comprimida a partir de la cantidad de elementos que
;; debiera tener según filas*columnas y la que realmente tiene
;; Tipo de recursión: no tiene

(define (compressed? p)
  (if (= (* (car p) (cadr p)) (length (get_pixlist p))) #f #t))



;;
;; Nombre: flipH
;; Dominio: image
;; Recorrido: image
;; Descripción: permite invertir una imagen horizontalmente, cambiando los valores x de cada pixel
;; Tipo de recursión: Recursión de cola con envoltorio

(define (flipH img)
  (define (flipHH W W2 pixlist aux)
    (if (null? pixlist) (imageaux (get_w img) (get_h img) (reverse aux))
        (if (= W -1) (flipHH W2 W2 pixlist aux)
            (flipHH (- W 1) W2 (cdr pixlist) (cons (replace_x (car pixlist) W) aux)))))
    (flipHH (- (get_w img) 1) (- (get_w img) 1) (get_pixlist img) '()))

;;
;; Nombre: flipV
;; Dominio: image
;; Recorrido: image
;; Descripción: permite invertir una imagen verticalmente, cambiando los valores y de cada pixel
;; Tipo de recursión: Recursión de cola con envoltorio

(define (flipV img)
  (define (flipVV H H2 pixlist aux)
    (if (null? pixlist) (imageaux (get_w img) (get_h img) (reverse aux))
        (if (= H -1) (flipVV H2 H2 pixlist aux)
            (flipVV (- H 1) H2 (cdr pixlist) (cons (replace_y (car pixlist) H) aux)))))
    (flipVV (- (get_w img) 1) (- (get_w img) 1) (get_pixlist img) '()))


;;
;; Nombre: crop
;; Dominio: image X x1 (int) X y1 (int) X x2 (int) X y2 (int)
;; Recorrido: image
;; Descripción: permite recortar una imagen a partir de 2 coordenadas, entregando una imagen con su lista de pixeles recortada
;; conteniendo sólo los pixeles dentro de los valores solicitados
;; Tipo de recursión: Recursión Natural

(define (crop img x1 y1 x2 y2)
  ;; defino una función dentro? para x e y, de modo que pueda filtrar los elementos
  ;; que cumplan con ese intervalo
  (define (dentro_x? p x1 x2) ; defin
    (if (or (and (> (get_x p) x1) (< (get_x p) x2))
            (or (= (get_x p) x1) (= (get_x p) x2))) #t #f))
  (define (dentro_y? p x1 x2)
    (if (or (and (> (get_y p) x1) (< (get_y p) x2))
            (or (= (get_y p) x1) (= (get_y p) x2))) #t #f))
  ;; ahora las uso para poder filtrar
  (define (cropaux x1 y1 x2 y2 pl aux)
    (if (null? pl) (imageaux (+ (get_x (car (reverse aux))) 1) (+ (get_y (car (reverse aux))) 1) (reverse aux))
        (if (and (dentro_x? (car pl) x1 x2) (dentro_y? (car pl) y1 y2)) (cropaux x1 y1 x2 y2 (cdr pl) (cons (car pl) aux))
            (cropaux x1 y1 x2 y2 (cdr pl) aux))))
  (cropaux x1 y1 x2 y2 (get_pixlist img) '()))


; conversor
; básicamente tengo que usar format para meterle números y string-append para meterle letras

;;
;; Nombre: imgRGB->imgHex
;; Dominio: image 
;; Recorrido: image
;; Descripción: Permite convertir una imagen de tipo pixrgb-d a pixhex-d, por medio de una recursión
;; que toma sus pixeles y cambia los valores rgb a un string en hex, luego se construye una nueva
;; imagen con los nuevos valores y el ID correspondiente

(define (imgRGB->imgHex img)
  (imageaux (car img) (cadr img) (convertir_lista (get_pixlist img) '())))

;; Nombre:  value_list
;; Dominio: image
;; Recorrido:  Lista de ints
;; Descripción: Recibe una imagen y obtiene los valores de sus pixeles
;; tipo de recursión: Recursión de cola con envoltorio

(define (value_list img)
  (define (list_gen input output)
    (if (null? input) output
        (list_gen (cdr input) (cons (get_values (car input)) output))))
  (list_gen (get_pixlist img) '()))

;; Nombre:  filtro
;; Dominio: a (int) X lista (lista de (pixbit-d|pixrgb-d|pixhex-d)) X output (lista)
;; Recorrido:  Lista de ints
;; Descripción: A partir de un valor y una lista de pixeles, retorna una lista que filtre sólo los elementos
;; que coincidan con (a)
;; tipo de recursión: Recursión Natural

(define (filtro a lista output)
  (if (null? lista) (reverse output)
      (if (equal? a (car lista)) (filtro a (cdr lista) (cons a output))
          (filtro a (cdr lista) output))))

;; Nombre:  clean-list 
;; Dominio: a (int) X lista (lista de (pixbit-d|pixrgb-d|pixhex-d))
;; Recorrido:  Lista de ints
;; Descripción: Elimina los elementos filtrados con anterioridad de la lista original
;; tipo de recursión: no tiene

(define (clean-list a lista)
  (remove* (filtro a lista '()) lista))


;;;;;;;;;;;;;;;;;;;;;;;;;;


;;
;; Nombre: histogram
;; Dominio: image 
;; Recorrido: histogram
;; Descripción: Recibe una imagen y cuenta cuántas veces se repite cada valor para el pixel, retornando entonces una
;; lista de pares: valor - frecuencia
;; Tipo de recursión: Recursión de cola con envoltorio

(define (histogram img)
  
  (define (filter-loop lista output)
    (if (null? lista) output
      (filter-loop (clean-list (car lista) lista) (cons  (cons (car lista) (length (filtro (car lista) lista '()))) output))))
  (filter-loop (value_list img) '()))


;; Para poder rotar la imagen, hay que considerar sus posiciones como si fueran las de una matriz
;; Así pues, se puede rotar una matriz si, primero, la transpones y, luego, la das vuelta horizontalmente
;; Llevando esto al TDA image, podrían considerarse sus posiciones x e y para realizarlo

;;
;; Nombre: rotate90
;; Dominio: image 
;; Recorrido: image
;; Descripción: Recibe una imagen, toma su pixlist y transpone las posiciones, para finalmente hacer
;; un flipH y así tener la imagen original, rotada en 90° antohorario
;; Tipo de recursión: Recursión de cola con envoltorio

(define (rotate90 img)
  ; primero es transponer las posiciones individualmente usando swap_positions y luego se usa flipH
  ; para poder terminar el proceso
  (define (rotate-loop pixlist output)
    (if (null? pixlist) (flipH (imageaux (get_h img) (get_w img) (reverse output)))
        (rotate-loop (cdr pixlist) (cons (swap_positions (car pixlist)) output))))
    
  (rotate-loop (get_pixlist img) '())
)


