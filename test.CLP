(deftemplate person "a person"
	(slot first-name)
	(slot last-name)
)

(deftemplate animal "an animal"
    (slot name (default none))
    (slot type (default none))
) 

(deftemplate work-state "a state object"
	(slot current (default initial))
) 

(deftemplate text-for-id
   (slot id)
   (slot text)
)
   
(deffacts text-for-id
(text-for-id 
   (id AnimalDemo)
   (text "Animal Demo"))
)

(deffunction get-info-animal()
=>
	(printout t " Please enter an animal" crlf)
   	(bind ?ani-name (read))
	(printout t " Please enter an animal's type" crlf)
	(bind ?ani-type (read))
	(assert (animal (name ?ani-name) (type ?ani-type)))
)

(defrule startup-rule
	(not (work-state ))
=>
	(assert (work-state (current initial)))
)

(defrule trigger-get-info-animal-rule
	?state <- (work-state (current initial))
	(not (animal ))
=>
	(get-info-animal)
	(modify ?state (current state-info-animal))
	(printout t "type " (type ?state) crlf)


)


; https://stackoverflow.com/questions/27468440/how-to-get-information-from-the-fact-in-clips
; https://stackoverflow.com/questions/32770082/how-do-i-retrieve-fact-index-in-clips-in-a-deffunction
; (deftemplate text-for-id
;    (slot id)
;    (slot text))
   
; (deffacts text-for-id
; (text-for-id 
;    (id AnimalDemo)
;    (text "Animal Demo"))
; )

;    (bind ?fact
;       (find-fact ((?f text-for-id))
;                   (eq ?f:id ?id)))

; (bind ?ani
;   (find-fact ((?a animal))
; 			  (eq ?a:name zebra)))
; (bind ?al (find-all-facts ((?f animal)) (eq ?f:name zebra)))

; (deffunction up ()
;    (do-for-fact ((?fact u)) TRUE
;       (retract ?fact))
;    (assert (u green)))

; (do-for-fact ((?fact animal)) (eq ?fact:name tiger)
;    (modify ?fact (type awesome))
;    (printout t "good things" crlf)
;    (type ?fact)
;    (bind ?bg ?fact)
; )

; (deffunction myprint ($?rest1)
;    (foreach ?r $?rest1
;       (printout t ?r crlf)))
; (myprint (create$ a b) (create$ c d))