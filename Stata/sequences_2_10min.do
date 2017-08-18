use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_all minutes"		, clear

******************************************************************************************
* Create 10 Minute file *
******************************************************************************************
cap drop 	tenmin
gen			tenmin=.
replace		tenmin	=	1	if	startmin	>=	240	&	endmin	<=	250
replace		tenmin	=	2	if	startmin	>	249	&	endmin	<=	260
replace		tenmin	=	3	if	startmin	>	259	&	endmin	<=	270
replace		tenmin	=	4	if	startmin	>	269	&	endmin	<=	280
replace		tenmin	=	5	if	startmin	>	279	&	endmin	<=	290
replace		tenmin	=	6	if	startmin	>	289	&	endmin	<=	300
replace		tenmin	=	7	if	startmin	>	299	&	endmin	<=	310
replace		tenmin	=	8	if	startmin	>	309	&	endmin	<=	320
replace		tenmin	=	9	if	startmin	>	319	&	endmin	<=	330
replace		tenmin	=	10	if	startmin	>	329	&	endmin	<=	340
replace		tenmin	=	11	if	startmin	>	339	&	endmin	<=	350
replace		tenmin	=	12	if	startmin	>	349	&	endmin	<=	360
replace		tenmin	=	13	if	startmin	>	359	&	endmin	<=	370
replace		tenmin	=	14	if	startmin	>	369	&	endmin	<=	380
replace		tenmin	=	15	if	startmin	>	379	&	endmin	<=	390
replace		tenmin	=	16	if	startmin	>	389	&	endmin	<=	400
replace		tenmin	=	17	if	startmin	>	399	&	endmin	<=	410
replace		tenmin	=	18	if	startmin	>	409	&	endmin	<=	420
replace		tenmin	=	19	if	startmin	>	419	&	endmin	<=	430
replace		tenmin	=	20	if	startmin	>	429	&	endmin	<=	440
replace		tenmin	=	21	if	startmin	>	439	&	endmin	<=	450
replace		tenmin	=	22	if	startmin	>	449	&	endmin	<=	460
replace		tenmin	=	23	if	startmin	>	459	&	endmin	<=	470
replace		tenmin	=	24	if	startmin	>	469	&	endmin	<=	480
replace		tenmin	=	25	if	startmin	>	479	&	endmin	<=	490
replace		tenmin	=	26	if	startmin	>	489	&	endmin	<=	500
replace		tenmin	=	27	if	startmin	>	499	&	endmin	<=	510
replace		tenmin	=	28	if	startmin	>	509	&	endmin	<=	520
replace		tenmin	=	29	if	startmin	>	519	&	endmin	<=	530
replace		tenmin	=	30	if	startmin	>	529	&	endmin	<=	540
replace		tenmin	=	31	if	startmin	>	539	&	endmin	<=	550
replace		tenmin	=	32	if	startmin	>	549	&	endmin	<=	560
replace		tenmin	=	33	if	startmin	>	559	&	endmin	<=	570
replace		tenmin	=	34	if	startmin	>	569	&	endmin	<=	580
replace		tenmin	=	35	if	startmin	>	579	&	endmin	<=	590
replace		tenmin	=	36	if	startmin	>	589	&	endmin	<=	600
replace		tenmin	=	37	if	startmin	>	599	&	endmin	<=	610
replace		tenmin	=	38	if	startmin	>	609	&	endmin	<=	620
replace		tenmin	=	39	if	startmin	>	619	&	endmin	<=	630
replace		tenmin	=	40	if	startmin	>	629	&	endmin	<=	640
replace		tenmin	=	41	if	startmin	>	639	&	endmin	<=	650
replace		tenmin	=	42	if	startmin	>	649	&	endmin	<=	660
replace		tenmin	=	43	if	startmin	>	659	&	endmin	<=	670
replace		tenmin	=	44	if	startmin	>	669	&	endmin	<=	680
replace		tenmin	=	45	if	startmin	>	679	&	endmin	<=	690
replace		tenmin	=	46	if	startmin	>	689	&	endmin	<=	700
replace		tenmin	=	47	if	startmin	>	699	&	endmin	<=	710
replace		tenmin	=	48	if	startmin	>	709	&	endmin	<=	720
replace		tenmin	=	49	if	startmin	>	719	&	endmin	<=	730
replace		tenmin	=	50	if	startmin	>	729	&	endmin	<=	740
replace		tenmin	=	51	if	startmin	>	739	&	endmin	<=	750
replace		tenmin	=	52	if	startmin	>	749	&	endmin	<=	760
replace		tenmin	=	53	if	startmin	>	759	&	endmin	<=	770
replace		tenmin	=	54	if	startmin	>	769	&	endmin	<=	780
replace		tenmin	=	55	if	startmin	>	779	&	endmin	<=	790
replace		tenmin	=	56	if	startmin	>	789	&	endmin	<=	800
replace		tenmin	=	57	if	startmin	>	799	&	endmin	<=	810
replace		tenmin	=	58	if	startmin	>	809	&	endmin	<=	820
replace		tenmin	=	59	if	startmin	>	819	&	endmin	<=	830
replace		tenmin	=	60	if	startmin	>	829	&	endmin	<=	840
replace		tenmin	=	61	if	startmin	>	839	&	endmin	<=	850
replace		tenmin	=	62	if	startmin	>	849	&	endmin	<=	860
replace		tenmin	=	63	if	startmin	>	859	&	endmin	<=	870
replace		tenmin	=	64	if	startmin	>	869	&	endmin	<=	880
replace		tenmin	=	65	if	startmin	>	879	&	endmin	<=	890
replace		tenmin	=	66	if	startmin	>	889	&	endmin	<=	900
replace		tenmin	=	67	if	startmin	>	899	&	endmin	<=	910
replace		tenmin	=	68	if	startmin	>	909	&	endmin	<=	920
replace		tenmin	=	69	if	startmin	>	919	&	endmin	<=	930
replace		tenmin	=	70	if	startmin	>	929	&	endmin	<=	940
replace		tenmin	=	71	if	startmin	>	939	&	endmin	<=	950
replace		tenmin	=	72	if	startmin	>	949	&	endmin	<=	960
replace		tenmin	=	73	if	startmin	>	959	&	endmin	<=	970
replace		tenmin	=	74	if	startmin	>	969	&	endmin	<=	980
replace		tenmin	=	75	if	startmin	>	979	&	endmin	<=	990
replace		tenmin	=	76	if	startmin	>	989	&	endmin	<=	1000
replace		tenmin	=	77	if	startmin	>	999	&	endmin	<=	1010
replace		tenmin	=	78	if	startmin	>	1009	&	endmin	<=	1020
replace		tenmin	=	79	if	startmin	>	1019	&	endmin	<=	1030
replace		tenmin	=	80	if	startmin	>	1029	&	endmin	<=	1040
replace		tenmin	=	81	if	startmin	>	1039	&	endmin	<=	1050
replace		tenmin	=	82	if	startmin	>	1049	&	endmin	<=	1060
replace		tenmin	=	83	if	startmin	>	1059	&	endmin	<=	1070
replace		tenmin	=	84	if	startmin	>	1069	&	endmin	<=	1080
replace		tenmin	=	85	if	startmin	>	1079	&	endmin	<=	1090
replace		tenmin	=	86	if	startmin	>	1089	&	endmin	<=	1100
replace		tenmin	=	87	if	startmin	>	1099	&	endmin	<=	1110
replace		tenmin	=	88	if	startmin	>	1109	&	endmin	<=	1120
replace		tenmin	=	89	if	startmin	>	1119	&	endmin	<=	1130
replace		tenmin	=	90	if	startmin	>	1129	&	endmin	<=	1140
replace		tenmin	=	91	if	startmin	>	1139	&	endmin	<=	1150
replace		tenmin	=	92	if	startmin	>	1149	&	endmin	<=	1160
replace		tenmin	=	93	if	startmin	>	1159	&	endmin	<=	1170
replace		tenmin	=	94	if	startmin	>	1169	&	endmin	<=	1180
replace		tenmin	=	95	if	startmin	>	1179	&	endmin	<=	1190
replace		tenmin	=	96	if	startmin	>	1189	&	endmin	<=	1200
replace		tenmin	=	97	if	startmin	>	1199	&	endmin	<=	1210
replace		tenmin	=	98	if	startmin	>	1209	&	endmin	<=	1220
replace		tenmin	=	99	if	startmin	>	1219	&	endmin	<=	1230
replace		tenmin	=	100	if	startmin	>	1229	&	endmin	<=	1240
replace		tenmin	=	101	if	startmin	>	1239	&	endmin	<=	1250
replace		tenmin	=	102	if	startmin	>	1249	&	endmin	<=	1260
replace		tenmin	=	103	if	startmin	>	1259	&	endmin	<=	1270
replace		tenmin	=	104	if	startmin	>	1269	&	endmin	<=	1280
replace		tenmin	=	105	if	startmin	>	1279	&	endmin	<=	1290
replace		tenmin	=	106	if	startmin	>	1289	&	endmin	<=	1300
replace		tenmin	=	107	if	startmin	>	1299	&	endmin	<=	1310
replace		tenmin	=	108	if	startmin	>	1309	&	endmin	<=	1320
replace		tenmin	=	109	if	startmin	>	1319	&	endmin	<=	1330
replace		tenmin	=	110	if	startmin	>	1329	&	endmin	<=	1340
replace		tenmin	=	111	if	startmin	>	1339	&	endmin	<=	1350
replace		tenmin	=	112	if	startmin	>	1349	&	endmin	<=	1360
replace		tenmin	=	113	if	startmin	>	1359	&	endmin	<=	1370
replace		tenmin	=	114	if	startmin	>	1369	&	endmin	<=	1380
replace		tenmin	=	115	if	startmin	>	1379	&	endmin	<=	1390
replace		tenmin	=	116	if	startmin	>	1389	&	endmin	<=	1400
replace		tenmin	=	117	if	startmin	>	1399	&	endmin	<=	1410
replace		tenmin	=	118	if	startmin	>	1409	&	endmin	<=	1420
replace		tenmin	=	119	if	startmin	>	1419	&	endmin	<=	1430
replace		tenmin	=	120	if	startmin	>	1429	&	endmin	<=	1440
replace		tenmin	=	121	if	startmin	>	1439	&	endmin	<=	1450
replace		tenmin	=	122	if	startmin	>	1449	&	endmin	<=	1460
replace		tenmin	=	123	if	startmin	>	1459	&	endmin	<=	1470
replace		tenmin	=	124	if	startmin	>	1469	&	endmin	<=	1480
replace		tenmin	=	125	if	startmin	>	1479	&	endmin	<=	1490
replace		tenmin	=	126	if	startmin	>	1489	&	endmin	<=	1500
replace		tenmin	=	127	if	startmin	>	1499	&	endmin	<=	1510
replace		tenmin	=	128	if	startmin	>	1509	&	endmin	<=	1520
replace		tenmin	=	129	if	startmin	>	1519	&	endmin	<=	1530
replace		tenmin	=	130	if	startmin	>	1529	&	endmin	<=	1540
replace		tenmin	=	131	if	startmin	>	1539	&	endmin	<=	1550
replace		tenmin	=	132	if	startmin	>	1549	&	endmin	<=	1560
replace		tenmin	=	133	if	startmin	>	1559	&	endmin	<=	1570
replace		tenmin	=	134	if	startmin	>	1569	&	endmin	<=	1580
replace		tenmin	=	135	if	startmin	>	1579	&	endmin	<=	1590
replace		tenmin	=	136	if	startmin	>	1589	&	endmin	<=	1600
replace		tenmin	=	137	if	startmin	>	1599	&	endmin	<=	1610
replace		tenmin	=	138	if	startmin	>	1609	&	endmin	<=	1620
replace		tenmin	=	139	if	startmin	>	1619	&	endmin	<=	1630
replace		tenmin	=	140	if	startmin	>	1629	&	endmin	<=	1640
replace		tenmin	=	141	if	startmin	>	1639	&	endmin	<=	1650
replace		tenmin	=	142	if	startmin	>	1649	&	endmin	<=	1660
replace		tenmin	=	143	if	startmin	>	1659	&	endmin	<=	1670
replace		tenmin	=	144	if	startmin	>	1669	&	endmin	<=	1680

