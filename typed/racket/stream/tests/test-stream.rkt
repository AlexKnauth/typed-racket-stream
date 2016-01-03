#lang typed/racket/base

(require typed/racket/stream
         typed/rackunit
         )

(: s1212 : (Sequenceof Natural))
(define s1212
  (stream-cons 1 (stream-cons 2 s1212)))

(check-equal? (stream-first s1212) 1)

(check-equal? (stream-first (stream-rest s1212)) 2)

(check-equal? (stream-ref s1212 100) 1)
(check-equal? (stream-ref s1212 101) 2)

