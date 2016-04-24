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
	
	return

#deffunc myship_move
	tempx = myxpos_
	tempy = myypos_
	myvec_ = 0

	stick keybuf, 15           ;ÉLÅ[ì¸óÕèÓïÒ
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
	if (tempx != myxpos_ || tempy != myypos_) {
		repeat 255
			myoptionxpos_@(cnt + 1) = myoptionxpos_@(cnt)
			myoptionypos_@(cnt + 1) = myoptionypos_@(cnt)
		loop
		myoptionxpos_@(0) = myxpos_
		myoptionypos_@(0) = myypos_
	
	}

	return

#deffunc myship_put
	; options.
/*	repeat 3
		color 0,0,255
		tempx = myoptionxpos_@(cnt * 32 + 32)
		tempy = myoptionypos_@(cnt * 32 + 32)
		
		boxf tempx, tempy, tempx + 16, tempy + 16
	loop
*/
	
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