cap drop tenmode
bysort		tucaseid tenmin: egen tenmode = mode(dactiv)			/* 	The nummode command doesn't work with the by command */
by tucaseid tenmin: replace tenmode = dactiv[1] if tenmode==. 		/* 	Replacing missing values generated when group contains multiple modes.
																		Replaced with the first activity in the 10 min. increment */
															
label value 	tenmode	dactivlbl

collapse (max)	selfcare		eating			workedu			carework						///
				housework		passleis		other											///
				dailycare		devlpcare		dailyhswk		elsehswk						///
				tele			passnotv		actleis			socleis							///
				shop			dother															///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 														///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10		tenmode 						///
				activity 		dactiv			startmin										///
				female			tufnwgtp		[aweight=tufnwgtp], by(tucaseid tenmin)
edit
save		"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_all_tenmin"		, replace


******************************************************************************************
* COMPLEXITY EQUATION *
******************************************************************************************
label define 	dactivlbl 		1 	"Sleep/Self-Care"	2	"Eating"		3	"Work & Edu"		///
								4 	"Daily Carework"	5 	"Devep. Care"	6 	"Daily HSWK"		///
								7 	"Other HSWK"		8	"Television"	9	"Pass Leis"			///
								10	"Active Leisure"	11	"Social Leis."	12	"Shopping"			///
								13	"Other"

