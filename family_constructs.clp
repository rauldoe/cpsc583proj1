
; Run instructions
; (clear)
; (load c:/temp/cpsc583proj1/family_constructs.clp)
; (batch c:/temp/cpsc583proj1/family_facts.clp)
; (run 1)
; or
; (run)

; Structures
(deftemplate domain-rule
    (multislot if (default none))
    (multislot then (default none)))

(deftemplate answer
    (slot known-factor (default none))
    (slot value (default none)))

; Rules
(defrule remove-ask-if-in-domain-rules-with-more-than
    ?r <- (domain-rule (if ?first-ask-if is-more-than ?min $?rest-of-ifs-true)) 
    (answer (known-factor ?f&:(eq ?f ?first-ask-if)) (value ?a&:(> ?a ?min)) )
 => 
    (if (eq (nth$ 1 ?rest-of-ifs-true) and) 
    then (modify ?r (if (rest$ ?rest-of-ifs-true)))
    else (modify ?r (if ?rest-of-ifs-true))))


