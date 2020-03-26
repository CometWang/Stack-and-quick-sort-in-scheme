#lang racket

(define f
   (lambda (z)
     (list 'f z)))
(define x
   (lambda (z)
     (list 'x z)))
((((lambda (f) (lambda (x)(f (f x)))) (lambda (f) (lambda(x) (f (f x)))))f) (car (x )))