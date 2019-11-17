

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

;Q1Left
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
	(assert (Q2L ?ans))
)

;Q1Right
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
	(assert (Q2R ?ans))
)

(defrule Q2L-a
	(Q2L a)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q3: Are you headed to work or school?" crlf)
	(printout t "a. going to the office" crlf)
	(printout t "b. going to school    " crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q3LL ?ans))
)

(defrule Q2L-b
	(Q2L b)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q3: What do you need most for work?" crlf)
	(printout t "a. get power   " crlf)
	(printout t "b. great towing" crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q3LR ?ans))
)

(defrule Q2R-a
	(Q2R a)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q3: How do you pack for tip?" crlf)
	(printout t "a. We pack light" crlf)
	(printout t "b. We pack heavy" crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q3RL ?ans))
)


(defrule Q2R-b
	(Q2R b)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q3: What do you value most?" crlf)
	(printout t "a. We like flexibility" crlf)
	(printout t "b. We want luxury     " crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q3RR ?ans))
)

(defrule Q3LL-a
	(Q3LL a)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q4: What's most important to you?" crlf)
	(printout t "a. bing comfortable" crlf)
	(printout t "b. bing efficient  " crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q4LLL ?ans))
)

(defrule Q3LL-b
	(Q3LL b)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q4: How do you want to appear?" crlf)
	(printout t "a. stylish " crlf)
	(printout t "b. creative" crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q4LLR ?ans))
)

(defrule Q3LR-a
	(Q3LR a)
=>
	(printout t " "crlf)
	(printout t "We have found your match"crlf)
	(printout t "2020 Sequoia"crlf)
	(printout t "2020 Tacoma "crlf)
	(printout t "2020 Tundra "crlf)
)

(defrule Q3LR-b
	(Q3LR b)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q3: What do you need?" crlf)
	(printout t "a. versaility" crlf)
	(printout t "b. space     " crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q4LRR ?ans))
)

(defrule Q3RL-a
	(Q3RL a)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q4: How far do you travel?" crlf)
	(printout t "a. stay near home" crlf)
	(printout t "b. go far away   " crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q4RLL ?ans))
)

(defrule Q3RL-b
	(Q3RL b)
=>
	(printout t " "crlf)
	(printout t "We have found your match"crlf)
	(printout t "2020 Highlander   "crlf)
	(printout t "2020 Sienna       "crlf)
	(printout t "2020 Avalon Hybrid"crlf)
)

(defrule Q3RR-a
	(Q3RR a)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q4: How far do you travel?" crlf)
	(printout t "a. stay near home" crlf)
	(printout t "b. go far away" crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q4RRL ?ans))
)

(defrule Q3RR-b
	(Q3RR b)
=>
	(printout t " "crlf)
	(printout t "Mutiple-choice question" crlf)
	(printout t "Q4: What type of luxury do you prefer?" crlf)
	(printout t "a. Rugged " crlf)
	(printout t "b. Refined" crlf)
  	(printout t ">> ")
	(bind  ?ans (read))
	(assert (Q4RRR ?ans))
)

(defrule Q4LLL-a
	(Q4LLL a)
=>
	(printout t " "crlf)
	(printout t "2020 4Runner"crlf)
	(printout t "2020 Avalon "crlf)
	(printout t "2020 Camry  "crlf)
)

(defrule Q4LLL-b
	(Q4LLL b)
=>
	(printout t " "crlf)
	(printout t "2020 Prius      "crlf)
	(printout t "2020 prius Prime"crlf)
)

(defrule Q4LLR-a
	(Q4LLR a)
=>
	(printout t " "crlf)
	(printout t "2020 Corolla "crlf)
	(printout t "2020 Yaris   "crlf)
)

(defrule Q4LLR-b
	(Q4LLR b)
=>
	(printout t " "crlf)
	(printout t "2020 Camry"crlf)
)

(defrule Q4LRR-a
	(Q4LRR a)
=>
	(printout t " "crlf)
	(printout t "2020 4Runner    "crlf)
	(printout t "2020 Highlander "crlf)
	(printout t "2020 Tundra     "crlf)
)

(defrule Q4LRR-b
	(Q4LRR b)
=>
	(printout t " "crlf)
	(printout t "2020 Land Cruiser "crlf)
	(printout t "2020 Sequoia      "crlf)
	(printout t "2020 Tundra       "crlf)
)


(defrule Q4RLL-a
	(Q4RLL a)
=>
	(printout t " "crlf)
	(printout t "2020 Camry  "crlf)
	(printout t "2020 Corolla"crlf)
)

(defrule Q4RLL-b
	(Q4RLL b)
=>
	(printout t " "crlf)
	(printout t "2020 Prius        "crlf)
	(printout t "2020 Camry Hybrid "crlf)
	(printout t "2020 RAV4 Hybrid  "crlf)
)

(defrule Q4RRL-a
	(Q4RRL a)
=>
	(printout t " "crlf)
	(printout t "2020 Camry      "crlf)
	(printout t "2020 Sienna     "crlf)
	(printout t "2020 Rav4 Hybrid"crlf)
)

(defrule Q4RRL-b
	(Q4RRL b)
=>
	(printout t " "crlf)
	(printout t "2020 Highlander "crlf)
	(printout t "2020 Sequoia    "crlf)
	(printout t "2020 Sienna     "crlf)
)

(defrule Q4RRR-a
	(Q4RRR a)
=>
	(printout t " "crlf)
	(printout t "2020 4Runner      "crlf)
	(printout t "2020 Land Cruisor "crlf)
	(printout t "2020 Tundra       "crlf)
)

(defrule Q4RRR-b
	(Q4RRR b)
=>
	(printout t " "crlf)
	(printout t "2020 Highlander "crlf)
	(printout t "2020 Sequioia   "crlf)
	(printout t "2020 Sienna     "crlf)
)
