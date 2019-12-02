(deftemplate customer
	(slot name (type STRING))
	(slot budget (type NUMBER)(default 0))
	(slot maritalStatus (type STRING)(default "UNKNOWN"))
	(slot homeOwnership (type STRING)(default "UNKNOWN"))
)

 (deftemplate pQuestion
     (slot No (type STRING)(default "UNKNOWN"))
     (slot Content (type STRING)(default "UNKNOWN"))
 )

 (deftemplate qChoice "for persoanl question"
     (slot No (type STRING)(default "UNKNOWN"))
     (slot Choice1 (type STRING)(default "UNKNOWN"))
     (slot Content1 (type STRING)(default "UNKNOWN"))
     (slot Choice2 (type STRING)(default "UNKNOWN"))
     (slot Content2 (type STRING)(default "UNKNOWN"))
     (slot Choice3 (type STRING)(default "UNKNOWN"))
     (slot Content3 (type STRING)(default "UNKNOWN"))
     (slot Choice4 (type STRING)(default "UNKNOWN"))
     (slot Content4 (type STRING)(default "UNKNOWN"))
 )
 
 (assert (pQuestion (No "A")(Content "What is your name?")))
 (assert (pQuestion (No "B")(Content "Budget?")))
 (assert (pQuestion (No "C")(Content "What is your marital status?")))
 (assert (pQuestion (No "D")(Content "Do you have a house?")))

 
 (assert (qChoice(No "c")(Choice1 "a")(Content1 "Married")(Choice2 "b")(Content2 "Single")(Choice3 "c")(Content3 "Divorced")(Choice4 "d")(Content4 "Window")))

 
 
(defrule starter
	?init <-(initial-fact)
=>
	(retract ?init)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t "			" crlf)
	(printout t "	W E L C O M E  T O T O Y O T A  C A R  M A T C H" crlf)
	(printout t " " crlf)
	(printout t "This Artifical Intelligence Automobile Match" crlf)
	(printout t "System will help  " crlf)
	(printout t " " crlf)
	(printout t "Auto buyer make a decision " crlf)
	(printout t "for 2020 Toyota Cars " crlf)
	(printout t "The system will asked basic questions" crlf)
	(printout t " based on user's personal information and activieies" crlf)
	(printout t "In the end of test, there will be a list of " crlf)
	(printout t "recommendation on the purchase " crlf)
	(printout t " " crlf)
	(printout t "hit <<return>> key to begin the play" crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(bind ?answer(readline))
	(assert (screen 2))
)
	
(defrule first-screen
	?scan <-(screen 2)
=>
	(retract ?scan)
)

(defrule welcome
=>
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t "welcome to Toyota Match" crlf)
	(printout t " " crlf)
	(printout t "Ready? (y/n)"crlf)
	(printout t ">> ")
	(bind ?w (read))
	(assert (welcome ?w))
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(printout t " " crlf)
	(assert (screen 3))
)

(defrule first-screen
	?scan <-(screen 3)
=>
	(retract ?scan)
)

(defrule storeCustomerInfor
	(welcome ?w&y|Y|yes|Yes|YES|ya|YA)
=>
	(defrule questionA
		(pQuestion (No ?no)(Content ?content1))
	=>
		(printout t ?no " " ?content1 crlf)
	)
	(bind ?cName (read))
	(printout t " " crlf)
	(defrule questionB
		(pQuestion (No ?no)(Content ?content2))
	=>
		(printout t ?no " " ?content2 crlf)
	)
	(bind ?cBudget (read))
	(printout t " " crlf)
    (defrule questionC
            (qChoice (No ?no)(Choice1 ?chc1)(Content1 ?cont1)(Choice2 ?chc2)(Content2 ?cont2)(Choice3 ?chc3)(Content3 ?cont3)(Choice4 ?chc4)(Content4 ?cont4))
            (pQuestion (No ?no)(Content ?content3))
        =>
            (printout t ?no " " ?content3 crlf)
            (printout t ?chc1 " " ?cont1 crlf)
            (printout t ?chc2 " " ?cont2 crlf)
            (printout t ?chc3 " " ?cont3 crlf)
            (printout t ?chc4 " " ?cont4 crlf)
    )
	(printout t ">> ")
	(bind ?cMarriage(read))
	(printout t "" crlf)
	(defrule questionD
		(pQuestion (No ?no)(Content ?content4))
	=>
		(printout t ?no " " ?content4 crlf)
	)
	(printout t "a Yes I own a property" crlf)
	(printout t "b No I dont a property" crlf)
	(printout t ">> ")
	(bind ?cHouseOwn(read))
	(printout t " " crlf)
	(assert (name ?cName))
	(assert (budget ?cBudget))
	(assert (maritalStatus ?cMarriage))
	(assert (homeOwnership ?cHouseOwn))
	(assert (screen 4))
)

(defrule w-n
	(welcome ?w&n|N|no|No|NO|nope|bye|Bye)
=>
	(printout t " "crlf)
	(printout t "Have a nice day" crlf)
	(printout t " "crlf)
)



	













































