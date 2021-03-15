global		ft_list_push_front
section		.text
extern		malloc
						;rdi = t_list **begin / rsi = void *data
ft_list_push_front:
				push	rdi
				push	rsi
				mov		rdi, 16
				call	malloc
				test	rax, rax
				jz		error
				pop		rsi
				pop		rdi
				mov		[rax], rsi
				mov		rdx, [rdi]
				mov		[rax + 8], rdx
				mov		[rdi], rax
error:
				ret
