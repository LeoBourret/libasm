global		ft_create_elem
section .text

extern		malloc

ft_create_elem:
				mov		rbx, rdi
				mov		rdi, 16
				call	malloc
				test	rax, rax
				jz		end
				mov		qword [rax], rbx
				mov		qword [rax + 8], 0
end:
				ret
