	org	100h

section	.text

start:
	mov	al, 60h
	mov	dx, 0cd6h
	out	dx, al
	inc	dl
	in	al, dx
	mov	bl, al

	mov	al, 61h
	dec	dl
	out	dx, al
	inc	dl
	in	al, dx
	mov	bh, al

	mov	dx, bx
	in	eax, dx
	or	eax, 04000400h	; activate rtc enable & clear rtc status
	out	dx, eax

	mov	ah, 4ch
	int	21h
