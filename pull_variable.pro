PRO pull_variable,thread,varname,output,id=id
	
	if not keyword_set(id) then id=indgen(n_elements(thread))
	output=ptrarr(n_elements(id),n_elements(varname),/allocate_heap)

	for i=0,n_elements(id)-1 do begin
		for j=0,n_elements(varname)-1 do begin
			*output[i,j]=thread[id[i]]->getvar(varname[j])
		endfor
	endfor
END
