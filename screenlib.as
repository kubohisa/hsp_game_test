; screenlib.as
; program: Hisao ookubo,

#module

#deffunc screen_init
	width ,,0,0				; 全画面表示
	chgdisp 1, ginfo(20), ginfo(21)
	
	bgscr 0, ginfo(20), ginfo(21), , 0, 0	; 枠の無いウィンドウ
	gsel 0
	
	color 0, 0, 0
	boxf 0, 0, ginfo(20), ginfo(21)

	buffer 1, 256, 240 ; nes size.
	
	mouse -1	;カーソルの非表示
	
	return

#deffunc screen_clear
	;gradf 0,0,256,240,1,0,128	; 画面クリア
	
	color 0,0,0
	boxf 0,0,255,239
	
	return
	
#deffunc screen_put
	gsel 0
	pos 0,0
	gzoom ginfo(20), ginfo(21), 1, 0, 0, 256, 240
	
	return
	
#deffunc screen_exit onexit
	chgdisp
	mouse
	return

#global
