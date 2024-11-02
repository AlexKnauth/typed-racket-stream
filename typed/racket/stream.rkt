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
 [stream-ref (All (a ...) [(Sequenceof a ... a) Natural -> (Values a ... a)])]
 [stream-tail (All (a ...) [(Sequenceof a ... a) Natural -> (Sequenceof a ... a)])]
 [stream-take (All (a ...) [(Sequenceof a ... a) Natural -> (Sequenceof a ... a)])]
 [stream-append (All (a ...) [(Sequenceof a ... a) * -> (Sequenceof a ... a)])]
 )

(require/typed/provide
 racket/stream
 [stream-empty? [SequenceTop -> Boolean]]
 ;; empty-stream is also provided from typed/racket/stream/stream-cons.rkt
 [stream-length [SequenceTop -> Natural]]
 [stream->list (All (a) [(Sequenceof a) -> (Listof a)])]
 [stream-map (All (a b) (-> (-> a b) (Sequenceof a) (Sequenceof b)))]
 )

(unsafe-require/typed/provide
 racket/base
 [sequence->stream (All (a ...) (-> (Sequenceof a ... a) (Sequenceof a ... a)))]
 )
