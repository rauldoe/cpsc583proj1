(deftemplate person "a person"
	(slot first-name)
	(slot last-name)
)

(deftemplate animal "a animal"
	(slot name)
	(slot type)
)

(defrule print-animal
	(not (animal ?))
=>
	(printout t " Please enter an animal" crlf)
   	(bind ?ani-name (read))
	?a <- (assert (animal (name ?ani-name)))
	(printout t " Please enter an animal's type" crlf)
	(bind ?ani-type (read))
	(modify ?a (type ?ani-type))
)