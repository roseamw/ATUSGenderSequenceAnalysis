// SEQUENCES MASTER FILE

clear
global 	jppath 		"C:\Users\Joanna\Dropbox\Repositories"		/*Set up Joanna's file path*/
cd 					"$jppath\ATUSGenderSequenceAnalysis\data"


log using "Sequences Log", text replace

do "sequences_1_measures_v1.do"									/*create activity and demographic variables		*/
do "sequences_2_10min_v1.do"									/*create 10 minute file	& complexity equation	*/
do "sequences_3_tables_v1.do"									/*create paper tables & tempograms				*/

log close
