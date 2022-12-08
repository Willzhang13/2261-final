	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"text.c"
	.text
	.align	2
	.global	drawDigits0
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDigits0, %function
drawDigits0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #99
	movhi	r2, #992
	push	{r4, r5, r6, lr}
	movhi	ip, r2
	bhi	.L2
	ldr	ip, .L6
	smull	r4, lr, ip, r2
	asr	ip, r2, #31
	rsb	ip, ip, lr, asr #2
	add	lr, ip, ip, lsl #2
	sub	r2, r2, lr, lsl #1
	add	r2, r2, #992
	add	ip, ip, #992
	lsl	r2, r2, #16
	lsl	ip, ip, #16
	lsr	r2, r2, #16
	lsr	ip, ip, #16
.L2:
	ldr	r4, .L6+4
	lsl	r0, r0, #16
	lsl	r1, r1, #16
	add	lr, r3, #1
	lsr	r0, r0, #16
	lsl	r5, r3, #3
	lsr	r1, r1, #16
	add	r3, r4, r3, lsl #3
	strh	r1, [r4, r5]	@ movhi
	lsl	r6, lr, #3
	strh	r0, [r3, #2]	@ movhi
	add	r5, r0, #8
	add	r0, r4, lr, lsl #3
	strh	ip, [r3, #4]	@ movhi
	strh	r1, [r4, r6]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	1717986919
	.word	shadowOAM
	.size	drawDigits0, .-drawDigits0
	.ident	"GCC: (devkitARM release 53) 9.1.0"
