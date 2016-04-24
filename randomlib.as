; randomlib.as
; program: Hisao Ookubo,

#module 

; 乱数の取得
#defcfunc rnd256 int a
	r = rnd256_seed_@(rnd256_count_@)
	
	rnd256_count_@ = rnd256_count_@ + 1
	if (rnd256_count_@ >= 256) {
		rnd256_count_@ = 0
		rnd256shufful
	}
	
	r = r \ a
	
	return r

; 変数のシャッフル
#deffunc rnd256shufful
	repeat 256
		r = rnd(256)
		temp = rnd256_seed_@(cnt)
		rnd256_seed_@(cnt) = rnd256_seed_@(r)
		rnd256_seed_@(r) = temp
	loop
	
	return 

#global

	; ライブラリの初期化
	
;	randomize ; システム乱数の初期化
	
	dim rnd256_seed_, 256 ; 変数の初期化
	repeat 256
		rnd256_seed_(cnt) = cnt
	loop
	rnd256_count_ = 0
	
	rnd256shufful ; 変数発生
