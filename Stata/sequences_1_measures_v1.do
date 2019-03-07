clear

// This file draws upon the "Multi-Year ATUS Data Files" downloaded from: https://www.bls.gov/tus/datafiles_0316.htm
// The .do files for the initial data is located: "ATUSGenderSequenceAnalysis\Stata\ATUS Setup"

global jppath "C:\Users\Joanna\Dropbox\Repositories"		/*Set up Joanna's file path*/

cd 	"$jppath\ATUSGenderSequenceAnalysis_data"
use "D:\Dropbox\Data\ATUS\ATUS0316\atusact_0316\atus0316act", replace	/*This is where my data is stored. How to share? */

sort tucaseid 

********************************************************************************************************
/*
Paid Work & Education
Household Work (Housework, Shopping/Services)
Care Work (Child Care, Elder Care)
Self Care (sleep, eating, grooming)

We could include education with paid work, volunteering with child care (as form of carework) & 
government services with household.
*/

**********************************************************************************************
// PAID WORK
cap drop 		workedu
gen 			workedu=.
foreach i in 		050101 	050102 	050103 	050189 	050201 	050202 	050203 	050204 	///
					050289 	050301 	050302 	050303 	050304 	050389	050403 	050404 	///
					050405 	050481 	050499 	059999	180501 	180502 	180589 			///
					060101 	060102 	060103 	060104 	060199 	060201 	060202 	060203 	///
					060289 	060301 	060302 	060303	060399 	060401	060402 	060403	///
					060499 	069999	160103 	180601 	180682 	180699	{
	replace 	workedu=1 if trcode == `i'
 	 }
replace 		workedu=0 if workedu==.
label var 		workedu "Paid Work & Education"
tab 			workedu, m

*checking to see if it matches Marital Status Summary Variables
cap drop		worksum
egen			worksum 	= total(tuactdur24) if workedu==1, by(tucaseid)
replace			worksum		= 0 if worksum==.

preserve
collapse (max)worksum, by(tucaseid)
sum worksum
restore

**********************************************************************************************
***HOUSEWORK***
cap drop 		housework
gen 			housework=.
foreach i in 	020101 	020102 	020103 	020104 	020199							///
				020201 	020202 	020203 	020299									///
				070101 	180701													///
				020301 	020302 	020303 	020399									///
				020401 	020402 	020499 											///
				020501 	020502 	020599 	180904									///
				020681 	020699 	180807 	180903									///
				020701 	020799 	020801 	020899									///
				020901 	020902 	020903 	020904 	020905 	020999					///
				029999															///
				080201 	080202 	080203 	080299									///
				080701 	080702 	080799 	080699 									///
				090101 	090102 	090103 	090104 	090199							///
				090201 	090202 	090299 	090301 	090302 	090399 	090401 			///
				090402 	090499	090501 	090502 	090599 	099999 	160106			{
	replace 	housework=1 if trcode == `i'
 	 }
replace 		housework=0 if housework==.
label var 		housework "Household work"
tab 			housework, m

// Creating sub-hswrk variable with cooking/cleaning/laundry
cap drop		dailyhswk
gen				dailyhswk=.
foreach i in	020101	020102	020201	020202	020203	020299					{
	replace		dailyhswk=1 if trcode== `i'
	}
replace			dailyhswk=0 if dailyhswk==.
label var		dailyhswk "Cooking/Cleaing/Laundry"

// Creating sub-hswrk variable with all other housework
cap drop 		elsehswk
gen 			elsehswk=.
foreach i in 	020103 	020104 	020199											///
				070101 	180701													///
				020301 	020302 	020303 	020399									///
				020401 	020402 	020499 											///
				020501 	020502 	020599 	180904									///
				020681 	020699 	180807 	180903									///
				020701 	020799 	020801 	020899									///
				020901 	020902 	020903 	020904 	020905 	020999					///
				029999															///
				080201 	080202 	080203 	080299									///
				080701 	080702 	080799 	080699 									///
				090101 	090102 	090103 	090104 	090199							///
				090201 	090202 	090299 	090301 	090302 	090399 	090401 			///
				090402 	090499	090501 	090502 	090599 	099999 	160106			{
	replace 	elsehswk=1 if trcode == `i'
 	 }
replace 		elsehswk=0 if elsehswk==.
label var 		elsehswk "Housework NOT cooking/cleaning/laundry"
	
*checking to see if it matches Marital Status Summary Variables
cap drop		hswksum
egen			hswksum 	= total(tuactdur24) if housework==1, by(tucaseid)
replace			hswksum		= 0 if hswksum==.

preserve
collapse (max)hswksum, by(tucaseid)
sum hswksum
restore

**********************************************************************************************
***CARE WORK***
cap drop 	allccare
gen 		allccare=.

