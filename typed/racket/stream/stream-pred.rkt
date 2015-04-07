#lang s-exp typed-racket/base-env/extra-env-lang

(require racket/stream)

(type-environment
 [stream? (let ([p (-arg-path 0)])
            (-> Univ -Boolean : (-FS (-filter (-seq Univ) p) -top)))]
 )

