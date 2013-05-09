PRO update_status,threads,id=id
	if not keyword_set(id) then id=indgen(n_elements(threads))
	status_str =['idle','running','completed','error','aborted']
	for i=0,n_elements(id)-1 do begin
		threads[id[i]]->GetProperty,USERDATA=ud
		stat=threads[id[i]]->Status()
		ud.status=stat & ud.status_str=status_str[stat]
	endfor
END
