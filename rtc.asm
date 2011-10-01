%macro	cmos_read8	0
	lodsb
	out	70h, al
	in	al, 71h
%endmacro

%macro	cmos_write8	0
	lodsb
	out	70h, al
	lodsb
	out	71h, al
%endmacro


	org	100h

section	.text

start:
	xor	ah, ah

	mov	cx, 3
	mov	si, cmos_table
.l1:
	cmos_read8

;-
	or	ah, ah
	jz	.l2
	stc

.l2:
	adc	al, [si]
	daa

	inc	si
	jc	.l3

	cmp	al, [si]
	jb	.l4

.l3:
	; 59 + 59 + ? = 1 18
	; 30 + 31 + ? = 60
	sbb	al, [si]
	das

	mov	ah, 1
	jmp	.l5
.l4:
	; 40 + 5 + ? = 45
	; 5 + 32 + ? = 37
	xor	ah, ah

.l5:
	dec	si
	mov	[si], al
;-

	dec	si
	inc	byte [si]
	cmos_write8
	inc	si
	loop	.l1


	mov	al, 0bh
	out	70h, al
	in	al, 71h
	or	al, 20h
	out	71h, al


	mov	ah, 4ch
	int	21h


section	.data

cmos_table	db	0, 30h, 60h,	; second
		db	2, 0h, 60h,	; minute
		db	4, 0h, 24h,	; hour
