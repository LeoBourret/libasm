global		ft_create_elem
section .text

extern		malloc

ft_create_elem:
				push	rdi
				mov		rdi, 16
				call	malloc
				test	rax, rax
				jz		end
				pop		rdi
				mov		qword [rax], rdi
				mov		qword [rax + 8], 0
end:
				ret
