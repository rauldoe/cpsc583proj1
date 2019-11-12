
; Structures
(deftemplate domain-rule
    (multislot if (default none))
    (multislot then (default none)))

(deftemplate answer
    (slot known-factor (default none))
    (slot value (default none)))

(deftemplate conclusion
    (slot name (default none))
    (slot confidence-factor (type FLOAT) (default 0.0)))

(deftemplate question
    (slot factor (default none)) 
    (slot question-to-ask (default none))
    (slot has-pre-condition (type SYMBOL) (default no))) 

(deftemplate question-rule
    (multislot if (default none))
    (slot then-ask-question (default none)))

; Rules
(defrule remove-ask-if-in-domain-rules-with-more-than
    ?r <- (domain-rule (if ?first-ask-if is-more-than ?min $?rest-of-ifs-true)) 
    (answer (known-factor ?f&:(eq ?f ?first-ask-if)) (value ?a&:(> ?a ?min)) )
 => 
    (if (eq (nth$ 1 ?rest-of-ifs-true) and) 
    then (modify ?r (if (rest$ ?rest-of-ifs-true)))
    else (modify ?r (if ?rest-of-ifs-true))))

(defrule fire-domain-rule
    ?r <- (domain-rule (if $?a&:(=(length$ ?a) 0)) 
    (then based-on ?factor&:(> (str-length ?factor) 0) favours-purchasing-car-with-certainty ?cf % $?rest-of-factors))
  =>
    (if (eq (nth$ 1 ?rest-of-factors) and) 
    then (modify ?r (then (rest$ ?rest-of-factors)))) 
    (assert (conclusion (name ?factor) (confidence-factor ?cf))) )

(defrule combine-confidence-factors
    ?rem1 <- (conclusion (name ?n) (confidence-factor ?f1))
    ?rem2 <- (conclusion (name ?n) (confidence-factor ?f2))
    (test (neq ?rem1 ?rem2))
  =>
    (retract ?rem1)
    (modify ?rem2 (confidence-factor (/ (- (* 100 (+ ?f1 ?f2)) (* ?f1 ?f2)) 100))))

(defrule calculate-age-difference
    (answer (known-factor your-age) ( value ?your-age))
    (answer (known-factor your-partner-age) ( value ?your-part-age))
  =>
    (assert (answer (known-factor age-difference) (value (abs (- ?your-age ?your-part-age)) ))))

(defrule remove-ask-if-in-question-rules
    ?r <- (question-rule (if ?first-ask-if is ?val $?rest-of-ifs-true))
    (answer (value ?val) (known-factor ?f&:(eq ?f ?first-ask-if)))
  =>
    (if (eq (nth$ 1 ?rest-of-ifs-true) and) 
    then (modify ?r (if (rest$ ?rest-of-ifs-true)))
    else (modify ?r (if ?rest-of-ifs-true))))

(defrule set-pre-condition-when-no-antecedents
    ?r <- (question-rule (if $?a&:(=(length$ ?a) 0)) (then-ask-question ?f))
    ?q <- (question (factor ?f)(has-pre-condition yes) )
    (not (answer (known-factor ?f)))
  =>
    (modify ?q (has-pre-condition no)))
