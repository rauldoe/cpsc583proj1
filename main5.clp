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
        
(deffunction getName (?question)
   (printout t ?question " ")
   (bind ?answer (read))
)

(deffunction displayInfor (?question)
   (printout t ?question crlf)
   
)


(defrule startGame
	(not (ready ?))
	(quest (no rdy)(question ?question1))	
=>
	(assert (ready (yesOrNo ?question1 )))
)


(defrule getName
   (ready yes)
   (not (name ?))
   (quest (no gn)(question ?question1))	
   =>
   (assert (name (getName ?question1))))
   
(defrule GoodBye
   (ready no)
   (not (name ?))
   (quest (no bye)(question ?question1))	
   =>
 	(assert (bye (displayInfor ?question1)))
 	
)

(defrule forWork
   (name ?name)
   (quest (no wk)(question ?question1))	
   =>
   (assert (forWork (yesOrNo ?question1))))
   
(defrule needMoreSpace
	(name ?name)
   (forWork no)
	(quest (no mrSpace)(question ?question1))
   =>
   (assert (needMoreSpace (yesOrNo ?question1))))
    

(defrule likeLuxury
	(name ?name)
   (forWork ?fw)
	(needMoreSpace yes)
	(quest (no luxury)(question ?question1))
   =>
   (assert (likeLuxury (yesOrNo ?question1))))
   
(defrule likeRuggedCar
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury yes)
	(quest (no ruggedCar)(question ?question1))
   =>
   (assert (likeRuggedCar (yesOrNo ?question1)))
)

(defrule likeTravel
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury no)
	(quest (no travel)(question ?question1))
   =>
   (assert (likeTravel (yesOrNo ?question1))))
   
      
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
	;(likeRuggedCar no)
	;(car(year ?year1)(Cname ?Cname1)(likeRuggedCar no))
   =>
	(printout t ?year1 " " ?Cname1 crlf) 
)

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
	;(likeRuggedCar yes)
	;(car(year ?year1)(Cname ?Cname1)(likeRuggedCar yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

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
	;(likeTravel yes)
	;(car(year ?year1)(Cname ?Cname1)(likeTravel yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

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
	;(likeTravel no)
	;(car(year ?year1)(Cname ?Cname1)(likeTravel no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)	
)

(defrule likeToPackLight
	(name ?name)
	(needMoreSpace no)
	(quest (no pkLight)(question ?question1))
   =>
   (assert (likeToPackLight (yesOrNo ?question1))))
   
(defrule likeToPackHeavy
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight ?packLight&no)
	(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeToPackLight ?packLight1))
	(test (eq ?fw ?fw1))
	(test (eq ?space ?space1))
	(test (eq ?packLight ?packLight1))
	;(likeToPackLight no)
	;(car(year ?year1)(Cname ?Cname1)(likeToPackLight no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)
   
(defrule likeLongDistanceTravel
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight yes)
	(quest (no lgDistance)(question ?question1))
   =>
   (assert (likeLongDistanceTravel (yesOrNo ?question1))))
   
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
	;(likeLongDistanceTravel yes)
	;(car(year ?year1)(Cname ?Cname1)(likeLongDistanceTravel yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

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
	;(likeLongDistanceTravel no)
	;(car(year ?year1)(Cname ?Cname1)(likeLongDistanceTravel no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
)

(defrule useOwnCarForWork
	(name ?name)
   (forWork yes)
   (quest (no ownCar)(question ?question1))
   =>
   (assert (useOwnCarForWork (yesOrNo ?question1))))

(defrule headToSchool
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork no)
    (quest (no school)(question ?question1))
   =>
   (assert (headToSchool (yesOrNo ?question1))))

(defrule mostImportantIs
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool no)
	(quest (no important)(question ?question1))
   =>
    (assert (mostImportantIs (yesOrNo ?question1))))
      
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
	;(mostImportantIs yes)
	;(car(year ?year1)(Cname ?Cname1)(mostImportantIs yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)

)

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
	;(mostImportantIs no)
	;(car(year ?year1)(Cname ?Cname1)(mostImportantIs no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	
)


(defrule style
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool yes)
	(quest (no style)(question ?question1))
   =>
    (assert (style (yesOrNo ?question1))))   
   
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
	;(style yes)
	;(car(year ?year1)(Cname ?Cname1)(style yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	
)

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
	;(style no)
	;(car(year ?year1)(Cname ?Cname1)(style no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)

)

(defrule needTowing
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork yes)
    (quest (no towing)(question ?question1))
   =>
   (assert (needTowing (yesOrNo ?question1))))
   
(defrule need
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(needTowing yes)
	(quest (no need)(question ?question1))
   =>
   (assert (need (yesOrNo ?question1))))
   
    
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
	;(need yes)
	;(car(year ?year1)(Cname ?Cname1)(need yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	
)

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
	;(need no)
	;(car(year ?year1)(Cname ?Cname1)(need no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)

)

(defrule needPower
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
    (needTowing ?towing&no)
    (car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(useOwnCarForWork ?owncar1)(needTowing ?towing1))
    	(test (eq ?fw ?fw1))
	(test (eq ?owncar ?owncar1))
	(test (eq ?towing ?towing1))
    ;(needTowing no)
    ;(car(year ?year1)(Cname ?Cname1)(needTowing no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	
)


(defrule getInput
	?f <- (getNextInput)
	=>
	(printout t "Input 'end' to leave this game? >> ")
	(bind ?input(readline))
	(if (neq ?input "end")
		then
		(retract ?f)
		(reset)
		(load /Users/kenh/Documents/583/project03/cpsc583proj1/version05/data5.clp)
		(load /Users/kenh/Documents/583/project03/cpsc583proj1/version05/main5.clp)
		(assert (getNextInput))
		(assert (user-input ?input)))
)   
   
      
  
   
 



	