foreach i in 		030101 	030102 	030103 	030104 	030105	030108 	030109 	030110 	///
					030111 	030112 	030199	030201 	030202 	030203 	030204 	030299 	///
					030301 	030302 	030303 	030399 	030186							///
					080101 	080102 	080199	{
	replace 	allccare=1 if trcode == `i'
 	 }
replace 		allccare=0 if allccare==.
label var 		allccare "Childcare"
tab 			allccare, m

*checking to see if it matches Marital Status Summary Variables (should match allccare)
cap drop		ccaresum
egen			ccaresum 	= total(tuactdur24) if allccare==1, by(tucaseid)
replace			ccaresum	= 0 if ccaresum==.

preserve
collapse (max)ccaresum, by(tucaseid)
sum ccaresum
restore

// ALL CAREWORK
cap drop 		carework
gen 			carework=.
foreach i in 		030101 	030102 	030103 	030104 	030105	030108 	030109 	030110 	///
					030111 	030112 	030199	030201 	030202 	030203 	030204 	030299 	///
					030301 	030302 	030303 	030399 	030186	080101 	080102 	080199	///
					030401 	030402 	030403 	030404 	030405 	030499 	030501 	030502 	///
					030503 	030504 	030599											///
					039999 	180381 	180382 	180399									{
	replace 	carework=1 if trcode == `i'
 	 }
replace 		carework=0 if carework==.
label var 		carework "Childcare & Eldercare"
tab 			carework, m

// DAILY CARE OF CHILDREN AND ADULT HH MEMBERS
cap drop		dailycare
gen 			dailycare=.
foreach i in 		030101 	030108	030109	030110 	030111 	030112 	030199 	030204 	///
					030299 	030301 	030302 	030303 	030399	030401	030402	030403	///
					030404	030305	030499	030501	030502	030503	030504	030599	{
	replace		dailycare=1 if trcode == `i'
	}
replace			dailycare=0 if dailycar==.
label var		dailycare "Care of Kids/HHAdults"

cap drop		devlpcare
gen				devlpcare=.
foreach i in		030102	030103 	030104 	030105	030201 	030202 	030203 	030186	///
					080101 	080102 	080199	039999 	180381 	180382 	180399			{
	replace		devlpcare=1 if trcode == `i'
	}
replace			devlpcare=0 if devlpcare==.
label var		devlpcare "Developmental Child Care"

**********************************************************************************************
***SELF-CARE***
cap drop		sleep
gen				sleep=.
foreach i in		010101 010102 010199 {
	replace		sleep=1 if trcode== `i'
	}
	
replace			sleep=0 if sleep==.
label var		sleep "Sleeping"
tab				sleep, m


*checking to see if it matches Marital Status Summary Variables
cap drop		sleepsum
egen			sleepsum 	= total(tuactdur24) if sleep==1, by(tucaseid)
replace			sleepsum	= 0 if sleepsum==.

preserve
collapse (max)sleepsum, by(tucaseid)
sum sleepsum
restore


cap drop		eating
gen				eating=.
foreach i in		110101	110199	110281	110289	119999	181101	181199 {
	replace		eating=1 if trcode==`i'
	}

replace			eating=0 if eating==.
label var		eating "Eating"
tab				eating, m


cap drop 		selfcare
gen 			selfcare=.
foreach i in 		010101	010102	010199 											///
					010201	010299	010301	010399	010401	010499	010501	010599	///
					019999	080501 	080502 	080599 	180101 	180199	{
	replace 	selfcare=1 if trcode == `i'
 	 }
replace 		selfcare=0 if selfcare==.
label var 		selfcare "Sleep & Grooming"
tab 			selfcare, m

**********************************************************************************************
// Leisure


***Social leisure variables***
cap drop	socleis
gen			socleis=.
foreach i in		120101 	120199 	120201 	120202 	120299 	120401 	120402 	120403 		///
					120404	120405	120499	120501 	120502 	120504 	120599	130202		///
					130203	130204	130205 	130206	130207	130208	130209 	130210 		///
					130211	130212	130213 	130214 	130215 	130216 	130217 	130218		///
					130219 	130220	130221 	130222 	130223	130224 	130225 	130226 		///
					130227	130228	130229	130230 	130231 	130232	130299 	130302 		///
					130402 {
	replace	socleis=1 if trcode== `i'
	}
replace		socleis=0 if socleis==.
label var	socleis "Social Leisure"
tab			socleis, m

*checking to see if it matches Marital Status Summary Variables
cap drop		socleissum
egen			socleissum 	= total(tuactdur24) if socleis==1, by(tucaseid)
replace			socleissum	= 0 if socleissum==.

preserve
collapse (max)socleissum, by(tucaseid)
sum socleissum
restore



***Passive leisure variables***
cap drop	passleis
gen			passleis=.
foreach i in		120301 	120302 	120303 	120304 	120305 	120306 	120308 	120399 		///
					120503 {
	replace	passleis=1 if trcode== `i'
	}
replace		passleis=0 if passleis==.
label var	passleis "Passive Leisure"
tab			passleis, m

// Create sub-pass leis -- tele only
cap drop	tele
gen			tele=.
foreach i in		120303 120304	 {
	replace	tele=1 if trcode== `i'
	}
