;Ibaoc, Christian Gabriel P - S11

section .data
reset dd 0.0

section .text
bits 64
default rel
extern printf
global nonsimdasm
global xmmfunc
global ymmasm

nonsimdasm:
    
    push rsi
    push rbp
    push rbx
    mov rbp,rsp
    add rbp, 16
    add rbp, 8
    xor rax,rax
    movss xmm1, [reset]

    push r12
    push r13

    mov r10, 0 ;offset for Y
    mov r11,0 ; counter for  stencilling
    mov r12,7 ; max range per Y value
    mov r13,0 ; offset for X
    sub rcx, 6 ; boundary for Y
    
        biggerloopy:

            loopy:
            movss xmm0, [rdx+r13]
            addss xmm1,xmm0
            inc r11
            add r13, 4
            cmp r11,r12
            jl loopy

        add r8,r10
        movss [r8], xmm1
        movss xmm1,[reset]
        sub r13,24
        mov r11,0
        mov r10,4

        loop biggerloopy

 
    pop r13
    pop r12
    pop rbx
    pop rbp
    pop rsi
    movss xmm0,[reset]
    xor rax,rax
    xor r8,r8
    ret

xmmfunc:
	push rsi
	push rbp
    push rbx
	mov rbp, rsp
	add rbp, 16
	add rbp, 8
	xor rax, rax
	mov rbx, rcx
	sub rbx, 6
	shr rcx, 2
	

	
L1:
	vbroadcastss xmm0, [reset]
	vbroadcastss xmm1, [reset]
	cmp rax, rbx 
	jg end
	
	vmovdqu xmm1, [r8]
	vaddps xmm0, xmm0, xmm1
	vmovdqu xmm1, [r8+4]
	vaddps xmm0, xmm0, xmm1
	vmovdqu xmm1, [r8+8]
	vaddps xmm0, xmm0, xmm1
	vmovdqu xmm1, [r8+12]
	vaddps xmm0, xmm0, xmm1
	vmovdqu xmm1, [r8+16]
	vaddps xmm0, xmm0, xmm1
	vmovdqu xmm1, [r8+20]
	vaddps xmm0, xmm0, xmm1
	vmovdqu xmm1, [r8+24]
	vaddps xmm0, xmm0, xmm1	
	vmovdqu [rdx], xmm0
	add rdx, 16
	add r8, 16
	inc rax
	loop L1


end:
	pop rbx
	pop rbp
	pop rsi
ret

ymmasm:
	; initialization
	push rsi
	push rbp
	push rbx

	xor rax, rax
	mov rbx, rcx
	sub rbx, 6
	shr rcx, 3

loopyy:

	vbroadcastss ymm0, [reset]
	vbroadcastss ymm1, [reset]
	cmp rax, rbx
	jg endo

	vmovdqu ymm1, [rdx]
	vaddps ymm0, ymm0, ymm1
	vmovdqu ymm1, [rdx+4]
	vaddps ymm0, ymm0, ymm1
	vmovdqu ymm1, [rdx+8]
	vaddps ymm0, ymm0, ymm1
	vmovdqu ymm1, [rdx+12]
	vaddps ymm0, ymm0, ymm1
	vmovdqu ymm1, [rdx+16]
	vaddps ymm0, ymm0, ymm1
	vmovdqu ymm1, [rdx+20]
	vaddps ymm0, ymm0, ymm1
	vmovdqu ymm1, [rdx+24]
	vaddps ymm0, ymm0, ymm1
	vmovdqu [r8], ymm0

	add rdx, 32
	add r8, 32
	
	inc rax
	loop loopyy

endo:

	pop rbx
	pop rbp
	pop rsi
ret