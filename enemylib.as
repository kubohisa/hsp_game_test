; bglib.as
; program: Hisao ookubo,

#module
	enemyx_ = 0
	enemyy_ = 0
	
	enemycount_ = 0

#deffunc enemy_init
	buffer 6
	picload "res/enemy.bmp"

	enemyx_ = rnd256(240)
	enemyy_ = rnd256(230)
	
	enemycount_ = 0
	
	return
	
#deffunc enemy_move
	if (enemycount_ == 100) {
		enemyx_ = rnd256(240)
		enemyy_ = rnd256(230)
		
		enemycount_ = 0	
	}
	enemycount_ ++

	return

#deffunc enemy_put
	pos enemyx_ - 9, enemyy_ - 9
	gcopy 6, 0, 0, 16, 16

	return

#defcfunc enemy_check_missile int misx, int misy
	if (stdio_attack (misx, misy, 4, 4, enemyx_, enemyy_, 6, 6)) {
		return 1
	}
	return 0

#deffunc enemy_exit onexit
	return

#global
