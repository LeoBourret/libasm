global		_ft_strdup
section		.text

extern		_ft_strlen
extern		_malloc
extern		_ft_strcpy

_ft_strdup:
			call	_ft_strlen
			push	rdi
			mov		rdi, rax
			inc		rdi
			call	_malloc
			test	rax, rax
			jz		fail_exit
			pop		rdi
			mov		rsi, rdi
			mov		rdi, rax
			call	_ft_strcpy
			ret

fail_exit:
			mov		rax, 0
			ret
