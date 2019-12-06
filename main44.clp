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
   (forWork no)
	(married yes)
   =>
   (assert (needMoreSpace (yesOrNo "Do you need more spaces (yes/no)? "))))
   
(defrule ownHouse
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(quest (no ?num1&C)(question ?question1))
   =>
   (assert (ownHouse (yesOrNo ?question1))))   

(defrule likeLuxury
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
   =>
   (assert (likeLuxury (yesOrNo "Do you like Luxury car? (yes/no) "))))
   
(defrule likeRuggedCar
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury yes)
   =>
   (assert (likeRuggedCar (yesOrNo "Do you like rugged car? (yes/no) ")))
)

(defrule likeTravel
   (forWork no)
	(married yes)
	(needMoreSpace yes)
	(ownHouse yes)
	(likeLuxury no)
   =>
   (assert (likeTravel (yesOrNo "Do you like travel? (yes/no) "))))
   
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
   (forWork no)
	(married yes)
	(needMoreSpace no)
   =>
   (assert (likeToPackLight (yesOrNo "Do you like to pack light for trips? (yes/no)? "))))
   
(defrule likeToPackHeavy
	(name ?name)
   (forWork no)
	(married no)
	(needMoreSpace no)
	(likeToPackLight no)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Highlander" crlf)
   (printout t "2020 Sienna" crlf)
   (printout t "2020 Avalon Hybrid" crlf)
)
   
(defrule likeLongDistanceTravel
   (forWork no)
	(married no)
	(needMoreSpace no)
	(likeToPackLight yes)
   =>
   (assert (likeLongDistanceTravel (yesOrNo "Do you like to drive far away? (yes/no)? "))))
   
 (defrule buyGuideForLongDistanceTravel
	(name ?name)
   (forWork no)
	(married no)
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
	(married no)
	(needMoreSpace no)
	(likeToPackLight yes)
	(likeLongDistanceTravel no)
   =>
      	(printout t ?name " we recoomended" crlf)
   (printout t "2020 Camry" crlf)
   (printout t "2020 Corolla" crlf)
)

(defrule useOwnCarForWork
   (forWork yes)
   =>
   (assert (useOwnCarForWork (yesOrNo "Do you use your own car for work? (yes/no)? "))))

(defrule headToSchool
   (forWork yes)
    (useOwnCarForWork no)
   =>
   (assert (headToSchool (yesOrNo "Are you headed to school? (yes/no)? "))))

(defrule mostImportantIs
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool no)
   =>
   (assert (mostImportantIs (askQuestion "What is most important to you ? comfortable or efficient > "comfortable efficient))))
      
(defrule buyGuideLikeComfortable
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool no)
	(mostImportantIs comfortable)
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
	(mostImportantIs efficient)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Prius" crlf)
   (printout t "2020 Prius Prime" crlf)
)


(defrule style
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool yes)
   =>
   (assert (style (askQuestion "How do you want to appear? stylish or creative > "stylish creative))))   
   
   (defrule buyGuideLikeStylish
	(name ?name)
   (forWork yes)
    (useOwnCarForWork no)
	(headToSchool yes)
	(style stylish)
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
	(style creative)
   =>
   (printout t ?name " we recoomended" crlf)
   (printout t "2020 Camry" crlf)
)

(defrule needTowing
   (forWork yes)
    (useOwnCarForWork yes)
   =>
   (assert (needTowing (yesOrNo "Do you need great towing for next vehicle ? (yes/no)? "))))
   
(defrule need
   (forWork yes)
    (useOwnCarForWork yes)
	(needTowing yes)
   =>
   (assert (need (askQuestion "what do you need? versatility or space? > "versatility space))))
   
    
(defrule buyGuideNeedVersatility
	(name ?name)
   (forWork yes)
    (useOwnCarForWork yes)
	(needTowing yes)
	(need versatility)
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
	(need space)
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

   
   
      
  
   
 



	
