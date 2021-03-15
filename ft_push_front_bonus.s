global		ft_list_push_front
section		.text
extern		malloc
						;rdi = t_list **begin / rsi = void *data
ft_list_push_front:
				push	rdi
				mov		rdi, 16
				call	malloc
				test	rax, rax
				jz		error
				pop		rdi
				mov		[rax], rsi
				mov		qword [rax + 8], rdi
error:
				ret
