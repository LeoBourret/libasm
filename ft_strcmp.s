global _ft_strcmp
section .text

_ft_strcmp:
			mov rdx, -1
loop:
			inc rdx
			cmp byte[rsi + rdx], 0
			je exit
			cmp byte[rdi + rdx], 0
			je exit
			movzx rax, byte[rdi + rdx]
			movzx rcx, byte[rsi + rdx]
			cmp rax, rcx
			jne exit
			jmp loop

exit:
			movzx rax, byte[rdi + rdx]
			movzx rcx, byte[rsi + rdx]
			sub rax, rcx
			ret