replace		tele=0 if tele==.
label var	tele "Television"
tab			tele, m

// Create sub-pass leis w/out tele
cap drop	passnotv
gen			passnotv=.
foreach i in		120301 	120302 	120305 	120306 	120308 	120399 						///
					120503 {
	replace	passnotv=1 if trcode== `i'
	}
replace		passnotv=0 if passnotv==.
label var	passnotv "Passive Leisure w/out TV"
tab			passnotv, m


*checking to see if it matches Marital Status Summary Variables
cap drop		passleissum
egen			passleissum 	= total(tuactdur24) if passleis==1, by(tucaseid)
replace			passleissum	= 0 if passleissum==.

preserve
collapse (max)passleissum, by(tucaseid)
sum passleissum
restore


***Acive leisure variables***
cap drop	actleis
gen			actleis=.
foreach i in		120307 	120309 	120310 	120311 	120312 	120313 	130101 	130102 		///
					130103	130104 	130105 	130106 	130107 	130108	130109	130110 		///
					130111	130112	130113 	130114	130115 	130116 	130117 	130118 		///
					130119 	130120	130121	130122 	130123	130124 	130125	130126 		///
					130127	130128 	130129 	130130	130131 	130132 	130133 	130134		///
					130135	130136 	130199 	130201	130301 	130401	130499 {
	replace actleis=1 if trcode== `i'
	}
replace		actleis=0 if actleis==.
tab 		actleis, m

*checking to see if it matches Marital Status Summary Variables
cap drop		actleissum
egen			actleissum 	= total(tuactdur24) if actleis==1, by(tucaseid)
replace			actleissum	= 0 if actleissum==.

preserve
collapse (max)actleissum, by(tucaseid)
sum actleissum
restore




cap drop 	allleis
gen 		allleis=.
foreach i in 		120101 	120199  120201 	120202  120299  120301  120302 	120303 	///
					120304 	120305 	120306 	120307 	120308 	120309 	120310  120311 	///
					120312 	120313 	120399 	120401 	120402 	120403 	120404 	120405 	///
					120499 	120501 	120502 	120503 	120504 	120599 	129999			///
					130101 	130102 	130103 	130104 	130105 	130106 	130107 	130108 	///
					130109 	130110 	130111 	130112 	130113 	130114 	130115 	130116 	///
					130117 	130118 	130119 	130120 	130121 	130122 	130123 	130124 	///
					130125 	130126 	130127 	130128 	130129 	130130 	130131 	130132 	///
					130133 	130134 	130135 	130136 	130199 	130201 	130202 	130203 	///
					130204 	130205 	130206 	130207 	130208 	130209 	130210 	130211 	///
					130212 	130213 	130214 	130215 	130216 	130217 	130218 	130219 	///
					130220 	130221 	130222 	130223 	130224 	130225 	130226 	130227 	///
					130228 	130229 	130230 	130231 	130232 	130299 	130301 	130302 	///
					130399 	130401	130402 	130499 	139999 {
 	replace 	allleis=1 if trcode == `i'
 	 }
replace 		allleis=0 if allleis==.
label var 		allleis "All Leisure activities"
tab 			allleis, m


cap drop 		notleis
gen				notleis=0
replace			notleis=1 if allleis==0
label var 		notleis "Not Leisure activities"
tab				notleis

cap drop	cogleis
gen			cogleis=.
foreach i in		60102  60103  60104  60199  60201  60202  60203  60289  60302		///
					60303  60399  60402  60403  60499  69999  120306 120307 120308		///
					120309 120310 120311 120312 120313 180601 180682 180699 181204	 	{
	replace	cogleis=1 if trcode== `i'
	}
replace		cogleis=0 if cogleis==.
label var	cogleis "Cognitive Leisure"
tab			cogleis, m

/*
120307 Playing games
120308 Computer use for leisure (exc. Games)
120309 Arts and crafts as a hobby
120310 Collecting as a hobby
120311 Hobbies, except arts & crafts and collecting
120312 Reading for personal interest
120313 Writing for personal interest
*/

**********************************************************************************************
// Shopping/Personal Services

