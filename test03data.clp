(deftemplate quest
	(slot no)
	(slot question(type STRING))
)

 (deffacts questions
 	(quest (no rdy)(question "Are you ready? (yes/no)?"))
 	(quest (no gn)(question "What is your name?"))
 	(quest (no bye)(question "Have a nice day"))
 	(quest (no wk)(question "Do you drive to work everyday? (yes/no) "))
	(quest (no mary)(question "Are you married? (yes/no) "))
 	(quest (no C)(question "Do you have a house? (yes/no) "))
 )
 