#lang racket


(require "TDA_image.rkt")
(require "TDA_pixmap.rkt")
(require "TDA_hexmap.rkt")
(require "TDA_bitmap.rkt")
(require "TDA_pixel.rkt")



(define img1 (image 2 2
                  (pixrgb-d 0 0 255 0 0 10)
                  (pixrgb-d 0 1 0 255 0 20)
                  (pixrgb-d 1 0 0 0 255 10)
                  (pixrgb-d 1 1 255 255 255  1)))
(display "img 1:\n")
(display img1)
(display "\n")

(define img2 (image 2 2
                  (pixbit-d 0 0 0 10)
                  (pixbit-d 0 1 1 20)
                  (pixbit-d 1 0 1 10)
                  (pixbit-d 1 1 0 255))
 )
(display "-----------------\n")
(display "img 2:\n")
(display img2)
(display "\n")

(define img3 (imgRGB->imgHex img1))
(display "-----------------\n")
(display "img 3:\n")
(display img3)
(display "\n")


(display "bitmap? \n")
(bitmap? img1) ; la respuesta debería ser #f
(bitmap? img2)  ; la respuesta debería ser #t
(bitmap? img3)  ; la respuesta debería ser #f

(display "pixmap? \n")
(pixmap? img1) ; la respuesta debería ser #t
(pixmap? img2)  ; la respuesta debería ser #f
(pixmap? img3)  ; la respuesta debería ser #f


(display "hexmap? \n")
(hexmap? img1) ; la respuesta debería ser #f
(hexmap? img2)  ; la respuesta debería ser #f
(hexmap? img3)  ; la respuesta debería ser #t


(display "compressed? \n")
(compressed? img1) ; la respuesta debería ser #f
(compressed? img2) ; la respuesta debería ser #f
(compressed? img3) ; la respuesta debería ser #f

(display "monki flipH\n")
(flipH img1)
(flipH img2)
(flipH img3)
(display "monki flipV\n")

(flipV img1)
(flipV img2)
(flipV img3)

(display "crop\n")
(define img4 (crop img1 0 0 0 0)) ; debería retornar una imágen con un pixel
(define img5 (crop img2 0 0 0 1)) ; debería retornar una imágen con dos pixeles
(define img6 (crop img1 0 1 1 1)) ; debería retornar una imágen con dos pixeles
(define img7 (crop img2 0 0 1 1)) ; debería retornar la misma imagen

(display "\n-- crop --\n")
(display img4)
(display "\n-- crop --\n")
(display img5)
(display "\n-- crop --\n")
(display img6)
(display "\n-- crop --\n")
(display img7)

(display "histogram\n")
(histogram img1)
(histogram img2)
(histogram img3)
(histogram img4)
(histogram img5)
(histogram img6)
(histogram img7)

