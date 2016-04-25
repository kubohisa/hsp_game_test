; stdiolib.as
; program: Hisao Ookubo,

#module

#defcfunc stdio_attack int myx, int myy, int myw, int myh, int enemyx, int enemyy, int enemyw, int enemyh
; éQçlURL: http://blog.goo.ne.jp/masaki_goo_2006/e/f7ff2860e2d796bbce2e9fb51e8a2ddc

	if(abs(myx - enemyx) < myw + enemyw) and (abs(myy - enemyy) < myh + enemyh){
		return 1
	}
	return 0
	
#global