label value 	tenmode	dactivlbl

tsset tucaseid tenmin
count

******************************************************************************************
*10 Min. Increment Activity Version
******************************************************************************************

//	q

/*
calculated by counting the number of the actual number of transitions in the sequence
Transitions are changes of activity type from one moment to next moment
*/

cap drop 	trans10
gen 		trans10 = (L1.tenmode!=tenmode) ///
			if !missing(L.tenmode, L2.tenmode)
	
list 		tucaseid tenmode tenmin trans10 in 1/500, sepby(tucaseid)

cap drop	transsum10
egen		transsum10 = sum(trans10), by(tucaseid)

list 		tucaseid tenmode tenmin trans10 transsum10 in 1/500, sepby(tucaseid)

//	q		= transsum10

//	qmax

/* 
the maximum number of transitions denotes the total length of the observation 
time period (minus 1). 
	qmax= 143	(1440/10 - 1)
*/

// qmax 	= 143


******************************************************************************************
//	h

/*
denotes the entropy of a sequence of activities -- the variety of activities itself
*/

* Variety w/ detailed actvities
cap drop	selfdum
cap drop	eatdum
cap drop	workdum
cap drop	dailycaredum
cap drop	devlpcaredum
cap drop	dailyhswkdum
cap drop	elsehswkdum
cap drop	teledum
cap drop	passnotvdum
cap drop	actleisdum
cap drop	socleisdum
cap drop	shopdum
cap drop	dotherdum

