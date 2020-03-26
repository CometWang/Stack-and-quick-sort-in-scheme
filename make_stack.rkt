#lang racket

(define make-stack
  (lambda ()
    (let ((stack '()) (size 0))
      (lambda (process arg)
	(case process
	  ((push!) (begin
		     (set! stack (cons arg stack))
		     stack)
         (set! size (+ 1 size)))
    ((empty?) (null? stack))
    ((top) (if(null? stack)
             (display "empty stack: cannot get the top\n")
             (display (car stack))
            )(newline))
	  ((pop!)  (if(null? stack)
             (display "empty stack: cannot pop\n")        
      (let ((temp (car stack)))
		     (set! stack (cdr stack))
		     temp)(set! size (- size 1))))
	  ((top-nth) (if (< size arg)
                  (display "not enough elements\n")
                  (find stack arg))(newline))
	  (else "unknown operation"))))))

(define find (lambda (stack index)
                  (if (= index 1) (display(car stack))
                    ;(set! index (- index 1))
                    ;(set! stack (cdr stack))
                    (find  (cdr stack) (- index 1)))))

 
(define my_stack (make-stack))
(my_stack 'push! 4)
(my_stack 'push! 1)
(my_stack 'push! 5)
(my_stack 'top) ;=> 5
(my_stack 'top-nth 2) ;=> 1
(my_stack 'top-nth 4) ; "not enough elements"
(my_stack 'pop!)
(my_stack 'pop!)
(my_stack 'empty)
(my_stack 'empty?)
(my_stack 'pop!)
(my_stack 'top)
(my_stack 'pop!)