(set-logic QF_FP)
(set-info :status unsat)
(set-option :produce-models true)

(declare-const x ( _ FloatingPoint 8 24))
(declare-const y ( _ FloatingPoint 8 24))
(declare-const r1 ( _ FloatingPoint 8 24))
(declare-const r2 ( _ FloatingPoint 8 24))

(define-const nan (_ FloatingPoint 8 24) (_ NaN 8 24))

(assert (not (= nan x)))
(assert (not (= nan y)))
(assert (not (= nan r1)))
(assert (not (= nan r2)))

(assert (= r1 (fp.add roundNearestTiesToEven x y)))
(assert (= r2 (fp.add roundNearestTiesToEven y x)))
(assert (not (fp.eq r1 r2)))

(check-sat)
