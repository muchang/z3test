(declare-const a (RegEx String))

(simplify (re.loop a 1 1))
(simplify (re.loop a 0 0))
(simplify (re.loop (re.loop a 1 2) 2 3))
(simplify (re.loop (re.loop a 3 5) 3))
(simplify (re.loop (re.loop a 3) 3 4))
(simplify (re.++ (re.loop a 1 2) (re.loop a 2 3)))
(simplify (re.++ (re.loop a 1 2) (re.loop a 2)))
(simplify (re.++ (re.loop a 1) (re.loop a 2 3)))
(simplify (re.++ (re.loop a 1) (re.loop a 2 3)))
(simplify (re.loop a 0))
(simplify (re.++ (re.* a) (re.loop a 1 2)))
(simplify (re.++ (re.loop a 1 2) (re.* a)))