#delimit ;
 
* Edit the import statement to reference the data file on your computer.;
* Edit save code at end;

 
import delimited
tucaseid
tuactivity_n
tuactdur24
tucc5
tucc5b
trtcctot_ln
trtcc_ln
trtcoc_ln
tustarttim
tustoptime
trcodep
trtier1p
trtier2p
tucc8
tucumdur
tucumdur24
tuactdur
tr_03cc57
trto_ln
trtonhh_ln
trtohh_ln
trthh_ln
trtnohh_ln
tewhere
tucc7
trwbelig
trtec_ln
tuec24
tudurstop
 using "D:\Dropbox\Data\ATUS\ATUS0316\atusact_0316\atusact_0316.dat", stringcols(1) ;
 
label variable tucaseid "ATUS Case ID (14-digit identifier)";
label variable tuactivity_n "Activity line number";
label variable tuactdur24 "Duration of activity in minutes (last activity truncated at 4:00 a.m.)";
label variable tucc5 "Was at least 1 of your own hh children < 13 in your care during this activity?";
label variable tucc5b "At least 1 of your non-own hh children < 13 in your care during this activity?";
label variable trtcctot_ln "Minutes during activity providing secondary childcare for all children < 13";
label variable trtcc_ln "Minutes during activity prov. 2ndary childcare for hh & own nonhh children < 13";
label variable trtcoc_ln "Minutes during activity providing 2ndary childcare for nonown nonhh children <13";
label variable tustarttim "Activity start time";
label variable tustoptime "Activity stop time";
label variable trcodep "Pooled six-digit activity code";
label variable trtier1p "Pooled lexicon tier 1: 1st and 2nd digits of 6-digit activity code";
label variable trtier2p "Pooled lexicon tiers 1 and 2: 1st four digits of 6-digit activity code";
label variable tucc8 "Other than hh or own nonhh children, child 0-12 in your care during activity?";
label variable tucumdur "Cum. duration of activity lengths in minutes; last activity not trunc. at 4:00am";
label variable tucumdur24 "Cum. duration of activity lengths in minutes; last activity truncated at 4:00am";
label variable tuactdur "Duration of activity in minutes (last activity not truncated at 4:00 a.m.)";
label variable tr_03cc57 "Household or own non-household child < 13 in your care during this activity?";
label variable trto_ln "Minutes during activity providing secondary childcare for own children < 13 ";
label variable trtonhh_ln "Minutes during activity providing 2ndary childcare for own nonhh children < 13";
label variable trtohh_ln "Minutes during activity providing secondary childcare for own hh children < 13";
label variable trthh_ln "Minutes during activity providing secondary childcare for hh children < 13";
label variable trtnohh_ln "Minutes during activity providing 2ndary childcare for nonown hh children < 13";
label variable tewhere "Edited: where were you during the activity?";
label variable tucc7 "Was at least 1 of own non-hh children < 13 in your care during this activity?";
label variable trwbelig "Flag identifying activities eligible for the Well-Being Module";
label variable trtec_ln "Time (in minutes) spent providing eldercare by activity";
label variable tuec24 "Which times/activities did you provide that care or assistance yesterday?";
label variable tudurstop "Method for reporting activity duration";
 
label define labeltewhere
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Respondent's home or yard"
2 "Respondent's workplace"
3 "Someone else's home"
4 "Restaurant or bar"
5 "Place of worship"
6 "Grocery store"
7 "Other store/mall"
8 "School"
9 "Outdoors away from home"
10 "Library"
11 "Other place"
12 "Car, truck, or motorcycle (driver)"
13 "Car, truck, or motorcycle (passenger)"
14 "Walking"
15 "Bus"
16 "Subway/train"
17 "Bicycle"
18 "Boat/ferry"
19 "Taxi/limousine service"
20 "Airplane"
21 "Other mode of transportation"
30 "Bank"
31 "Gym/health club"
32 "Post Office"
89 "Unspecified place"
99 "Unspecified mode of transportation"
;
label define labeltucc5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "No"
1 "Yes"
97 "No additional activities involved childcare"
;
label define labeltucc5b
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "No"
1 "Yes"
97 "No additional activities involved childcare"
;
label define labeltucc7
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "No"
1 "Yes"
97 "No additional activities involved childcare"
;
label define labeltucc8
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "No"
1 "Yes"
97 "No additional activities involved childcare"
;
label define labeltr_03cc57
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "At least one child < 13 was in respondent's care during activity"
;
label define labeltrwbelig
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Activity not eligible for selection in the Well-Being Module"
1 "Activity eligible for selection in the Well-Being Module"
;
label define labeltuec24
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Activity identified as eldercare"
96 "All day"
97 "No more activities"
;
label define labeltudurstop
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Activity duration was entered"
2 "Activity stop time was entered"
;

label values tewhere   labeltewhere;
label values tucc5     labeltucc5;
label values tucc5b    labeltucc5b;
label values tucc7     labeltucc7;
label values tucc8     labeltucc8;
label values tr_03cc57 labeltr_03cc57;
label values trwbelig  labeltrwbelig;
label values tuec24    labeltuec24;
label values tudurstop labeltudurstop;

describe, short;

save 		"D:\Dropbox\Data\ATUS\ATUS0316\atusact_0316\atus0316act", replace
