global _ft_atoi_base
section		.text

_ft_atoi_base:
				xor		rax, rax
				mov		rcx, -1

check_base_dup:
				cmp		rcx, 0
				je		check_base_inc
				inc		r11
				je		check_base_inc
				mov		dl, byte[rsi + rcx]
				cmp		byte[rsi + r11], dl
				je		error
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
				cmp		byte[rsi + rcx], 32
				je		error
				cmp		byte[rsi + rcx], 43
				je		error
				cmp		byte[rsi + rcx], 45
				je		error
				mov		r11, -1
				jmp		check_base_dup

check_base_end:
				cmp		rcx, 1
				jle		error
				jmp		get_nbr
				mov		r11, -1

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
				inc		r11
				mov		r10, -1

is_in_base_inc:
				inc		r10

is_in_base:
				cmp		byte[rsi + r10], 0
				je		end
				mov		bl, byte[rsi + r10]
				cmp		bl, dl
				jne		is_in_base_inc

get_nbr:
				mov		r10, -1
				mov		dl, byte[rdi + r11]
				inc		r11
				mul		rcx
				add		rax, r10
				cmp		byte[rdi + r11], 0
				je		end
				jmp		is_in_base_inc

end:
				cmp		r12, -1
				je		end_neg
				ret

end_neg:
				neg		rax
				ret

error:
				xor rax, rax
				ret
