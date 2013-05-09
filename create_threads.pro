PRO create_threads,nthreads,threads,idl_startup=idl_startup

	stat_str=['idle','running','completed','error','aborted']
	threads=objarr(nthreads)
	stat=intarr(nthreads)
	for i=0L,nthreads-1 do begin
		threads[i]=obj_new('IDL_IDLBridge',callback='thread_callback', output='')
		stat[i]=threads[i]->status()
	endfor

	;;CREATE STATE STRUCTURE AND EXECUTE IDL_STARTUP IF SET
	for i=0L,nthreads-1 do begin
		if keyword_set(idl_startup) then threads[i]->execute,'@' + pref_get('IDL_STARTUP'),/nowait
		state={id:i,status:stat[i],status_str:stat_str[stat[i]]}
		threads[i]->setproperty,userdata=state
	endfor 
	wait_threads,threads
END
