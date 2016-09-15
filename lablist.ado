* Listing variable and value labels though loop

capture program drop lablist
program define lablist
	version 14.1
	syntax varlist [, skip Number COLnum(integer 10)]
	if "`skip'"=="skip" {
		display
	}
	local varnumber = 0
	foreach varname in `varlist' {
		local ++varnumber
		local varlabel : variable label `varname'
		if "`number'" =="" {
			display in yellow "`varname'" _col(`colnum') "`varlabel'"
		}
		else {
			local colnumplus2 = `colnum' + 2
			display in green "#`varnumber':"  ///
				in yellow "`varname'" _col(`colnumplus2') "`varlabel'"
		}
	}
end
