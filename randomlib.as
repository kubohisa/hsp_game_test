; randomlib.as
; program: Hisao Ookubo,

#module 

; �����̎擾
#defcfunc rnd256 int a
	r = rnd256_seed_@(rnd256_count_@)
	
	rnd256_count_@ = rnd256_count_@ + 1
	if (rnd256_count_@ >= 256) {
		rnd256_count_@ = 0
		rnd256shufful
	}
	
	r = r \ a
	
	return r

; �ϐ��̃V���b�t��
#deffunc rnd256shufful
	repeat 256
		r = rnd(256)
		temp = rnd256_seed_@(cnt)
		rnd256_seed_@(cnt) = rnd256_seed_@(r)
		rnd256_seed_@(r) = temp
	loop
	
	return 

#global

	; ���C�u�����̏�����
	
;	randomize ; �V�X�e�������̏�����
	
	dim rnd256_seed_, 256 ; �ϐ��̏�����
	repeat 256
		rnd256_seed_(cnt) = cnt
	loop
	rnd256_count_ = 0
	
	rnd256shufful ; �ϐ�����
