; fpslib.as
; program: Hisao ookubo,
; orig. https://blog.mono0x.net/blog/2011/02/28/

#module
 
	; fps seting.
	#uselib "kernel32"
	#func Sleep "Sleep" int

	#uselib "winmm"
	#func  timeBeginPeriod "timeBeginPeriod" int
	#func  timeEndPeriod   "timeEndPeriod"   int
	#cfunc timeGetTime     "timeGetTime"
	timeBeginPeriod 1
	tick = timeGetTime() ; dummy.

#deffunc fps_proc
	d = 17 - (cnt \ 3 == 0) - (timeGetTime() - tick)
	if d > 0 {
	        Sleep d
	}
	
	#ifdef _DEBUG
	    if (cnt + 1) \ 60 == 0 {
	        current = timeGetTime()
	        title strf("FPS:%.1f", 60000.0 / (current - prev))	        
	        prev = current
	    }
	#endif
	
	tick = timeGetTime()
    return

#deffunc fps_end onexit
    timeEndPeriod 1
    return
    
#global
