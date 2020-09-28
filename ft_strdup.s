;---------------------------------------------------------------------------
; char	*ft_strdup(const char *s1);
;---------------------------------------------------------------------------
extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy

section	.text
		global _ft_strdup
	
_ft_strdup:
		push rdi			; save first function argument to stack
		call _ft_strlen		; calc length of string
		inc rax				; add 1 for ending zero at the end of string
		mov rdi, rax		; move (length + 1) to first argument
		call _malloc		; call c malloc function
		mov rdi, rax		; save malloc address to rdi
		pop rsi				; restore first ft_strdup arg to rsi
		call _ft_strcpy		; copy string from rsi to rdi, and write rsi to rax
		ret
