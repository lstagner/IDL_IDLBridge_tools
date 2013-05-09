PRO test_threads

	x=2*!DPI*.1*dindgen(5)
	create_threads,2,threads
	in_vars=['x'] & out_vars=['y','z']
	push_variable,threads,'x',id=0
	execute_threads,threads,'y=sin(x)',id=0
	execute_threads,threads,'print,!path',id=1
	wait_threads,threads
	pull_variable,threads,'y',output1,id=0
;	pull_variable,threads,'z',output2,id=1
	print,*output1[0]
	ptr_free,output1
;	ptr_free,output2
	destroy_threads,threads
END
