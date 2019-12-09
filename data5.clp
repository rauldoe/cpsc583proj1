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
 	
 	(quest (no important)(question "Like comfortable? > "))
 	(quest (no style)(question "Like stylish? > "))
 	(quest (no need)(question " Like versatility? > "))
 	
 	
 )
 
 (deftemplate car
	(slot year)
	(slot Cname)
	(slot forWork)
	(slot married)
	(slot needMoreSpace)
	(slot ownHouse)
	(slot likeLuxury)
	(slot likeRuggedCar)
	(slot likeTravel)
	(slot likeToPackLight)
	(slot likeLongDistanceTravel)
	(slot useOwnCarForWork)
	(slot headToSchool)
	(slot mostImportantIs)
	(slot style)
	(slot needTowing)
	(slot need)
)
 
 ;(forWork )(married )(needMoreSpace )(ownHouse )(likeLuxury )(likeRuggedCar )(likeTravel )(likeToPackLight )(likeLongDistanceTravel )(useOwnCarForWork )(headToSchool )(mostImportantIs )(style )(needTowing )(need ) 
 
 (deffacts carInfor

;Q4LLL-a
(car(year 2020)(Cname 4Runner)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs yes)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Avalon)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs yes)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Camry)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs yes)(style nil)(needTowing nil)(need nil) )

;Q4LLL-b
(car(year 2020)(Cname Prius)(forWork yes)(married no)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool no)(mostImportantIs no)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Prius_Prime)(forWork yes)(married no)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool no)(mostImportantIs no)(style nil)(needTowing nil)(need nil )  )

;Q4LLR-a
(car(year 2020)(Cname Corolla)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool yes)(mostImportantIs nil)(style yes)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Yaris) (forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool yes)(mostImportantIs nil)(style yes)(needTowing nil)(need nil) )

;Q4LLR-b
(car(year 2020)(Cname Camry)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool yes)(mostImportantIs nil)(style no)(needTowing nil)(need nil)  )

;Q3LR
(car(year 2020)(Cname Sequoia)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing no)(need nil)  )
(car(year 2020)(Cname Tacoma)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing no)(need nil) )
(car(year 2020)(Cname Tundra)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing no)(need nil) )

;Q4LRR-a
(car(year 2020)(Cname 4Runner)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need yes) )
(car(year 2020)(Cname Highlander)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need yes) )
(car(year 2020)(Cname Tundra)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need yes))

;Q4LRR-b
(car(year 2020)(Cname Land_Cruiser)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need no)  )
(car(year 2020)(Cname Sequoia)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need no)  )
(car(year 2020)(Cname Tundra)(forWork yes)(married nil)(needMoreSpace nil)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need no)  )

;Q4RLL-a
(car(year 2020)(Cname Camry) (forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel no)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Corolla)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel no)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )

;Q4RLL-b
(car(year 2020)(Cname Prius)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel yes)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil))
(car(year 2020)(Cname Camry_Hybrid)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel yes)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname RAV4_Hybrid)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel yes)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )

;Q3RL-b
(car(year 2019)(Cname Highlander)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight no)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sienna)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight no)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Avalon_Hybrid)(forWork no)(married yes)(needMoreSpace no)(ownHouse nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight no)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )

;Q4RRL-a
(car(year 2020)(Cname Camry)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel no)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sienna)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel no)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname RAV4_Hybrid)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel no)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )

;Q4RRL-b
(car(year 2020)(Cname Highlander)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel yes)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sequoia)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel yes)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sienna)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel yes)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )

;Q4RRR-a
(car(year 2020)(Cname 4Runner)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury yes)(likeRuggedCar yes)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Land_Cruiser)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury yes)(likeRuggedCar yes)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Tundra)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury yes)(likeRuggedCar yes)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil))

;Q4RRR-b
(car(year 2020)(Cname Highlander)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury yes)(likeRuggedCar no)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Sequoia)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury yes)(likeRuggedCar no)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Sienna)(forWork no)(married yes)(needMoreSpace yes)(ownHouse yes)(likeLuxury yes)(likeRuggedCar no)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )

;
) 
 
 ;(quest (no )(question ""))
 
 
 
 
 
 