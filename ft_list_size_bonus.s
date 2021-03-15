global		ft_list_size
section		.text

ft_list_size:
				xor		rax, rax
start:
				cmp		rdi, 0
				je		end
				inc		rax
				mov		rdx, [rdi + 8]
				mov		[rdi], rdx
				jmp		start
end:
				ret
