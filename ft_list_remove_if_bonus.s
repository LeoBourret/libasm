global		ft_list_remove_if
section		.text
extern		free

	;rdi == **begin_list rsi == data_ref rdx == int(*cmp) rcx == void(free_fct)

ft_list_remove_if:
					push	rbx		;rbx == current
					cmp		rdi, 0
					je		return
					cmp		qword[rdi], 0
					je		return
					cmp		rsi, 0
					je		return
					cmp		rdx, 0
					je		return
					cmp		rcx, 0
					je		return
					mov		rbx, [rdi]

check_next:
					cmp		qword[rbx + 8], 0
					je		check_first
					mov		r8, [rbx + 8]	;r8 = current->next

check_data:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	r8
					push	r9
					push	rbx
					mov		rdi, [r8]
					call	rdx
					pop		rbx
					pop		r9
					pop		r8
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					cmp		al, 0
					jz		free_data
					mov		rbx, r8
					jmp		check_next

free_data:
					cmp		qword[r8 + 8], 0
					je		free_last
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					mov		r9, [r8 + 8]
					mov		[rbx + 8], r9
					mov		rdi, [r8]
					push	r8
					push	r9
					push	rbx
					call	rcx
					pop		rbx
					pop		r9
					pop		r8
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	r8
					push	r9
					push	rbx
					mov		rdi, r8
					call	free
					pop		rbx
					pop		r9
					pop		r8
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					jmp		check_next

free_last:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	r8
					push	r9
					push	rbx
					mov		rdi, [r8]
					call	rcx
					pop		rbx
					pop		r9
					pop		r8
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	r8
					push	r9
					push	rbx
					mov		rdi, r8
					call	free
					pop		rbx
					pop		r9
					pop		r8
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					mov		qword[rbx + 8], 0

check_first:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	r8
					push	rbx
					mov		rbx, [rdi]
					mov		rdi, [rbx]
					call	rdx
					pop		rbx
					pop		r8
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					cmp		al, 0
					je		first_not_ok
					pop		rbx
					ret

return:
					pop		rbx
					ret

first_not_ok:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rbx, [rdi]
					mov		r8, [rbx + 8]
					mov		rdi, [rbx]
					push	r8
					call	rcx
					pop		r8
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					push	r8
					mov		rbx, [rdi]
					mov		rdi, rbx
					call	free
					pop		r8
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					mov		[rdi], r8
					pop		rbx
					ret
