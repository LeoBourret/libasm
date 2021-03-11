global		ft_strdup
section		.text

extern		ft_strlen
extern		malloc
extern		ft_strcpy

ft_strdup:
			call	ft_strlen
			push	rdi
			mov		rdi, rax
			inc		rdi
			call	malloc
			test	rax, rax
			jz		fail_exit
			pop		rdi
			mov		rsi, rdi
			mov		rdi, rax
			call	ft_strcpy
			ret

fail_exit:
			mov		rax, 0
			ret
