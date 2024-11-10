#lang typed/racket/base

(require "stream/stream-pred.rkt" "stream/stream-cons.rkt")
(provide stream? stream-cons stream empty-stream)

(require typed/racket/unsafe)

(unsafe-require/typed/provide
 racket/stream
 [stream-first  (All (a ...) [(Sequenceof a ... a) -> (Values     a ... a)])]
 [stream-rest   (All (a ...) [(Sequenceof a ... a) -> (Sequenceof a ... a)])]
 [in-stream     (All (a ...) [(Sequenceof a ... a) -> (Sequenceof a ... a)])]
 [stream-force  (All (a ...) [(Sequenceof a ... a) -> (Sequenceof a ... a)])]
 [stream-ref    (All (a ...) [(Sequenceof a ... a) Natural -> (Values     a ... a)])] ; see also sequence-ref
 [stream-tail   (All (a ...) [(Sequenceof a ... a) Natural -> (Sequenceof a ... a)])] ; see also sequence-tail
 [stream-take   (All (a ...) [(Sequenceof a ... a) Natural -> (Sequenceof a ... a)])]
 [stream-append (All (a ...) [(Sequenceof a ... a) * -> (Sequenceof a ... a)])]       ; see also sequence-append
 [stream-map (All (a b ...)                                                           ; see also sequence-map
                  (case->
                   [(-> b ... b a) (Sequenceof b ... b) -> (Sequenceof a)]
                   [(-> a (values b ... b)) (Sequenceof a) -> (Sequenceof b ... b)]))]
 [stream-andmap (All (b a ...) [(-> a ... a b) (Sequenceof a ... a) -> (U True  b)])] ; see also sequence-andmap
 [stream-ormap  (All (b a ...) [(-> a ... a b) (Sequenceof a ... a) -> (U False b)])] ; see also sequence-ormap
 [stream-for-each (All (a ...) [(-> a ... a Any) (Sequenceof a ... a) -> Void])]      ; see also sequence-for-each
 [stream-fold   (All (b a ...) [(-> b a ... a b) b (Sequenceof a ... a) -> b])]       ; see also sequence-fold
 [stream-count (All (a ...)                                                           ; see also sequence-count
                    [(-> a ... a Any) (Sequenceof a ... a) -> Nonnegative-Integer])]
 [stream-filter (All (a b c ...)                                                      ; see also sequence-filter
                     (case->
                      [(-> a Any : #:+ b) (Sequenceof a) -> (Sequenceof b)]
                      [(-> c ... c Any) (Sequenceof c ... c) -> (Sequenceof c ... c)]))]
 [stream-add-between (All (a) [(Sequenceof a) a -> (Sequenceof a)])]                  ; see also sequence-add-between
 )

(require/typed/provide
 racket/stream
 ;; stream-cons and stream are reimplemented in typed/racket/stream/stream-cons.rkt
 ;; empty-stream is also provided from typed/racket/stream/stream-cons.rkt
 [stream-empty? [SequenceTop -> Boolean]]
 [stream-length [SequenceTop -> Natural]] ; see also sequence-length
 [stream->list (All (a) [(Sequenceof a) -> (Listof a)])]
 )

(unsafe-require/typed/provide
 racket/base
 [sequence->stream
  (All (a ...)
       (case->
        [(All (b ...) (Sequenceof b ... b)) -> (All (b ...) (Sequenceof b ... b))] ; empty-sequence->empty-stream
        [(Sequenceof a ... a) -> (Sequenceof a ... a)]))]
 )
