	org	100h

section	.text

start:
	mov	eax, 80000000h | 0 << 16 | 31 << 11 | 0 << 8 | 40h
	mov	dx, 0cf8h
	out	dx, eax

	mov	dl, 0fch
	in	ax, dx

	and	ax, ~1
	add	ax, 4

	mov	dx, ax
	in	ax, dx
	and	ah, ~1ch
	or	ah, 1ch | 20h
	out	dx, ax
