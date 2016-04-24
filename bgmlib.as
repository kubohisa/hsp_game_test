; bgmlib.as
; program: Hisao ookubo,

#module

#deffunc bgm_play
	dmmload "res/bgm.ogg",1
	dmmloop 1, 44000
	dmmplay 1
	return

#deffunc bgm_stop
	dmmstop
	return
	
#deffunc bgm_exit onexit
	bgm_stop
	return

#global

