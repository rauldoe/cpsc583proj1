
; Facts
(assert 
    (domain-rule 
        (if age-difference is-more-than 30 )
        (then based-on age-factor favours-purchasing-car-with-certainty 20.0 %)))

(assert
    (domain-rule 
    (if your-age is-more-than 40 )
    (then based-on age-factor favours-purchasing-car-with-certainty 45.0 %)))

(assert 
    (answer (known-factor age-difference) (value 31)))

(assert 
    (answer (known-factor your-age) (value 47)))