cap drop	shop
gen			shop=.
foreach i in		070102	070103	070104	070105	070199	070201	070299	070301		///
					070399	079999	080501	080502	080599								{
	replace shop=1 if trcode== `i'
	}
replace		shop=0 if shop==.
tab 		shop, m


**********************************************************************************************
**********************************************************************************************
**********************************************************************************************

cap drop		tulineno
gen				tulineno=1

cap drop		childu13
gen				childu13=0
replace			childu13=1 if tr_03cc57==1


sort tucaseid 	tulineno

save "ATUS_activities", replace



**********************************************************************************************
**********************************************************************************************
**COMBINE DATASETS AND CREATE MEASURES AS NEEDED

clear

**********************************************************************************************
*PERSON LEVEL

/*input ATUS Roster File data*/
run "$jppath\ATUSGenderSequenceAnalysis\Stata\ATUS Setup\atusrost_0316.do"

capture drop	numterrp
bysort 			tucaseid: 		generate numterrp = _N
label var 		numterrp 		"Number in Household"
tab 			terrp			,missing
tab				numterrp		,missing


***CONSTRUCTING KEY MEASURES ***
**********************************************************************************************

**LIVING ARRANGEMENTS
tab 		terrp
tab			terrp, nolabel

gen 		self=0
replace 	self=1 				if terrp==18 		| terrp==19

gen 		spouse=0 
replace 	spouse=1 			if terrp==20

gen 		unmarpartner=0
replace 	unmarpartner=1 		if terrp==21

gen 		hhchild=0
replace 	hhchild=1 			if terrp==22

gen 		hhchildu18=0
replace 	hhchildu18=1 		if hhchild==1 		& teage<18

gen			hhchildo18=0
replace 	hhchildo18=1 		if hhchild==1		& teage>=18

gen			hhchildu13=0
replace		hhchildu13=1		if hhchild==1		& teage<=13

gen 		grandchild=0
replace 	grandchild=1 		if terrp==23

gen 		grandchildu18=0
replace 	grandchildu18=1 	if grandchild==1 	& teage<=17

gen 		grandchildo18=0
replace 	grandchildo18=1 	if grandchild==1 	& teage>=18

gen 		parent=0
replace 	parent=1 			if terrp==24

gen 		sibling=0 
replace 	sibling=1 			if terrp==25

gen 		siblingo18=0
replace 	siblingo18=1 		if terrp==25 		& teage>=18
	
gen 		otherrelative=0
replace 	otherrelative=1		if terrp==26

gen 		foster=0
replace 	foster=1 			if terrp==27

gen 		roommate=0
replace 	roommate=1 			if terrp==28

gen 		roomer=0
replace 	roomer=1 			if terrp==29

gen 		othernonrelative=0
replace 	othernonrelative=1 	if terrp==30

gen 		notinhh=0
replace 	notinhh=1 			if terrp==40

***GENERATING AN EXTENDED FAMILY
gen 		exfamdum=0
replace 	exfamdum=1 			if hhchildo18==1 | parent==1 | siblingo18==1 | otherrelative==1

***GENERATING KID UNDER 2
generate 	kidu2dum= 0
replace 	kidu2dum= 1			if terrp == 22 & teage <2 	|  terrp == 27 & teage <2

***GENERATE KID 2-5
gen			kid2to5=0
replace		kid2to5=1			if (terrp == 22 & teage >=2) & (terrp == 22 & teage<=5)
replace		kid2to5=1			if (terrp == 27 & teage >=2) & (terrp == 27 & teage<=5)

**PREP FOR NUMBER VARIABLES AT HOUSEHOLD LEVEL
gen 		exfamnumber 	= exfamdum
gen 		kidu2number 	= kidu2dum
gen 		numberhhchild 	= hhchild
gen 		kid2to5number	= kid2to5


****GENERATING RESPONDENTS DEMOGRAPHICS
generate 	rfemale= 1 			if (terrp == 18 | terrp == 19) & tesex == 2
generate 	rage=teage 			if 	terrp == 18 | terrp == 19


tab1 		terrp self spouse unmarpartner hhchild hhchildu18 hhchildo18 grandchild grandchildu18 grandchildo18 parent ///
			sibling siblingo18 otherrelative foster roommate roomer othernonrelative notinhh exfamdum exfamnumber kidu2dum kidu2number rfemale

			

			
**CREATING HOUSEHOLD LEVEL VARIABLES		
sort tucaseid
collapse	(lastnm) 	rage rfemale 																				///
			(max) 		self 	spouse 		unmarpartner 	hhchild 	hhchildu18 	hhchildo18 	hhchildu13			///
						grandchild 	grandchildu18 	grandchildo18  													///
						parent	sibling siblingo18 otherrelative foster roommate roomer othernonrelative notinhh 	///
						kidu2dum kid2to5 exfamdum																	///
			(sum) 		exfamnumber kidu2number	numberhhchild kid2to5number											///
			(count) 	numhhold = terrp, by(tucaseid)

sort tucaseid

/*gender variable*/
cap drop	female
gen 		female = 1 		if rfemale==1
replace 	female = 0 		if rfemale==.
label var 	female			"Female Respondents"
tab		 	female rfemale	,missing


sort tucaseid

save "atusroster_recodes", replace
clear

************************************************************************************************
************************************************************************************************
*merge CPS data to ATUS Roster (recoded) data

*input ATUS CPS file data
run 	"$jppath\ATUSGenderSequenceAnalysis\Stata\ATUS Setup\atuscps_0316.do"	, nostop
keep 	if tulineno==1
sort 	tucaseid
save 	"atus_cps.dta", replace

*merge CPS data to ATUS Roster data
merge 	1:1 tucaseid using "atusroster_recodes.dta"
tab 		_merge
drop 	if 	_merge !=3
drop		_merge
sort 	tucaseid
save 	"atus_roster&recodes_CPS"													, replace

************************************************************************************************
*merge Activity Summary data to ATUS Roster (recoded) & CPS data
clear
*input ATUS activity summary file data
run 	"$jppath\ATUSGenderSequenceAnalysis\Stata\ATUS Setup\atussum_0316.do"	,nostop
sort 	tucaseid
save 	"atus_summary"																,replace

*merge activity summary data to ATUS Roster&CPS data
use 	"atus_roster&recodes_CPS"													,clear

merge 	1:1 tucaseid using "atus_summary"
tab			_merge
drop 	if 	_merge !=3
drop		_merge
sort 	tucaseid
save 	"ATUS0316_roster_cps_summary", replace


************************************************************************************************
************************************************************************************************
*Merge activity file with atus_roster&recodes_CPS

use "ATUS_activities", clear


merge 	m:1 tucaseid using "ATUS0316_roster_cps_summary.dta"
tab 		_merge
drop 	if 	_merge !=3
drop		_merge
sort 	tucaseid


keep 	tucaseid 		tulineno 			tuactivity_n 	tustarttim 	tustoptime  tucumdur 		tucumdur24 	tuactdur 		///
		tuactdur24		allleis 			notleis 		rage 		allccare												///
		tudiaryday		peeduca				tehruslt		prhrusl		teage		ptdtrace		pemlr						///
		self			spouse				unmarpartner	hhchild		hhchildu18	hhchildo18		hhchildu13 	grandchild		///
		grandchildu18	grandchildo18		parent			sibling		siblingo18	otherrelative	foster		roommate		///
		roomer 			othernonrelative 	notinhh			kidu2dum	exfamdum	exfamnumber		kidu2number numberhhchil 	///
		sleep			female 				pehspnon 		pemaritl 	childu13 	kidu2dum		kid2to5		tryhhchild		///
		socleis 		passleis 			actleis 		workedu	 	housework 	carework 		selfcare	eating	tele 	///
		cogleis 		dailycare			devlpcare		dailyhswk	elsehswk	passnotv		actleis		socleis			///
		shop			tufnwgtp
	
	
sort 	tucaseid tuactivity_n 

************************************************************************************************************
***recode marital status into dummies, with cohabitors in one group regardless of marital history***
************************************************************************************************************

tab 	pemaritl	,m
tab 	unmarpartner pemaritl
recode 	pemaritl 	(6=1) 	(1/5=0) (.=.) 	(-1=.)				, gen(nevmar)
replace nevmar=0 	if unmarpartner==1

recode 	pemaritl 	(5=1) 	(1/4=0) (6=0)	(.=.) 	(-1=.)		, gen(separated)
replace separated=0 if unmarpartner==1

recode 	pemaritl 	(4=1) 	(1/3=0) (5/6=0)	(.=.) 	(-1=.)		, gen(divorced)
replace divorced=0 if unmarpartner==1

recode	pemaritl 	(3=1) 	(1/2=0) (4/6=0)	(.=.) 	(-1=.)		, gen(widowed)
replace widowed=0 if unmarpartner==1

recode 	pemaritl 	(1/2=1) (3/6=0)	(.=.) 	(-1=.)				, gen(married)
replace married=0 if unmarpartner==1

cap drop 	marstat
gen 		marstat=0
replace 	marstat=1 if married		==1
replace 	marstat=2 if nevmar			==1
replace 	marstat=3 if unmarpartner	==1
replace 	marstat=4 if divorced		==1
replace 	marstat=4 if separated		==1
replace 	marstat=4 if widowed		==1
tab 		marstat

label 		define marstatlbl 1 "Married" 2 "Never Married" 3 "cohabiting"  4 "divorced/sep/widowed", replace
label 		values marstat marstatlbl

gen 		divsep	=divorced
replace 	divsep	=1 if separated==1

tab1 		nevmar divsep married unmarpartner

************************************************************************************************************
***recode of ATUS's race/ethinicity variables into mutually exclusive categories***
************************************************************************************************************
tab 	ptdtrace
recode 	ptdtrace 	(1=1 "white") (2=2 "black") (4=3 "asian") (5/21=4 "other") (3=4) (-1=.) (.=.) (23=.), gen(race)
tab 	race
tab 	pehspnon

gen 	raceethnicity=0
replace raceethnicity=1 if race==1 		& pehspnon==2
replace raceethnicity=2 if race==2 		& pehspnon==2
replace raceethnicity=3 if race==3 		& pehspnon==2
replace raceethnicity=4 if 				  pehspnon==1
replace raceethnicity=5 if race==4 		& pehspnon==2
replace raceethnicity=. if race==.
recode 	raceethnicity 	(1=1) (2/5=0) 			(.=.), 	gen(white)
recode 	raceethnicity 	(2=1) (3/5=0) 	(1=0) 	(.=.), 	gen(black)
recode 	raceethnicity 	(3=1) (1/2=0) 	(4/5=0) (.=.), 	gen(asian)
recode 	raceethnicity 	(4=1) (1/3=0) 	(5=0) 	(.=.), 	gen(hispanic)
recode 	raceethnicity 	(5=1) (1/4=0) 			(.=.), 	gen(otherrace)

label 	variable white 		"White"
label	variable black 		"Black"
label	variable asian 		"Asian"
label	variable hispanic 	"Hispanic"
label 	variable otherrace 	"Other"

***define values for race ethnicity variable***
label 	define raceethnicity 1 "white" 2 "black" 3 "asian" 4 "hispanic" 5 "otherrace"
label 	values raceethnicity raceethnicity
***frequency of race/ethnicity variable***
tab 	raceethnicity
tab1 	white black asian hispanic otherrace

drop if raceethnicity==.
tab1 	raceethnicity white black asian hispanic otherrace, m

***recoding diary day into a dichotomous dummy with 1=diary on weekend***
tab 	tudiaryday		,m
recode 	tudiaryday 		(2/6=1 "weekday") (1=2 "weekend") (7=2) (.=.), gen(recodeday)
tab 	recodeday		,m
recode 	recodeday 		(1=0) (2=1) (.=.), gen(weekend)
tab 	weekend			,m
label 	variable weekend "Diary day"

***recoding education level into different categories, and then creating dummies for those categories***
tab 	peeduca			,m
recode 	peeduca 		(31/38=1 "less than high school") 	(39=2 "high school") 		(40/42=3 "some college") ///
						(43/46=4 "BA or higher") 			(-1=.), gen(edcat)
tab 	edcat			,m

gen 	lths=0
replace lths=1 			if edcat==1

gen 	highschool=0
replace highschool=1 	if edcat==2

gen 	somecol=0
replace somecol=1 		if edcat==3

gen 	baormore=0
replace baormore=1 		if edcat==4

tab1 	peeduca edcat lths highschool somecol baormore, m 

***recoding age into categories, then creating summies for categories***
label 	variable teage "age"

tab 	teage			,m
recode 	teage 			(0/17=1 "under 18") 	(18/24=2 "18-24") 	(25/34=3 "25-34") 	(35/44=4 "35-44") 	///
						(45/54=5 "45-54") 		(55/80=6 "55+") 	(-3=.), gen(agecat)
tab 	agecat			,m

gen 	under18=0
replace under18=1 		if agecat==1

gen 	a18to24=0
replace a18to24=1 		if agecat==2

gen 	a25to34=0
replace a25to34=1 		if agecat==3

gen 	a35to44=0
replace a35to44=1 		if agecat==4

gen 	a45to54=0
replace a45to54=1 		if agecat==5

gen 	a55plus=0
replace a55plus=1 		if agecat==6

tabstat	under18 a18to24 a25to34 a35to44 a45to54 a55plus, stat(mean sd n)

***generate employment level variables***
tab 	tehruslt
tab 	prhrusl 
tab		prhrusl, nolabel
tab		pemlr
tab 	pemlr, 	nolabel

tabstat tehruslt, by(pemlr)
tabstat	tehruslt, by(prhrusl)

cap drop 	unemployed
gen 		unemployed=0
replace 	unemployed=1 	if pemlr>=3
tab 		unemployed

cap drop 	parttime
gen 		parttime=0
replace 	parttime=1 		if prhrusl==1 	| 	prhrusl==2	| prhrusl==8
tab 		parttime

cap drop	fulltime
gen 		fulltime=0
replace 	fulltime=1 		if prhrusl==3	| 	prhrusl==4	|	prhrusl==5 	|	prhrusl==6	| prhrusl==7
tab 		fulltime

tab1 unemployed parttime fulltime

cap drop	employ
gen			employ=.
replace		employ=1 		if fulltime==1
replace		employ=2		if unemployed==1
replace		employ=3		if parttime==1

label define employlbl 1 "Fulltime" 2 "Unemployed" 3 "Part-time"
label values employ employlbl


****************************************************************************************************************************
**************************************************SAMPLE SELECTION**********************************************************
// Limit to employed people
drop if		employ==2


// Limit to parents
drop if 	numberhhchild==0


// LIMIT Cases to 2016
destring 		tucaseid, replace
format			tucaseid %20.0g
sort 			tucaseid
keep if			tucaseid	> 20160000000000

// Random Sample of 500 Cases from 2016
	/*
	sort			tucaseid
	preserve
		tempfile 	tmp
		bysort 		tucaseid: keep if _n == 1
		sample 		500, count
		sort 		tucaseid
		save 		`tmp'
	restore
	merge 			m:1 tucaseid using `tmp'
	keep if 		_merge == 3
	drop 			_merge
	*/


***Total # of CASES AFTER RESTRICTIONS***
count

mark 		nomiss          
markout 	nomiss  female nevmar unmarpartner divsep exfamdum numberhhchild kidu2dum kid2to5 lths highschool somecol parttime black asian hispanic otherrace teage weekend      
tab 		nomiss
drop if 	nomiss==0 


save 		"sequences_0316", replace
use			"sequences_0316", clear

***************************************************************************************************
** Creating activity variables
***************************************************************************************************
cap drop		activity
gen				activity=0
replace			activity=1	if 	selfcare	==1
replace			activity=2	if 	eating		==1
replace			activity=3	if 	workedu		==1
replace			activity=4 	if 	carework	==1
replace			activity=5 	if	housework	==1
replace			activity=6	if 	passleis	==1 
replace			activity=7 	if 	activity	==0


label define 	activitylbl 	1 	"Sleep/Self-Care"	2	"Eating"		3	"Work & Edu"		///
								4 	"Carework"			5 	"Housework"	 	6 	"Passive Leisure"	///
								7 	"Other"											
label value 	activity	activitylbl							

edit 		tucaseid tuactivity_n tustarttim tustoptime tucumdur tucumdur24 tuactdur tuactdur24 activity

cap drop	other
gen			other=0
replace		other=1 	if activity==7

cap drop		dactiv
gen				dactiv=0
replace			dactiv=1	if 	selfcare	==1
replace			dactiv=2	if 	eating		==1
replace			dactiv=3	if	workedu		==1
replace			dactiv=4	if 	dailycare	==1
replace			dactiv=5	if 	devlpcare	==1
replace			dactiv=6	if	dailyhswk	==1
replace			dactiv=7	if 	elsehswk	==1
replace			dactiv=8 	if 	tele		==1
replace			dactiv=9	if	passnotv	==1
replace			dactiv=10	if	actleis		==1
replace			dactiv=11	if	socleis		==1
replace			dactiv=12	if 	shop		==1
replace			dactiv=13	if 	dactiv		==0

label define 	dactivlbl 		1 	"Sleep/Self-Care"	2	"Eating"		3	"Work & Edu"		///
								4 	"Daily Carework"	5 	"Devep. Care"	6 	"Daily HSWK"		///
								7 	"Other HSWK"		8	"Television"	9	"Pass Leis"			///
								10	"Active Leisure"	11	"Social Leis."	12	"Shopping"			///
								13	"Other"
label value 	dactiv	dactivlbl							

cap drop	dother
gen			dother=0
replace		dother=1 	if dactiv==13


***************************************************************************************************
** Create Summary Variables
***************************************************************************************************
sort 			tucaseid tuactivity_n

cap drop		selfsum
egen			selfsum 		= total(tuactdur24) if activity==1, by(tucaseid)
replace			selfsum			=0 if selfsum==.

cap drop		eatsum
egen 			eatsum 			= total(tuactdur24) if activity==2, by(tucaseid) 
replace			eatsum			=0 if eatsum==.

cap drop		worksum
egen 			worksum 		= total(tuactdur24) if activity==3, by(tucaseid) 
replace			worksum			=0 if worksum==.

cap drop		caresum
egen			caresum 		= total(tuactdur24) if activity==4, by(tucaseid) 
replace			caresum			=0 if caresum==.

cap drop		housesum
egen			housesum 		= total(tuactdur24) if activity==5, by(tucaseid)
replace			housesum		=0 if housesum==.

cap drop		passsum
egen			passsum 		= total(tuactdur24) if activity==6, by(tucaseid)
replace			passsum			=0 if passsum==.

cap drop		othersum
egen			othersum 		= total(tuactdur24) if activity==7, by(tucaseid)
replace			othersum		=0 if othersum==.


cap drop		dailycaresum
egen			dailycaresum	=total(tuactdur24) 	if dactiv==4,	by(tucaseid)
replace			dailycaresum	=0 if dailycaresum==.

cap drop		devlpcaresum
egen			devlpcaresum	=total(tuactdur24) 	if dactiv==5,	by(tucaseid)
replace			devlpcaresum	=0 if devlpcaresum==.

cap drop		dailyhswksum
egen			dailyhswksum	=total(tuactdur24) 	if dactiv==6,	by(tucaseid)
replace			dailyhswksum	=0 if dailyhswksum==.

cap drop		elsehswksum
egen			elsehswksum		=total(tuactdur24) 	if dactiv==7,	by(tucaseid)
replace			elsehswksum		=0 if elsehswksum==.

cap drop		telesum
egen			telesum			=total(tuactdur24) 	if dactiv==8,	by(tucaseid)
replace			telesum			=0 if telesum==.

cap drop		passnotvsum
egen			passnotvsum		=total(tuactdur24) 	if dactiv==9,	by(tucaseid)
replace			passnotvsum		=0 if passnotvsum==.

cap drop		actleissum
egen			actleissum		=total(tuactdur24) 	if dactiv==10,	by(tucaseid)
replace			actleissum		=0 if actleissum==.

cap drop		socleissum
egen			socleissum		=total(tuactdur24) 	if dactiv==11,	by(tucaseid)
replace			socleissum		=0 if socleissum==.

cap drop		shopsum
egen			shopsum			=total(tuactdur24) 	if dactiv==12,	by(tucaseid)
replace			shopsum			=0 if shopsum==.

cap drop		dothersum
egen			dothersum		=total(tuactdur24) 	if dactiv==13,	by(tucaseid)
replace			dothersum		=0 if dothersum==.


cap drop		actsum
gen				actsum=		0
replace			actsum=		selfsum			if activity==1
replace			actsum=		eatsum			if activity==2
replace			actsum= 	worksum 		if activity==3
replace			actsum=		caresum 		if activity==4
replace			actsum=		housesum		if activity==5
replace			actsum=		passsum			if activity==6
replace			actsum=		othersum		if activity==7
	
cap drop		dactsum
gen				dactsum=	0
replace			dactsum=	selfsum			if dactiv==1
replace			dactsum=	eatsum			if dactiv==2
replace			dactsum= 	worksum 		if dactiv==3
replace			dactsum=	dailycaresum 	if dactiv==4
replace			dactsum=	devlpcaresum	if dactiv==5
replace			dactsum=	dailyhswksum	if dactiv==6
replace			dactsum=	elsehswksum		if dactiv==7
replace			dactsum=	telesum			if dactiv==8
replace			dactsum=	passnotvsum		if dactiv==9
replace			dactsum=	actleissum		if dactiv==10
replace			dactsum=	socleissum		if dactiv==11
replace			dactsum=	shopsum			if dactiv==12
replace			dactsum=	dothersum		if dactiv==13


edit 			tucaseid tuactivity_n tustarttim tustoptime activity tucumdur tucumdur24 tuactdur tuactdur24  worksum caresum actsum dactsum

***************************************************************************************************
** Identifying Outliers -- 95th percentile or higher in any of our activities
***************************************************************************************************
sum 		worksum, 	d
sum			eatsum,		d
sum			caresum, 	d
sum			housesum,	d
sum			othersum, 	d
sum			passsum, 	d
sum			selfsum, 	d

/*
// Identifying the 95th percentiles

cap drop	sum95
gen			sum95		=0
replace		sum95		=1 	if worksum	>=	745	& 	worksum 	<=	1034
replace		sum95		=1 	if caresum	>=	512	& 	caresum 	<=	1030
replace		sum95		=1 	if housesum	>=	556	& 	housesum 	<=	1110
replace		sum95		=1 	if othersum	>=	350	& 	othersum 	<=	980
replace		sum95		=1 	if passsum	>=	460	& 	passsum 	<=	990
replace		sum95		=1 	if selfsum	>=	900	& 	selfsum 	<=	1382

preserve
collapse (count) sum95 , by(tucaseid)
count
restore

preserve
collapse (sum) sum95 , by(tucaseid)
tab sum95
restore


cap drop	tot95
gen			tot95		=0
replace		tot95		=1 if actsum >= 770

*/

*save		"sequences--500sample", 	replace
 save		"sequences--2016sample", 	replace
 use		"sequences--2016sample", 	clear
 
******************************************************************************************
* CREATE 144 EPISODE FILE *
******************************************************************************************
cap drop	order
sort 		tucaseid
format		tucaseid %20.0g
by 			tucaseid: generate order = _n

 
 
******************************************************************************************
* CREATE MINUTES FILE *
******************************************************************************************
cap drop	order
sort 		tucaseid
format		tucaseid %20.0g
by 			tucaseid: generate order = _n

ntimeofday 	tustarttim , gen(time1) s( h mi s) n(day)
ntimeofday 	tustoptime , gen(time2) s( h mi s) n(day)
gen 		start	= time1*1440
gen 		end 	= time2*1440
replace 	end 	= (1440-start) + end  	if end < start

sort 		tucaseid tuactivity_n

gen 		loops	= (end-start)
replace 	loops	= end 					if loops < 0
by			tucaseid: gen sum=sum(loops )
expand 		loops if loops > 1


sort 		tucaseid
sort 		tucaseid 	order
by 			tucaseid : 	gen startmin=_n
gen 		endmin	=	startmin+1

keep if 	endmin 	<=	1441		/* keep only from 4 am to 4 am -- tustoptime isn't top coded at 4am */
replace		startmin=startmin+239	/* make start minute equal to 240 which is 4am						*/
replace		endmin	=endmin+239		/* make end minute correspond with startmin							*/


save		"sequences_all minutes"		, replace
