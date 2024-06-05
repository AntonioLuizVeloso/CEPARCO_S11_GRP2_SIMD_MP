section .data
	reset dd 0.0

section .text
bits 64
default rel

global ymmasm
extern printf

ymmasm:
	; initialization
	push rsi
	push rbp
	mov rbp, rsp
	add rbp, 16
	add rbp, 8

	xor rax, rax
	mov rbx, rcx
	sub rbx, 6
	shr rcx, 3

loopy:
	; initial
	vzeroall
	cmp rax, rbx
	jg end

	; X[i-3]
	vmovdqu ymm1, [rdx]
	vaddps ymm0, ymm0, ymm1

	; X[i-2]
	vmovdqu ymm1, [rdx+4]
	vaddps ymm0, ymm0, ymm1

	; X[i-1]
	vmovdqu ymm1, [rdx+8]
	vaddps ymm0, ymm0, ymm1

	; X[i]
	vmovdqu ymm1, [rdx+12]
	vaddps ymm0, ymm0, ymm1

	; X[i+1]
	vmovdqu ymm1, [rdx+16]
	vaddps ymm0, ymm0, ymm1

	; X[i+2]
	vmovdqu ymm1, [rdx+20]
	vaddps ymm0, ymm0, ymm1

	; X[i+3]
	vmovdqu ymm1, [rdx+24]
	vaddps ymm0, ymm0, ymm1

	; store result in Y
	vmovdqu [r8], ymm0

	add rdx, 32
	add r8, 32
	
	inc rax
	loop loopy

end:
	; end
	pop rbp
	pop rsi
	ret