;---------------------------------------------------------------------------
; ssize_t	 ft_write(int fildes, const void *buf, size_t nbyte);
;---------------------------------------------------------------------------
extern  ___error

section .text
		global _ft_write

_ft_write:
		mov rax, 0x2000004		; sys_write call identifier
		syscall					; make the system call
		jc set_errno			; error sets carry flag, rax = errno
		ret
set_errno:
		mov rbx, rax			; save rax to rbx
		call ___error			; get address of error
		mov [rax], rbx			; write errno to address
		mov rax, -1				; set rax to -1
		ret
