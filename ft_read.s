;---------------------------------------------------------------------------
; ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
;---------------------------------------------------------------------------
extern  ___error

section .text
		global _ft_read

_ft_read:
		mov rax, 0x2000003		; sys_write call identifier
		syscall					; make the system call
		jc set_errno			; in MacOS values are in RAX, CF indicate error
		ret
set_errno:
		mov rbx, rax			; save rax to rbx
		call ___error			; get address of error
		mov [rax], rbx			; write errno to address
		mov rax, -1				; set rax to -1
		ret
