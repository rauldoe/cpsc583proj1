
; Facts
(assert 
    (question-rule (if your-work-status is employed) (then-ask-question your-annual-income)))

(assert 
    (question 
    (factor your-age) 
    (question-to-ask "What is your age?") ))

(assert 
    (question 
    (factor your-partner-age) 
    (question-to-ask "What is the model of the car you wish to purchase?") )) 

(assert 
    (question 
    (factor your-annual-income) 
    (question-to-ask "What is your annual income in USD?") 
    (has-pre-condition yes)))

(assert 
    (question 
    (factor your-work-status) 
    (question-to-ask "What is your work status?") ))
