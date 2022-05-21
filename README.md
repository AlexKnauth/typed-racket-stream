typed-racket-stream
===
A typed wrapper for using streams in typed racket.

Typed racket (as of racket version 6.3) doesn't have a type for streams, so this
uses `(Sequenceof a)` as the type for streams. Every stream is a valid sequence,
but not every sequence is a valid stream. It will raise an exception late at
runtime when given a sequence that is not a stream.
