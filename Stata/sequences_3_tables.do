**TABLES FOR PAPER

clear
set more off
cd 			"D:\Dropbox\Sayer\Gendered Sequences\Stata"
use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\10minute\sequences_all_tenmin"		, clear

sort tucaseid


**********************************************************************************************************************
*Table A -- Appendix
**********************************************************************************************************************

preserve
collapse (max)female tufnwgtp [aweight=tufnwgtp], by(tucaseid)
tab female [aweight=tufnwgtp]
count
restore

preserve
collapse (max)complex10 tufnwgtp [aweight=tufnwgtp], by(tucaseid)
tabstat complex10 [aweight=tufnwgtp]
sum complex10 [aweight=tufnwgtp]
count
restore

preserve
collapse (max)	selfsum			eatsum			worksum			dailycaresum	devlpcaresum	///
				dailyhswksum	elsehswksum		telesum			passnotvsum		actleissum		///
				socleissum 		shopsum			dothersum										///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 														///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10										///
				female			tufnwgtp		[aweight=tufnwgtp], by(tucaseid)			

**MEANS				
tablemat 		selfsum			eatsum			worksum			dailycaresum	devlpcaresum	///
				dailyhswksum	elsehswksum		telesum			passnotvsum		actleissum		///
				socleissum 		shopsum			dothersum										///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 														///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10										///
				[aweight=tufnwgtp], by(female) 	stat(mean)	
			
**STANDARD DEVIATIONS
tablemat 		selfsum			eatsum			worksum			dailycaresum	devlpcaresum	///
				dailyhswksum	elsehswksum		telesum			passnotvsum		actleissum		///
				socleissum 		shopsum			dothersum										///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 														///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10										///
				[aweight=tufnwgtp], by(female) 	stat(sd)	
restore

preserve
collapse (max)	complex10	female	raceethnicity 	baormore	tufnwgtp		, by(tucaseid)			

tabstat complex10 				[aweight=tufnwgtp],  	by(female) 			stat(mean sd min max)
tabstat complex10 if female==0	[aweight=tufnwgtp],  	by(raceethnicity) 	stat(mean sd min max)
tabstat complex10 if female==1	[aweight=tufnwgtp],  	by(raceethnicity) 	stat(mean sd min max)
tabstat complex10 if female==0	[aweight=tufnwgtp],  	by(baormore) 		stat(mean sd min max)
tabstat complex10 if female==1	[aweight=tufnwgtp],  	by(baormore) 		stat(mean sd min max)

restore

**********************************************************************************************************************
*Table 1
**********************************************************************************************************************
cd 			"D:\Dropbox\Sayer\Gendered Sequences\Stata"

preserve
collapse (max)	selfsum			eatsum			worksum			dailycaresum	devlpcaresum	///
				dailyhswksum	elsehswksum		telesum			passnotvsum		actleissum		///
				socleissum 		shopsum			dothersum										///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 														///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10										///
				female			tufnwgtp		[aweight=tufnwgtp], by(tucaseid)			


global ivars "i.female nevmar unmarpartner divsep exfamdum numberhhchild kidu2dum kid2to5 lths highschool somecol parttime black asian hispanic otherrace teage weekend"

eststo m1:	regress selfsum 		$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m2:	regress eatsum 			$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m3:	regress worksum 		$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m4:	regress dailycaresum	$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m5:	regress devlpcaresum	$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m6:	regress dailyhswksum	$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m7:	regress elsehswksum		$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m8:	regress telesum			$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m9:	regress passnotvsum		$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m10:	regress actleissum		$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m11:	regress socleissum		$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m12:	regress shopsum			$ivars 				[pweight=tufnwgtp]
margins
margins 	female
eststo m13:	regress dothersum		$ivars 				[pweight=tufnwgtp]
margins
margins 	female


esttab  m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 using sequences--table1.csv, cells(b(star fmt(2)) se(par fmt(2))) ///
		varlabels(_cons Constant) legend label stats(r2 N) stardetach replace
eststo clear

restore


**********************************************************************************************************************
*Tempograms
**********************************************************************************************************************
use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\10minute\sequences_men_tenmin"				, clear

proprcspline dactiv1 tenmin if weekend==0, 																					///
	catlegend																												///
	xlabel(	1  "4am"   7   "5am"   13  "6am"  19  "7am" 25  "8am" 31  "9am" 37  "10am" 43 "11am" 49  "12pm" 				///
			55  "1pm"  61  "2pm"   67  "3pm"  73  "4pm" 79  "5pm" 85  "6pm" 91  "7pm"  97 "8pm"  103 "9pm" 					///
			109 "10pm" 115 "11pm"  121 "12am" 127 "1am" 133 "2am" 139 "3am" 144 "4am", angle(90) labsize(small))			///
	xsize(4.5) ysize(5)																										///
	ylabel(, angle(0) labsize(small)) 																						///
	legend(size(small)) 

