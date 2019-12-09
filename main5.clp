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
 	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
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
	(likeRuggedCar ?rugger)
	;(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeLuxury ?luxury1)(likeRuggedCar ?rugger1))
	;(test (eq ?fw ?fw1))
	;(test (eq ?space ?space1))
	;(test (eq ?luxury ?luxury1))
	;(test (eq ?rugger ?rugger1))
	(likeRuggedCar no)
	(car(year ?year1)(Cname ?Cname1)(likeRuggedCar no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideRuggedCar
	(name ?name)
    (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeRuggedCar ?rugger)
	;(car(year ?year1)(Cname ?Cname1)(forWork ?fw1)(needMoreSpace ?space1)(likeLuxury ?luxury1)(likeRuggedCar ?rugger1))
	;(test (eq ?fw ?fw1))
	;(test (eq ?space ?space1))
	;(test (eq ?luxury ?luxury1))
	;(test (eq ?rugger ?rugger1))
	(likeRuggedCar yes)
	(car(year ?year1)(Cname ?Cname1)(likeRuggedCar yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideGoFarAway
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeTravel yes)
	(car(year ?year1)(Cname ?Cname1)(likeTravel yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideStayNearHome
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeLuxury ?luxury)
	(likeTravel no)
	(car(year ?year1)(Cname ?Cname1)(likeTravel no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
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
	(likeToPackLight no)
	(car(year ?year1)(Cname ?Cname1)(likeToPackLight no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
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
	(likeToPackLight ?pklight)
	(likeLongDistanceTravel yes)
	(car(year ?year1)(Cname ?Cname1)(likeLongDistanceTravel yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideForStayNearHome
	(name ?name)
   (forWork ?fw)
	(needMoreSpace ?space)
	(likeToPackLight ?pklight)
	(likeLongDistanceTravel no)
	(car(year ?year1)(Cname ?Cname1)(likeLongDistanceTravel no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
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
	(mostImportantIs yes)
	(car(year ?year1)(Cname ?Cname1)(mostImportantIs yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideLikeEfficient
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool ?school)
	(mostImportantIs no)
	(car(year ?year1)(Cname ?Cname1)(mostImportantIs no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
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
	(style yes)
	(car(year ?year1)(Cname ?Cname1)(style yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideLikeCreative
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(headToSchool ?school)
	(style no)
	(car(year ?year1)(Cname ?Cname1)(style no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
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
	(need yes)
	(car(year ?year1)(Cname ?Cname1)(need yes))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule buyGuideNeedSpace
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
	(needTowing ?towing)
	(need no)
	(car(year ?year1)(Cname ?Cname1)(need no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

(defrule needPower
	(name ?name)
   (forWork ?fw)
    (useOwnCarForWork ?owncar)
    (needTowing no)
    (car(year ?year1)(Cname ?Cname1)(needTowing no))
   =>
	(printout t ?year1 " " ?Cname1 crlf)
	(save-facts /Users/kenh/Documents/583/project03/cpsc583proj1/version05/facts.clp)
)

   
   
      
  
   
 



	
