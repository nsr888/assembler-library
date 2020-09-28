;---------------------------------------------------------------------------
; size_t ft_strlen(char *);
;---------------------------------------------------------------------------

section .text
		global _ft_strlen

_ft_strlen:
		xor	rcx, rcx				; counter to zero
lp:		mov al, [rdi + rcx]			; get next byte
		cmp	al, 0					; compare to zero
		je	lpquit					; if al == 0 goto lpquit
		inc	rcx						; increment rcx by 1
		jmp	lp						; loop
lpquit:	
		mov rax, rcx				; write counter to rax
		ret							; return
