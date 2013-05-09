PRO execute_threads,threads,cmd,id=id
	nthreads=n_elements(threads)
	if not keyword_set(id) then id=indgen(nthreads)

	for i=0,n_elements(id)-1 do begin
		threads[id[i]]->execute,cmd,/nowait
	endfor

END
	
