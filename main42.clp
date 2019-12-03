(deffunction askQuestion (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)   
   
 (deffunction yesOrNo (?question)
   (bind ?response (askQuestion ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))
       
  (deffunction mutipleChoice (?question)
   (bind ?response (askQuestion ?question A a B b))
   (if (or (eq ?response a) (eq ?response b))
       then a 
       else b))

       
(deffunction getName (?question)
   (printout t ?question)
   (bind ?answer (read))
)

(defrule startgame
	(not (ready ?))
=>
	(assert (ready (yesOrNo "Are you ready? (yes/no)?" )))
)


(defrule getName
   (ready yes)
   (not (name ?))
   =>
   (assert (name (getName " what is your name? "))))
   
(defrule GoodBye
   (ready no)
   (not (name ?))
   =>
 	(printout t "have a nice day" crlf)
)

(defrule ownHouse
   (name ?name)
   =>
   (assert (ownHouse (yesOrNo "Do you have a house? (yes/no)? "))))

(defrule married
   (ownHouse yes)
   =>
   (assert (married (yesOrNo "Are you married? (yes/no)? "))))   

(defrule likeLuxury
   (ownHouse yes)
	(married yes)
   =>
   (assert (likeLuxury (yesOrNo "Do you like Luxury car? (yes/no) "))))
   
(defrule likeRuggedCar
   (ownHouse yes)
	(married yes)
	(likeLuxury yes)
   =>
   (assert (likeRuggedCar (yesOrNo "Do you like rugged car? (yes/no) ")))
   (printout t "2020 Highlander" crlf)
   (printout t "2020 Sequoia" crlf)
   (printout t "2020 Sienna" crlf)
)
  
   
 



	