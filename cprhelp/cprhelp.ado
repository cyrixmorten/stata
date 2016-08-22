program drop cprhelp
program define cprhelp			

	tostring cpr, replace

	gen cpr_obs = 1 if length(cpr) != 10	
		replace cpr = "0" + cpr if length(cpr) == 9
		label var cpr_obs "tjek alle med 1 for korrekt korrektion"
	
	generate bday 	= real(substr(cpr,1,2))
	gen bmon 		= real(substr(cpr,3,2))
	gen byear 		= real(substr(cpr,5,2))
	gen pos7 		= real(substr(cpr,7,1)) // to find century
	generate cen 	= 19
		replace cen 	= 20 if pos7 >= 4 & byear <= 36
		replace cen		= 18 if pos7 >= 5 & pos7 <= 8 & byear >= 58
		replace byear 	= 100*cen + byear
	generate bdate 	= mdy(bmon,bday,byear)
		format bdate %d
		label var bdate "fødselsdato"
	drop bday bmon byear pos7 cen
	 
	*køn (0 kvinde 1 mand)
	gen control 	= real(substr(cpr,7,4))
		generate sex 	= mod(control,2)
	label define sex1 1 "1male" 0 "0female"
		label values sex sex1
		label var sex "køn"
	drop control
	
	order cpr cpr_obs
	 

end
