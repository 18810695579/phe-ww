use "C:\Users\TOMORROW\Desktop\中期数据\phe_B_M_R1_NAME.dta",clear

rename factory factory1_M
keep  *_M
sum wm_1303_cln_M wm_1304_cln_M wm_1305_cln_M wm_1306_cln_M wm_1307_cln_M
replace wm_1304_cln_M=wm_1304_cln_M-1
replace wm_1305_cln_M=wm_1305_cln_M-1
replace wm_1307_cln_M=wm_1307_cln_M-1
sum wm_1303_cln_M wm_1304_cln_M wm_1305_cln_M wm_1306_cln_M wm_1307_cln_M
replace wm_1303_cln_M=. if wm_1303_cln_M>10
replace wm_1306_cln_M=. if wm_1306_cln_M>10
recode wm_1412_cln_M wm_1413_cln_M wm_1414_cln_M(2=0)
save 2.dta,replace

********************一。女工总体情况**************************
****************************************************************************
//*表1. 项目启动后女性生殖结构与卫生保健知识的获取情况分析 


use 2.dta,clear
global	WWT1 "wm_1303_cln_M wm_1304_cln_M wm_1305_cln_M wm_1306_cln_M wm_1307_cln_M"

global	WWT2 "wm_130201_cln_M wm_130202_cln_M wm_130203_cln_M wm_130204_cln_M" 

global	WWT3 "wm_1401_cln_M wm_1402_cln_M wm_1403_cln_M wm_1404_cln_M wm_1405_cln_M"

global	WWT4 " wm_1406_cln_M wm_1407_cln_M wm_1408_cln_M wm_1412_cln_M wm_1413_cln_M" 

global	WWT5 "wm_1409_cln_M wm_1410_cln_M wm_141101_cln_M wm_141102_cln_M wm_141103_cln_M wm_141104_cln_M wm_141105_cln_M wm_141106_cln_M wm_141107_cln_M" 

global  WWT6 "wm_1414_cln_M wm_1415_cln_M wm_1416_cln_M wm_1420_cln_M wm_1421_cln_M"

global  WWT7 "wm_1417_cln_M wm_1418_cln_M wm_141901_cln_M wm_141902_cln_M wm_141903_cln_M wm_141904_cln_M wm_141905_cln_M wm_141906_cln_M wm_141907_cln_M"

global  WWT8 "wm_1426_cln_M wm_120303_cln_M wm_120304_cln_M wm_120305_cln_M wm_120306_cln_M" 

global  WWT9 "wm_120302_cln_M"

global  WWT10 "wm_1429_cln_M wm_1431_cln_M wm_1433_cln_M wm_1435_cln_M wm_1436_cln_M wm_1437_cln_M wm_1438_cln_M wm_1439_cln_M wm_1440_cln_M wm_1441_cln_M"

global  WWT11 "wm_143001_cln_M wm_143002_cln_M wm_143003_cln_M wm_143004_cln_M wm_143005_cln_M wm_143201_cln_M wm_143202_cln_M wm_143203_cln_M wm_143204_cln_M wm_143205_cln_M"



sum  $WWT1 
sum  $WWT3 		
sum  $WWT4 				
sum  $WWT5 	
sum  $WWT6	
sum  $WWT8	
sum  $WWT10
	
foreach var of varlist $WWT2 {
		tab `var'
		}		
		
foreach var of varlist $WWT5 {
		tab `var'
		}		
		
		
foreach var of varlist $WWT7{
		tab `var'
		}		
				
		
foreach var of varlist $WWT9{
		tab `var'
		}			

foreach var of varlist $WWT11{
		tab `var'
		}
********************二。女工分工厂情况**************************
****************************************************************************
//*表1. 项目启动后女性生殖结构与卫生保健知识的获取情况分析 



eststo clear
	qui eststo: estpost tabstat  $WWT1      , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT1      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p1.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

		eststo clear
	qui eststo: estpost tabstat  $WWT3     , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT3      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT3      if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT3      if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p3.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
eststo clear
	qui eststo: estpost tabstat  $WWT4      , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT4      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT4     if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT4     if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p4.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

		
	eststo clear
	qui eststo: estpost tabstat  $WWT5     , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT5   if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT5   if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT5   if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p5.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

eststo clear
	qui eststo: estpost tabstat  $WWT6      , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT6      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT6     if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT6     if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p6.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

eststo clear
	qui eststo: estpost tabstat  $WWT8      , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT8      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT8     if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT8     if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p8.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

		
eststo clear
	qui eststo: estpost tabstat  $WWT10      , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT10     if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT10     if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT10     if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "p10.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
		
		
		
		
		
		
foreach var of varlist $WWT2 {
		tab `var'  if factory1_M == 1
		}		
		
			
foreach var of varlist $WWT2 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT2 {
		tab `var'  if factory1_M == 3
		}		
	
foreach var of varlist $WWT5 {
		tab `var'  if factory1_M == 1
		}		
		
			
foreach var of varlist $WWT5 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT5 {
		tab `var'  if factory1_M == 3
		}			
	
	foreach var of varlist $WWT5 {
		tab `var'  
		}			
	
foreach var of varlist $WWT7 {
		tab `var'  if factory1_M == 1
		}		
		
	foreach var of varlist $WWT7 {
		tab `var'  
		}				
foreach var of varlist $WWT7 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT7 {
		tab `var'  if factory1_M == 3
		}				
		
		
		
		
foreach var of varlist $WWT9 {
		tab `var'  if factory1_M == 1
		}		
		
	foreach var of varlist $WWT9 {
		tab `var'  
		}				
foreach var of varlist $WWT9 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT9 {
		tab `var'  if factory1_M == 3
		}				
		
				
		
foreach var of varlist $WWT11 {
		tab `var'  if factory1_M == 1
		}		
		
	foreach var of varlist $WWT11 {
		tab `var'  
		}				
foreach var of varlist $WWT11 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT11 {
		tab `var'  if factory1_M == 3
		}				
				
