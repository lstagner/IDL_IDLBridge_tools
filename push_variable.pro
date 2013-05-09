PRO push_variable,threads,varname,id=id,level=level
	
	if not keyword_set(level) then var_level=scope_level()-1 else var_level=level

	if not keyword_set(id) then id=indgen(n_elements(threads))

	for i=0,n_elements(id)-1 do begin
		while 1 do begin
			stat=threads[id[i]]-> Status()
			if stat eq 0 then break
		endwhile
		for j=0,n_elements(varname)-1 do begin
			threads[id[i]] -> setvar,varname[j],scope_varfetch(varname[j],level=var_level)
		endfor
	endfor
END
