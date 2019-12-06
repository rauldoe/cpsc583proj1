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
 
 ;(deffunction askTXTQuestion (?question ?ans1 ?ans2 $?allowed-values)
   ;(printout t ?question)
   ;(bind ?answer (read))
   ;(if (lexemep ?answer) 
   ;    then (bind ?answer (lowcase ?answer)))
   ;(while (not (member ?answer ?allowed-values)) do
    ;  (printout t ?question)
    ;  (bind ?answer (read))
    ;  (if (lexemep ?answer) 
    ;     then (bind ?answer (lowcase ?answer))))
   ;?answer)  
 

       
(deffunction getName (?question)
   (printout t ?question " ")
   (bind ?answer (read))
)

(deffunction displayInfor (?question)
   (printout t ?question crlf)
)


(defrule startGame
	(not (ready ?))
	(quest (no ?num1&rdy)(question ?question1))	
=>
	(assert (ready (yesOrNo ?question1 )))
)




(defrule getName
   (ready yes)
   (not (name ?))
   (quest (no ?num1&gn)(question ?question1))	
   =>
   (assert (name (getName ?question1))))
   
(defrule GoodBye
   (ready no)
   (not (name ?))
   (quest (no ?num1&bye)(question ?question1))	
   =>
 	(displayInfor ?question1)
)

(defrule forWork
   (name ?name)
   (quest (no ?num1&wk)(question ?question1))	
   =>
   (assert (forWork (yesOrNo ?question1))))
   
(defrule married
	(name ?name)
   (forWork no)
   (quest (no ?num1&mary)(question ?question1))	
   =>
   (assert (married (yesOrNo ?question1))))

(defrule needMoreSpace
	(name ?name)
   (forWork no)
	(married yes)
	 (quest (no ?num1&mrSpace)(question ?question1))
   =>
   (assert (needMoreSpace (yesOrNo ?question1))))
   
(defrule ownHouse
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(quest (no ?num1&house)(question ?question1))
   =>
   (assert (ownHouse (yesOrNo ?question1))))   

(defrule likeLuxury
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(quest (no ?num1&luxury)(question ?question1))
   =>
   (assert (likeLuxury (yesOrNo ?question1))))
   
(defrule likeRuggedCar
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury yes)
	(quest (no ?num1&ruggedCar)(question ?question1))
   =>
   (assert (likeRuggedCar (yesOrNo ?question1)))
)

(defrule likeTravel
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury no)
	(quest (no ?num1&travel)(question ?question1))
   =>
   (assert (likeTravel (yesOrNo ?question1))))
   
(defrule buyGuideRuggedCar
	(name ?name)
     (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury yes)
	(likeRuggedCar yes)
   =>
	(printout t ?name " we recoomended" crlf)
   (printout t "2020 Highlander" crlf)
   (printout t "2020 Sequoia" crlf)
   (printout t "2020 Sienna" crlf)
)

(defrule buyGuideRefinedCar
	(name ?name)
     (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury yes)
	(likeRuggedCar no)
=>
	(printout t ?name " we recoomended" crlf)
   (printout t "2020 4Runner" crlf)
   (printout t "2020 Land Cruiser" crlf)
   (printout t "2020 Tundra" crlf)
)

(defrule buyGuideGoFarAway
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury no)
	(likeTravel yes)
   =>
   	(printout t ?name " we recoomended" crlf)
   (printout t "2019 Highlander" crlf)
   (printout t "2020 Sequoia" crlf)
   (printout t "2020 Sienna" crlf)
)

(defrule buyGuideStayNearHome
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury no)
	(likeTravel no)
   =>
   	(printout t ?name " we recoomended" crlf)
   (printout t "2020 Camry" crlf)
   (printout t "2020 Sienna" crlf)
   (printout t "2020 RAV4 Hybrid" crlf)
)

(defrule likeToPackLight
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace no)
	(quest (no ?num1&pkLight)(question ?question1))
   =>
   (assert (likeToPackLight (yesOrNo ?question1))))
   
