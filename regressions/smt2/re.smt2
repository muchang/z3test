(declare-const a String)
(declare-const b String)
(declare-const r (RegEx String))
(declare-const r1 (RegEx String))
(declare-const r2 (RegEx String))

(simplify (not (str.in.re a re.nostr)))
(simplify (str.in.re a re.allchar))
(simplify (str.in.re "a" (str.to.re "a")))
(simplify (not (str.in.re "a" (str.to.re "ab"))))
(simplify (str.in.re "a" (re.+ (str.to.re "a"))))
(simplify (str.in.re "a" (re.* (str.to.re "a"))))
(simplify (str.in.re "a" (re.opt (str.to.re "a"))))
(simplify (str.in.re "a" (re.union (str.to.re "a") (str.to.re "b"))))
(simplify (not (str.in.re "c" (re.union (str.to.re "a") (str.to.re "b")))))
(simplify (= (= a "") (str.in.re a (re.* re.nostr))))
(simplify (str.in.re a (re.* re.allchar)))
(simplify (not (str.in.re a (re.+ re.nostr))))
(simplify (str.in.re a (re.+ re.allchar)))
(simplify (= (= a "") (str.in.re a (re.opt re.nostr))))
(simplify (str.in.re a (re.opt re.allchar)))
(simplify (= r (re.union re.nostr r)))
(simplify (= r (re.union r re.nostr)))
(simplify (= re.allchar (re.union re.allchar r)))
(simplify (= re.allchar (re.union r re.allchar)))
(simplify (= r (re.union r r)))
(simplify (= re.nostr (re.++ re.nostr r)))
(simplify (= re.nostr (re.++ r re.nostr)))
(simplify (= r (re.++ r (str.to.re ""))))
(simplify (= r (re.++ (str.to.re "") r)))
(simplify (= r (re.inter r r)))
(simplify (= re.nostr (re.inter re.nostr r)))
(simplify (= re.nostr (re.inter r re.nostr)))
(simplify (= r (re.inter r re.allchar)))
(simplify (= r (re.inter re.allchar r)))
(simplify (= (re.+ r) (re.+ (re.+ r))))
(simplify (= (re.* r) (re.* (re.* r))))
(simplify (= (re.* r) (re.* (re.+ r))))
(simplify (= (re.* r) (re.+ (re.* r))))
(simplify (= (str.to.re "") (re.* re.nostr)))
(simplify (= re.nostr (re.+ re.nostr)))
(simplify (= re.allchar (re.* re.allchar)))
(simplify (= re.allchar (re.+ re.allchar)))
(simplify (= (re.* (re.union r1 r2)) (re.* (re.union (re.* r1) r2))))
(simplify (= (re.* (re.union r1 r2)) (re.* (re.union r1 (re.* r2)))))
(simplify (= (re.* r) (re.* (re.union (str.to.re "") r))))
(simplify (= (re.* r) (re.* (re.opt r))))

(simplify (str.in.re a (str.to.re "abc")))
(simplify (str.in.re a (re.union (str.to.re "ab") (str.to.re "abc"))))


; test loop with both lower and upper bounds
(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 1 3) (str.to.re "ab"))))
(check-sat)
(pop)

(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 1 3) (str.to.re "ab"))))
(assert (= (str.len a) 2))
(check-sat)
(get-model)
(pop)

(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 1 3) (str.to.re "ab"))))
(assert (= (str.len a) 4))
(check-sat)
(get-model)
(pop)

(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 1 3) (str.to.re "ab"))))
(assert (= (str.len a) 6))
(check-sat)
(get-model)
(pop)

(push)
(set-info :status unsat)
(assert (str.in.re a ((_ re.loop 1 3) (str.to.re "ab"))))
(assert (> (str.len a) 6))
(check-sat)
(pop)

(push)
(set-info :status unsat)
(assert (str.in.re a ((_ re.loop 1 3) (str.to.re "ab"))))
(assert (not (= (str.len a) 6)))
(assert (not (= (str.len a) 4)))
(assert (not (= (str.len a) 2)))
(check-sat)
(pop)

; test loop with just lower bound
(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 2) (str.to.re "ab"))))
(check-sat)
(get-model)
(pop)

(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 2) (str.to.re "ab"))))
(assert (= (str.len a) 4))
(check-sat)
(get-model)
(pop)

(push)
(set-info :status sat)
(assert (str.in.re a ((_ re.loop 2) (str.to.re "ab"))))
(assert (= (str.len a) 6))
(check-sat)
(get-model)
(pop)

(push)
(set-info :status unsat)
(assert (str.in.re a ((_ re.loop 2) (str.to.re "ab"))))
(assert (= (str.len a) 5))
(check-sat)
(pop)




