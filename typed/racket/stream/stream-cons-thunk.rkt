#lang typed/racket/base

(require typed/racket/unsafe)

(unsafe-require/typed/provide
  "stream-cons-thunk-untyped.rkt"
  [stream-cons/thunk (All (a ...) [(-> (Values a ... a)) (-> (Sequenceof a ... a)) -> (Sequenceof a ... a)])]
  [empty-stream (All (a ...) (Sequenceof a ... a))] ; see also empty-sequence
  )
