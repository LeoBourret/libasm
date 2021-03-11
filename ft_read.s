		extern __errno_location
		global		ft_read
section .text

ft_read:
			mov rax, 0
			syscall
			jc error
			ret
error:
			mov rdi, rax
			call __errno_location
			neg rdi
			mov [rax], rdi
			mov rax, -1
			ret
