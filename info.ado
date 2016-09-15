program define info
	display _newline "Run " c(current_date) " at " c(current_time) ///
	" on Stata version "	c(stata_version) _newline "using datafile: " 	///
	c(filename) _newline "including " c(N) "(N) observations and " c(k) " variables"
end
	