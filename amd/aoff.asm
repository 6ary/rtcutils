	org	100h

section	.text

start:
	mov	al, 62h
	mov	dx, 0cd6h
	out	dx, al
	inc	dl
	in	al, dx
	mov	bl, al

	mov	al, 63h
	dec	dl
	out	dx, al
	inc	dl
	in	al, dx
	mov	bh, al

	mov	dx, bx
	in	ax, dx
	and	ah, ~1ch
	or	ah, 14h | 20h
	out	dx, ax
