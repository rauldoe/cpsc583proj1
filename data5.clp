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
 ;Name of this program: data5.clp
 ;Purpose of this file:
 ;1. build up full set of data and data structure


;create a template for question
(deftemplate quest
	(slot no)
	(slot question(type STRING))
)

;create a template for user input (ending game)
(deffacts start
	(getNextInput)
)

;create a template for car information
(deftemplate car
	(slot year)
	(slot Cname)
	(slot forWork)
	(slot needMoreSpace)
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


;build up full set of questions
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
 	(quest (no towing)(question "Do you need great towing for next vehicle ? (yes/no)? "))
 	(quest (no important)(question "Like comfortable? > "))
 	(quest (no style)(question "Like stylish? > "))
 	(quest (no need)(question " Like versatility? > "))
 )
 
  

 
(deffacts carInfor

(car(year 2020)(Cname 4Runner)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs yes)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Avalon)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs yes)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Camry)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs yes)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Prius)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs no)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Prius_Prime)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool no)(mostImportantIs no)(style nil)(needTowing nil)(need nil )  )
(car(year 2020)(Cname Corolla)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool yes)(mostImportantIs nil)(style yes)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Yaris) (forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool yes)(mostImportantIs nil)(style yes)(needTowing nil)(need nil) )
(car(year 2020)(Cname Camry)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork no)(headToSchool yes)(mostImportantIs nil)(style no)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sequoia)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing no)(need nil)  )
(car(year 2020)(Cname Tacoma)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing no)(need nil) )
(car(year 2020)(Cname Tundra)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing no)(need nil) )
(car(year 2020)(Cname 4Runner)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need yes) )
(car(year 2020)(Cname Highlander)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need yes) )
(car(year 2020)(Cname Tundra)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need yes))
(car(year 2020)(Cname Land_Cruiser)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need no)  )
(car(year 2020)(Cname Sequoia)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need no)  )
(car(year 2020)(Cname Tundra)(forWork yes)(needMoreSpace nil)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork yes)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing yes)(need no)  )
(car(year 2020)(Cname Camry) (forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel no)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Corolla)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel no)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Prius)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel yes)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil))
(car(year 2020)(Cname Camry_Hybrid)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel yes)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname RAV4_Hybrid)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight yes)(likeLongDistanceTravel yes)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2019)(Cname Highlander)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight no)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sienna)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight no)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Avalon_Hybrid)(forWork no)(needMoreSpace no)(likeLuxury nil)(likeRuggedCar nil)(likeTravel nil)(likeToPackLight no)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Camry)(forWork no)(needMoreSpace yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel no)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sienna)(forWork no)(needMoreSpace yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel no)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname RAV4_Hybrid)(forWork no)(needMoreSpace yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel no)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Highlander)(forWork no)(needMoreSpace yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel yes)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sequoia)(forWork no)(needMoreSpace yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel yes)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname Sienna)(forWork no)(needMoreSpace yes)(likeLuxury no)(likeRuggedCar nil)(likeTravel yes)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil)  )
(car(year 2020)(Cname 4Runner)(forWork no)(needMoreSpace yes)(likeLuxury yes)(likeRuggedCar yes)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Land_Cruiser)(forWork no)(needMoreSpace yes)(likeLuxury yes)(likeRuggedCar yes)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Tundra)(forWork no)(needMoreSpace yes)(likeLuxury yes)(likeRuggedCar yes)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil))
(car(year 2020)(Cname Highlander)(forWork no)(needMoreSpace yes)(likeLuxury yes)(likeRuggedCar no)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Sequoia)(forWork no)(needMoreSpace yes)(likeLuxury yes)(likeRuggedCar no)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
(car(year 2020)(Cname Sienna)(forWork no)(needMoreSpace yes)(likeLuxury yes)(likeRuggedCar no)(likeTravel nil)(likeToPackLight nil)(likeLongDistanceTravel nil)(useOwnCarForWork nil)(headToSchool nil)(mostImportantIs nil)(style nil)(needTowing nil)(need nil) )
) 
 

 
 
 
 
 
 