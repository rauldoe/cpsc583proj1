(defrule welcome
=>
	(printout t " "crlf)
	(printout t "welcome to Toyota Match" crlf)
	(printout t " " crlf)
	(printout t "Ready? (y/n)"crlf)
	(printout t ">> ")
	(bind ?w (read))
	(assert (welcome ?w))
)


(defrule w-y
	(welcome y)
=>
	(printout t " "crlf)
	(printout t "* * Let's start * *" crlf)
	(printout t " "crlf)
	(printout t "Multiple-choice question" crlf)
	(printout t "Where are you headed?" crlf)
	(printout t "a. Off to work" crlf)
	(printout t "b. Out with family"crlf)
  	(printout t ">> ")
	(bind ?ans (read))
	(assert (Q1 ?ans))
)

(defrule w-n
	(welcome n)
=>
	(printout t " "crlf)
	(printout t "Have a nice day" crlf)
	(printout t " "crlf)
)


(defrule Q1-b
	(Q1 b)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q2: How much spaces does you family need" crlf)
	(printout t "a. We need a little" crlf)
	(printout t "b. We need a lot   " crlf)
  (printout t ">> ")
	(bind  ?ans (read))
	(assert (Q2RT ?ans))
)

(defrule Q1-a
	(Q1 a)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q2: I plan to use my vehicle" crlf)
	(printout t "a. commuting to work" crlf)
	(printout t "b. getting work done" crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q2LT ?ans))
)
