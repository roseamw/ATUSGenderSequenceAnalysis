#delimit ;
 
* Edit the insheet statement to reference the data file on your computer.;
 
insheet
 tucaseid
 tulineno
 terrp
 teage
 tesex
 using D:\Dropbox\Sayer\MaritalStatus\Data_Analysis\atusrost_0312\atusrost_0312.dat, names comma ;
 
label variable teage "Edited: age";
label variable tucaseid "ATUS Case ID (14-digit identifier)";
label variable tulineno "ATUS person line number";
label variable terrp "Edited: how is this person related to you?";
label variable tesex "Edited: sex";
 
label define labelterrp
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
18 "Self"
19 "Self"
20 "Spouse"
21 "Unmarried partner"
22 "Own household child"
23 "Grandchild"
24 "Parent"
25 "Brother/sister"
26 "Other relative"
27 "Foster child"
28 "Housemate/roommate"
29 "Roomer/boarder"
30 "Other nonrelative"
40 "Own non-household child < 18"
;
label define labeltesex
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Male"
2 "Female"
;
 
label values terrp   labelterrp;
label values tesex   labeltesex;
 
describe, short;

save D:\Dropbox\Sayer\MaritalStatus\Data_Analysis\atusrost_0312\atus.roster.dta, replace;
