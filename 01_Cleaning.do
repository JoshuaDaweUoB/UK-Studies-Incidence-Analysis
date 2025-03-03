
/* UK X-Sectional data analysis*/

* load Bristol data
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\BRISTOL_withstudyvbls.dta", clear

* renam vars 

rename subject id // participant ID

rename age3 age_cat3 // age (3 categories)

rename rhomeles homeless_12m // homeless past 12 months
rename ehomeles homeless_ever // homeless ever

rename eprison prison_ever // prison ever
rename tlyrpris prison_num_12m // times in prison past 12 months

rename cscript oat_current // OAT current
rename escript oat_ever // OAT ever

rename injdur inj_dur // injecting duration (years)
rename timesinj inj_freq_4w // number of times injected past 4 weeks

rename msexmen sw_men_12m // exchanged sex with men for money or drugs past 12 months
rename msexwmen sw_women_12m // exchanged sex with men for money or drugs past 12 months

* variable generation
gen any_sex = .
	recode any_sex .=1 if sexmen >0 & sexmen !=.
	recode any_sex .=1 if sexwmen >0 & sexwmen !=.
	recode any_sex .=0 if sexwmen == 0 & sexmen == 0

la var any_sex "Any sex (past 12 months)"
label define any_sex 0 "No" 1 "Yes"
label values any_sex any_sex

gen prison_12m = .
	recode prison_12m .=0 if prison_num_12m == 0
	recode prison_12m .=1 if prison_num_12m > 0 & prison_num_12m !=.

la var prison_12m "Imprisoned past 12 months (binary)"
label define prison_12m 0 "No" 1 "Yes"
label values prison_12m prison_12m

gen inj_freq_day = inj_freq_4w/28 // average times injected daily past 4 weeks
la var inj_freq_day "Average times injected daily (past 4 weeks)"

gen sw_all_12m = .
	recode sw_all_12m .= 1 if (sw_men_12m == 1 | sw_women_12 == 1)
	recode sw_all_12m .= 0 if (any_sex == 1 & sw_men_12m !=1)
	recode sw_all_12m .= 0 if (any_sex == 1 & sw_women_12 !=1)

la var sw_all_12m "Sex work (past 12 months)"
label define sw_all_12m 0 "No" 1 "Yes"
label values sw_all_12m sw_all_12m

gen msm_12m = .
	recode msm_12m .=0 if (sexmen == 0 & gender == 1)
	recode msm_12m .=1 if (sexmen > 0 & sexmen !=. & gender == 1)

la var msm_12m "Men who had sex with men (past 12 months)"
label define msm_12m 0 "No" 1 "Yes"
label values msm_12m msm_12m

gen inc_hcv = 0
	recode inc_hcv 0= 1 if all_hcv_rna == 1
	recode inc_hcv 0=. if all_hcv_ab == 1
	
la var inc_hcv "Incident HCV infection (all participants)"
label define inc_hcv 0 "No" 1 "Yes"
label values inc_hcv inc_hcv

gen dataset = 0

* QA checks
tab sexmen gender, m // missing for 2 participants (one man one woman)
tab msm_12m gender, m // missing for one man

keep id date age age_cat3 gender homeless_12m homeless_ever prison_12m prison_ever prison_num_12m oat_current oat_ever inj_dur inj_freq_4w inj_freq_day any_sex sw_men_12m sw_women_12m sw_all_12m msm_12m inc_hcv dataset

save "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\Bristol_subset.dta", replace

* load Birmingham data
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\BIRMINGHAM_withstudyvbls.dta", clear

* renam vars 
drop id
rename subject id // participant ID

rename age3 age_cat3 // age (3 categories)

rename rhomeles homeless_12m // homeless past 12 months
rename ehomeles homeless_ever // homeless ever

rename eprison prison_ever // prison ever
rename tlyrpris prison_num_12m // times in prison past 12 months

rename c3script oat_current // OAT current
rename escript oat_ever // OAT past 12 months

rename injdur inj_dur // injecting duration (years)
rename ndaysinj inj_freq_4w // number of times injected past 4 weeks

rename msexmen sw_men_12m // exchanged sex with men for money or drugs past 12 months
rename msexwmen sw_women_12m // exchanged sex with men for money or drugs past 12 months

* variable generation
gen any_sex = .
	recode any_sex .=1 if sexmen >0 & sexmen !=.
	recode any_sex .=1 if sexwmen >0 & sexwmen !=.
	recode any_sex .=0 if sexwmen == 0 & sexmen == 0
	
gen prison_12m = .
	recode prison_12m .=0 if prison_num_12m == 0
	recode prison_12m .=1 if prison_num_12m > 0 & prison_num_12m !=.

la var prison_12m "Imprisoned past 12 months (binary)"
label define prison_12m 0 "No" 1 "Yes"
label values prison_12m prison_12m

gen inj_freq_day = inj_freq_4w/28 // average times injected daily past month
la var inj_freq_day "Average times injected daily (past 4 weeks)"

gen sw_all_12m = .
	recode sw_all_12m .= 1 if (sw_men_12m == 1 | sw_women_12 == 1)
	recode sw_all_12m .= 0 if (any_sex == 1 & sw_men_12m !=1)
	recode sw_all_12m .= 0 if (any_sex == 1 & sw_women_12 !=1)

