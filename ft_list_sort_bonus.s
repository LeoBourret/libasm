global		ft_list_sort
section		.text
extern		ft_list_size
				;rdi = **begin_list rsi = int(*cmp)
ft_list_sort:
				push	rbx					;rbx = current
				push	r12
				cmp		rdi, 0				;begin == NULL ?
				je		return
				cmp		qword[rdi], 0
				je		return
				cmp		rsi, 0				;int(cmp)() == NULL ?
				je		return
				push	rdi
				mov		r8, [rdi]
				mov		rdi, r8
				push	rsi
				call	ft_list_size
				pop		rsi
				pop		rdi
				mov		rcx, 1
				mov		rdx, rax

set_compare:
				mov		rbx, [rdi]
				mov		r12, [rbx + 8]		;r12 == next: current->next
				jmp		compare

decrement_size:
				sub		rdx, 1
				cmp		rdx, 1
				je		return
				mov		rcx, 1
				jmp		set_compare
inc_ptr:
				cmp		rcx, rdx
				je		decrement_size
				mov		r8, [r12 + 8]
				mov		rbx, r12
				mov		r12, r8

compare:
				push	rdi
				push	rsi
				push	rbx
				push	rcx
				push	r12
				push	rdx
				mov		rdi, [rbx]
				mov		r9, rsi			;rax = int(cmp)()
				mov		rsi, [r12]
				call	r9
				pop		rdx
				pop		r12
				pop		rcx
				pop		rbx
				pop		rsi
				pop		rdi
				inc		rcx
				cmp		al, 0
				jg		swap
				jmp		inc_ptr

swap:
				mov		r8, [rbx]
				mov		rax, [r12]
				mov		[rbx], rax
				mov		[r12], r8
				jmp		inc_ptr

return:
				pop		rbx
				pop		r12
				ret
