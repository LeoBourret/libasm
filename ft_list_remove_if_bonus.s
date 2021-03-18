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
					mov		rbx, [rdi]	;rbx == *begin_list
					jmp		check_next

check_next_post_free:
					cmp		qword[rbx + 8], 0
					je		check_first
					jmp		check_data

check_next:
					cmp		qword[rbx + 8], 0
					je		check_first
					mov		r8, [rbx + 8]
					mov		rbx, r8

check_data:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					mov		rdi, [rbx]
					call	rdx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					cmp		al, 0
					jz		free_data
					jmp		check_next

free_data:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					mov		rdi, [rbx]
					mov		r8, [rbx + 8]
					call	rcx
					pop		rcx
					pop		rdx
					pop		rsi
					mov		rdi, rbx
					call	free
					pop		rdi
					mov		rbx, r8
					jmp		check_next

check_first:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					mov		rbx, [rdi]
					mov		rdi, [rbx]
					call	rdx
					pop		rcx
					pop		rdx
					pop		rsi
					cmp		al, 0
					je		first_not_ok

pop_rdi:
					pop		rdi

return:
					pop		rbx
					ret

first_not_ok:
					push	rsi
					push	rdx
					push	rcx
					mov		r8, [rdi + 8]
					mov		rbx, [rdi]
					mov		rdi, rbx
					call	rcx
					pop		rcx
					pop		rdx
					pop		rsi
					mov		rdi, rbx
					call	free
					pop		rdi
					mov		[rdi], r8
					pop		rbx
					ret