proprcspline dactiv1 tenmin if weekend==1, 																					///
	catlegend																												///
	xlabel(	1  "4am"   7   "5am"   13  "6am"  19  "7am" 25  "8am" 31  "9am" 37  "10am" 43 "11am" 49  "12pm" 				///
			55  "1pm"  61  "2pm"   67  "3pm"  73  "4pm" 79  "5pm" 85  "6pm" 91  "7pm"  97 "8pm"  103 "9pm" 					///
			109 "10pm" 115 "11pm"  121 "12am" 127 "1am" 133 "2am" 139 "3am" 144 "4am", angle(90) labsize(small))			///
	xsize(4.5) ysize(5)																										///
	ylabel(, angle(0) labsize(small)) 																						///
	legend(size(small)) 

	
use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\10minute\sequences_women_tenmin"				, clear

proprcspline dactiv1 tenmin if weekend==0, 																					///
	catlegend																												///
	xlabel(	1  "4am"   7   "5am"   13  "6am"  19  "7am" 25  "8am" 31  "9am" 37  "10am" 43 "11am" 49  "12pm" 				///
			55  "1pm"  61  "2pm"   67  "3pm"  73  "4pm" 79  "5pm" 85  "6pm" 91  "7pm"  97 "8pm"  103 "9pm" 					///
			109 "10pm" 115 "11pm"  121 "12am" 127 "1am" 133 "2am" 139 "3am" 144 "4am", angle(90) labsize(small))			///
	xsize(4.5) ysize(5)																										///
	ylabel(, angle(0) labsize(small)) 																						///
	legend(size(small)) 

proprcspline dactiv1 tenmin if weekend==1, 																					///
	catlegend																												///
	xlabel(	1  "4am"   7   "5am"   13  "6am"  19  "7am" 25  "8am" 31  "9am" 37  "10am" 43 "11am" 49  "12pm" 				///
			55  "1pm"  61  "2pm"   67  "3pm"  73  "4pm" 79  "5pm" 85  "6pm" 91  "7pm"  97 "8pm"  103 "9pm" 					///
			109 "10pm" 115 "11pm"  121 "12am" 127 "1am" 133 "2am" 139 "3am" 144 "4am", angle(90) labsize(small))			///
	xsize(4.5) ysize(5)																										///
	ylabel(, angle(0) labsize(small)) 																						///
	legend(size(small)) 
	
**********************************************************************************************************************
*Table 2 -- Descriptive Characteristics of the Sequences
**********************************************************************************************************************
clear
set more off
cd 			"D:\Dropbox\Sayer\Gendered Sequences\Stata"
use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_all_tenmin"		, clear

sort tucaseid


log using "Gender Sequences Table2 Log_tenmin", text replace
//Average number of activities in a day
preserve
collapse (max)	dvariety	female white black hispanic asian baormore	tufnwgtp		[aweight=tufnwgtp], by(tucaseid)			
				
	**MEANS			
	tablemat 	dvariety								[aweight=tufnwgtp], by(female) 		stat(mean)
	tablemat	dvariety	if female==0 &	white==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==0 &	black==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==0 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==0 &	asian==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(mean)
	
	tablemat 	dvariety								[aweight=tufnwgtp], by(female) 		stat(mean)
	tablemat	dvariety	if female==1 &	white==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==1 &	black==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==1 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==1 &	asian==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	dvariety	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(mean)

	**STANDARD DEVIATIONS
	tablemat 	dvariety								[aweight=tufnwgtp], by(female) 		stat(sd)
	tablemat	dvariety	if female==0 &	white==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==0 &	black==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==0 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==0 &	asian==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(sd)
	
	tablemat 	dvariety								[aweight=tufnwgtp], by(female) 		stat(sd)
	tablemat	dvariety	if female==1 &	white==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==1 &	black==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==1 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==1 &	asian==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	dvariety	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(sd)
restore

//Average number of transitions in a day
preserve
collapse (max)	transsum10	female	white black hispanic asian baormore	tufnwgtp		[aweight=tufnwgtp], by(tucaseid)			
				
	**MEANS			
	tablemat 	transsum10								[aweight=tufnwgtp], by(female) 		stat(mean)	
	tablemat	transsum10	if female==0 &	white==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==0 &	black==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==0 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==0 &	asian==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(mean)
	
	tablemat 	transsum10								[aweight=tufnwgtp], by(female) 		stat(mean)
	tablemat	transsum10	if female==1 &	white==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==1 &	black==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==1 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==1 &	asian==1	[aweight=tufnwgtp], 		 		stat(mean)
	tablemat	transsum10	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(mean)
			
	**STANDARD DEVIATIONS
	tablemat 	transsum10								[aweight=tufnwgtp], by(female) 		stat(sd)	
	tablemat	transsum10	if female==0 &	white==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==0 &	black==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==0 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==0 &	asian==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(sd)
	
	tablemat 	transsum10								[aweight=tufnwgtp], by(female) 		stat(sd)
	tablemat	transsum10	if female==1 &	white==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==1 &	black==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==1 &	hispanic==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==1 &	asian==1	[aweight=tufnwgtp], 		 		stat(sd)
	tablemat	transsum10	if female==0 				[aweight=tufnwgtp], by(baormore)	stat(sd)
