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


(define p
  (stream (begin (displayln "evaluating") 5)))

(let ([out (open-output-string)])
  (check-equal? (get-output-string out) "")
  (parameterize ([current-output-port out])
    (stream-first p)
    (check-equal? (stream-first p) 5)
    (check-equal? (stream-first (stream-map add1 p)) 6)
    (stream-first p))
  (check-equal? (get-output-string out) "evaluating\n"))


(: s0 (Sequenceof))
(define s0 (stream-cons (values) s0))
(check-true (call-with-values (λ () (stream-ref s0 0)) (λ () #t)))
(check-true (call-with-values (λ () (stream-ref s0 1)) (λ () #t)))

(: s1 (Sequenceof Number))
(define s1 (stream-cons (values 1) s1))
(check-true (call-with-values (λ () (stream-ref s1 0)) (λ (a) #t)))
(check-true (call-with-values (λ () (stream-ref s1 1)) (λ (a) #t)))

(: s2 (Sequenceof Number Symbol))
(define s2 (stream-cons (values 2 'c) s2))
(check-true (call-with-values (λ () (stream-ref s2 0)) (λ (a b) #t)))
(check-true (call-with-values (λ () (stream-ref s2 1)) (λ (a b) #t)))


(check-true  (stream? s1212))
(check-true  (stream? p))
(check-true  (stream? (list 1 2 3)))
(check-false (stream? (vector 1 2 3)))
(check-true  (stream? s0))
(check-true  (stream? s1))
(check-true  (stream? s2))
