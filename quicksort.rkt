#lang racket
( define quicksort (lambda (L)
 ( define ( filt pred items )
   ( cond ( ( null? items ) '() )
          ( ( pred ( car items ) )
            ( cons ( car items )
                   ( filt pred ( cdr items ) ) ) )
          ( else ( filt pred ( cdr items ) ) ) ) )

   ( cond ( ( null? L ) '() )
          ( else ( let* ( ( cut ( car L ) )
                          ( rest ( cdr L ) )
                          ( left ( filt ( lambda ( elem )
                                             ( < elem cut ) ) rest ) )
                          ( right ( filt ( lambda ( elem )
                                              ( >= elem cut ) ) rest ) ) )
                    ( append ( quicksort left )
                             ( list cut )
                             ( quicksort right ) ) ) ) ) ))

(quicksort '(5 3 7 2 1 6 4))


