#lang typed/racket/base

(require "stream/stream-pred.rkt" "stream/stream-cons.rkt")
(provide stream? stream-cons stream empty-stream)

(require typed/racket/unsafe)

(unsafe-require/typed/provide
 racket/stream
 [stream-first (All (a ...) [(Sequenceof a ... a) -> (Values a ... a)])]
 [stream-rest (All (a ...) [(Sequenceof a ... a) -> (Sequenceof a ... a)])]
 ;; stream-cons and stream are reimplemented in typed/racket/stream/stream-cons.rkt
 [in-stream (All (a ...) [(Sequenceof a ... a) -> (Sequenceof a ... a)])]
 [stream-force (All (a ...) [(Sequenceof a ... a) -> (Sequenceof a ... a)])]
 [stream-ref (All (a ...) [(Sequenceof a ... a) Natural -> (Values a ... a)])]
 [stream-tail (All (a ...) [(Sequenceof a ... a) Natural -> (Sequenceof a ... a)])]
 [stream-take (All (a ...) [(Sequenceof a ... a) Natural -> (Sequenceof a ... a)])]
 [stream-append (All (a ...) [(Sequenceof a ... a) * -> (Sequenceof a ... a)])]
 [stream-map (All (a b ...)
                  (case->
                   (-> (-> b ... b a) (Sequenceof b ... b) (Sequenceof a))
                   (-> (-> a (values b ... b)) (Sequenceof a) (Sequenceof b ... b))))]
 [stream-andmap (All (b a ...) (-> (-> a ... a b) (Sequenceof a ... a) (U True b)))]
 [stream-ormap (All (b a ...) (-> (-> a ... a b) (Sequenceof a ... a) (U False b)))]
 [stream-for-each (All (a ...) (-> (-> a ... a Any) (Sequenceof a ... a) Void))]
 [stream-fold (All (b a ...) (-> (-> b a ... a b) b (Sequenceof a ... a) b))]
 [stream-count (All (a ...)
                    (-> (-> a ... a Any) (Sequenceof a ... a) Nonnegative-Integer))]
 [stream-filter (All (a b c ...)
                     (case->
                      (-> (-> a Any : #:+ b) (Sequenceof a) (Sequenceof b))
                      (-> (-> c ... c Any) (Sequenceof c ... c) (Sequenceof c ... c))))]
 [stream-add-between (All (a) (-> (Sequenceof a) a (Sequenceof a)))]
 )

(require/typed/provide
 racket/stream
 [stream-empty? [SequenceTop -> Boolean]]
 ;; empty-stream is also provided from typed/racket/stream/stream-cons.rkt
 [stream-length [SequenceTop -> Natural]]
 [stream->list (All (a) [(Sequenceof a) -> (Listof a)])]
 )

(unsafe-require/typed/provide
 racket/base
 [sequence->stream (All (a ...) (-> (Sequenceof a ... a) (Sequenceof a ... a)))]
 )
