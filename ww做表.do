use "C:\Users\TOMORROW\Desktop\做表\Apple_B_M_ALL_BTest.dta",clear
rename treatment treatment_M
rename factory factory1_M
keep  *_M
replace wm_120102_cln_M=. if wm_120102_cln_M==9999
replace wm_120202_cln_M=9999 if wm_120202_cln_M==43164
replace wm_120202_cln_M=. if wm_120202_cln_M==9999
replace wm_120203_cln_M =. if wm_120203_cln_M >1
replace wm_120109_cln_M=. if  wm_120109_cln_M>10
replace wm_120108_cln_M=. if  wm_120108_cln_M>10
replace  wm_120101_cln_M =. if wm_120101_cln_M>1 
replace  wm_120201_cln_M =. if wm_120201_cln_M>1 
replace wm_120112_cln_M =. if wm_120112_cln_M >1
replace wm_120111_cln_M =. if wm_120111_cln_M >1
replace wm_120212_cln_M =. if wm_120212_cln_M >1
replace wm_120211_cln_M =. if wm_120211_cln_M >1
destring wm_120302_cln_M wm_120105_cln_M wm_120106_cln_M wm_120205_cln_M wm_120206_cln_M,replace force
replace wm_120105_cln_M =. if wm_120105_cln_M >4
replace wm_120106_cln_M =. if wm_120106_cln_M >3|wm_120106_cln_M <1			
replace wm_120205_cln_M =. if wm_120205_cln_M >4
replace wm_120206_cln_M =. if wm_120206_cln_M >3|wm_120206_cln_M <1	
replace wm_120302_cln_M =. if wm_120302_cln_M >6|wm_120302_cln_M <1	
save 1.dta,replace

********************一。女工总体情况**************************
****************************************************************************
//*表1. 项目启动后女性生殖结构与卫生保健知识的获取情况分析 


use 1.dta,clear
global	WWT1 "wm_120101_cln_M wm_120102_cln_M wm_120103_cln_M wm_120107_cln_M wm_120108_cln_M wm_120109_cln_M  wm_120111_cln_M wm_120112_cln_M"

global	WWT2 "wm_120105_cln_M wm_120106_cln_M wm_12011001_cln_M wm_12011002_cln_M wm_12011003_cln_M wm_12011004_cln_M wm_12011005_cln_M wm_12011006_cln_M wm_12011007_cln_M" 

global	WWT3 "wm_120201_cln_M wm_120202_cln_M wm_120203_cln_M wm_120207_cln_M wm_120208_cln_M wm_120209_cln_M  wm_120211_cln_M wm_120212_cln_M"

global	WWT4 "wm_120205_cln_M wm_120206_cln_M wm_12021001_cln_M wm_12021002_cln_M wm_12021003_cln_M wm_12021004_cln_M wm_12021005_cln_M wm_12021006_cln_M wm_12021007_cln_M" 

global	WWT5 "wm_120301_cln_M wm_120303_cln_M wm_120304_cln_M wm_120305_cln_M wm_120306_cln_M" 

global  WWT6 "wm_120302_cln_M"

sum  $WWT1 

sum  $WWT3 		
		
sum  $WWT5 	
	
foreach var of varlist $WWT2 {
		tab `var'
		}		
		
foreach var of varlist $WWT4 {
		tab `var'
		}		
		
		
foreach var of varlist $WWT6{
		tab `var'
		}		
				
		
		

********************二。女工分工厂情况**************************
****************************************************************************
//*表1. 项目启动后女性生殖结构与卫生保健知识的获取情况分析 


use 1.dta,clear
global	WWT1 "wm_120101_cln_M wm_120102_cln_M wm_120103_cln_M wm_120107_cln_M wm_120108_cln_M wm_120109_cln_M  wm_120111_cln_M wm_120112_cln_M"

global	WWT2 "wm_120105_cln_M wm_120106_cln_M wm_12011001_cln_M wm_12011002_cln_M wm_12011003_cln_M wm_12011004_cln_M wm_12011005_cln_M wm_12011006_cln_M wm_12011007_cln_M" 

global	WWT3 "wm_120201_cln_M wm_120202_cln_M wm_120203_cln_M wm_120207_cln_M wm_120208_cln_M wm_120209_cln_M  wm_120211_cln_M wm_120212_cln_M"

global	WWT4 "wm_120205_cln_M wm_120206_cln_M wm_12021001_cln_M wm_12021002_cln_M wm_12021003_cln_M wm_12021004_cln_M wm_12021005_cln_M wm_12021006_cln_M wm_12021007_cln_M" 

global	WWT5 "wm_120301_cln_M wm_120303_cln_M wm_120304_cln_M wm_120305_cln_M wm_120306_cln_M" 

global  WWT6 "wm_120302_cln_M"

eststo clear
	qui eststo: estpost tabstat  $WWT1      , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT1      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "111.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

		eststo clear
	qui eststo: estpost tabstat  $WWT3     , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT3      if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT3      if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT3      if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "222.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
	
	eststo clear
	qui eststo: estpost tabstat  $WWT5     , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT5   if factory1_M == 1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT5   if factory1_M == 2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT5   if factory1_M == 3, statistics(mean sd) columns(statistics)

	esttab ///
		using "333.csv", ///
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
	
foreach var of varlist $WWT4 {
		tab `var'  if factory1_M == 1
		}		
		
			
