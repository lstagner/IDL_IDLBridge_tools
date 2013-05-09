PRO run_parallel,threads,cmd,in_vars,out_vars,output

	nthreads=n_elements(threads)
	if not keyword_set(id) then id=indgen(nthreads)	
	push_variable,threads,in_vars,level=scope_level()-1,id=id
	execute_threads,threads,cmd,id=id
	wait_threads,threads,id=id
	pull_variable,threads,out_vars,output,id=id

END
