; bglib.as
; program: Hisao ookubo,

#module

#deffunc bg_init
	buffer 5
	picload "res/back_a.bmp"

	return
	
#deffunc bg_put
	for ytemp, 0, 24
		for xtemp, 0, 32
			pos xtemp * 16, ytemp * 16
			gcopy 5, 0, 0, 16, 16
		next
	next

	return
	
#deffunc bg_exit onexit
	return

#global
