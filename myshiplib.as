; myshiplib.as
; program: Hisao ookubo,

#module

#deffunc myship_init
	buffer 3
	picload "res/ship.bmp"

	myxpos_ = 100
	myypos_ = 100
	myspped_ = 1
	
	repeat 256
		myoptionxpos_@(cnt) = myxpos_
		myoptionypos_@(cnt) = myypos_
	loop
	
	repeat 4
		mymissilexpos_@(cnt) = 0
		mymissileypos_@(cnt) = -100
	loop
	
	return

#deffunc myship_move
	myvec_ = 0

	stick keybuf, 15           ;ÉLÅ[ì¸óÕèÓïÒ
	
	// my ship move.
    if (keybuf & 1) {
	    myxpos_ = myxpos_ - myspped_    ;[Å©]
		myvec_ = 1
	}

    if (keybuf & 4) {
	    myxpos_ = myxpos_ + myspped_    ;[Å®]
	    myvec_ = 2
	}
    
    if keybuf & 2 : myypos_ = myypos_ - myspped_    ;[Å™]
    if keybuf & 8 : myypos_ = myypos_ + myspped_    ;[Å´]
 
    if myxpos_ < 9 : myxpos_ = 9 : myvec_ = 0
    if myxpos_ > 247 : myxpos_ = 247 : myvec_ = 0
    if myypos_ < 9 : myypos_ = 9
    if myypos_ > 234 : myypos_ = 234

	; options.
	pos 0,0
	mes "FPS:" + fpsmon_@
	
	repeat 255
		myoptionxpos_@(255 - cnt) = myoptionxpos_@(254 - cnt)
		myoptionypos_@(255 - cnt) = myoptionypos_@(254 - cnt)
	loop
	
	myoptionxpos_@(0) = myxpos_
	myoptionypos_@(0) = myypos_
	
	return

#deffunc myship_put
	; options.
	repeat 6
		color 0,0,255
		tempi = (5 - cnt) * 16 + 16
		tempx = myoptionxpos_@(tempi) - 9
		tempy = myoptionypos_@(tempi) - 9
		
		pos tempx, tempy
		gcopy 3, 0, 0, 16, 16
	
		;boxf tempx, tempy, tempx + 16, tempy + 16
	loop

	; my ship.
;	color 255,255,255
;	boxf myxpos_, myypos_, 	myxpos_ + 16, myypos_ + 16
	
	pos myxpos_ - 9, myypos_ - 9
	gcopy 3, myvec_ * 16, 0, 16, 16
	return
	
#deffunc myship_exit onexit
	return

#global
	myxpos_ = 0
	myypos_ = 0
	myspped_ = 0

	myvec_ = 0
	
	dim myoptionxpos_, 256
	dim myoptionypos_, 256
	myoptioncount_ = 0

	dim mymissilexpos_, 4
	dim mymissileypos_, 4