(defrule likeToPackHeavy
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace no)
	(likeToPackLight no)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Highlander" crlf)
   (printout t "2020 Sienna" crlf)
   (printout t "2020 Avalon Hybrid" crlf)
)
   
(defrule likeLongDistanceTravel
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace no)
	(likeToPackLight yes)
	(quest (no ?num1&lgDistance)(question ?question1))
   =>
   (assert (likeLongDistanceTravel (yesOrNo ?question1))))
   
 (defrule buyGuideForLongDistanceTravel
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace no)
	(likeToPackLight yes)
	(likeLongDistanceTravel yes)
   =>
    (printout t ?name " we recoomended" crlf)
   (printout t "2020 Prius" crlf)
   (printout t "2020 Camry Hybrid" crlf)
   (printout t "2020 RAV4 Hybrid" crlf)
)

(defrule buyGuideForStayNearHome
	(name ?name)
   (forWork no)
	(married yes)
	(needMoreSpace no)
	(likeToPackLight yes)
	(likeLongDistanceTravel no)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Camry" crlf)
   (printout t "2020 Corolla" crlf)
)

(defrule useOwnCarForWork
	(name ?name)
   (forWork yes)
   (quest (no ?num1&ownCar)(question ?question1))
   =>
   (assert (useOwnCarForWork (yesOrNo ?question1))))

(defrule headToSchool
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
    (quest (no ?num1&school)(question ?question1))
   =>
   (assert (headToSchool (yesOrNo ?question1))))

(defrule mostImportantIs
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool no)
	(quest (no ?num1&important)(question ?question1))
   =>
    (assert (mostImportantIs (yesOrNo ?question1))))
      
(defrule buyGuideLikeComfortable
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool no)
	(mostImportantIs yes)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 4Runner" crlf)
   (printout t "2020 Avalon" crlf)
   (printout t "2020 Camry" crlf)
)

(defrule buyGuideLikeEfficient
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool no)
	(mostImportantIs no)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Prius" crlf)
   (printout t "2020 Prius Prime" crlf)
)


(defrule style
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool yes)
	(quest (no ?num1&style)(question ?question1))
   =>
    (assert (style (yesOrNo ?question1))))   
   
   (defrule buyGuideLikeStylish
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool yes)
	(style yes)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Corolla" crlf)
   (printout t "2020 Yaris" crlf)
)

(defrule buyGuideLikeCreative
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool yes)
	(style no)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Camry" crlf)
)

(defrule needTowing
	(name ?name)
   (forWork yes)
    (useOwnCarForWork yes)
    (quest (no ?num1&towing)(question ?question1))
   =>
   (assert (needTowing (yesOrNo ?question1))))
   
(defrule need
	(name ?name)
   (forWork yes)
    (useOwnCarForWork yes)
	(needTowing yes)
	(quest (no ?num1&need)(question ?question1))
   =>
   (assert (need (yesOrNo ?question1))))
   
    
(defrule buyGuideNeedVersatility
	(name ?name)
   (forWork yes)
    (useOwnCarForWork yes)
	(needTowing yes)
	(need yes)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 4Runner" crlf)
	(printout t "2020 Highlander" crlf)
	(printout t "2020 Tundra" crlf)
)

(defrule buyGuideNeedSpace
	(name ?name)
   (forWork yes)
    (useOwnCarForWork yes)
	(needTowing yes)
	(need no)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Land Cruiser" crlf)
	(printout t "2020 Sequoia" crlf)
	(printout t "2020 Tundra" crlf)
)

(defrule needPower
	(name ?name)
   (forWork yes)
    (useOwnCarForWork yes)
    (needTowing no)
   =>
 (printout t ?name " we recoomended" crlf)
   (printout t "2020 Sequoia" crlf)
	(printout t "2020 Tacoma" crlf)
	(printout t "2020 Tundra" crlf)
)

   
   
      
  
   
 



	
