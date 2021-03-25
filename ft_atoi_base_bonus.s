global ft_atoi_base
section		.text

ft_atoi_base:
				push	r12
				xor		rax, rax
				xor		rcx, rcx
				jmp		check_base

check_base_dup:
				cmp		rcx, 0
				je		check_base_inc
				mov		dl, byte[rsi + rcx]
				cmp		byte[rsi + r11], dl
				je		error
				inc		r11
				cmp		r11, rcx
				jl		check_base_dup


check_base_inc:
				inc		rcx

check_base:
				cmp		byte[rsi + rcx], 0
				je		check_base_end
				cmp		byte[rsi + rcx], 9
				je		error
				cmp		byte[rsi + rcx], 10
				je		error
				cmp		byte[rsi + rcx], 11
				je		error
				cmp		byte[rsi + rcx], 12
				je		error
				cmp		byte[rsi + rcx], 13
				je		error
				cmp		byte[rsi + rcx], 32
				je		error
				cmp		byte[rsi + rcx], 43
				je		error
				cmp		byte[rsi + rcx], 45
				je		error
				xor		r11, r11
				jmp		check_base_dup

check_base_end:
				cmp		rcx, 1
				jle		error
				xor		r11, r11
				jmp skip_whitespace

skip_whitespace_inc:
				inc		r11

skip_whitespace:
				cmp		byte[rdi + r11], 0
				je		error
				cmp		byte[rdi + r11], 9
				je		skip_whitespace_inc
				cmp		byte[rdi + r11], 10
				je		skip_whitespace_inc
				cmp		byte[rdi + r11], 11
				je		skip_whitespace_inc
				cmp		byte[rdi + r11], 12
				je		skip_whitespace_inc
				cmp		byte[rdi + r11], 13
				je		skip_whitespace_inc
				cmp		byte[rdi + r11], 32
				je		skip_whitespace_inc
				mov		r12, 1
				jmp		get_sign

is_negative:
				neg		r12

is_positive:
				inc		r11

get_sign:
				cmp		byte[rdi + r11], 0
				je		error
				cmp		byte[rdi + r11], 43
				je		is_positive
				cmp		byte[rdi + r11], 45
				je		is_negative
				mov		r10, -1

is_in_base_inc:
				inc		r10

is_in_base:
				cmp		byte[rsi + r10], 0
				je		end
				mov		bl, byte[rsi + r10]
				cmp		bl, byte[rdi + r11]
				jne		is_in_base_inc

get_nbr:
				inc		r11
				mul		rcx
				add		rax, r10
				cmp		byte[rdi + r11], 0
				je		end
				mov		r10, 0
				jmp		is_in_base

end:
				cmp		r12, -1
				je		end_neg
				pop		r12
				ret

end_neg:
				neg		rax
				pop		r12
				ret

error:
				pop		r12
				xor rax, rax
				ret