egen		selfdum 		= max(selfcare)			, by(tucaseid)
egen		eatdum 			= max(eating)			, by(tucaseid)
egen		workdum 		= max(workedu)			, by(tucaseid)
egen		dailycaredum 	= max(dailycare)		, by(tucaseid)
egen		devlpcaredum 	= max(devlpcare)		, by(tucaseid)
egen		dailyhswkdum 	= max(dailyhswk)		, by(tucaseid)
egen		elsehswkdum 	= max(elsehswk)			, by(tucaseid)
egen		teledum 		= max(tele)				, by(tucaseid)
egen		passnotvdum 	= max(passnotv)			, by(tucaseid)
egen		actleisdum 		= max(actleis)			, by(tucaseid)
egen		socleisdum 		= max(socleis)			, by(tucaseid)
egen		shopdum 		= max(shop)				, by(tucaseid)
egen		dotherdum 		= max(dother)			, by(tucaseid)


cap drop	dvariety
egen		dvariety 		= max(selfdum + eatdum + workdum + dailycaredum + devlpcaredum + dailyhswkdum + elsehswkdum + teledum + passnotvdum + actleisdum + socleisdum + shopdum + dotherdum), by(tucaseid)


// h		= dvariety

******************************************************************************************
//	hmax

/* the maximum possible entropy, which is determined by the size of the set of activities.
So hmax =7
*/
tab 		dactiv

