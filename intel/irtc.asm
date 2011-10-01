	org	100h

section	.text

start:
	mov	eax, 80000000h | 0 << 16 | 31 << 11 | 0 << 8 | 40h
	mov	dx, 0cf8h
	out	dx, eax

	mov	dl, 0fch
	in	ax, dx
	and	ax, ~1

	mov	dx, ax
	in	eax, dx
	or	eax, 04000400h	; activate rtc enable & clear rtc status
	out	dx, eax

	mov	ah, 4ch
	int	21h
