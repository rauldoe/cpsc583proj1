(deftemplate quest
	(slot no)
	(slot question(type STRING))
)

;(deftemplate txtquest
;	(slot no)
;	(slot question(type STRING))
;	(slot correctAns1)
;	(slot correctAns2)
;)

 (deffacts questions
 	(quest (no rdy)(question "Are you ready? (yes/no)?"))
 	(quest (no gn)(question "What is your name?"))
 	(quest (no bye)(question "Have a nice day"))
 	(quest (no wk)(question "Do you drive to work everyday? (yes/no) "))
	(quest (no mary)(question "Are you married? (yes/no) "))
	(quest (no mrSpace)(question "Do you need more spaces (yes/no)? "))
 	(quest (no house)(question "Do you have a house? (yes/no) "))
 	(quest (no luxury)(question "Do you like Luxury car? (yes/no) "))
 	(quest (no ruggedCar)(question "Do you like rugged car? (yes/no) "))
 	(quest (no travel)(question "Do you like travel? (yes/no) "))
 	(quest (no pkLight)(question "Do you like to pack light for trips? (yes/no)? "))
 	(quest (no lgDistance)(question "Do you like to drive far away? (yes/no)? "))
 	(quest (no ownCar)(question "Do you use your own car for work? (yes/no)? "))
 	(quest (no school)(question "Are you headed to school? (yes/no)? "))
 	;(quest (no style)(question "How do you want to appear? stylish or creative > "))
 	(quest (no towing)(question "Do you need great towing for next vehicle ? (yes/no)? "))
 	
 	(quest (no important)(question "Like comfortable or not? > "))
 	(quest (no style)(question "Like stylish or not? > "))
 	(quest (no need)(question " Like versatility or not? > "))
 	
 )
 
  ;(deffacts txtquestions
 	
 	;(txtquest (no important)(question "What is most important to you ? comfortable or efficient > ")(correctAns1 comfortable)(correctAns2 efficient))
 	;(txtquest (no style)(question "How do you want to appear? stylish or creative > ")(correctAns1 stylish)(correctAns2 creative))
 	;(txtquest (no need)(question "what do you need? versatility or space? > ")(correctAns1 versatility)(correctAns2 space))
 ;)
 
 
 
 ;(quest (no )(question ""))