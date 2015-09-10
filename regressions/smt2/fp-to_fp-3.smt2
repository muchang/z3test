(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(declare-fun X () (_ FloatingPoint 5 11))

(assert (= X ((_ to_fp 5 11) RTZ #xFFFFFFFFFFFFFFD6))) ; -42 = -1.3125p5
(assert (not (= X ((_ to_fp 5 11) RTZ -42.0 0))))

(check-sat)
(exit)