foreach var of varlist $WWT4 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT4 {
		tab `var'  if factory1_M == 3
		}			
	
foreach var of varlist $WWT6 {
		tab `var'  if factory1_M == 1
		}		
		
			
foreach var of varlist $WWT6 {
		tab `var'  if factory1_M == 2
		}		

foreach var of varlist $WWT6 {
		tab `var'  if factory1_M == 3
		}				
		
		
		
		
		
		
		
********************三。女工分组别情况**************************
****************************************************************************
//*表1. 项目启动后女性生殖结构与卫生保健知识的获取情况分析 


use 1.dta,clear
global	WWT1 "wm_120101_cln_M wm_120102_cln_M wm_120103_cln_M wm_120107_cln_M wm_120108_cln_M wm_120109_cln_M  wm_120111_cln_M wm_120112_cln_M"

global	WWT2 "wm_120105_cln_M wm_120106_cln_M wm_12011001_cln_M wm_12011002_cln_M wm_12011003_cln_M wm_12011004_cln_M wm_12011005_cln_M wm_12011006_cln_M wm_12011007_cln_M" 

global	WWT3 "wm_120201_cln_M wm_120202_cln_M wm_120203_cln_M wm_120207_cln_M wm_120208_cln_M wm_120209_cln_M  wm_120211_cln_M wm_120212_cln_M"

global	WWT4 "wm_120205_cln_M wm_120206_cln_M wm_12021001_cln_M wm_12021002_cln_M wm_12021003_cln_M wm_12021004_cln_M wm_12021005_cln_M wm_12021006_cln_M wm_12021007_cln_M" 

global	WWT5 "wm_120301_cln_M wm_120303_cln_M wm_120304_cln_M wm_120305_cln_M wm_120306_cln_M" 

global  WWT6 "wm_120302_cln_M"

eststo clear
qui eststo: estpost tabstat  $WWT1     , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT1     if treatment_M == 0, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if treatment_M == 1, statistics(mean sd) columns(statistics)
	esttab ///
		using "1211.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
	

eststo clear
qui eststo: estpost tabstat   $WWT3   , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat   $WWT3   if treatment_M == 0, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat   $WWT3     if treatment_M == 1, statistics(mean sd) columns(statistics)
	esttab ///
		using "1221.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 	
	
	

eststo clear
qui eststo: estpost tabstat   $WWT5  , statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT5  if treatment_M == 0, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT5   if treatment_M == 1, statistics(mean sd) columns(statistics)
	esttab ///
		using "1231.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
		
		
foreach var of varlist $WWT2 {
		tab `var'  if treatment_M == 0
		}		
		
			
foreach var of varlist $WWT2 {
		tab `var'  if treatment_M == 1
		}		
		
foreach var of varlist $WWT4 {
		tab `var' if treatment_M == 0
		}		
		
foreach var of varlist $WWT4 {
		tab `var' if treatment_M == 1
		}		
				
foreach var of varlist $WWT6{
		tab `var' if treatment_M == 0
		}				
		
foreach var of varlist $WWT6{
		tab `var' if treatment_M == 1
		}				
		
		
		
********************四。女工分组别和工厂情况**************************
****************************************************************************
//*表1. 项目启动后女性生殖结构与卫生保健知识的获取情况分析 


use 1.dta,clear
global	WWT1 "wm_120101_cln_M wm_120102_cln_M wm_120103_cln_M wm_120107_cln_M wm_120108_cln_M wm_120109_cln_M  wm_120111_cln_M wm_120112_cln_M"

global	WWT2 "wm_120105_cln_M wm_120106_cln_M wm_12011001_cln_M wm_12011002_cln_M wm_12011003_cln_M wm_12011004_cln_M wm_12011005_cln_M wm_12011006_cln_M wm_12011007_cln_M" 

global	WWT3 "wm_120201_cln_M wm_120202_cln_M wm_120203_cln_M wm_120207_cln_M wm_120208_cln_M wm_120209_cln_M  wm_120211_cln_M wm_120212_cln_M"

global	WWT4 "wm_120205_cln_M wm_120206_cln_M wm_12021001_cln_M wm_12021002_cln_M wm_12021003_cln_M wm_12021004_cln_M wm_12021005_cln_M wm_12021006_cln_M wm_12021007_cln_M" 

global	WWT5 "wm_120301_cln_M wm_120303_cln_M wm_120304_cln_M wm_120305_cln_M wm_120306_cln_M" 

