PRO wait_threads,threads,delay=delay,id=id

	if not keyword_set(delay) then delay=1
	if not keyword_set(id) then id=indgen(n_elements(threads))
	nthreads=n_elements(id)
	stat_arr=intarr(nthreads)*0
	done_arr=stat_arr
	still_running= 0L eq 0L
	
	while still_running do begin
		for i=0,nthreads-1 do begin
			if done_arr[i] eq 1 then continue
			stat_arr[i]=threads[id[i]]->Status()
		endfor
		w=where(stat_arr eq 0 or stat_arr eq 2,nw)
		if nw eq nthreads then still_running = 1L eq 0L else begin
			if nw ne 0 then done_arr[w]=1
		endelse
		if still_running then wait,delay
	endwhile
	update_status,threads,id=id
END
