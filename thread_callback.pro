PRO thread_callback,status,error,objref,userdata
	;print,'Thread'+strtrim(string(userdata.id))+' done'
	;print,'Thread Status:'+string(status)
	status_str =['idle','running','completed','error','aborted']
	userdata.status=status
	userdata.status_str=status_str[status]
END