restore


// Activity Duration
tabstat 	selfdur	eatdur workdur dailycaredur devlpcaredur dailyhswkdur elsehswkdur teledur 		///
			passnotvdur actleisdur socleisdur shopdur dotherdur [aweight=tufnwgtp]					///
			, by(female) stat(mean sd) col(stat)
*Fathers
tabstat 	selfdur	eatdur workdur dailycaredur devlpcaredur dailyhswkdur elsehswkdur teledur 		///
			passnotvdur actleisdur socleisdur shopdur dotherdur if female==0 [aweight=tufnwgtp]		///
			, by(raceethnicity) stat(mean sd) col(stat)
*Mothers
tabstat 	selfdur	eatdur workdur dailycaredur devlpcaredur dailyhswkdur elsehswkdur teledur 		///
			passnotvdur actleisdur socleisdur shopdur dotherdur if female==1 [aweight=tufnwgtp]		///
			, by(raceethnicity) stat(mean sd) col(stat)
*Fathers
tabstat 	selfdur	eatdur workdur dailycaredur devlpcaredur dailyhswkdur elsehswkdur teledur 		///
			passnotvdur actleisdur socleisdur shopdur dotherdur if female==0 [aweight=tufnwgtp]		///
			, by(baormore) stat(mean sd) col(stat)

*Mothers
tabstat 	selfdur	eatdur workdur dailycaredur devlpcaredur dailyhswkdur elsehswkdur teledur 		///
			passnotvdur actleisdur socleisdur shopdur dotherdur if female==1 [aweight=tufnwgtp]		///
			, by(baormore) stat(mean sd) col(stat)


// Average number of episodes
preserve
collapse 	(sum) _end											///
			(max) female white black asian hispanic baormore	///	
			[aweight=tufnwgtp], by(tucaseid dactiv)
			
	tablemat _end if dactiv==1, 	by(female) stat(mean)
	tablemat _end if dactiv==2, 	by(female) stat(mean)
	tablemat _end if dactiv==3, 	by(female) stat(mean)
	tablemat _end if dactiv==4, 	by(female) stat(mean)
	tablemat _end if dactiv==5, 	by(female) stat(mean)
	tablemat _end if dactiv==6, 	by(female) stat(mean)
	tablemat _end if dactiv==7, 	by(female) stat(mean)
	tablemat _end if dactiv==8, 	by(female) stat(mean)
	tablemat _end if dactiv==9, 	by(female) stat(mean)
	tablemat _end if dactiv==10, 	by(female) stat(mean)
	tablemat _end if dactiv==11, 	by(female) stat(mean)
	tablemat _end if dactiv==12, 	by(female) stat(mean)
	tablemat _end if dactiv==13, 	by(female) stat(mean)

restore

log close
**********************************************************************************************************************
*Table 3 - Logisitic Regression of Complexity Index
**********************************************************************************************************************
clear
cd 			"D:\Dropbox\Sayer\Gendered Sequences\Stata"
use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\10minute\sequences_all_tenmin"		, clear
sort tucaseid


preserve
collapse (max)	selfsum			eatsum			worksum			dailycaresum	devlpcaresum	///
				dailyhswksum	elsehswksum		telesum			passnotvsum		actleissum		///
				socleissum 		shopsum			dothersum										///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 		raceethnicity	edcat			marstat			///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10										///
				female			tufnwgtp		[aweight=tufnwgtp], by(tucaseid)			


global ivars "i.marstat exfamdum numberhhchild kidu2dum kid2to5 teage weekend"

eststo m1:	glm complex10 i.female		 									[pweight=tufnwgtp], link(logit) family(binomial) robust
eststo m2:	glm complex10 i.female i.raceethnicity 	ib4.edcat		$ivars 	[pweight=tufnwgtp], link(logit) family(binomial) robust
	margins
	margins 	female
	predict		pcomplex
	summarize 	complex10	pcomplex if e(sample)
	graph twoway scatter pcomplex teage, yline(0 1) msym(oh)

eststo m3:	glm complex10 i.female##i.raceethnicity 	ib4.edcat		$ivars 	[pweight=tufnwgtp], link(logit) family(binomial) robust
	margins female#raceethnicity

eststo m4:	glm complex10 i.female##ib4.edcat 			i.raceethnicity $ivars 	[pweight=tufnwgtp], link(logit) family(binomial) robust
	margins female#edcat


esttab  m1 m2 m3 m4 using sequences--table3.csv, cells(b(star fmt(2)) se(par fmt(2))) ///
		varlabels(_cons Constant) legend label stats(AIC N) stardetach replace

restore

	