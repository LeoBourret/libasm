			extern __errno_location
			global ft_write
section .text

ft_write:
			mov		rax, 1
			syscall
			cmp		rax, 0
			jl		error
			ret
error:
			mov		rdi, rax
			neg		rdi
			call	__errno_location
			mov		[rax], rdi
			mov		rax, -1
			ret