//hmax		=13

******************************************************************************************
// Complexity equation

edit tucaseid tenmode tenmin trans10  dvariety 

*** square variable^2
*** square root = sqrt(variable)

// Create DETAILED COMPLEXITY with 10 MIN. INCREMENTS

cap drop	qtrans10
gen			qtrans10	=(transsum10/143)^2

cap drop	dhvar
gen			dhvar		=(dvariety/13)^2

cap drop	complex10	
gen			complex10	=sqrt(qtrans10/dhvar)

edit tucaseid transsum10 dvariety qtrans10 dhvar complex10

******************************************************************************************
* SEQUENCE ANALYSIS *
******************************************************************************************
tsspell tenmode		/*	Set data to get accurate duration variables	*/

egen 		tmax 		= max(tenmin), by(tucaseid _spell)
egen 		tmin 		= min(tenmin), by(tucaseid _spell)

cap drop 	duration
gen 		duration 	= ((tmax - tmin) + 1)*10


// Sequences -- new way with detailed activity variable

egen selfdur 		= max(duration) if dactiv==1 	& _end==1, by(tucaseid _spell)
egen eatdur 		= max(duration) if dactiv==2 	& _end==1, by(tucaseid _spell)
egen workdur 		= max(duration) if dactiv==3 	& _end==1, by(tucaseid _spell)
egen dailycaredur 	= max(duration) if dactiv==4 	& _end==1, by(tucaseid _spell)
egen devlpcaredur 	= max(duration) if dactiv==5 	& _end==1, by(tucaseid _spell)
egen dailyhswkdur 	= max(duration) if dactiv==6 	& _end==1, by(tucaseid _spell)
egen elsehswkdur 	= max(duration) if dactiv==7 	& _end==1, by(tucaseid _spell)
egen teledur 		= max(duration) if dactiv==8 	& _end==1, by(tucaseid _spell)
egen passnotvdur 	= max(duration) if dactiv==9 	& _end==1, by(tucaseid _spell)
egen actleisdur 	= max(duration) if dactiv==10 	& _end==1, by(tucaseid _spell)
egen socleisdur 	= max(duration) if dactiv==11 	& _end==1, by(tucaseid _spell)
egen shopdur 		= max(duration) if dactiv==12 	& _end==1, by(tucaseid _spell)
egen dotherdur 		= max(duration) if dactiv==13 	& _end==1, by(tucaseid _spell)

cap drop	numepi
egen		numepi	=max(_spell), by(tucaseid)


save		"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_all_tenmin"		, replace
use			"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_all_tenmin",		, clear

preserve
drop if female==1
vreverse dactiv,	gen(dactiv1)
save 		"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_men_tenmin"		, replace
restore

preserve
drop if female==0
vreverse dactiv,	gen(dactiv1)
save 		"D:\Dropbox\Sayer\Gendered Sequences\Stata\sequences_women_tenmin"		, replace
restore

// CREATE SUMMMARY FILE
collapse (max)	selfsum			eatsum			worksum			dailycaresum	devlpcaresum	///
				dailyhswksum	elsehswksum		telesum			passnotvsum		actleissum		///
				socleissum 		shopsum			dothersum										///
				married 		nevmar			unmarpartner 	divsep							///
				numberhhchild 	kidu2dum		kid2to5			exfamdum						///
				lths 			highschool 		somecol 		baormore						///
				parttime 		fulltime 														///
				white			black			asian			hispanic		otherrace		///
				teage 			weekend			complex10		dvariety		transsum10		///
				qtrans10		female			tufnwgtp		[aweight=tufnwgtp], by(tucaseid)

save		"D:\Dropbox\Sayer\Gendered Sequences\Stata\10minute\sequences_summary"

