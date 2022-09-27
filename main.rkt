#lang racket


(require "TDA_image.rkt")
(require "TDA_pixrgb-d.rkt")
(require "TDA_pixhex-d.rkt")
(require "TDA_pixbit-d.rkt")
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

(display "flipH\n")
(flipH img1)
(flipH img2)
(flipH img3)
(display "flipV\n")

(flipV img1)
(flipV img2)
(flipV img3)

(display "img4 - img7\n")
(define img4 (crop img1 0 0 0 0)) ; debería retornar una imágen con un pixel
(display "\n-- img4 --\n")
(display img4)
(display "\n-- -- --\n")
(define img5 (crop img2 0 0 0 1)) ; debería retornar una imágen con dos pixeles
(display "\n-- img5 --\n")
(display img5)
(display "\n-- -- --\n")
(define img6 (crop img1 0 1 1 1)) ; debería retornar una imágen con dos pixeles
(display "\n-- img6 --\n")
(display img6)
(display "\n-- -- --\n")
(define img7 (crop img2 0 0 1 1)) ; debería retornar la misma imagen
(display "\n-- img7 --\n")
(display img7)
(display "\n-- -- --\n")

(display "\n-- crop --\n")
(display img4)
(display "\n-- crop --\n")
(display img5)
(display "\n-- crop --\n")
(display img6)
(display "\n-- crop --\n")
(display img7)
(display "\n-- -- --\n")

(display "histograms\n")
(display "\n-- v --\n")

(display "histogram img1\n")
(histogram img1)
(display "histogram img2\n")
(histogram img2)
(display "histogram img3\n")
(histogram img3)
(display "histogram img4\n")
(histogram img4)
(display "histogram img5\n")
(histogram img5)
(display "histogram img6\n")
(histogram img6)
(display "histogram img7\n")
(histogram img7)

(display "rotate90\n")
(display "\n-- v --\n")
(define img18 (rotate90 img1))
(define img19 (rotate90 img2))
(define img20 (rotate90 img3))
(define img21 (rotate90 img4))
(define img22 (rotate90 img5))
(define img23 (rotate90 img6))
(define img24 (rotate90 img7))

(display "img1\n")
(display img1)
(display "\n-- -- --\n")
(display "img18\n")
(display img18)
(display "\n-- -- --\n")
(display "img2\n")
(display img2)
(display "\n-- -- --\n")
(display "img19\n")
(display img19)
(display "\n-- -- --\n")
(display "img3\n")
(display img3)
(display "\n-- -- --\n")
(display "img20\n")
(display img20)
(display "\n-- -- --\n")
(display "img4\n")
(display img2)
(display "\n-- -- --\n")
(display "img21\n")
(display img19)
(display "\n-- -- --\n")
(display "img5\n")
(display img5)
(display "\n-- -- --\n")
(display "img22\n")
(display img22)
(display "\n-- -- --\n")
(display "img6\n")
(display img23)
(display "\n-- -- --\n")
(display "img23\n")
(display img23)
(display "\n-- -- --\n")
(display "img7\n")
(display img23)
(display "\n-- -- --\n")
(display "img24\n")
(display img24)



