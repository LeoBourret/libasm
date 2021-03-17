global		ft_list_size
section		.text

ft_list_size:
				xor		rax, rax
				mov		rsi, rdi		;rsi == save of *begin_list
start:
				cmp		rdi, 0
				jz		end
				inc		rax
				mov		rdi, [rdi + 8]
				jmp		start
end:
				mov rdi, rsi
				ret
