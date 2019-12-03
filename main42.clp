(deffunction ask-question (?question $?allowed-values)
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
   
 (deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))
       
(deffunction ask-Name (?question)
   (printout t ?question)
   (bind ?answer (read))
)

(defrule determine-gamePlay
	(not (ready ?))
=>
	(assert (ready (yes-or-no-p "Are you ready? (yes/no)?" )))
)

(defrule startGame
   (ready yes)
   (not (name ?))
   =>
   (assert (name (ask-Name " what is your name? "))))
   
(defrule GoodBye
   (ready no)
   (not (name ?))
   =>
 	(printout t "have a nice day" crlf)
)

(defrule ownHouse
   (name ?name)
   =>
   (assert (ownHouse (yes-or-no-p "Do you have a house? (yes/no)? "))))

(defrule married
   (ownHouse yes)
   =>
   (assert (married (yes-or-no-p "Are you married? (yes/no)? "))))
   
   
   
	