global  WWT6 "wm_120302_cln_M"

eststo clear
qui eststo: estpost tabstat  $WWT1     if  factory1_M==1, statistics(mean sd) columns(statistics)

	qui eststo: estpost tabstat  $WWT1     if treatment_M == 0 & factory1_M==1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1      if treatment_M == 1 & factory1_M==1, statistics(mean sd) columns(statistics)
	esttab ///
		using "211.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

eststo clear
	qui eststo: estpost tabstat     $WWT3   if treatment_M == 0 & factory1_M==1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat     $WWT3     if treatment_M == 1 & factory1_M==1, statistics(mean sd) columns(statistics)
	esttab ///
		using "212.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
eststo clear
	qui eststo: estpost tabstat   $WWT5  if treatment_M == 0 & factory1_M==1, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat    $WWT5   if treatment_M == 1 & factory1_M==1, statistics(mean sd) columns(statistics)
	esttab ///
		using "213.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
		
eststo clear
	qui eststo: estpost tabstat  $WWT1     if treatment_M == 0 & factory1_M==2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if treatment_M == 1 & factory1_M==2, statistics(mean sd) columns(statistics)
	esttab ///
		using "311.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
		
eststo clear
	qui eststo: estpost tabstat   $WWT3   if treatment_M == 0 & factory1_M==2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat    $WWT3     if treatment_M == 1 & factory1_M==2, statistics(mean sd) columns(statistics)
	esttab ///
		using "313.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
eststo clear
	qui eststo: estpost tabstat   $WWT5  if treatment_M == 0 & factory1_M==2, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat   $WWT5   if treatment_M == 1 & factory1_M==2, statistics(mean sd) columns(statistics)
	esttab ///
		using "315.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 

	
eststo clear
	qui eststo: estpost tabstat    $WWT5  if treatment_M == 0 & factory1_M==3, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat   $WWT5   if treatment_M == 1 & factory1_M==3, statistics(mean sd) columns(statistics)
	esttab ///
		using "415.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
eststo clear
	qui eststo: estpost tabstat  $WWT1   if treatment_M == 0 & factory1_M==3, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat  $WWT1     if treatment_M == 1 & factory1_M==3, statistics(mean sd) columns(statistics)
	esttab ///
		using "411.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 		
eststo clear
	qui eststo: estpost tabstat    $WWT3   if treatment_M == 0 & factory1_M==3, statistics(mean sd) columns(statistics)
	qui eststo: estpost tabstat     $WWT3     if treatment_M == 1 & factory1_M==3, statistics(mean sd) columns(statistics)
	esttab ///
		using "413.csv", ///
		main(mean %9.3fc) aux(sd %9.3fc) nostar unstack nolabel ///
		nogap noeqlines nonote nolines obslast ///
		replace 
		
		
		
foreach var of varlist $WWT2 {
		tab `var'  if treatment_M == 0 & factory1_M==1
		}		
		
			
foreach var of varlist $WWT2 {
		tab `var'  if treatment_M == 1 & factory1_M==1
		}		
		
foreach var of varlist $WWT2 {
		tab `var' if treatment_M == 0 & factory1_M==2
		}		
		
foreach var of varlist $WWT2 {
		tab `var' if treatment_M == 1& factory1_M==2
		}		
				
foreach var of varlist $WWT2{
		tab `var' if treatment_M == 0& factory1_M==3
		}				
		
foreach var of varlist $WWT2{
		tab `var' if treatment_M == 1& factory1_M==3
		}				
		
		
		
foreach var of varlist $WWT4 {
		tab `var'  if treatment_M == 0 & factory1_M==1
		}		
		
			
foreach var of varlist $WWT4 {
		tab `var'  if treatment_M == 1 & factory1_M==1
		}		
		
foreach var of varlist $WWT4 {
		tab `var' if treatment_M == 0 & factory1_M==2
		}		
		
foreach var of varlist $WWT4 {
		tab `var' if treatment_M == 1& factory1_M==2
		}		
				
foreach var of varlist $WWT4{
		tab `var' if treatment_M == 0& factory1_M==3
		}				
		
foreach var of varlist $WWT4{
		tab `var' if treatment_M == 1& factory1_M==3
		}				
				

foreach var of varlist $WWT6 {
		tab `var'  if treatment_M == 0 & factory1_M==1
		}		
		
			
foreach var of varlist $WWT6 {
		tab `var'  if treatment_M == 1 & factory1_M==1
		}		
		
foreach var of varlist $WWT6 {
		tab `var' if treatment_M == 0 & factory1_M==2
		}		
		
foreach var of varlist $WWT6 {
		tab `var' if treatment_M == 1& factory1_M==2
		}		
				
foreach var of varlist $WWT6{
		tab `var' if treatment_M == 0& factory1_M==3
		}				
		
foreach var of varlist $WWT6{
		tab `var' if treatment_M == 1& factory1_M==3
		}				
		