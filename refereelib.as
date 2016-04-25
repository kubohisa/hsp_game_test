; referee.as
; program: Hisao Ookubo,

#module

#deffunc referee_game
	; my missile check.
	repeat 4
		if enemy_check_missile(mymissilexpos_out_@(cnt), mymissileypos_out_@(cnt)) {
			missiledel(cnt)
		}
	loop
	return
	
#global


