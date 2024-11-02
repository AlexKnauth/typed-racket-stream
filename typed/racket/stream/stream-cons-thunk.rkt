#lang typed/racket/base

(require typed/racket/unsafe)

(unsafe-require/typed/provide
  "stream-cons-thunk-untyped.rkt"
  [stream-cons/thunk (All (a ...) [(-> (Values a ... a)) (-> (Sequenceof a ... a)) -> (Sequenceof a ... a)])]
  ;; The type of empty-stream is the same as that of empty-sequence
  [empty-stream (All (a ...) (Sequenceof a ... a))]
  )
