; Antonio Luiz Veloso, S11
; Ideas/Techniques Implemented: 
; vmovdqu - the universal instruction to move packed values, used to move contents of var1 to ymm3
; vextracti128 - AVX2 intruction to extract 128 bits from a ymm register to an xmm register, used to separate ymm3 register into 2 smaller xmm registers
; xorps - SSE instruction to zero out the xmm0 register, used to make the xmm0 register an operand for horizontal addition to ensure no doubling
; vphaddd - Horizontal addition instruction for doublewords, used to add each dword pair in a register. When repeated more than 2 times with a ymm register, 
;	somehow does not go beyond half the expected sum no matter how many times repeated, so xmm register was used.

section .data
	reset dd 0.0

section .text
bits 64
default rel

global ymmasm
extern printf

ymmasm:
	; initialization
	mov rax, 0
	shr rcx, 2
	mov rbx, rcx
	sub rbx, 6

loopy:
	vbroadcastss ymm0, [reset]
	vbroadcastss ymm1, [reset]
	cmp rax, rbx
	jg end

	; move contents of x (rdx is a pointer to x) to ymm0 register
	vmovdqu ymm1, [r8]


	; extract upper and lower bits of ymm3 and put them into xmm1 and xmm2
	vextracti128 xmm1, ymm3, 0
	vextracti128 xmm2, ymm3, 1

	; initialize a zero register to ensure horizontal addition does not lead to doubling of values
	xorps xmm0, xmm0

	; add both halves of ymm3 then horizontally add each doubleword pair in the result until only one remains
	vphaddd xmm3, xmm1, xmm2 ; 4 dword results
	vphaddd xmm3, xmm3, xmm0 ; 2 dword results
	vphaddd xmm3, xmm3, xmm0 ; 1 dword result, first index of xmm3 contains result

	loop loopy

	; end
	xor rax, rax
	ret