
/* UK X-Sectional data analysis*/

* load Bristol data
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\UK_Analysis.dta", clear

///* Descriptive *///

* SW and HCV 
summ age if sw_all_12m !=., detail // male and female
summ age if sw_all_12m !=. & gender == 1, detail // males
summ age if sw_all_12m !=. & gender == 2, detail // females

tab sw_all_12m if sw_all_12m !=. // male and female
tab sw_all_12m if gender ==1 & sw_all_12m !=. // males
tab sw_all_12m if gender == 2 & sw_all_12m !=. // females

tab oat_current if sw_all_12m !=. // male and female
tab oat_current if gender ==1 & sw_all_12m !=. // males
tab oat_current if gender == 2 & sw_all_12m !=. // females

tab homeless_12m if sw_all_12m !=. // male and female
tab homeless_12m if gender ==1 & sw_all_12m !=. // males
tab homeless_12m if gender == 2 & sw_all_12m !=. // females

tab prison_12m if sw_all_12m !=. // male and female
tab prison_12m if gender ==1 & sw_all_12m !=. // males
tab prison_12m if gender == 2 & sw_all_12m !=. // females

summ inj_freq_4w if sw_all_12m !=., detail // male and female
summ inj_freq_4w if sw_all_12m !=. & gender == 1, detail // males
summ inj_freq_4w if sw_all_12m !=. & gender == 2, detail // females

summ inj_dur if sw_all_12m !=., detail // male and female
summ inj_dur if sw_all_12m !=. & gender == 1, detail // males
summ inj_dur if sw_all_12m !=. & gender == 2, detail // females

* MSM and HCV
summ age if msm_12m !=. & gender == 1, detail

tab msm_12m if gender ==1 & msm_12m !=. 

tab oat_4w if gender ==1 & msm_12m !=. 

tab homeless_12m if gender ==1 & msm_12m !=. 

tab prison_12m if gender ==1 & msm_12m !=. 

summ inj_freq_4w if msm_12m !=. & gender == 1, detail 

summ inj_dur if msm_12m !=. & gender == 1, detail 

///* Analysis *///
* SW and HCV (male and female)
tab sw_all_12m inc_hcv, row

logistic inc_hcv sw_all_12m 
logistic inc_hcv sw_all_12m i.oat_current i.prison_ever i.homeless_12m
logistic inc_hcv sw_all_12m i.oat_current i.prison_ever i.homeless_12m i.inj_dur i.inj_freq_4w

csi 3 23 12 298

* SW and HCV (men)
tab sw_all_12m inc_hcv if gender == 1, row
di (0.5/12.5)/(10.5/248.5) // https://www.omnicalculator.com/statistics/relative-risk

* SW and HCV (female)
tab sw_all_12m inc_hcv if gender == 2, row
csi 3 11 2 60

logistic inc_hcv sw_all_12m if gender == 2
logistic inc_hcv sw_all_12m i.prison_ever i.homeless_12m if gender == 2

* MSM and HCV
tab msm_12m inc_hcv if gender == 1, row






















