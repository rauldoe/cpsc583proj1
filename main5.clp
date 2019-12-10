 ;Author: Ken Hsu, Paul Do
 ;Course: CPSC 583
 ;Assignment: Project One
 ;Due Date: 12/10/19
 ;Source fie: script5.clp, main5.clp, data5.clp, buyGuideFlowchart.pdf
 ;
 ;Purpose of this entire program:
 ;1. understand how to build up Artifical intelligent program 
 ;2. how to use CLIPS IDE
 ;
 ;Development Status: completed
 ;
 ;Name of this program: main5.clp
 ;Purpose of this file:
 ;1. build up rules and functions to run the application 
 
 
 
 
 ;output user decisoin formally 
 ;offer users to write thier demand in word 
 ;to match question choices in this program
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
 
 ;output user decisoin formally     
 (deffunction yesOrNo (?question)
   (bind ?response (askQuestion ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no)
 ) 

;get user name        
(deffunction getName (?question)
   (printout t ?question " ")
   (bind ?answer (read))
)

;build a function to display endgame message 
(deffunction displayInfor (?question)
   (printout t ?question crlf)  
)

;get start-game decision
(defrule startGame
	(not (ready ?))
	(quest (no rdy)(question ?question1))	
=>
	(assert (ready (yesOrNo ?question1 )))
)

;build a rule to get user name
(defrule getName
   (ready yes)
   (not (name ?))
   (quest (no gn)(question ?question1))	
   =>
   (assert (name (getName ?question1)))
)
   
;build a rule to display endgame message 
(defrule GoodBye
   (ready no)
   (not (name ?))
   (quest (no bye)(question ?question1))	
   =>
 	(assert (bye (displayInfor ?question1)))
)

;build a rule to ask if user is a communter
(defrule forWork
   (name ?name)
   (quest (no wk)(question ?question1))	
   =>
   (assert (forWork (yesOrNo ?question1)))
)
   
;build a rule to ask if family car owner need bigger room for thier future car   
(defrule needMoreSpace
	(name ?name)
   (forWork no)
	(quest (no mrSpace)(question ?question1))
   =>
   (assert (needMoreSpace (yesOrNo ?question1)))
)
    
;build a rule to ask if family car owner like luxury car or not 
(defrule likeLuxury
	(name ?name)
   (forWork ?fw)
	(needMoreSpace yes)
	(quest (no luxury)(question ?question1))
   =>
   (assert (likeLuxury (yesOrNo ?question1)))
)

;build a rule to ask if family car owner who like luxury car also like extra feature like rugged car   
(defrule likeRuggedCar
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury yes)
	(quest (no ruggedCar)(question ?question1))
   =>
   (assert (likeRuggedCar (yesOrNo ?question1)))
)

;build a rule to ask if family car owners who dont like luxury but like traveling.
(defrule likeTravel
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury no)
	(quest (no travel)(question ?question1))
   =>
   (assert (likeTravel (yesOrNo ?question1)))
)

;generate recommendation for family car owners who like luxury car also like extra feature like refined car          
(defrule buyGuideRefinedCar
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeRuggedCar ?rugger&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeLuxury ?luxury1)(likeRuggedCar ?rugger1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?luxury ?luxury1))
	(test (eq ?rugger ?rugger1))
   =>
	(printout t ?year1 " " ?Cname1 crlf) 
)

