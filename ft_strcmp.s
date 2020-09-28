;---------------------------------------------------------------------------
; int	ft_strcmp(const char *s1, const char *s2);
;---------------------------------------------------------------------------
extern	_ft_strlen

section .text
		global _ft_strcmp

_ft_strcmp:
		call _ft_strlen		; calc length of rdi (first arg)
		mov rcx, rax		; save length to rcx
		inc rcx				; increment counter for last zero check
		repe cmpsb			; compare rdi and rsi with increment
		jne not_eq			; if not equal jump to not_eq
		xor rax, rax		; if equal set return value in rax to zero
		ret
not_eq:	xor rax, rax		; clear rax
		mov al, [rdi - 1]	; copy byte in [rdi - 1] address to AL
		mov ah, 0			; fill last 8 bytes in AX with 0
		mov bl, [rsi - 1]	; copy byte in [rdi - 1] address to BL
		mov bh, 0			; fill last 8 bytes in BX with 0
		sub ax, bx			; substract BX address byte from AX
		movsx rax, ax		; convert 16b with sign to 64b with sign
		ret					; return
