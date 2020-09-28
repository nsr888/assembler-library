;---------------------------------------------------------------------------
; char *ft_strcpy(char *dst, const char *src);
;---------------------------------------------------------------------------

section .text
		global _ft_strcpy

_ft_strcpy:
		xor	rcx, rcx		; counter to zero
lp:		mov al, [rsi + rcx]	; get next byte
		cmp	al, 0			; compare to zero
		je	lpquit			; if al == 0 goto lpquit
		inc	rcx				; increment rcx by 1
		jmp	lp				; loop
lpquit:	
		inc rcx				; add 1 for ending zero
		cld					; clear direction for movsb
		push rdi			; save rdi (dst) address to stack
		rep movsb			; copy from rsi to rdi
		pop rax				; pop rdi (dst) address from stack to rax
		ret					; return