la var sw_all_12m "Sex work (past 12 months)"
label define sw_all_12m 0 "No" 1 "Yes"
label values sw_all_12m sw_all_12m

gen msm_12m = .
	recode msm_12m .=0 if (sexmen == 0 & gender == 1)
	recode msm_12m .=1 if (sexmen > 0 & sexmen !=. & gender == 1)

la var msm_12m "Men who had sex with men (past 12 months)"
label define msm_12m 0 "No" 1 "Yes"
label values msm_12m msm_12m

gen inc_hcv = 0
	recode inc_hcv 0= 1 if all_hcv_rna == 1
	recode inc_hcv 0=. if all_hcv_ab == 1
	
la var inc_hcv "Incident HCV infection (all participants)"
label define inc_hcv 0 "No" 1 "Yes"
label values inc_hcv inc_hcv

gen dataset = 1 

* QA checks
tab sexmen gender, m // missing for 4 participants (two men two women)
tab msm_12m gender, m

keep id date age age_cat3 gender homeless_12m homeless_ever prison_12m prison_ever prison_num_12m oat_current oat_ever inj_dur inj_freq_4w inj_freq_day sw_men_12m sw_women_12m sw_all_12m msm_12m inc_hcv dataset
save "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\Birmingham_subset.dta", replace

* load Leeds data
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\LEEDS_withstudyvbls.dta", clear

* renam vars 
rename subject id // participant ID

rename rhomeles homeless_12m // homeless past 12 months
rename ehomeles homeless_ever // homeless ever

rename eprison prison_ever // prison ever
rename tlyrpris prison_num_12m // times in prison past 12 months

rename cscript oat_current // OAT current
rename escript oat_ever // OAT ever

rename injdur inj_dur // injecting duration (years)
rename ndaysinj inj_freq_4w // number of times injected past 4 weeks

rename msexmen sw_men_12m // exchanged sex with men for money or drugs past 12 months
rename msexwmen sw_women_12m // exchanged sex with men for money or drugs past 12 months

* variable generation
gen any_sex = .
	recode any_sex .=1 if sexmen >0 & sexmen !=.
	recode any_sex .=1 if sexwmen >0 & sexwmen !=.
	recode any_sex .=0 if sexwmen == 0 & sexmen == 0
	
gen age_cat3 =.
	recode age_cat3 .=1 if age <25 & age !=.
	recode age_cat3 .=1 if age >24 & age <35
	recode age_cat3 .=1 if age >34 & age !=.

la var age_cat3 "Age (3 categories)"
label define age_cat3 0 "<25" 1 "25-34" 2 "35+"
label values age_cat3 age_cat3

gen prison_12m = .
	recode prison_12m .=0 if prison_num_12m == 0
	recode prison_12m .=1 if prison_num_12m > 0 & prison_num_12m !=.

la var prison_12m "Imprisoned past 12 months (binary)"
label define prison_12m 0 "No" 1 "Yes"
label values prison_12m prison_12m

gen inj_freq_day = inj_freq_4w/28 // average times injected daily past month
la var inj_freq_day "Average times injected daily (past 4 weeks)"

gen sw_all_12m = .
	recode sw_all_12m .= 1 if (sw_men_12m == 1 | sw_women_12 == 1)
	recode sw_all_12m .= 0 if (any_sex == 1 & sw_men_12m !=1)
	recode sw_all_12m .= 0 if (any_sex == 1 & sw_women_12 !=1)

la var sw_all_12m "Sex work (past 12 months)"
label define sw_all_12m 0 "No" 1 "Yes"
label values sw_all_12m sw_all_12m

gen msm_12m = .
	recode msm_12m .=0 if (sexmen == 0 & gender == 1)
	recode msm_12m .=1 if (sexmen > 0 & sexmen !=. & gender == 1)

la var msm_12m "Men who had sex with men (past 12 months)"
label define msm_12m 0 "No" 1 "Yes"
label values msm_12m msm_12m

gen inc_hcv = 0
	recode inc_hcv 0= 1 if all_hcv_rna == 1
	recode inc_hcv 0=. if all_hcv_ab == 1
	
la var inc_hcv "Incident HCV infection (all participants)"
label define inc_hcv 0 "No" 1 "Yes"
label values inc_hcv inc_hcv

gen dataset = 2

* QA checks	
tab sw_men_12m gender, m // 299 missing for men , 16 missing for women
tab sw_women_12m gender, m

tab sexmen gender, m // missing for 7 participants (all women)
tab msm_12m gender, m // not missing for any men

keep id date age age_cat3 gender homeless_12m homeless_ever prison_12m prison_ever prison_num_12m oat_current oat_ever inj_dur inj_freq_4w inj_freq_day sw_men_12m sw_women_12m sw_all_12m msm_12m inc_hcv dataset
save "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\Leeds_subset.dta", replace

* append datasets
use "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\Bristol_subset.dta", clear
append using "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\Birmingham_subset.dta"
append using "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\Leeds_subset.dta"

la var dataset "Contributing data"
label define dataset 0 "Bristol" 1 "Birmingham" 2 "Leeds"
label values dataset dataset

* save analysis dataset
save "C:\Users\vl22683\OneDrive - University of Bristol\Documents\Publications\Sex work and risk of HIV and HCV\Emails to authors\UK data\UK_Analysis.dta", replace

