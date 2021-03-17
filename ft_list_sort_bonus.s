global		ft_list_sort
section		.text

				;rdi = **begin_list rsi = int(*cmp)
ft_list_sort:
				push	rdx
				push	r12
				mov		r12, [rdi]			;r12 = save begin
				cmp		rdi, 0				;begin == NULL ?
				je		pop_register
				cmp		rsi, 0				;int(cmp)() == NULL ?
				je		pop_register
				jmp		compare
restart:
				mov		rdx, rdi
				jmp		compare

list_inc:
				mov		rdx, [rdx + 8]

set_compare:
				cmp		[rdi], 0			;*begin == NULL ?
				jz		return

compare:
				cmp		byte[rdx + 8], 0
				je		return
				push	rdi
				push	rsi
				mov		rax, rsi
				mov		rdi, [rdx]
				mov		r11, [rdx + 8]
				mov		rsi, [r11]
				call	rax
				mov		rdx, rsi
				cmp		rax, 0
				jg		swap
				pop		rdi
				pop		rsi
				jmp		list_inc

swap:
				mov		r12, [rdx]
				mov		rdx, [rsi]
				mov		rsi, [r12]
				jmp		restart

return:
				mov		[rdi], r12

pop_register:
				pop		r12
				pop		rax
				ret
