global _ft_strcpy
section .text

_ft_strcpy:
			mov rax, -1

start:
			inc rax
			cmp byte[rsi + rax], 0
			je exit
			mov bl, byte[rsi + rax]
			mov byte[rdi + rax], bl
			jmp start
exit:
			mov byte[rdi + rax], 0
			mov rax, rdi
			ret
