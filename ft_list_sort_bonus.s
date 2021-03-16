global		ft_list_sort
section		.text

				;rdi = **begin_list rsi = int(*cmp)
ft_list_sort:
				mov		rdx, [rdi]		;rdx = current
				push	r12				;r12 = tmp for swap
				xor		r12, r12
				push	rax
				xor		rax, rax
				cmp		qword[rdx + 8], 0
				je		return
				jmp		compare
restart:
				mov		rdx, rdi
				jmp		compare

list_inc:
				mov		rdx, [rdx + 8]

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
				pop		r12
				pop		rax
				ret
