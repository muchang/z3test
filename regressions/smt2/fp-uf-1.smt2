(set-info :status unsat)

(declare-fun f (Int) (_ FloatingPoint 53 11))

(assert (= (f 1) (_ +oo 53 11)))
(assert (= (f 1) (_ -oo 53 11)))

(check-sat)

