; fpslib.as
; program: Hisao ookubo,
; orig. https://blog.mono0x.net/blog/2011/02/28/

; fps seting.
#module
	#uselib "kernel32"
	#func Sleep "Sleep" int

	#uselib "winmm"
	#func  timeBeginPeriod "timeBeginPeriod" int
	#func  timeEndPeriod   "timeEndPeriod"   int
	#cfunc timeGetTime     "timeGetTime"

#deffunc fps_init
	timeBeginPeriod 1
	
	fpstick_@ = timeGetTime() ; dummy.
	fpsprev_@ = fpstick_@
	fpscnt_@ = 1
	
	return

#deffunc fps_proc
	d = 17 - (fpscnt_@ \ 3 == 0) - (timeGetTime() - fpstick_@)
	if (d > 0) {
	        Sleep d
	}

	#ifdef _DEBUG
	    if (fpscnt_@ + 1) \ 60 == 0 {
	        current = timeGetTime()
	        
	        title strf("FPS:%.1f", 60000.0 / (current - fpsprev_@))
	        fpsmon_@ = 60000.0 / (current - fpsprev_@)
	        
	        fpsprev_@ = current
	    }
	#endif
	
	fpstick_@ = timeGetTime()
	
	fpscnt_@ = fpscnt_@ + 1
	if fpscnt_@ == 60 : fpscnt_@ = 0

    return

#deffunc fps_end onexit
    timeEndPeriod 1
    return
    
#global
	fpstick_ = 0
	fpscnt_ = 0
	
	fpsprev_ = 0
	
	fpsmon_ = 0