;generate recommendation for family car owners who like luxury car also like extra feature like rugged car  
(defrule buyGuideRuggedCar
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeRuggedCar ?rugger&yes)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeLuxury ?luxury1)(likeRuggedCar ?rugger1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?luxury ?luxury1))
	(test (eq ?rugger ?rugger1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

;generate recommendation for family car owners who dislike luxury car but love traveling 
(defrule buyGuideGoFarAway
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeTravel ?travel&yes)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeLuxury ?luxury1)(likeTravel ?travel1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?luxury ?luxury1))
	(test (eq ?travel ?travel1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;generate recommendation for family car owners who dislike luxury car but are used to drive around community 
(defrule buyGuideStayNearHome
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeTravel ?travel&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeLuxury ?luxury1)(likeTravel ?travel1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?luxury ?luxury1))
	(test (eq ?travel ?travel1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

;build a rule to ask family car owner about thier travel habit.
(defrule likeToPackLight
	(name ?name)
	(needMoreSpace no)
	(quest (no pkLight)(question ?question1))
   =>
   (assert (likeToPackLight (yesOrNo ?question1)))
)
   
;generate recommendation for family car owner who like to pack a lot in trips
(defrule likeToPackHeavy
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight ?packLight&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeToPackLight ?packLight1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?packLight ?packLight1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;build a rule to ask family car owner who like light-weight baggage but love long-distance travels 
(defrule likeLongDistanceTravel
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight yes)
	(quest (no lgDistance)(question ?question1))
   =>
   (assert (likeLongDistanceTravel (yesOrNo ?question1)))
 )
   
;generate recommendation for family car owner who light-weight baggage but love long-distance travels  
 (defrule buyGuideForLongDistanceTravel
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight ?packLight)
	(likeLongDistanceTravel ?lgDistance&yes)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeToPackLight ?packLight1)(likeLongDistanceTravel ?lgDistance1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?packLight ?packLight1))
	(test (eq ?lgDistance ?lgDistance1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;generate recommendation for family car owner who light-weight baggage but like to drive in community  
(defrule buyGuideForStayNearHome
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight ?packLight)
	(likeLongDistanceTravel ?lgDistance&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeToPackLight ?packLight1)(likeLongDistanceTravel ?lgDistance1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?packLight ?packLight1))
	(test (eq ?lgDistance ?lgDistance1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;build a rule to find out commuters who drive own car to work or not. 
(defrule useOwnCarForWork
	(name ?name)
   (forWork yes)
   (quest (no ownCar)(question ?question1))
   =>
   (assert (useOwnCarForWork (yesOrNo ?question1))))

;build a rule to find out communters who are student  
(defrule headToSchool
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork no)
    (quest (no school)(question ?question1))
   =>
   (assert (headToSchool (yesOrNo ?question1)))
 )

;build a rule to find out special demands for commuters who are office worker 
(defrule mostImportantIs
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool no)
	(quest (no important)(question ?question1))
   =>
    (assert (mostImportantIs (yesOrNo ?question1)))
 )

;generate recommendation for students who drive own cars to school daily and need extra features like comfortable 
(defrule buyGuideLikeComfortable
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool ?school)
	(mostImportantIs ?important&yes)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(headToSchool ?school1)(mostImportantIs ?important1))
	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?school ?school1))
	(test (eq ?important ?important1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;generate recommendation for students who drive own cars to school daily and need extra features like efficient 
(defrule buyGuideLikeEfficient
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool ?school)
	(mostImportantIs ?important&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(headToSchool ?school1)(mostImportantIs ?important1))
	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?school ?school1))
	(test (eq ?important ?important1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

;build a rule to find out car stye for students who drive own cars to schools every day.
(defrule style
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool yes)
	(quest (no style)(question ?question1))
   =>
    (assert (style (yesOrNo ?question1))))   
   
;generate recommendation for students who drive own cars to school daily and need extra stylish      
(defrule buyGuideLikeStylish
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool ?school)
	(style ?Style&yes)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(headToSchool ?school1)(style ?Style1))
	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?school ?school1))
	(test (eq ?Style ?Style1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

;generate recommendation for communters who use own car for towing and need versatility from their future car  
(defrule buyGuideLikeCreative
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool ?school)
	(style ?Style&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(headToSchool ?school1)(style ?Style1))
	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?school ?school1))
	(test (eq ?Style ?Style1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;build a rule to find out demand for communter who own-car worker who need towing or not for their future car    
(defrule needTowing
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork yes)
    (quest (no towing)(question ?question1))
   =>
   (assert (needTowing (yesOrNo ?question1)))
)

;build a rule to find out extra special demand for communter who use own car to work and need towking power for thier future car     
(defrule need
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(needTowing yes)
	(quest (no need)(question ?question1))
   =>
   (assert (need (yesOrNo ?question1)))
 )
   
;generate recommendation for communters who use own car for towing and need versatility from their future car     
(defrule buyGuideNeedVersatility
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(needTowing ?towing)
	(need ?Need&yes)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(needTowing ?towing1)(need ?Need1))
	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?towing ?towing1))
	(test (eq ?Need ?Need1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

;generate recommendation for communters who use own car for towing and need large-size room to load tools and packages. 
(defrule buyGuideNeedSpace
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(needTowing ?towing)
	(need ?Need&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(needTowing ?towing1)(need ?Need1))
	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?towing ?towing1))
	(test (eq ?Need ?Need1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

;generate recommendation for communters who use own car for working don't need towing power from thier their car
(defrule needPower
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
    (needTowing ?towing&no)
    (car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(needTowing ?towing1))
    	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?towing ?towing1))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

;get ending decisions from user 
(defrule getInput
	?f <- (getNextInput)
	=>
	(printout t "Input 'end' to leave this game? >> ")
	(bind ?input(readline))
	(clear-window)
	(if (neq ?input "end")
		then
		(retract ?f)
		(reset)
		(run)
		(assert (getNextInput))
		(assert (user-input ?input)))


)   
   
      
  
   
 



	
