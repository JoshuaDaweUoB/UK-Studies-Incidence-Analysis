
/* UK X-Sectional data analysis*/

** sex work analysis 

* load data
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\UK_Analysis.dta", clear

* drop for complete case analysis
drop if inc_hcv ==. | sw_all_12m ==.

///* Descriptive *///

* SW and HCV 
summ age, detail // male and female
summ age if gender == 1, detail // males
summ age if gender == 2, detail // females

tab sw_all_12m // male and female
tab sw_all_12m if gender ==1 // males
tab sw_all_12m if gender == 2 // females

tab oat_current // male and female
tab oat_current if gender ==1 // males
tab oat_current if gender == 2 // females

tab homeless_12m // male and female
tab homeless_12m if gender ==1 // males
tab homeless_12m if gender == 2 // females

tab prison_12m // male and female
tab prison_12m if gender ==1 // males
tab prison_12m if gender == 2 // females

summ inj_freq_4w, detail // male and female
summ inj_freq_4w if gender == 1, detail // males
summ inj_freq_4w if gender == 2, detail // females

summ inj_dur, detail // male and female
summ inj_dur if gender == 1, detail // males
summ inj_dur if gender == 2, detail // females

* SW and HCV (male and female)
tab sw_all_12m inc_hcv, row

logistic inc_hcv sw_all_12m 
logistic inc_hcv sw_all_12m i.oat_current i.prison_ever i.homeless_12m
logistic inc_hcv sw_all_12m i.oat_current i.prison_ever i.homeless_12m c.inj_dur c.inj_freq_4w

* SW and HCV (men)
tab sw_all_12m inc_hcv if gender == 1, row

* SW and HCV (female)
tab sw_all_12m inc_hcv if gender == 2, row

logistic inc_hcv sw_all_12m if gender == 2
logistic inc_hcv sw_all_12m i.prison_ever i.homeless_12m if gender == 2
logistic inc_hcv sw_all_12m i.prison_ever i.homeless_12m c.inj_dur c.inj_freq_4w if gender == 2

** MSM analysis*

* load data
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\UK_Analysis.dta", clear

* drop for complete case analysis
drop if inc_hcv ==. | msm_12m ==.

* MSM 
summ age, detail

tab msm_12m 

tab oat_current 

tab homeless_12m

tab prison_12m 

summ inj_freq_4w  

summ inj_dur 

///* Analysis *///

* MSM and HCV
tab msm_12m inc_hcv, row


