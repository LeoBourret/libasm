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
				mov		r12, byte[rsi + rcx]
				cmp		byte[rsi + r11], r12
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
				mov		r4, -1

skip_whitespace_inc:
				inc		r4

skip_whitespace:
				cmp		byte[rdi + r4], 0
				je		error
				cmp		byte[rdi + r4], 9
				je		skip_whitespace_inc
				cmp		byte[rdi + r4], 10
				je		skip_whitespace_inc
				cmp		byte[rdi + r4], 11
				je		skip_whitespace_inc
				cmp		byte[rdi + r4], 12
				je		skip_whitespace_inc
				cmp		byte[rdi + r4], 32
				je		skip_whitespace_inc
				mov		r5, 1
				jmp		get_sign

is_negative:
				mul		r5, -1

is_positive:
				inc		r4

get_sign:
				cmp		byte[rdi + r4], 0
				je		error
				cmp		byte[rdi + r4], 43
				je		is_positive
				cmp		byte[rdi + r4], 45
				je		is_negative
				inc		r4
				mov		r3, -1

is_in_base_inc:
				inc		r3

is_in_base:
				cmp		byte[rsi + r3], 0
				je		end
				mov		r1, byte[rsi + r3]
				cmp		r1, r2
				jne		is_in_base_inc

get_nbr:
				mov		r3, -1
				mov		r2, byte[rdi + r4]
				inc		r4
				mul		rcx
				add		rax, r3
				cmp		byte[rdi + r4], 0
				je		end
				jmp		is_in_base_inc

end:
				mul		rax, r5
				ret

error:
				xor rax, rax
				ret
