; Run instructions
; (clear)
; (load c:/temp/cpsc583proj1/family_constructs.clp)
; (batch c:/temp/cpsc583proj1/family_facts.clp)
; (run 1)
; or
; (run) a test

; Facts
(assert 
    (domain-rule 
        (if age-difference is-more-than 30 )
        (then based-on age-factor the-expert-system-favours-getting-married-with-certainty 20.0 %)))

(assert 
    (answer (known-factor age-difference) (value 31)))
