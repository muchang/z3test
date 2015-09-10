(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(declare-fun X () (_ FloatingPoint 5 11))

(assert (= X ((_ to_fp_unsigned 5 11) RTP #xFFFF))) ; +65535 --> +oo (rounding)
(assert (not (= X (_ +oo 5 11))))

(check-sat)
(exit)
