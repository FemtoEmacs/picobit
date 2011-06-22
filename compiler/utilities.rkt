#lang racket

(provide (all-defined-out))

(require srfi/4)

(define compiler-error
  (lambda (msg . others)
    (display "*** PICOBIT ERROR -- ")
    (display msg)
    (for-each (lambda (x) (display " ") (write x)) others)
    (newline)
    (exit 1)))

(define (self-eval? expr)
  (or (number?   expr)
      (char?     expr)
      (boolean?  expr)
      (string?   expr)
      (u8vector? expr)))