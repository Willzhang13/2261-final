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
	.file	"game.c"
	.text
	.global	__aeabi_idivmod
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy0.part.0, %function
updateEnemy0.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L86
	ldr	r3, [r4, #112]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L2
	ldr	r3, [r4, #72]
	cmp	r3, #0
	beq	.L79
.L2:
	ldr	r3, [r4, #104]
	cmp	r3, #0
	movne	r2, #0
	ldr	r3, [r4, #108]
	addne	r3, r3, #1
	strne	r3, [r4, #108]
	strne	r2, [r4, #112]
	cmp	r3, #59
	ldr	r5, [r4, #124]
	ble	.L5
	ldr	r2, .L86+4
	mov	ip, #0
	mov	r3, r2
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #4]
	mov	lr, ip
	str	ip, [r4, #108]
	str	ip, [r4, #104]
	add	r0, r0, #8
	add	ip, r2, #176
	add	r1, r1, #8
.L6:
	str	r0, [r3, #4]
	str	r1, [r3]
	str	lr, [r3, #24]
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L6
	mov	r1, #1
	ldr	r3, [r4, #128]
	cmp	r3, #0
	streq	r1, [r2, #76]
	streq	r1, [r2, #124]
	strne	r1, [r2, #36]
	strne	r1, [r2, #76]
	strne	r1, [r2, #80]
	strne	r1, [r2, #116]
	strne	r1, [r2, #128]
	strne	r1, [r2, #164]
	str	r1, [r2, #28]
	str	r1, [r2, #172]
	mov	r2, #1
	adds	r3, r3, r2
	and	r3, r3, r2
	rsbmi	r3, r3, #0
	str	r3, [r4, #128]
	str	r2, [r4, #16]
	str	r2, [r4, #12]
.L5:
	cmp	r5, #0
	ldr	r3, [r4, #120]
	bne	.L3
.L9:
	ldr	r2, [r4, #100]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	strle	r3, [r4, #120]
	strle	r3, [r4, #124]
	strle	r2, [r4, #112]
	ldr	r3, .L86+8
	ldr	r2, [r4, #20]
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	subs	r1, r2, r3
	addne	r2, r2, #1
	bne	.L12
	ldr	r5, .L86+12
	ldr	r3, [r4, #4]
	ldr	r2, [r5]
	cmp	r3, r2
	ldr	r2, [r4, #8]
	ble	.L13
	ldr	r0, [r4, #12]
	sub	ip, r3, r0
	cmp	ip, #0
	bge	.L80
.L14:
	ldr	r3, [r5, #4]
	cmp	r3, r2
	bge	.L17
	ldr	r1, .L86+16
	ldr	r3, [r4, #16]
	ldr	r1, [r1]
	sub	r0, r2, r3
	cmp	r0, r1
	bge	.L81
.L19:
	mov	r2, #1
.L12:
	ldr	r5, [r4, #52]
	cmp	r5, #0
	str	r2, [r4, #20]
	beq	.L82
.L21:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	movne	r2, #0
	ldr	r3, [r4, #76]
	addne	r3, r3, #1
	strne	r3, [r4, #76]
	strne	r2, [r4, #80]
	cmp	r3, #29
	ble	.L24
	mov	r3, #0
	ldr	r2, [r4, #52]
	cmp	r2, r3
	str	r3, [r4, #76]
	str	r3, [r4, #72]
	beq	.L83
.L26:
	mov	r3, #0
	str	r3, [r4, #32]
.L24:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	ldr	r3, [r4, #96]
	bne	.L22
.L28:
	ldr	r2, [r4, #88]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	mov	r10, #1
	ldr	r5, .L86+20
	strle	r3, [r4, #96]
	strle	r3, [r4, #92]
	strle	r2, [r4, #80]
	ldr	r8, .L86+24
	ldr	r9, .L86+12
	add	r7, r5, #220
.L33:
	ldr	r6, [r5, #24]
	cmp	r6, #0
	beq	.L84
.L31:
	add	r5, r5, #44
	cmp	r5, r7
	bne	.L33
	ldr	r3, .L86+28
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L85
.L35:
	ldr	r5, [r4, #32]
	add	r3, r5, r5, lsl #4
	ldr	r2, .L86+32
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	r1, .L86+36
	sub	r2, r2, r3
	ldr	r3, [r4, #36]
	cmp	r2, r1
	str	r3, [r4, #40]
	bcs	.L37
	ldr	r0, [r4, #44]
	ldr	r3, .L86+40
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L37:
	add	r5, r5, #1
	str	r5, [r4, #32]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L84:
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L31
	ldr	r3, [r4]
	ldr	r2, [r5, #16]
	ldr	r1, [r9, #84]
	rsb	r2, r2, #0
	sub	r3, r3, r1
	stm	r5, {r2, r6}
	str	r10, [r5, #24]
	str	r6, [r5, #28]
	str	r6, [r5, #32]
	str	r3, [r4]
	b	.L31
.L82:
	ldr	r3, .L86+12
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r6, .L86+24
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L21
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L21
	mov	r3, #1
	str	r5, [r4, #80]
	str	r3, [r4, #72]
	str	r3, [r4, #92]
	str	r3, [r4, #76]
	ldr	r3, [r4, #96]
.L22:
	add	r3, r3, #1
	str	r3, [r4, #96]
	b	.L28
.L79:
	mov	r2, #1
	str	r3, [r4, #16]
	str	r3, [r4, #12]
	str	r3, [r4, #112]
	str	r2, [r4, #104]
	str	r2, [r4, #124]
	str	r2, [r4, #108]
	ldr	r3, [r4, #120]
.L3:
	add	r3, r3, #1
	str	r3, [r4, #120]
	b	.L9
.L13:
	bge	.L14
	ldr	ip, [r4, #28]
	ldr	lr, [r4, #12]
	add	r0, r3, ip
	add	r0, r0, lr
	cmp	r0, #256
	bgt	.L14
	str	lr, [sp, #12]
	str	r1, [sp, #8]
	ldr	lr, [r4, #24]
	str	ip, [sp, #4]
	ldr	r0, .L86+44
	mov	r1, #1024
	ldr	r0, [r0]
	ldr	r6, .L86+48
	str	lr, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	ldrne	r2, [r4, #12]
	addne	r3, r3, r2
	strne	r3, [r4, #4]
.L77:
	ldr	r2, [r4, #8]
	b	.L14
.L85:
	add	r0, r3, #16
	ldm	r0, {r0, r1}
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r5, .L86+24
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #68]
	b	.L35
.L17:
	ble	.L19
	ldr	r3, .L86+16
	ldr	r0, [r4, #24]
	ldr	r3, [r3]
	ldr	ip, [r4, #16]
	add	r1, r0, r2
	add	r3, r3, #512
	add	r1, r1, ip
	cmp	r1, r3
	bgt	.L19
	mov	r5, #0
	ldr	r3, [r4, #28]
	ldr	r1, .L86+44
	str	ip, [sp, #8]
	str	r0, [sp]
	str	r5, [sp, #12]
	ldr	r6, .L86+48
	ldr	r0, [r1]
	str	r3, [sp, #4]
	mov	r1, #1024
	ldr	r3, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, r5
	ldrne	r3, [r4, #8]
	ldrne	r2, [r4, #16]
	addne	r3, r3, r2
	strne	r5, [r4, #36]
	strne	r3, [r4, #8]
	b	.L19
.L83:
	ldr	r5, .L86+12
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r6, .L86+24
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L26
	ldr	r3, [r5, #188]
	cmp	r3, #0
	ldreq	r3, [r5, #48]
	ldreq	r2, [r4, #84]
	subeq	r3, r3, r2
	streq	r3, [r5, #48]
	b	.L26
.L80:
	rsb	r0, r0, #0
	str	r1, [sp, #8]
	ldr	r6, .L86+44
	ldr	lr, [r4, #28]
	str	r0, [sp, #12]
	ldr	ip, [r4, #24]
	ldr	r0, [r6]
	mov	r1, #1024
	stm	sp, {ip, lr}
	ldr	r6, .L86+48
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L77
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	ldr	r2, [r4, #8]
	b	.L14
.L81:
	mov	lr, #0
	rsb	r3, r3, #0
	add	r1, r4, #24
	ldm	r1, {r1, ip}
	ldr	r0, .L86+44
	str	r3, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r4, #4]
	ldr	r0, [r0]
	ldr	r5, .L86+48
	stm	sp, {r1, ip}
	mov	r1, #1024
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L19
	mov	r2, #1
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #16]
	sub	r3, r3, r1
	str	r3, [r4, #8]
	str	r2, [r4, #36]
	b	.L19
.L87:
	.align	2
.L86:
	.word	enemy0
	.word	eyeballs
	.word	1431655766
	.word	player
	.word	hOfflimit
	.word	fireballs
	.word	collision
	.word	wave
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	collisionCheck
	.size	updateEnemy0.part.0, .-updateEnemy0.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMinor1.part.0, %function
updateMinor1.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #20]
	ldr	r3, .L164
	smull	r1, r3, r2, r3
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	subs	r1, r2, r3
	mov	r4, r0
	sub	sp, sp, #16
	addne	r2, r2, #1
	bne	.L90
	ldr	r5, .L164+4
	ldr	r3, [r0, #4]
	ldr	r2, [r5]
	cmp	r3, r2
	ldr	r2, [r0, #8]
	ble	.L91
	ldr	r0, [r0, #12]
	sub	ip, r3, r0
	cmp	ip, #0
	bge	.L157
.L92:
	ldr	r3, [r5, #4]
	cmp	r3, r2
	bge	.L96
	ldr	r1, .L164+8
	ldr	r3, [r4, #16]
	ldr	r1, [r1]
	sub	r0, r2, r3
	cmp	r0, r1
	bge	.L158
.L98:
	mov	r2, #1
.L90:
	ldr	r5, [r4, #52]
	cmp	r5, #0
	str	r2, [r4, #20]
	beq	.L159
.L100:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	movne	r2, #0
	ldr	r3, [r4, #76]
	addne	r3, r3, #1
	strne	r3, [r4, #76]
	strne	r2, [r4, #80]
	cmp	r3, #19
	ble	.L103
	mov	r3, #0
	ldr	r2, [r4, #52]
	cmp	r2, r3
	str	r3, [r4, #76]
	str	r3, [r4, #72]
	beq	.L160
.L105:
	mov	r3, #0
	str	r3, [r4, #32]
.L103:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	ldr	r3, [r4, #96]
	bne	.L101
.L107:
	ldr	r2, [r4, #88]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	mov	r10, #1
	ldr	r5, .L164+12
	strle	r3, [r4, #96]
	strle	r3, [r4, #92]
	strle	r2, [r4, #80]
	ldr	r8, .L164+16
	ldr	r9, .L164+4
	add	r7, r5, #220
.L112:
	ldr	r6, [r5, #24]
	cmp	r6, #0
	beq	.L161
.L110:
	add	r5, r5, #44
	cmp	r7, r5
	bne	.L112
	ldr	r3, .L164+20
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L162
.L114:
	ldr	r5, [r4, #32]
	add	r3, r5, r5, lsl #4
	ldr	r2, .L164+24
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	r1, .L164+28
	sub	r2, r2, r3
	ldr	r3, [r4, #36]
	cmp	r2, r1
	str	r3, [r4, #40]
	bcc	.L163
.L116:
	ldr	r3, [r4]
	add	r5, r5, #1
	cmp	r3, #0
	str	r5, [r4, #32]
	bgt	.L88
	mov	r0, #1
	mov	r3, #0
	mov	lr, #20
	ldr	ip, .L164+32
	ldr	r1, [r4, #28]
	ldr	r2, [ip]
	rsb	r1, r1, #0
	add	r2, r2, r0
	str	lr, [r4]
	str	r1, [r4, #4]
	str	r2, [ip]
	str	r3, [r4, #8]
	str	r3, [r4, #20]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r3, [r4, #36]
	str	r3, [r4, #96]
	str	r0, [r4, #52]
	str	r0, [r4, #80]
.L88:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L161:
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L110
	ldr	r3, [r5, #16]
	rsb	r3, r3, #0
	stm	r5, {r3, r6}
	str	r10, [r5, #24]
	str	r6, [r5, #28]
	str	r6, [r5, #32]
	ldr	r2, [r9, #84]
	ldr	r3, [r4]
	sub	r3, r3, r2
	str	r3, [r4]
	b	.L110
.L159:
	ldr	r3, .L164+4
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r6, .L164+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L100
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L100
	mov	r3, #1
	str	r5, [r4, #80]
	str	r3, [r4, #72]
	str	r3, [r4, #92]
	str	r3, [r4, #76]
	ldr	r3, [r4, #96]
.L101:
	add	r3, r3, #1
	str	r3, [r4, #96]
	b	.L107
.L163:
	ldr	r0, [r4, #44]
	ldr	r3, .L164+36
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
	b	.L116
.L91:
	bge	.L92
	ldr	ip, [r0, #28]
	ldr	lr, [r0, #12]
	add	r0, r3, ip
	add	r0, r0, lr
	cmp	r0, #256
	bgt	.L92
	str	lr, [sp, #12]
	ldr	r0, .L164+40
	ldr	lr, [r4, #24]
	str	r1, [sp, #8]
	str	ip, [sp, #4]
	mov	r1, #1024
	ldr	r0, [r0]
	ldr	r6, .L164+44
	str	lr, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	ldrne	r2, [r4, #12]
	addne	r3, r3, r2
	strne	r3, [r4, #4]
	b	.L156
.L162:
	add	r0, r3, #16
	ldm	r0, {r0, r1}
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r5, .L164+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #68]
	b	.L114
.L96:
	ble	.L98
	ldr	r3, .L164+8
	ldr	r0, [r4, #24]
	ldr	r3, [r3]
	ldr	ip, [r4, #16]
	add	r1, r0, r2
	add	r3, r3, #512
	add	r1, r1, ip
	cmp	r1, r3
	bgt	.L98
	mov	r6, #0
	ldr	r3, [r4, #28]
	ldr	r1, .L164+40
	str	ip, [sp, #8]
	str	r0, [sp]
	str	r6, [sp, #12]
	ldr	r0, [r1]
	str	r3, [sp, #4]
	mov	r1, #1024
	ldr	r3, [r4, #4]
	ldr	r5, .L164+44
	mov	lr, pc
	bx	r5
	cmp	r0, r6
	beq	.L98
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #8]
	add	r3, r3, r2
	ldr	r5, .L164+48
	ldr	r7, [r4, #28]
	ldr	lr, [r4, #24]
	ldr	ip, [r4, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	r7, [sp, #12]
	stmib	sp, {ip, lr}
	ldr	r7, .L164+16
	mov	lr, pc
	bx	r7
	ldr	r3, [r5, #16]
	cmp	r0, r6
	cmpne	r3, r6
	bne	.L98
	ldr	r3, [r4, #8]
	ldr	ip, [r4, #16]
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #4]
	add	r3, r3, ip
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	r3, [r5, #48]
	ldr	r2, [r5, #52]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #44]
	mov	lr, pc
	bx	r7
	ldr	r3, [r5, #56]
	cmp	r0, r6
	cmpne	r3, r6
	bne	.L98
	ldr	r3, [r4, #8]
	ldr	ip, [r4, #16]
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #4]
	add	r3, r3, ip
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	r2, [r5, #72]
	ldr	r3, [r5, #68]
	ldr	r1, [r5, #60]
	ldr	r0, [r5, #64]
	mov	lr, pc
	bx	r7
	ldr	r3, [r5, #76]
	cmp	r0, r6
	cmpne	r3, r6
	ldreq	r3, [r4, #8]
	ldreq	r2, [r4, #16]
	addeq	r3, r3, r2
	streq	r6, [r4, #36]
	streq	r3, [r4, #8]
	b	.L98
.L160:
	ldr	r5, .L164+4
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	ldr	r6, .L164+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L105
	ldr	r3, [r5, #188]
	cmp	r3, #0
	ldreq	r3, [r5, #48]
	ldreq	r2, [r4, #84]
	subeq	r3, r3, r2
	streq	r3, [r5, #48]
	b	.L105
.L157:
	rsb	r0, r0, #0
	ldr	lr, [r4, #28]
	str	r0, [sp, #12]
	ldr	r6, .L164+40
	ldr	ip, [r4, #24]
	str	r1, [sp, #8]
	mov	r1, #1024
	ldr	r0, [r6]
	stm	sp, {ip, lr}
	ldr	r6, .L164+44
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L93
.L156:
	ldr	r2, [r4, #8]
	b	.L92
.L158:
	mov	lr, #0
	rsb	r3, r3, #0
	add	r1, r4, #24
	ldm	r1, {r1, ip}
	ldr	r0, .L164+40
	str	r3, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0]
	stm	sp, {r1, ip}
	ldr	r5, .L164+44
	mov	r1, #1024
	ldr	r3, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L98
	mov	r2, #1
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #16]
	sub	r3, r3, r1
	str	r3, [r4, #8]
	str	r2, [r4, #36]
	b	.L98
.L93:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #4]
	sub	r3, r3, r2
	ldr	r7, [r4, #28]
	ldr	r6, .L164+48
	ldr	lr, [r4, #24]
	ldr	ip, [r4, #8]
	str	r3, [sp, #4]
	ldr	r3, [r6, #28]
	ldr	r2, [r6, #32]
	ldr	r1, [r6, #20]
	ldr	r0, [r6, #24]
	str	r7, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	r7, .L164+16
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #36]
	cmp	r0, #0
	cmpne	r3, #0
	bne	.L156
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	ldr	r2, [r4, #8]
	b	.L92
.L165:
	.align	2
.L164:
	.word	1431655766
	.word	player
	.word	hOfflimit
	.word	fireballs
	.word	collision
	.word	wave
	.word	143165576
	.word	286331153
	.word	enemykilled
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	collisionCheck
	.word	blockers
	.size	updateMinor1.part.0, .-updateMinor1.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy0.part.0, %function
drawEnemy0.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L181
	ldr	r1, [r4, #72]
	cmp	r1, #0
	ldr	r2, [r4]
	beq	.L177
	mov	r3, #15
	mov	r1, #0
	mov	r0, #192
	ldr	r5, .L181+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #76]
	cmp	r3, #10
	ble	.L178
	cmp	r3, #20
	bgt	.L171
	ldr	r3, .L181+8
	ldr	r2, .L181+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L181+16
	ldr	r2, [r4, #4]
	ldr	r0, [r1]
	ldr	r1, .L181+20
	sub	r2, r2, r0
	ldr	r0, .L181+24
	and	r2, r2, #255
	strh	r3, [r1, #66]	@ movhi
	strh	r2, [r1, #64]	@ movhi
	strh	r0, [r1, #68]	@ movhi
.L166:
	pop	{r4, r5, r6, lr}
	bx	lr
.L177:
	ldr	r3, [r4, #104]
	cmp	r3, #0
	beq	.L179
	mov	r3, #15
	mov	r0, #192
	ldr	r5, .L181+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #108]
	cmp	r3, #20
	bgt	.L173
	ldr	r3, .L181+8
	ldr	r2, .L181+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L181+16
	ldr	r2, [r4, #4]
	ldr	r0, [r1]
	ldr	r1, .L181+20
	sub	r2, r2, r0
	ldr	r0, .L181+28
	and	r2, r2, #255
	strh	r3, [r1, #66]	@ movhi
	strh	r2, [r1, #64]	@ movhi
	strh	r0, [r1, #68]	@ movhi
	b	.L166
.L178:
	ldr	r3, .L181+8
	ldr	r2, .L181+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L181+16
	ldr	r2, [r4, #4]
	ldr	r0, [r1]
	ldr	r1, .L181+20
	sub	r2, r2, r0
	ldr	r0, .L181+32
	and	r2, r2, #255
	strh	r3, [r1, #66]	@ movhi
	strh	r2, [r1, #64]	@ movhi
	strh	r0, [r1, #68]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L179:
	mov	r1, r3
	mov	r0, #192
	mov	r3, #15
	ldr	r5, .L181+4
	mov	lr, pc
	bx	r5
	ldr	r2, .L181+8
	ldr	r3, .L181+12
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #8]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r4, #44]
	ldr	r1, .L181+16
	ldr	r0, [r4, #36]
	lsl	r3, r3, #5
	ldr	ip, [r1]
	add	r3, r3, #112
	ldr	r1, [r4, #4]
	add	r3, r3, r0
	sub	r1, r1, ip
	ldr	r0, .L181+20
	lsl	r3, r3, #2
	and	r1, r1, #255
	orr	r3, r3, #16384
	strh	r2, [r0, #66]	@ movhi
	strh	r1, [r0, #64]	@ movhi
	strh	r3, [r0, #68]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L173:
	cmp	r3, #40
	ble	.L180
	cmp	r3, #60
	bgt	.L166
	ldr	r3, .L181+8
	ldr	r2, .L181+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L181+16
	ldr	r2, [r4, #4]
	ldr	r0, [r1]
	ldr	r1, .L181+20
	sub	r2, r2, r0
	ldr	r0, .L181+36
	and	r2, r2, #255
	strh	r3, [r1, #66]	@ movhi
	strh	r2, [r1, #64]	@ movhi
	strh	r0, [r1, #68]	@ movhi
	b	.L166
.L171:
	cmp	r3, #30
	bgt	.L166
	ldr	r3, .L181+8
	ldr	r2, .L181+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L181+16
	ldr	r2, [r4, #4]
	ldr	r0, [r1]
	ldr	r1, .L181+20
	sub	r2, r2, r0
	ldr	r0, .L181+40
	and	r2, r2, #255
	strh	r3, [r1, #66]	@ movhi
	strh	r2, [r1, #64]	@ movhi
	strh	r0, [r1, #68]	@ movhi
	b	.L166
.L180:
	ldr	r3, .L181+8
	ldr	r2, .L181+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L181+16
	ldr	r2, [r4, #4]
	ldr	r0, [r1]
	ldr	r1, .L181+20
	sub	r2, r2, r0
	ldr	r0, .L181+44
	and	r2, r2, #255
	strh	r3, [r1, #66]	@ movhi
	strh	r2, [r1, #64]	@ movhi
	strh	r0, [r1, #68]	@ movhi
	b	.L166
.L182:
	.align	2
.L181:
	.word	enemy0
	.word	drawDigits0
	.word	hOfflimit
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	16968
	.word	16844
	.word	16840
	.word	17100
	.word	17096
	.word	16972
	.size	drawEnemy0.part.0, .-drawEnemy0.part.0
	.align	2
	.global	bossAlive
	.syntax unified
	.arm
	.fpu softvfp
	.type	bossAlive, %function
bossAlive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L184
	ldr	r0, [r3]
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L185:
	.align	2
.L184:
	.word	enemy0
	.size	bossAlive, .-bossAlive
	.align	2
	.global	playerAlive
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerAlive, %function
playerAlive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L187
	ldr	r0, [r3, #48]
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L188:
	.align	2
.L187:
	.word	player
	.size	playerAlive, .-playerAlive
	.align	2
	.global	playerDashCDCounterPlus
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerDashCDCounterPlus, %function
playerDashCDCounterPlus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L190
	ldr	r3, [r2, #108]
	add	r3, r3, #1
	str	r3, [r2, #108]
	bx	lr
.L191:
	.align	2
.L190:
	.word	player
	.size	playerDashCDCounterPlus, .-playerDashCDCounterPlus
	.align	2
	.global	playerDashCDStarts
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerDashCDStarts, %function
playerDashCDStarts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L193
	str	r2, [r3, #112]
	bx	lr
.L194:
	.align	2
.L193:
	.word	player
	.size	playerDashCDStarts, .-playerDashCDStarts
	.align	2
	.global	openFirst
	.syntax unified
	.arm
	.fpu softvfp
	.type	openFirst, %function
openFirst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r2, .L199
	str	lr, [sp, #-4]!
	ldr	r3, .L199+4
	str	r1, [r2]
	ldr	ip, .L199+8
	ldr	r2, .L199+12
.L196:
	lsl	r1, r3, #1
	ldrh	r0, [r2, r1]
	add	r1, r2, r3, lsl #1
	strh	r0, [r1, #-4]	@ movhi
	add	r3, r3, #32
	ldrh	r0, [r1, #2]
	cmp	r3, ip
	strh	r0, [r1, #-2]	@ movhi
	bne	.L196
	mov	r2, #0
	mov	lr, #136
	mov	ip, #432
	mov	r0, #223
	mov	r1, #300
	ldr	r3, .L199+16
	str	r2, [r3, #16]
	ldr	r3, .L199+20
	str	lr, [r3, #4]
	str	r2, [r3, #52]
	str	r2, [r3, #152]
	str	ip, [r3, #8]
	str	r0, [r3, #104]
	str	r1, [r3, #108]
	ldr	lr, [sp], #4
	bx	lr
.L200:
	.align	2
.L199:
	.word	door1Opened
	.word	718
	.word	1038
	.word	100718592
	.word	blockers
	.word	minor1s
	.size	openFirst, .-openFirst
	.align	2
	.global	openSecond
	.syntax unified
	.arm
	.fpu softvfp
	.type	openSecond, %function
openSecond:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r3, .L207
	ldr	r2, .L207+4
	ldr	ip, [r3, #2364]
	push	{r4, r5, lr}
	str	r1, [r2]
	mov	r5, #384
	str	ip, [r3, #2876]
	mov	r4, #128
	mov	ip, #136
	ldr	r1, [r3, #2492]
	ldr	r0, [r3, #2428]
	ldr	r2, [r3, #2556]
	str	r1, [r3, #3004]
	str	r0, [r3, #2940]
	str	r2, [r3, #3068]
	ldr	r1, .L207+8
.L202:
	mov	r3, r4
	sub	lr, r5, r4
.L203:
	lsl	r2, r3, #1
	ldrh	r0, [r1, r2]
	add	r2, lr, r3
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, ip
	strh	r0, [r1, r2]	@ movhi
	bne	.L203
	add	r4, r4, #32
	cmp	r4, #256
	add	r5, r5, #32
	add	ip, r3, #32
	bne	.L202
	mov	r2, #0
	mov	lr, #63
	mov	ip, #129
	mov	r0, #56
	mov	r1, #440
	ldr	r3, .L207+12
	str	r2, [r3, #36]
	ldr	r3, .L207+16
	str	lr, [r3, #4]
	str	r2, [r3, #52]
	str	r2, [r3, #152]
	str	ip, [r3, #8]
	str	r0, [r3, #104]
	str	r1, [r3, #108]
	pop	{r4, r5, lr}
	bx	lr
.L208:
	.align	2
.L207:
	.word	100716544
	.word	door2Opened
	.word	100720640
	.word	blockers
	.word	minor1s
	.size	openSecond, .-openSecond
	.align	2
	.global	openThird
	.syntax unified
	.arm
	.fpu softvfp
	.type	openThird, %function
openThird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	mov	r0, #60
	ldr	r3, .L215
	str	lr, [sp, #-4]!
	ldr	ip, .L215+4
	str	r2, [r3]
	ldr	lr, .L215+8
.L210:
	sub	r3, r0, #4
.L211:
	lsl	r2, r3, #1
	ldrh	r1, [lr, r2]
	add	r2, ip, r3, lsl #1
	add	r3, r3, #1
	cmp	r3, r0
	strh	r1, [r2, #8]	@ movhi
	bne	.L211
	cmp	r3, #348
	add	r0, r3, #32
	bne	.L210
	mov	r2, #0
	ldr	r3, .L215+12
	ldr	lr, [sp], #4
	str	r2, [r3, #56]
	bx	lr
.L216:
	.align	2
.L215:
	.word	door3Opened
	.word	100720640
	.word	100718592
	.word	blockers
	.size	openThird, .-openThird
	.align	2
	.global	openBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	openBoss, %function
openBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #100
	mov	lr, #800
	mov	r2, #0
	ldr	r3, .L223
	mov	r0, #1
	stmib	r3, {ip, lr}
	mov	ip, #8
	ldr	r1, .L223+4
	str	r2, [r1, #76]
	ldr	r1, .L223+8
	str	r2, [r3, #52]
	str	r0, [r1]
	ldr	r2, .L223+12
	add	lr, lr, #232
.L218:
	sub	r3, ip, #4
.L219:
	lsl	r1, r3, #1
	ldrh	r0, [r2, r1]
	add	r1, r2, r3, lsl #1
	add	r3, r3, #1
	cmp	r3, ip
	strh	r0, [r1, #-8]	@ movhi
	bne	.L219
	add	ip, r3, #32
	cmp	ip, lr
	bne	.L218
	ldr	lr, [sp], #4
	bx	lr
.L224:
	.align	2
.L223:
	.word	enemy0
	.word	blockers
	.word	BossOpened
	.word	100724736
	.size	openBoss, .-openBoss
	.align	2
	.global	initBlockers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlockers, %function
initBlockers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #1
	mov	r0, #32
	mov	r1, #80
	mov	r10, #176
	mov	r9, #33
	mov	r8, #240
	mov	r7, #480
	mov	r6, #8
	mov	r5, #256
	mov	r4, #768
	mov	lr, #0
	mov	ip, #96
	ldr	r3, .L227
	str	r10, [r3]
	str	r9, [r3, #28]
	str	r8, [r3, #24]
	str	r7, [r3, #44]
	str	r6, [r3, #40]
	str	r5, [r3, #68]
	str	r4, [r3, #64]
	str	lr, [r3, #60]
	str	r2, [r3, #16]
	str	r2, [r3, #36]
	str	r2, [r3, #56]
	str	r2, [r3, #76]
	str	r0, [r3, #12]
	str	r0, [r3, #52]
	str	r0, [r3, #72]
	str	r1, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #48]
	str	ip, [r3, #4]
	str	ip, [r3, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L228:
	.align	2
.L227:
	.word	blockers
	.size	initBlockers, .-initBlockers
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r1, #1
	mov	ip, #32
	mov	r0, #3
	mov	lr, #300
	mov	r4, #2
	mov	r6, #20
	mov	r5, #500
	ldr	r3, .L231
	str	r6, [r3, #48]
	str	r4, [r3, #68]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	ip, [r3]
	str	ip, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #64]
	str	r1, [r3, #80]
	str	r1, [r3, #84]
	str	r1, [r3, #100]
	str	r1, [r3, #104]
	str	r1, [r3, #156]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r2, [r3, #56]
	str	r2, [r3, #76]
	str	r2, [r3, #72]
	str	r2, [r3, #108]
	str	r2, [r3, #92]
	str	r2, [r3, #112]
	str	r2, [r3, #96]
	str	r2, [r3, #164]
	str	r2, [r3, #148]
	str	r0, [r3, #40]
	str	r0, [r3, #88]
	str	r0, [r3, #160]
	str	lr, [r3, #144]
	str	lr, [r3, #116]
	str	r4, [r3, #184]
	str	lr, [r3, #192]
	str	r5, [r3, #212]
	str	r2, [r3, #168]
	str	r2, [r3, #152]
	str	r1, [r3, #128]
	str	r2, [r3, #136]
	str	r1, [r3, #132]
	str	r2, [r3, #120]
	str	r2, [r3, #140]
	str	r2, [r3, #124]
	str	r1, [r3, #180]
	str	r2, [r3, #176]
	str	r2, [r3, #172]
	str	r1, [r3, #196]
	str	r2, [r3, #200]
	str	r1, [r3, #204]
	str	r2, [r3, #188]
	str	r1, [r3, #208]
	str	r2, [r3, #220]
	str	r0, [r3, #216]
	str	r1, [r3, #236]
	str	r2, [r3, #224]
	str	r2, [r3, #228]
	str	r2, [r3, #232]
	pop	{r4, r5, r6, lr}
	bx	lr
.L232:
	.align	2
.L231:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemy0
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy0, %function
initEnemy0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r1, #1
	mov	r0, #32
	mvn	r6, #31
	mov	r5, #60
	mov	r4, #3
	mov	lr, #90
	mov	ip, #400
	ldr	r3, .L235
	stm	r3, {r5, r6}
	str	r4, [r3, #48]
	str	lr, [r3, #88]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #100]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #52]
	str	r1, [r3, #80]
	str	r1, [r3, #84]
	str	r1, [r3, #112]
	str	r1, [r3, #116]
	str	r2, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	r2, [r3, #96]
	str	r2, [r3, #120]
	str	r2, [r3, #128]
	pop	{r4, r5, r6, lr}
	bx	lr
.L236:
	.align	2
.L235:
	.word	enemy0
	.size	initEnemy0, .-initEnemy0
	.align	2
	.global	initMinor1s
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMinor1s, %function
initMinor1s:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L241
	push	{r4, r5, r6, r7, lr}
	mov	r0, #32
	mov	r3, ip
	mvn	r7, #31
	mov	r2, #0
	mov	r1, #1
	mov	r6, #20
	mov	r5, #3
	mov	r4, #120
	add	lr, ip, #300
.L238:
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r7, [r3, #4]
	str	r2, [r3, #8]
	str	r1, [r3, #16]
	str	r1, [r3, #12]
	str	r1, [r3, #52]
	str	r6, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r5, [r3, #48]
	str	r2, [r3, #36]
	str	r1, [r3, #80]
	str	r1, [r3, #84]
	str	r2, [r3, #96]
	str	r4, [r3, #88]
	add	r3, r3, #100
	cmp	r3, lr
	bne	.L238
	mov	r3, #192
	str	r0, [ip, #8]
	str	r2, [ip, #52]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L242:
	.align	2
.L241:
	.word	minor1s
	.size	initMinor1s, .-initMinor1s
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #9664
	ldr	r4, .L249
	mov	r0, #3
	ldr	r2, .L249+4
	ldr	r1, .L249+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L249+12
	ldr	r1, .L249+16
	mov	lr, pc
	bx	r4
	mov	r4, #0
	mov	r3, #67108864
	mov	ip, #27
	mov	r5, #1
	mov	r0, #2
	mov	r6, #3
	ldr	r2, .L249+20
	str	r4, [r2]
	ldr	r2, .L249+24
	strh	r4, [r3, #22]	@ movhi
	ldr	r1, .L249+28
	strh	r4, [r3, #20]	@ movhi
	str	r4, [r2]
	ldr	r2, .L249+32
	str	r4, [r1]
	str	r4, [r2]
	ldr	r1, .L249+36
	ldr	r2, .L249+40
	str	r4, [r1]
	str	r4, [r2]
	ldr	r1, .L249+44
	ldr	r2, .L249+48
	str	r4, [r1]
	str	r4, [r2]
	ldr	r1, .L249+52
	ldr	r2, .L249+56
	ldr	lr, .L249+60
	str	ip, [r1]
	str	r5, [r2]
	ldr	ip, .L249+64
	ldr	r1, .L249+68
	ldr	r2, .L249+72
	str	r4, [lr]
	str	r0, [r1]
	str	r6, [ip]
	strh	r2, [r3, #10]	@ movhi
	bl	initBlockers
	bl	initPlayer
	bl	initEnemy0
	bl	initMinor1s
	mov	r2, r4
	mov	ip, r6
	mov	r0, r5
	mov	r1, #8
	mvn	r4, #7
	ldr	r3, .L249+76
	add	lr, r3, #220
.L244:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #44
	cmp	r3, lr
	bne	.L244
	mov	r0, #8
	mvn	r4, #7
	mov	r2, #0
	mov	r1, #2
	mov	ip, #1
	ldr	r3, .L249+80
	add	lr, r3, #176
.L245:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #44
	cmp	r3, lr
	bne	.L245
	mov	r0, #16
	mvn	lr, #15
	ldr	r3, .L249+84
	str	lr, [r3]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #4]
	str	r1, [r3, #12]
	str	ip, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L250:
	.align	2
.L249:
	.word	DMANow
	.word	100679680
	.word	background0Tiles
	.word	100718592
	.word	background0Map
	.word	cheat
	.word	vOff
	.word	hOff
	.word	hOfflimit
	.word	door1Opened
	.word	door2Opened
	.word	door3Opened
	.word	BossOpened
	.word	screenBlock
	.word	swordPalr
	.word	enemykilled
	.word	wavePalr
	.word	firePalr
	.word	23300
	.word	fireballs
	.word	eyeballs
	.word	wave
	.size	initGame, .-initGame
	.align	2
	.global	initFireballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFireballs, %function
initFireballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #8
	mvn	r4, #7
	mov	r2, #0
	mov	lr, #3
	mov	ip, #1
	ldr	r3, .L255
	add	r0, r3, #220
.L252:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3]
	str	r2, [r3, #4]
	str	lr, [r3, #12]
	str	ip, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L252
	pop	{r4, lr}
	bx	lr
.L256:
	.align	2
.L255:
	.word	fireballs
	.size	initFireballs, .-initFireballs
	.align	2
	.global	initEyeballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEyeballs, %function
initEyeballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #8
	mvn	r4, #7
	mov	r2, #0
	mov	r1, #2
	mov	lr, #1
	ldr	r3, .L261
	add	ip, r3, #176
.L258:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	lr, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L258
	pop	{r4, lr}
	bx	lr
.L262:
	.align	2
.L261:
	.word	eyeballs
	.size	initEyeballs, .-initEyeballs
	.align	2
	.global	initWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWave, %function
initWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r1, #16
	mvn	lr, #15
	mov	ip, #2
	mov	r0, #1
	ldr	r3, .L265
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L266:
	.align	2
.L265:
	.word	wave
	.size	initWave, .-initWave
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L339
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldr	r5, [r4, #28]
	sub	sp, sp, #16
	bne	.L268
	ldr	r6, [r4, #24]
	add	r3, r6, r6, lsl #4
	ldr	r2, .L339+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L339+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r2, r1
	str	r5, [r4, #32]
	bcs	.L269
	ldr	r0, [r4, #36]
	ldr	r3, .L339+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L269:
	ldr	r3, .L339+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L270
.L275:
	mov	r3, #1
	str	r3, [r4, #28]
.L271:
	add	r6, r6, #1
	str	r6, [r4, #24]
.L267:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L268:
	cmp	r5, #0
	moveq	r3, #4
	str	r5, [r4, #32]
	streq	r3, [r4, #28]
	beq	.L281
	cmp	r5, #1
	moveq	r3, #3
	streq	r3, [r4, #28]
.L281:
	ldr	r3, .L339+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L282
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L291
.L283:
	mov	r3, #4
	str	r3, [r4, #28]
.L286:
	ldr	r5, .L339+20
	add	r0, r5, #24
	ldmib	r5, {r1, r3}
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #16]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L339+24
	add	r2, r2, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #1
	mov	r8, #1
	strne	r3, [r5, #64]
	ldr	r5, .L339+28
	add	r7, r5, #300
.L290:
	add	r0, r5, #24
	ldmib	r5, {r1, r3}
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #16]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	add	r2, r2, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	strne	r8, [r5, #64]
	add	r5, r5, #100
	cmp	r5, r7
	bne	.L290
	b	.L267
.L282:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L283
	ldr	r3, [r4, #28]
	cmp	r3, #4
	beq	.L286
	cmp	r3, #3
	bne	.L267
.L291:
	ldr	r5, .L339+20
	add	ip, r5, #24
	ldmib	r5, {r1, r3}
	ldm	ip, {ip, lr}
	ldr	r2, [r4, #16]
	ldr	r0, [r4, #4]
	stmib	sp, {r1, ip, lr}
	str	r3, [sp]
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	ldr	r6, .L339+24
	add	r2, r2, #8
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #1
	mov	r8, #1
	strne	r3, [r5, #64]
	ldr	r5, .L339+28
	add	r7, r5, #300
.L294:
	ldr	r3, [r5, #28]
	ldr	r1, [r5, #4]
	ldr	ip, [r5, #24]
	str	r3, [sp, #12]
	ldr	r2, [r4, #16]
	ldr	r3, [r5, #8]
	ldr	r0, [r4, #4]
	stmib	sp, {r1, ip}
	str	r3, [sp]
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	add	r2, r2, #8
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	strne	r8, [r5, #64]
	add	r5, r5, #100
	cmp	r5, r7
	bne	.L294
	b	.L267
.L270:
	ldrh	r2, [r3, #48]
	tst	r2, #16
	beq	.L274
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L337
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L337
	mov	r3, #0
	cmp	r5, #4
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	beq	.L333
	cmp	r5, #3
	beq	.L338
.L279:
	str	r5, [r4, #28]
	b	.L267
.L274:
	mov	r3, #0
	str	r3, [r4, #28]
	b	.L271
.L337:
	cmp	r5, #4
	beq	.L274
	cmp	r5, #3
	strne	r5, [r4, #28]
	beq	.L275
	cmp	r5, #2
	bne	.L271
	mov	r3, #0
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	b	.L279
.L338:
	mov	r3, #1
.L333:
	str	r3, [r4, #28]
	b	.L267
.L340:
	.align	2
.L339:
	.word	player
	.word	143165576
	.word	286331153
	.word	__aeabi_idivmod
	.word	67109120
	.word	enemy0
	.word	collision
	.word	minor1s
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L599
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	ldr	r4, .L599+4
	sub	sp, sp, #16
	beq	.L342
.L343:
	ldr	r3, .L599
	ldrh	r3, [r3, #48]
	ands	r2, r3, #128
	bne	.L347
	ldr	r3, [r4]
	ldr	r0, [r4, #20]
	ldr	ip, [r4, #8]
	add	r1, r3, r0
	add	r1, r1, ip
	cmp	r1, #256
	ble	.L581
.L348:
	ldr	r1, .L599+8
	ldr	r2, [r1]
	sub	r3, r3, r2
	cmp	r3, #79
	movgt	r3, #1
	movle	r3, #0
	cmp	r2, #95
	movgt	r3, #0
	cmp	r3, #0
	ldrne	r3, [r4, #8]
	addne	r2, r3, r2
	strne	r2, [r1]
.L347:
	ldr	r3, .L599
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L352
	ldr	r5, .L599+12
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #12]
	ldr	r1, [r5]
	sub	ip, r2, r0
	cmp	ip, r1
	ldr	ip, [r4, #16]
	bge	.L582
.L353:
	ldr	r0, .L599+16
	ldr	r3, [r0]
	add	r2, r2, ip
	add	r1, r3, r1
	sub	r2, r2, r1
	cmp	r2, #120
	movle	r2, #1
	movgt	r2, #0
	cmp	r3, #0
	movle	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #12]
	subne	r3, r3, r2
	strne	r3, [r0]
.L352:
	ldr	r3, .L599
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L357
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #16]
	ldr	ip, [r4, #12]
	add	r1, r2, r0
	add	r1, r1, ip
	cmp	r1, #1024
	ble	.L583
.L358:
	ldr	r0, .L599+16
	ldr	r3, .L599+12
	ldr	r1, [r0]
	ldr	r3, [r3]
	add	r3, r1, r3
	sub	r2, r2, r3
	cmp	r2, #119
	movle	r2, #0
	movgt	r2, #1
	cmp	r1, #272
	movge	r2, #0
	cmp	r2, #0
	ldrne	r3, [r4, #12]
	addne	r1, r3, r1
	strne	r1, [r0]
.L357:
	ldr	r3, .L599
	ldrh	r3, [r3, #48]
	ands	r2, r3, #256
	ldr	r3, [r4, #200]
	bne	.L364
	ldr	r1, [r4, #196]
	cmp	r1, #0
	bne	.L584
.L365:
	ldr	r2, [r4, #192]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	ldr	r5, .L599+20
	ldrh	ip, [r5]
	strle	r3, [r4, #196]
	strle	r3, [r4, #188]
	strle	r2, [r4, #204]
	tst	ip, #512
	beq	.L367
	ldr	r3, .L599+24
	ldrh	r3, [r3]
	ands	r3, r3, #512
	beq	.L585
.L367:
	ldr	r3, [r4, #228]
	cmp	r3, #0
	ldr	r3, [r4, #232]
	addne	r3, r3, #1
	strne	r3, [r4, #232]
	cmp	r3, #59
	ldr	lr, [r4, #224]
	ble	.L371
	mov	r1, #0
	mov	r3, #1
	ldr	r0, [r4, #216]
	cmp	r0, r1
	str	r1, [r4, #232]
	str	r1, [r4, #228]
	str	r3, [r4, #236]
	ble	.L371
	mov	r3, r1
	ldr	r2, [r4, #48]
.L374:
	cmp	r2, #19
	movle	r1, #1
	add	r3, r3, #1
	addle	r2, r2, r1
	cmp	r0, r3
	bne	.L374
	cmp	r1, #0
	strne	r2, [r4, #48]
.L371:
	cmp	lr, #0
	ldr	r3, [r4, #220]
	bne	.L368
.L375:
	ldr	r2, [r4, #212]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	strle	r3, [r4, #220]
	strle	r3, [r4, #224]
	ldr	r3, .L599
	strle	r2, [r4, #208]
	ldrh	r2, [r3, #48]
	ldrh	r3, [r3, #48]
	mvn	r2, r2
	mvn	r3, r3
	and	r2, r2, #32
	and	r3, r3, #16
	cmp	r2, r3
	beq	.L377
	tst	ip, #1
	bne	.L586
.L377:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	ldr	r3, [r4, #96]
	bne	.L587
.L379:
	cmp	r3, #19
	ble	.L389
	mov	r3, #0
	mov	r1, #1
	mov	ip, #0
	ldr	r2, .L599+28
	ldr	r0, [r2, #56]
	cmp	r0, r3
	str	r1, [r4, #12]
	str	r1, [r4, #8]
	ldr	r0, [r4, #104]
	ldrne	r1, [r2]
	str	r3, [r4, #96]
	str	r3, [r4, #52]
	str	r3, [r4, #92]
	strne	r3, [r2, #56]
	ldr	r3, .L599+32
	subne	r1, r1, r0
	strne	r1, [r2]
	add	r1, r3, #300
.L388:
	ldr	r2, [r3, #56]
	cmp	r2, #0
	ldrne	r2, [r3]
	subne	r2, r2, r0
	strne	ip, [r3, #56]
	strne	r2, [r3]
	add	r3, r3, #100
	cmp	r1, r3
	bne	.L388
.L389:
	ldr	r3, [r4, #112]
	cmp	r3, #0
	ldr	r2, [r4, #88]
	ldr	r3, [r4, #108]
	beq	.L385
	mov	ip, #0
	mov	r0, #195
	mov	r7, #49152
	mov	r6, #149
	mov	lr, #2
	ldr	r1, .L599
	strh	ip, [r1, #10]	@ movhi
	strh	r7, [r1, #8]	@ movhi
	strh	r0, [r1, #10]	@ movhi
	ldr	r1, .L599+36
	add	r0, r2, #992
	sub	r0, r0, r3
	str	ip, [r4, #112]
	strh	r0, [r1, #140]	@ movhi
	strh	r6, [r1, #136]	@ movhi
	strh	lr, [r1, #138]	@ movhi
.L385:
	cmp	r2, r3
	bgt	.L390
	mov	r3, #0
	mov	r2, #1
	mov	r0, #149
	mov	r1, #2
	ldr	ip, .L599
	strh	r3, [ip, #10]	@ movhi
	str	r3, [r4, #108]
	str	r3, [r4, #112]
	str	r2, [r4, #100]
	ldr	r3, .L599+36
	ldr	r2, .L599+40
	strh	r0, [r3, #136]	@ movhi
	strh	r1, [r3, #138]	@ movhi
	strh	r2, [r3, #140]	@ movhi
.L390:
	ldrh	r1, [r5]
	ldr	r3, .L599
	ands	r0, r1, #1
	ldrh	r3, [r3, #48]
	beq	.L391
	ldr	r2, .L599+24
	ldrh	r2, [r2]
	and	r3, r3, #64
	and	r2, r2, #1
	orrs	r3, r2, r3
	beq	.L588
.L391:
	ldr	r3, [r4, #120]
	cmp	r3, #0
	ldr	r3, [r4, #124]
	bne	.L589
.L393:
	cmp	r3, #39
	ble	.L392
	mov	r3, #0
	mov	r2, #1
	str	r3, [r4, #124]
	str	r3, [r4, #52]
	str	r3, [r4, #120]
	str	r2, [r4, #12]
	str	r2, [r4, #8]
.L392:
	ldr	r3, [r4, #140]
	cmp	r3, #0
	ldr	r3, [r4, #136]
	ldr	r2, [r4, #116]
	addne	r3, r3, #1
	strne	r3, [r4, #136]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	strle	r3, [r4, #136]
	strle	r3, [r4, #140]
	ldr	r3, .L599
	strle	r2, [r4, #128]
	cmp	r0, #0
	ldrh	r3, [r3, #48]
	beq	.L400
	ldr	r2, .L599+24
	ldrh	r2, [r2]
	and	r3, r3, #128
	and	r2, r2, #1
	orrs	r3, r2, r3
	beq	.L590
.L400:
	ldr	r3, [r4, #148]
	cmp	r3, #0
	ldr	r3, [r4, #152]
	bne	.L591
.L402:
	cmp	r3, #39
	ble	.L412
	mov	r3, #0
	mov	ip, #1
	mov	r6, #0
	ldr	r2, .L599+28
	ldr	lr, [r2, #60]
	cmp	lr, r3
	str	ip, [r4, #12]
	str	ip, [r4, #8]
	ldr	lr, [r4, #160]
	ldrne	ip, [r2]
	str	r3, [r4, #152]
	str	r3, [r4, #52]
	str	r3, [r4, #148]
	strne	r3, [r2, #60]
	ldr	r3, .L599+32
	subne	ip, ip, lr
	strne	ip, [r2]
	add	ip, r3, #300
.L411:
	ldr	r2, [r3, #60]
	cmp	r2, #0
	ldrne	r2, [r3]
	subne	r2, r2, lr
	strne	r6, [r3, #60]
	strne	r2, [r3]
	add	r3, r3, #100
	cmp	ip, r3
	bne	.L411
.L412:
	ldr	r3, [r4, #168]
	cmp	r3, #0
	ldr	r3, [r4, #164]
	ldr	r2, [r4, #144]
	addne	r3, r3, #1
	strne	r3, [r4, #164]
	cmp	r2, r3
	movle	r3, #0
	movle	r2, #1
	strle	r3, [r4, #164]
	strle	r3, [r4, #168]
	strle	r2, [r4, #156]
	cmp	r0, #0
	beq	.L414
	ldr	r3, .L599+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L592
.L414:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	movne	r2, #0
	ldr	r3, [r4, #60]
	addne	r3, r3, #1
	strne	r3, [r4, #60]
	strne	r2, [r4, #64]
	cmp	r3, #29
	ble	.L415
	mov	r3, #0
	mov	lr, #0
	ldr	r2, .L599+28
	ldr	r0, [r2, #64]
	cmp	r0, r3
	ldrne	r0, [r2]
	ldr	ip, [r4, #68]
	str	r3, [r4, #60]
	str	r3, [r4, #52]
	str	r3, [r4, #56]
	strne	r3, [r2, #64]
	ldr	r3, .L599+32
	subne	r0, r0, ip
	strne	r0, [r2]
	add	r0, r3, #300
.L419:
	ldr	r2, [r3, #64]
	cmp	r2, #0
	ldrne	r2, [r3]
	subne	r2, r2, ip
	strne	lr, [r3, #64]
	strne	r2, [r3]
	add	r3, r3, #100
	cmp	r0, r3
	bne	.L419
	mov	r3, #1
	str	r3, [r4, #64]
.L415:
	ldr	r3, .L599
	ldrh	r2, [r3, #48]
	ldrh	r3, [r3, #48]
	mvn	r2, r2
	mvn	r3, r3
	and	r2, r2, #32
	and	r3, r3, #16
	cmp	r2, r3
	and	r1, r1, #2
	beq	.L420
	cmp	r1, #0
	bne	.L593
.L420:
	ldr	r3, [r4, #172]
	cmp	r3, #0
	movne	r2, #0
	ldr	r3, [r4, #176]
	addne	r3, r3, #1
	strne	r3, [r4, #176]
	strne	r2, [r4, #180]
	cmp	r3, #14
	ble	.L424
	mov	r3, #0
	ldr	r2, .L599+124
	str	r3, [r4, #176]
	str	r3, [r4, #52]
	str	r3, [r4, #172]
	str	r3, [r2, #24]
.L424:
	cmp	r1, #0
	beq	.L425
	ldr	r3, .L599+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L594
.L425:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	ldr	r3, [r4, #76]
	bne	.L437
.L431:
	cmp	r3, #29
	ble	.L432
	mov	r3, #0
	mov	r2, #1
	str	r3, [r4, #76]
	str	r3, [r4, #52]
	str	r3, [r4, #72]
	str	r2, [r4, #80]
.L432:
	mov	r9, #1
	ldr	r5, .L599+44
	ldr	r8, .L599+120
	ldr	r10, .L599+28
	add	r7, r5, #176
.L436:
	ldr	r6, [r5, #24]
	cmp	r6, #0
	beq	.L595
.L434:
	add	r5, r5, #44
	cmp	r7, r5
	bne	.L436
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L585:
	ldr	r2, [r4, #208]
	cmp	r2, #0
	beq	.L367
	mov	r2, #1
	str	r3, [r4, #236]
	str	r3, [r4, #208]
	str	r2, [r4, #228]
	str	r2, [r4, #224]
	str	r2, [r4, #232]
	ldr	r3, [r4, #220]
.L368:
	add	r3, r3, #1
	str	r3, [r4, #220]
	b	.L375
.L595:
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L434
	ldr	r2, [r4, #188]
	ldr	r3, [r5, #16]
	cmp	r2, #0
	rsb	r3, r3, #0
	stm	r5, {r3, r6}
	ldreq	r2, [r10, #116]
	ldreq	r3, [r4, #48]
	subeq	r3, r3, r2
	str	r9, [r5, #24]
	str	r6, [r5, #28]
	str	r6, [r5, #32]
	str	r6, [r5, #36]
	str	r6, [r5, #40]
	streq	r3, [r4, #48]
	b	.L434
.L598:
	ldr	r1, [r4, #28]
	cmp	r1, #1
	beq	.L596
	cmp	r1, #0
	bne	.L428
	mov	r3, #44
	mov	ip, #1
	mul	r3, r5, r3
	ldm	r4, {r0, r1}
	ldr	lr, [r4, #16]
	add	r0, r0, #8
	add	r1, r1, lr
	str	r0, [r2, r3]
	sub	r1, r1, #1
	add	r3, r2, r3
	str	r1, [r3, #4]
	str	ip, [r3, #32]
.L428:
	mov	r1, #44
	mov	r3, #0
	mla	r2, r1, r5, r2
	str	r3, [r2, #24]
.L429:
	ldr	r3, [r4, #76]
.L437:
	add	r3, r3, #1
	str	r3, [r4, #76]
	b	.L431
.L364:
	cmp	r3, #0
	blt	.L365
	mov	r1, #0
	mov	r2, #1
	sub	r3, r3, #1
	cmp	r3, r1
	str	r3, [r4, #200]
	str	r1, [r4, #188]
	str	r2, [r4, #204]
	streq	r2, [r4, #196]
	b	.L365
.L593:
	ldr	r3, .L599+24
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L420
	ldr	r3, [r4, #180]
	cmp	r3, #0
	beq	.L420
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #120]
	ldr	r0, [r4, #56]
	orr	r2, r2, r3
	ldr	r3, [r4, #72]
	ldr	r6, [r4, #92]
	orr	r2, r2, r0
	orr	r2, r2, r3
	orrs	r6, r2, r6
	bne	.L420
	ldr	r3, .L599+48
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L599+52
	ldr	r3, .L599+56
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r2, [r4, #28]
	cmp	r2, r0
	str	r6, [r4, #176]
	str	r0, [r4, #52]
	str	r0, [r4, #172]
	beq	.L597
	cmp	r2, #0
	bne	.L422
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #4]
	ldr	r1, [r4]
	add	r3, r3, r2
	ldr	r2, .L599+124
	sub	r3, r3, #1
	add	r1, r1, #8
	str	r3, [r2, #4]
	str	r0, [r2, #32]
	str	r1, [r2]
.L422:
	mov	r2, #0
	mov	r3, #1
	ldrh	r1, [r5]
	str	r2, [r4, #180]
	str	r3, [r4, #176]
	and	r1, r1, #2
	b	.L424
.L586:
	ldr	r3, .L599+24
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L377
	ldr	r3, [r4, #100]
	cmp	r3, #0
	beq	.L377
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #120]
	ldr	r1, [r4, #56]
	orr	r2, r2, r3
	ldr	r3, [r4, #72]
	ldr	r6, [r4, #172]
	orr	r2, r2, r1
	orr	r2, r2, r3
	orrs	r6, r2, r6
	bne	.L377
	ldr	r3, .L599+60
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L599+64
	ldr	r3, .L599+56
	mov	lr, pc
	bx	r3
	mov	r3, #1
	mov	r2, #5
	mov	ip, r3
	str	r6, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #52]
	str	r3, [r4, #92]
	str	r3, [r4, #112]
	b	.L378
.L594:
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #120]
	ldr	r1, [r4, #92]
	orr	r2, r2, r3
	ldr	r3, [r4, #56]
	ldr	r5, [r4, #172]
	orr	r2, r2, r1
	orr	r2, r2, r3
	orrs	r5, r2, r5
	bne	.L425
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L425
	ldr	r3, .L599+68
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L599+72
	ldr	r3, .L599+56
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L599+76
	mov	r3, r2
	str	r5, [r4, #80]
	str	r1, [r4, #52]
	str	r1, [r4, #72]
.L430:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bne	.L598
	add	r5, r5, #1
	cmp	r5, #5
	add	r3, r3, #44
	bne	.L430
	b	.L429
.L592:
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #120]
	ldr	r0, [r4, #92]
	orr	r2, r2, r3
	ldr	r3, [r4, #72]
	ldr	r6, [r4, #172]
	orr	r2, r2, r0
	orr	r2, r2, r3
	orrs	r6, r2, r6
	bne	.L414
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L414
	ldr	r3, .L599+80
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L599+84
	ldr	r3, .L599+56
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r6, [r4, #64]
	str	r3, [r4, #52]
	str	r3, [r4, #56]
	str	r3, [r4, #60]
	ldrh	r1, [r5]
	b	.L415
.L584:
	mov	r1, #1
	add	r3, r3, #2
	str	r3, [r4, #200]
	str	r2, [r4, #204]
	str	r1, [r4, #188]
	b	.L365
.L589:
	mov	r0, #0
	ldr	r2, .L599+88
	add	r3, r3, #1
	smull	ip, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r4, #124]
	str	r0, [r4, #128]
	beq	.L394
	ldrh	r1, [r5]
	and	r0, r1, #1
	b	.L393
.L342:
	add	r0, r4, #16
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #8]
	stm	sp, {r0, ip}
	rsb	r2, r2, #0
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	ldr	r1, .L599+92
	ldr	r3, [r4]
	ldr	r0, [r1]
	ldr	r2, [r4, #4]
	mov	r1, #1024
	ldr	r5, .L599+96
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L343
	ldr	r2, [r4, #8]
	ldr	r3, [r4]
	sub	r3, r3, r2
	ldr	r5, .L599+116
	str	r3, [sp, #4]
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #4]
	ldr	r3, [r5, #28]
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #20]
	ldr	r0, [r5, #24]
	str	r6, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	r6, .L599+120
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #36]
	cmp	r0, #0
	cmpne	r3, #0
	bne	.L343
	ldr	r3, [r4]
	ldr	r1, [r4, #8]
	subs	r2, r3, r1
	movpl	r3, r2
	ldr	r0, .L599+8
	strpl	r2, [r4]
	ldr	r2, [r0]
	sub	r3, r3, r2
	cmp	r3, #80
	movle	r3, #1
	movgt	r3, #0
	cmp	r2, #0
	movle	r3, #0
	cmp	r3, #0
	subne	r2, r2, r1
	strne	r2, [r0]
	b	.L343
.L591:
	add	ip, r3, #1
.L401:
	mov	lr, #0
	ldr	r6, .L599+28
	ldr	r0, [r6, #28]
	ldr	r2, [r6, #24]
	ldr	r1, [r6, #4]
	str	r0, [sp, #12]
	ldr	r0, [r6, #8]
	ldr	r3, [r4, #20]
	str	r2, [sp, #8]
	str	r1, [sp, #4]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	str	r0, [sp]
	ldr	r0, [r4, #4]
	add	r3, r3, #16
	ldr	r7, .L599+120
	add	r2, r2, #16
	sub	r1, r1, #8
	sub	r0, r0, #8
	str	ip, [r4, #152]
	str	lr, [r4, #156]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #1
	mov	r9, #1
	strne	r3, [r6, #60]
	ldr	r6, .L599+32
	add	r8, r6, #300
.L405:
	add	ip, r6, #24
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r6, #4]
	str	ip, [sp, #8]
	ldr	r1, [r4]
	ldr	ip, [r6, #8]
	ldr	r0, [r4, #4]
	stm	sp, {ip, lr}
	add	r3, r3, #16
	add	r2, r2, #16
	sub	r1, r1, #8
	sub	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r9, [r6, #60]
	add	r6, r6, #100
	cmp	r8, r6
	bne	.L405
	ldrh	r1, [r5]
	ldr	r3, [r4, #152]
	and	r0, r1, #1
	b	.L402
.L587:
	add	ip, r3, #1
.L378:
	mov	lr, #0
	ldr	r6, .L599+28
	ldmib	r6, {r2, r3}
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r7, .L599+120
	str	ip, [r4, #96]
	str	lr, [r4, #100]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #1
	mov	r9, #1
	strne	r3, [r6, #56]
	ldr	r6, .L599+32
	add	r8, r6, #300
.L382:
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldmib	r6, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r9, [r6, #56]
	add	r6, r6, #100
	cmp	r8, r6
	bne	.L382
	ldr	r3, [r4, #96]
	b	.L379
.L581:
	stmib	sp, {r0, r2, ip}
	ldr	r1, [r4, #16]
	ldr	lr, .L599+92
	ldr	r2, [r4, #4]
	ldr	r0, [lr]
	ldr	r5, .L599+96
	str	r1, [sp]
	mov	r1, #1024
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldr	r3, [r4]
	ldrne	r2, [r4, #8]
	addne	r3, r3, r2
	strne	r3, [r4]
	b	.L348
.L582:
	rsb	r0, r0, #0
	ldr	r1, [r4, #20]
	str	r3, [sp, #12]
	str	ip, [sp]
	ldr	lr, .L599+92
	str	r0, [sp, #8]
	ldr	r3, [r4]
	ldr	r0, [lr]
	ldr	r6, .L599+96
	str	r1, [sp, #4]
	mov	r1, #1024
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, [r4, #4]
	ldrne	r3, [r4, #12]
	subne	r2, r2, r3
	ldreq	r1, [r5]
	ldreq	r2, [r4, #4]
	ldrne	r1, [r5]
	strne	r2, [r4, #4]
	ldr	ip, [r4, #16]
	b	.L353
.L583:
	ldr	r1, [r4, #20]
	str	r3, [sp, #12]
	ldr	lr, .L599+92
	str	ip, [sp, #8]
	str	r0, [sp]
	ldr	r3, [r4]
	ldr	r0, [lr]
	ldr	r5, .L599+96
	str	r1, [sp, #4]
	mov	r1, #1024
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L359
.L580:
	ldr	r2, [r4, #4]
	b	.L358
.L590:
	ldr	r3, [r4, #156]
	cmp	r3, #0
	beq	.L400
	ldr	r2, [r4, #120]
	ldr	r3, [r4, #92]
	ldr	ip, [r4, #56]
	orr	r3, r3, r2
	ldr	r2, [r4, #72]
	ldr	r6, [r4, #172]
	orr	r3, r3, ip
	orr	r3, r3, r2
	orrs	r6, r3, r6
	bne	.L400
	ldr	r3, .L599+100
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L599+104
	ldr	r3, .L599+56
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r6, [r4, #12]
	mov	ip, r3
	str	r6, [r4, #8]
	str	r3, [r4, #52]
	str	r3, [r4, #148]
	str	r3, [r4, #168]
	b	.L401
.L588:
	ldr	r3, [r4, #128]
	cmp	r3, #0
	beq	.L391
	ldr	r2, [r4, #148]
	ldr	r3, [r4, #92]
	ldr	ip, [r4, #56]
	orr	r3, r3, r2
	ldr	r2, [r4, #72]
	ldr	r6, [r4, #172]
	orr	r3, r3, ip
	orr	r3, r3, r2
	orrs	r6, r3, r6
	bne	.L391
	ldr	r3, .L599+108
	ldr	r0, .L599+112
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r3, .L599+56
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldrh	r1, [r5]
	str	r6, [r4, #12]
	str	r6, [r4, #8]
	str	r6, [r4, #128]
	str	r3, [r4, #52]
	str	r3, [r4, #120]
	str	r3, [r4, #140]
	str	r3, [r4, #124]
	and	r0, r1, r3
	b	.L392
.L394:
	ldr	r6, .L599+28
	add	r0, r6, #24
	ldm	r0, {r0, r1}
	ldr	lr, [r6, #4]
	ldr	ip, [r6, #8]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	add	r3, r3, #16
	add	r2, r2, #16
	stm	sp, {ip, lr}
	ldr	r7, .L599+120
	sub	r1, r1, #8
	sub	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r6]
	ldrne	r2, [r4, #132]
	subne	r3, r3, r2
	strne	r3, [r6]
	ldr	r6, .L599+32
	add	r8, r6, #300
.L397:
	add	ip, r6, #24
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r6, #4]
	str	ip, [sp, #8]
	ldr	r1, [r4]
	ldr	ip, [r6, #8]
	ldr	r0, [r4, #4]
	add	r3, r3, #16
	add	r2, r2, #16
	stm	sp, {ip, lr}
	sub	r1, r1, #8
	sub	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r6]
	ldrne	r2, [r4, #132]
	subne	r3, r3, r2
	strne	r3, [r6]
	add	r6, r6, #100
	cmp	r8, r6
	bne	.L397
	ldrh	r1, [r5]
	ldr	r3, [r4, #124]
	and	r0, r1, #1
	b	.L393
.L600:
	.align	2
.L599:
	.word	67109120
	.word	player
	.word	vOff
	.word	hOfflimit
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	enemy0
	.word	minor1s
	.word	shadowOAM
	.word	1002
	.word	eyeballs
	.word	waveSound_length
	.word	waveSound_data
	.word	playSoundB
	.word	dashSound_length
	.word	dashSound_data
	.word	fireballSound_length
	.word	fireballSound_data
	.word	fireballs
	.word	meleeSound_length
	.word	meleeSound_data
	.word	1717986919
	.word	.LANCHOR0
	.word	collisionCheck
	.word	slamSound_length
	.word	slamSound_data
	.word	swingSound_length
	.word	swingSound_data
	.word	blockers
	.word	collision
	.word	wave
.L359:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #4]
	add	r3, r3, r2
	ldr	r5, .L599+116
	str	r3, [sp]
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #16]
	ldr	ip, [r4]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	r6, [sp, #12]
	stmib	sp, {ip, lr}
	ldr	r6, .L599+120
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #16]
	cmp	r0, #0
	cmpne	r3, #0
	bne	.L580
	ldr	r3, [r4, #4]
	ldr	ip, [r4, #12]
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4]
	add	r3, r3, ip
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	r3, [r5, #48]
	ldr	r2, [r5, #52]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #44]
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #56]
	cmp	r0, #0
	cmpne	r3, #0
	bne	.L580
	ldr	r3, [r4, #4]
	ldr	ip, [r4, #12]
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4]
	add	r3, r3, ip
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	r3, [r5, #68]
	ldr	r2, [r5, #72]
	ldr	r1, [r5, #60]
	ldr	r0, [r5, #64]
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #76]
	cmp	r0, #0
	cmpne	r3, #0
	ldr	r2, [r4, #4]
	ldreq	r3, [r4, #12]
	addeq	r2, r2, r3
	streq	r2, [r4, #4]
	b	.L358
.L597:
	ldr	r3, .L599+124
	ldr	r0, [r4, #4]
	ldr	r1, [r3, #20]
	sub	r0, r0, r1
	ldr	r1, [r4]
	add	r1, r1, #8
	str	r2, [r3, #28]
	str	r0, [r3, #4]
	str	r1, [r3]
	b	.L422
.L596:
	mov	r3, #44
	mul	r3, r5, r3
	ldr	ip, [r4]
	add	r0, r2, r3
	add	ip, ip, #8
	ldr	lr, [r0, #20]
	str	ip, [r2, r3]
	ldr	r3, [r4, #4]
	sub	r3, r3, lr
	str	r1, [r0, #28]
	str	r3, [r0, #4]
	b	.L428
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy0
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy0, %function
updateEnemy0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L603
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bxne	lr
	b	updateEnemy0.part.0
.L604:
	.align	2
.L603:
	.word	enemy0
	.size	updateEnemy0, .-updateEnemy0
	.align	2
	.global	updateMinor1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMinor1, %function
updateMinor1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #52]
	cmp	r3, #0
	bxne	lr
	b	updateMinor1.part.0
	.size	updateMinor1, .-updateMinor1
	.align	2
	.global	updateFireball
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFireball, %function
updateFireball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxne	lr
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #12]
	sub	sp, sp, #20
	beq	.L610
	sub	r1, r3, r2
	str	r1, [r0, #4]
	sub	r3, r1, r2
.L611:
	ldr	r0, .L634
	ldr	ip, [r0]
	cmp	ip, r3
	movlt	r3, #0
	movge	r3, #1
	ldr	r0, [r4, #20]
	add	ip, ip, #508
	add	r6, r0, r1
	add	r2, r6, r2
	add	ip, ip, #3
	cmp	ip, r2
	movge	ip, r3
	orrlt	ip, r3, #1
	ldr	r3, .L634+4
	ldr	lr, [r4]
	ldr	r2, [r3]
	add	r3, r2, lr, lsl #10
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	ldr	r7, [r4, #16]
	cmp	r3, #0
	add	r3, lr, r7
	sub	r3, r3, #1
	add	r2, r2, r3, lsl #10
	ldrb	r6, [r2, r6]	@ zero_extendqisi2
	ldr	r5, .L634+8
	moveq	ip, #1
	stm	sp, {r1, lr}
	cmp	r6, #0
	str	r7, [sp, #12]
	str	r0, [sp, #8]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r7, .L634+12
	movne	r6, ip
	moveq	r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L613
	ldr	r3, [r5, #16]
	cmp	r3, #0
	movne	r6, #1
.L613:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #52]
	ldr	r3, [r5, #48]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #44]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L614
	ldr	r0, [r5, #64]
	ldr	r1, [r5, #60]
	ldr	r2, [r5, #72]
	ldr	r3, [r5, #68]
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	ldr	r8, [r4, #20]
	ldr	r9, [r4, #16]
.L615:
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L617
	ldr	r3, [r5, #76]
	cmp	r3, #0
	beq	.L617
.L618:
	mov	r3, #0
	mov	r2, #1
	str	r3, [r4, #28]
	str	r2, [r4, #24]
	str	r3, [r4, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L610:
	ldr	r1, [r0, #32]
	cmp	r1, #0
	addne	r1, r3, r2
	strne	r1, [r0, #4]
	moveq	r1, r3
	subeq	r3, r3, r2
	b	.L611
.L614:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	ldr	r0, [r5, #64]
	ldr	r1, [r5, #60]
	ldr	r2, [r5, #72]
	ldr	r3, [r5, #68]
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	ldr	r8, [r4, #20]
	ldr	r9, [r4, #16]
	beq	.L615
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r7
	b	.L618
.L617:
	cmp	r6, #0
	bne	.L618
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L635:
	.align	2
.L634:
	.word	hOfflimit
	.word	.LANCHOR0
	.word	blockers
	.word	collision
	.size	updateFireball, .-updateFireball
	.align	2
	.global	updateEyeball
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEyeball, %function
updateEyeball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	push	{r4, r5, lr}
	ldr	ip, [r0, #4]
	ldr	r5, [r0, #12]
	ldr	r1, [r0]
	ldr	r4, [r0, #8]
	cmp	r3, #0
	subne	r2, r1, r4
	subne	r3, ip, r5
	bne	.L638
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L649
	ldr	r3, [r0, #32]
	cmp	r3, #0
	addne	r2, ip, r5
	movne	r3, ip
	strne	r2, [r0, #4]
	movne	ip, r2
	ldr	r2, [r0, #36]
	subeq	r3, ip, r5
	cmp	r2, #0
	beq	.L642
.L650:
	sub	r1, r1, r4
	str	r1, [r0]
	sub	r2, r1, r4
.L638:
	cmp	r2, #0
	movgt	r2, #0
	movle	r2, #1
	ldr	lr, .L651
	ldr	lr, [lr]
	cmp	lr, r3
	orrge	r2, r2, #1
	ldr	r3, [r0, #20]
	add	lr, lr, #508
	add	r3, ip, r3
	add	lr, lr, #3
	add	r3, r3, r5
	cmp	lr, r3
	movge	r3, r2
	orrlt	r3, r2, #1
	ldr	r2, [r0, #16]
	add	r1, r1, r2
	add	r1, r1, r4
	cmp	r1, #255
	orrgt	r3, r3, #1
	cmp	r3, #0
	beq	.L636
	mov	r3, #0
	mov	r2, #1
	str	r3, [r0, #28]
	str	r2, [r0, #24]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	str	r3, [r0, #40]
.L636:
	pop	{r4, r5, lr}
	bx	lr
.L649:
	ldr	r2, [r0, #36]
	sub	ip, ip, r5
	cmp	r2, #0
	str	ip, [r0, #4]
	sub	r3, ip, r5
	bne	.L650
.L642:
	ldr	r2, [r0, #40]
	cmp	r2, #0
	addne	lr, r1, r4
	movne	r2, r1
	strne	lr, [r0]
	movne	r1, lr
	subeq	r2, r1, r4
	b	.L638
.L652:
	.align	2
.L651:
	.word	hOfflimit
	.size	updateEyeball, .-updateEyeball
	.align	2
	.global	updateWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWave, %function
updateWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L674
	ldr	r3, [r2, #24]
	cmp	r3, #0
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #4]
	ldr	ip, [r2, #12]
	bne	.L673
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L656
	sub	r3, r3, ip
	str	r3, [r2, #4]
.L673:
	sub	r0, r3, ip
.L655:
	ldr	r1, .L674+4
	ldr	r1, [r1]
	cmp	r1, r0
	movlt	r0, #0
	movge	r0, #1
	ldr	lr, [r2, #20]
	add	r1, r1, #508
	add	r3, r3, lr
	add	r1, r1, #3
	add	r3, r3, ip
	cmp	r1, r3
	movge	r3, r0
	orrlt	r3, r0, #1
	cmp	r3, #0
	beq	.L653
	mov	r1, #0
	mov	ip, #1
	ldr	r3, .L674+8
	ldr	lr, [r3, #68]
	cmp	lr, r1
	mov	lr, #0
	ldr	r0, .L674+12
	str	ip, [r2, #24]
	str	r1, [r2, #28]
	str	r1, [r2, #32]
	ldr	ip, [r0, #184]
	ldrne	r2, [r3]
	subne	r2, r2, ip
	strne	r1, [r3, #68]
	strne	r2, [r3]
	ldr	r3, .L674+16
	add	r1, r3, #300
.L661:
	ldr	r2, [r3, #68]
	cmp	r2, #0
	ldrne	r2, [r3]
	subne	r2, r2, ip
	strne	lr, [r3, #68]
	strne	r2, [r3]
	add	r3, r3, #100
	cmp	r1, r3
	bne	.L661
	mov	r3, #1
	str	r3, [r0, #180]
.L653:
	ldr	lr, [sp], #4
	bx	lr
.L656:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L673
	add	r1, r3, ip
	mov	r0, r3
	str	r1, [r2, #4]
	mov	r3, r1
	b	.L655
.L675:
	.align	2
.L674:
	.word	wave
	.word	hOfflimit
	.word	enemy0
	.word	player
	.word	minor1s
	.size	updateWave, .-updateWave
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L703
	ldrh	r3, [r3]
	ldr	r2, .L703+4
	tst	r3, #4
	ldr	r3, [r2]
	beq	.L677
	ldr	r1, .L703+8
	ldrh	r1, [r1]
	tst	r1, #4
	beq	.L698
.L677:
	cmp	r3, #0
	beq	.L678
	mov	r1, #4
	mov	lr, #1
	mov	ip, #600
	mov	r2, #100
	mov	r3, #5
	mov	r0, #2
	mov	r5, #7
	ldr	r4, .L703+12
	str	r1, [r4, #68]
	str	r1, [r4, #84]
	str	r1, [r4, #184]
	str	lr, [r4, #88]
	str	ip, [r4, #192]
	ldr	lr, .L703+16
	ldr	ip, .L703+20
	ldr	r1, .L703+24
	str	r5, [r4, #160]
	str	r0, [r4, #104]
	str	r0, [r4, #132]
	str	r2, [r4, #116]
	str	r2, [r4, #144]
	str	r2, [r4, #212]
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r1]
.L679:
	bl	updatePlayer
	ldr	r3, .L703+28
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bleq	updateEnemy0.part.0
.L680:
	ldr	r0, .L703+32
	bl	updateFireball
	ldr	r0, .L703+36
	bl	updateFireball
	ldr	r0, .L703+40
	bl	updateFireball
	ldr	r0, .L703+44
	bl	updateFireball
	ldr	r0, .L703+48
	bl	updateFireball
	ldr	r0, .L703+52
	bl	updateEyeball
	ldr	r0, .L703+56
	bl	updateEyeball
	ldr	r5, .L703+60
	ldr	r0, .L703+64
	bl	updateEyeball
	ldr	r0, .L703+68
	bl	updateEyeball
	ldr	r3, [r5, #52]
	cmp	r3, #0
	moveq	r0, r5
	bleq	updateMinor1.part.0
.L681:
	ldr	r3, [r5, #152]
	cmp	r3, #0
	ldreq	r0, .L703+72
	bleq	updateMinor1.part.0
.L682:
	ldr	r3, [r5, #252]
	cmp	r3, #0
	ldreq	r0, .L703+76
	bleq	updateMinor1.part.0
.L683:
	bl	updateWave
	ldr	r6, .L703+80
	ldr	r3, [r4, #20]
	ldr	r0, [r4]
	add	r2, r3, r3, lsr #31
	ldr	ip, [r6]
	ldr	r1, [r4, #4]
	add	r2, r0, r2, asr #1
	ldr	r3, [r4, #16]
	add	r2, ip, r2, lsl #10
	add	r2, r2, r1
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L699
.L684:
	add	r2, ip, r0, lsl #10
	add	r2, r2, r1
	add	lr, r3, r3, lsr #31
	ldrb	r2, [r2, lr, asr #1]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L700
.L685:
	ldr	r2, [r4, #20]
	add	r2, r2, r2, lsr #31
	add	r0, r0, r2, asr #1
	add	r3, r1, r3
	add	r3, r3, r0, lsl #10
	ldrb	r0, [ip, r3]	@ zero_extendqisi2
	cmp	r0, #3
	add	r2, ip, r3
	beq	.L701
.L686:
	cmp	r0, #4
	beq	.L702
.L687:
	sub	r1, r1, #488
	sub	r1, r1, #2
	cmp	r1, #21
	bls	.L691
	ldr	r3, .L703+84
	ldrh	r1, [r3]
.L692:
	mov	r3, #67108864
	ldr	r2, .L703+88
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L678:
	mov	r0, #2
	mov	r3, #1
	mov	r1, #3
	mov	r2, #300
	mov	lr, #500
	ldr	r4, .L703+12
	ldr	ip, .L703+20
	str	r0, [r4, #68]
	str	r0, [ip]
	str	r0, [r4, #184]
	ldr	ip, .L703+16
	ldr	r0, .L703+24
	str	lr, [r4, #212]
	str	r3, [r4, #84]
	str	r3, [r4, #104]
	str	r3, [r4, #132]
	str	r3, [ip]
	str	r1, [r4, #160]
	str	r1, [r4, #88]
	str	r1, [r0]
	str	r2, [r4, #116]
	str	r2, [r4, #144]
	str	r2, [r4, #192]
	b	.L679
.L691:
	mov	r3, #0
	mov	r9, #29
	mov	r7, #512
	mov	r2, #128
	mov	lr, #67108864
	mov	r10, #9
	mov	r8, #600
	mov	r6, #200
	mov	ip, #520
	mov	r0, #16
	ldr	fp, .L703+84
	str	r3, [r5, #52]
	str	r3, [r5, #152]
	str	r3, [r5, #252]
	str	r3, [fp]
	mov	r1, r3
	ldr	r3, .L703+92
	str	r9, [r3]
	ldr	r3, .L703+96
	str	r7, [r3]
	ldr	r3, .L703+100
	str	r10, [r5, #4]
	str	r8, [r5, #8]
	str	r6, [r5, #104]
	strh	r3, [lr, #10]	@ movhi
	str	r2, [r5, #204]
	ldr	r3, .L703+104
	ldr	r2, .L703+108
	str	ip, [r4, #4]
	str	r0, [r4]
	str	r2, [r5, #108]
	str	r3, [r5, #208]
	b	.L692
.L702:
	ldr	r3, .L703+112
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L687
	ldr	r3, .L703+116
	ldr	r3, [r3]
	cmp	r3, #7
	ble	.L687
	bl	openBoss
	ldr	r1, [r4, #4]
	b	.L687
.L698:
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r2]
	b	.L677
.L699:
	ldr	r2, .L703+120
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L684
	ldr	r2, .L703+116
	ldr	r2, [r2]
	cmp	r2, #0
	ble	.L684
	bl	openFirst
	ldr	ip, [r6]
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #16]
	b	.L684
.L701:
	ldr	r3, .L703+124
	ldr	r0, [r3]
	cmp	r0, #0
	bne	.L687
	ldr	r0, .L703+116
	ldr	r0, [r0]
	cmp	r0, #4
	ble	.L687
	mov	r0, #1
	mov	lr, #60
	str	r0, [r3]
	ldr	r7, .L703+128
	ldr	r6, .L703+132
.L688:
	sub	r3, lr, #4
.L689:
	lsl	r0, r3, #1
	ldrh	ip, [r7, r0]
	add	r0, r6, r3, lsl #1
	add	r3, r3, #1
	cmp	r3, lr
	strh	ip, [r0, #8]	@ movhi
	bne	.L689
	cmp	r3, #348
	add	lr, r3, #32
	bne	.L688
	mov	r0, #0
	ldr	r3, .L703+136
	str	r0, [r3, #56]
	ldrb	r0, [r2]	@ zero_extendqisi2
	b	.L686
.L700:
	ldr	r2, .L703+140
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L685
	ldr	r2, .L703+116
	ldr	r2, [r2]
	cmp	r2, #2
	ble	.L685
	bl	openSecond
	ldr	ip, [r6]
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #16]
	b	.L685
.L704:
	.align	2
.L703:
	.word	oldButtons
	.word	cheat
	.word	buttons
	.word	player
	.word	swordPalr
	.word	firePalr
	.word	wavePalr
	.word	enemy0
	.word	fireballs
	.word	fireballs+44
	.word	fireballs+88
	.word	fireballs+132
	.word	fireballs+176
	.word	eyeballs
	.word	eyeballs+44
	.word	minor1s
	.word	eyeballs+88
	.word	eyeballs+132
	.word	minor1s+100
	.word	minor1s+200
	.word	.LANCHOR0
	.word	hOff
	.word	vOff
	.word	screenBlock
	.word	hOfflimit
	.word	23812
	.word	705
	.word	537
	.word	BossOpened
	.word	enemykilled
	.word	door1Opened
	.word	door3Opened
	.word	100718592
	.word	100720640
	.word	blockers
	.word	door2Opened
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L797
	mov	r3, #13
	mov	r1, #9
	mov	r0, #73
	ldr	r2, [r4, #48]
	ldr	r5, .L797+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L706
	ldr	r3, .L797+8
	ldrh	r2, [r3, #16]
	orr	r2, r2, #512
	strh	r2, [r3, #16]	@ movhi
.L707:
	ldr	r2, [r4, #204]
	cmp	r2, #0
	beq	.L738
.L792:
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	ldr	r2, [r4, #236]
	cmp	r2, #0
	beq	.L740
.L793:
	ldrh	r2, [r3, #8]
	orr	r2, r2, #512
	strh	r2, [r3, #8]	@ movhi
.L705:
	pop	{r4, r5, r6, lr}
	bx	lr
.L706:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L708
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	ldr	r3, .L797+8
	sub	r0, r0, ip
	ldr	lr, [r4, #36]
	ldr	ip, [r4, #28]
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, [r4, #204]
	lsl	r1, r1, #12
	add	ip, ip, lr, lsl #5
	and	r0, r0, #255
	orr	r1, r1, ip, lsl #2
	cmp	r2, #0
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	bne	.L792
.L738:
	ldr	r2, .L797+12
	ldr	r1, .L797+16
	ldr	r0, [r2]
	ldr	r1, [r1]
	ldr	r2, [r4, #4]
	add	r1, r1, r0
	sub	r2, r2, r1
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	mov	r0, #404
	ldr	r1, .L797+20
	ldr	ip, [r1]
	ldr	r1, [r4]
	strh	r2, [r3, #2]	@ movhi
	ldr	r2, [r4, #236]
	sub	r1, r1, ip
	and	r1, r1, #255
	cmp	r2, #0
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	bne	.L793
.L740:
	ldr	r2, [r4, #232]
	cmp	r2, #20
	ble	.L744
	cmp	r2, #40
	bgt	.L743
	ldr	r2, .L797+12
	ldr	r1, .L797+16
	ldr	r0, [r2]
	ldr	r1, [r1]
	ldr	r2, [r4, #4]
	add	r1, r1, r0
	sub	r2, r2, r1
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mov	r0, #532
	b	.L791
.L708:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	ldr	lr, [r4, #92]
	ldr	r1, [r4, #120]
	ldr	r0, [r4, #72]
	ldr	r5, [r4, #148]
	beq	.L709
	cmp	lr, #0
	bne	.L710
	ldr	r6, [r4, #172]
	orr	ip, r1, r0
	orr	ip, ip, r5
	orrs	ip, ip, r6
	bne	.L711
	ldr	r3, [r4, #28]
	cmp	r3, #4
	beq	.L794
	cmp	r3, #3
	bne	.L790
	ldr	r3, [r4, #60]
	cmp	r3, #10
	bgt	.L715
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #140
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L743:
	cmp	r2, #60
	bgt	.L705
.L744:
	ldr	r2, .L797+12
	ldr	r1, .L797+16
	ldr	r0, [r2]
	ldr	r1, [r1]
	ldr	r2, [r4, #4]
	add	r1, r1, r0
	sub	r2, r2, r1
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mov	r0, #528
.L791:
	mvn	r2, r2, lsr #17
	ldr	ip, .L797+20
	ldr	r1, [r4]
	ldr	ip, [ip]
	sub	r1, r1, ip
	and	r1, r1, #255
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L709:
	cmp	lr, #0
	beq	.L717
	cmp	r1, #0
	bne	.L718
	ldr	r1, [r4, #172]
	orr	ip, r0, r5
	orrs	r1, ip, r1
	bne	.L719
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L720
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #28
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L711:
	cmp	r1, #0
	beq	.L746
	cmp	r5, #0
	bne	.L790
.L718:
	cmp	r0, #0
	orreq	r3, r1, r5
	bne	.L790
.L788:
	ldr	r1, [r4, #172]
.L726:
	orr	r2, r2, lr
	orrs	r3, r2, r3
	moveq	r3, #1
	movne	r3, #0
	cmp	r1, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L779
.L790:
	ldr	r3, .L797+8
	b	.L707
.L717:
	cmp	r1, #0
	bne	.L795
.L746:
	cmp	r5, #0
	bne	.L796
.L785:
	cmp	r0, #0
	beq	.L788
.L729:
	ldr	r1, [r4, #172]
.L725:
	orr	r2, r2, lr
	orr	r2, r2, r5
	orrs	r3, r2, r1
	bne	.L790
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L732
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+28
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #156
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L710:
	cmp	r1, #0
	bne	.L718
.L719:
	cmp	r5, #0
	beq	.L785
	cmp	r0, #0
	beq	.L790
	b	.L729
.L795:
	cmp	r5, #0
	bne	.L790
	ldr	r3, [r4, #172]
	orrs	r3, r0, r3
	bne	.L718
	ldr	r3, [r4, #124]
	cmp	r3, #10
	bgt	.L722
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #16
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L796:
	cmp	r2, #0
	bne	.L790
	cmp	r0, #0
	ldr	r1, [r4, #172]
	bne	.L725
	cmp	r1, #0
	bne	.L751
	ldr	r3, [r4, #152]
	cmp	r3, #10
	bgt	.L727
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+28
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #20
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L779:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L733
	ldr	r3, [r4, #176]
	cmp	r3, #5
	bgt	.L734
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+32
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #284
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L751:
	mov	r3, r5
	b	.L726
.L722:
	cmp	r3, #20
	bgt	.L723
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #144
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L727:
	cmp	r3, #20
	bgt	.L728
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+28
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #148
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L720:
	cmp	r3, #1
	bne	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #24
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L733:
	cmp	r3, #1
	bne	.L790
	ldr	r3, [r4, #176]
	cmp	r3, #5
	bgt	.L736
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+32
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #280
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L732:
	cmp	r3, #1
	bne	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+28
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #152
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L794:
	ldr	r3, [r4, #60]
	cmp	r3, #10
	bgt	.L713
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #136
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L723:
	cmp	r3, #30
	bgt	.L724
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #272
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L728:
	cmp	r3, #40
	bgt	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+28
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #276
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L734:
	cmp	r3, #10
	bgt	.L735
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+32
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #412
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L713:
	cmp	r3, #20
	bgt	.L714
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #264
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L724:
	cmp	r3, #40
	bgt	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #400
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L735:
	cmp	r3, #15
	bgt	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+32
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #540
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L715:
	cmp	r3, #20
	bgt	.L716
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #268
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L736:
	cmp	r3, #10
	bgt	.L737
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+32
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #408
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L714:
	cmp	r3, #30
	bgt	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #8
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L716:
	cmp	r3, #30
	bgt	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+24
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #12
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L737:
	cmp	r3, #15
	bgt	.L790
	ldr	r2, .L797+12
	ldr	r3, .L797+16
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L797+20
	ldr	r3, .L797+32
	ldr	ip, [r1]
	ldr	r0, [r4]
	ldr	r1, [r3]
	sub	r0, r0, ip
	ldr	r3, .L797+8
	lsl	r1, r1, #12
	and	r0, r0, #255
	orr	r1, r1, #536
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L707
.L798:
	.align	2
.L797:
	.word	player
	.word	drawDigits0
	.word	shadowOAM
	.word	hOfflimit
	.word	hOff
	.word	vOff
	.word	swordPalr
	.word	firePalr
	.word	wavePalr
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemy0
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy0, %function
drawEnemy0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L803
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L800
	ldr	r2, .L803+4
	ldrh	r3, [r2, #64]
	orr	r3, r3, #512
	strh	r3, [r2, #64]	@ movhi
	bx	lr
.L800:
	b	drawEnemy0.part.0
.L804:
	.align	2
.L803:
	.word	enemy0
	.word	shadowOAM
	.size	drawEnemy0, .-drawEnemy0
	.align	2
	.global	drawMinor1s
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMinor1s, %function
drawMinor1s:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r8, #920
	ldr	r2, .L812
	ldr	r3, .L812+4
	ldr	ip, [r2]
	ldr	r3, [r3]
	ldr	r2, .L812+8
	add	ip, ip, r3
	ldr	r3, .L812+12
	ldrh	r7, [r2]
	lsl	ip, ip, #16
	ldr	r2, .L812+16
	ldr	r6, .L812+20
	ldr	r5, .L812+24
	lsr	ip, ip, #16
	add	r4, r3, #300
.L809:
	ldr	r1, [r3, #52]
	cmp	r1, #0
	and	lr, r5, #32768
	beq	.L806
	ldrh	r1, [r2, #184]
	orr	r1, r1, #512
	strh	r1, [r2, #184]	@ movhi
.L807:
	add	r3, r3, #100
	cmp	r3, r4
	add	r2, r2, #8
	bne	.L809
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L806:
	ldmib	r3, {r0, r1}
	ldr	r9, [r3, #72]
	sub	r1, r1, ip
	and	r1, r1, r6
	sub	r0, r0, r7
	cmp	r9, #0
	orr	r1, lr, r1
	and	r0, r0, #255
	bne	.L808
	ldr	r9, [r3, #44]
	ldr	lr, [r3, #36]
	add	lr, lr, r9, lsl #5
	add	lr, lr, #164
	lsl	lr, lr, #2
	strh	r0, [r2, #184]	@ movhi
	strh	r1, [r2, #186]	@ movhi
	strh	lr, [r2, #188]	@ movhi
	b	.L807
.L808:
	strh	r0, [r2, #184]	@ movhi
	strh	r1, [r2, #186]	@ movhi
	strh	r8, [r2, #188]	@ movhi
	b	.L807
.L813:
	.align	2
.L812:
	.word	hOff
	.word	hOfflimit
	.word	vOff
	.word	minor1s
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawMinor1s, .-drawMinor1s
	.align	2
	.global	drawFireballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFireballs, %function
drawFireballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #384
	ldr	r2, .L820
	ldr	r3, .L820+4
	ldr	ip, [r2]
	ldr	r3, [r3]
	ldr	r2, .L820+8
	add	ip, ip, r3
	ldr	r3, .L820+12
	ldrh	r5, [r2]
	lsl	ip, ip, #16
	ldr	r2, .L820+16
	ldr	r4, .L820+20
	lsr	ip, ip, #16
	add	lr, r3, #220
.L817:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L815
	ldrh	r1, [r2, #24]
	orr	r1, r1, #512
	strh	r1, [r2, #24]	@ movhi
.L816:
	add	r3, r3, #44
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L817
	pop	{r4, r5, r6, lr}
	bx	lr
.L815:
	ldm	r3, {r0, r1}
	sub	r0, r0, r5
	sub	r1, r1, ip
	and	r0, r0, #255
	and	r1, r1, r4
	strh	r6, [r2, #28]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #26]	@ movhi
	b	.L816
.L821:
	.align	2
.L820:
	.word	hOff
	.word	hOfflimit
	.word	vOff
	.word	fireballs
	.word	shadowOAM
	.word	511
	.size	drawFireballs, .-drawFireballs
	.align	2
	.global	drawEyeballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEyeballs, %function
drawEyeballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L828
	ldr	r3, .L828+4
	ldr	ip, [r2]
	ldr	r3, [r3]
	ldr	r2, .L828+8
	add	ip, ip, r3
	ldr	r3, .L828+12
	push	{r4, r5, r6, lr}
	lsl	ip, ip, #16
	ldrh	r6, [r2]
	ldr	r5, .L828+16
	ldr	r2, .L828+20
	ldr	r4, .L828+24
	lsr	ip, ip, #16
	add	lr, r3, #176
.L825:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L823
	ldrh	r1, [r2, #72]
	orr	r1, r1, #512
	strh	r1, [r2, #72]	@ movhi
.L824:
	add	r3, r3, #44
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L825
	pop	{r4, r5, r6, lr}
	bx	lr
.L823:
	ldm	r3, {r0, r1}
	sub	r0, r0, r6
	sub	r1, r1, ip
	and	r0, r0, #255
	and	r1, r1, r5
	strh	r4, [r2, #76]	@ movhi
	strh	r0, [r2, #72]	@ movhi
	strh	r1, [r2, #74]	@ movhi
	b	.L824
.L829:
	.align	2
.L828:
	.word	hOff
	.word	hOfflimit
	.word	vOff
	.word	eyeballs
	.word	511
	.word	shadowOAM
	.word	385
	.size	drawEyeballs, .-drawEyeballs
	.align	2
	.global	drawWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWave, %function
drawWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L841
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L831
	ldr	r2, .L841+4
	ldrh	r3, [r2, #56]
	orr	r3, r3, #512
	strh	r3, [r2, #56]	@ movhi
	bx	lr
.L831:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L833
	mov	ip, #388
	ldr	r2, .L841+8
	ldr	r1, .L841+12
	str	lr, [sp, #-4]!
	ldr	r1, [r1]
	ldr	lr, [r2]
	ldr	r0, .L841+16
	ldr	r2, [r3, #4]
	add	r1, r1, lr
	sub	r2, r2, r1
	ldr	lr, [r0]
	ldr	r1, [r3]
	lsl	r3, r2, #23
	ldr	r0, .L841+4
	sub	r2, r1, lr
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r0, #58]	@ movhi
	strh	r2, [r0, #56]	@ movhi
	strh	ip, [r0, #60]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L833:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, .L841+8
	ldr	r1, .L841+12
	ldr	ip, [r2]
	ldr	r1, [r1]
	ldr	r2, [r3, #4]
	ldr	r0, .L841+16
	add	r1, r1, ip
	sub	r2, r2, r1
	ldr	ip, [r0]
	ldr	r1, [r3]
	lsl	r3, r2, #23
	ldr	r0, .L841+4
	sub	r2, r1, ip
	lsr	r3, r3, #23
	ldr	r1, .L841+20
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r0, #58]	@ movhi
	strh	r2, [r0, #56]	@ movhi
	strh	r1, [r0, #60]	@ movhi
	bx	lr
.L842:
	.align	2
.L841:
	.word	wave
	.word	shadowOAM
	.word	hOfflimit
	.word	hOff
	.word	vOff
	.word	386
	.size	drawWave, .-drawWave
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	ldr	r3, .L857
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L844
	ldr	r4, .L857+4
	ldrh	r3, [r4, #64]
	orr	r3, r3, #512
	strh	r3, [r4, #64]	@ movhi
.L845:
	bl	drawMinor1s
	bl	drawFireballs
	bl	drawEyeballs
	bl	drawWave
	ldr	r3, .L857+8
	ldr	r2, [r3, #180]
	cmp	r2, #0
	moveq	r2, #960
	mov	r1, #15
	ldrne	r2, .L857+12
	strh	r2, [r4, #148]	@ movhi
	ldr	r2, [r3, #128]
	cmp	r2, #0
	moveq	r2, #960
	strh	r1, [r4, #146]	@ movhi
	mov	r0, #149
	mov	r1, #28
	ldrne	r2, .L857+12
	strh	r2, [r4, #156]	@ movhi
	ldr	r2, [r3, #156]
	cmp	r2, #0
	moveq	r2, #960
	strh	r0, [r4, #144]	@ movhi
	strh	r1, [r4, #154]	@ movhi
	mov	r0, #149
	mov	r1, #41
	ldrne	r2, .L857+12
	strh	r2, [r4, #164]	@ movhi
	ldr	r2, [r3, #208]
	cmp	r2, #0
	moveq	r2, #960
	strh	r0, [r4, #152]	@ movhi
	strh	r1, [r4, #162]	@ movhi
	mov	r0, #149
	mov	r1, #54
	ldr	r3, [r3, #196]
	ldrne	r2, .L857+12
	cmp	r3, #0
	moveq	r3, #960
	strh	r0, [r4, #160]	@ movhi
	strh	r1, [r4, #170]	@ movhi
	mov	r0, #149
	mov	r1, #149
	strh	r2, [r4, #172]	@ movhi
	mov	r2, #67
	ldrne	r3, .L857+12
	strh	r0, [r4, #168]	@ movhi
	strh	r1, [r4, #176]	@ movhi
	strh	r2, [r4, #178]	@ movhi
	strh	r3, [r4, #180]	@ movhi
	ldr	r3, .L857+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L857+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L857+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L844:
	bl	drawEnemy0.part.0
	ldr	r4, .L857+4
	b	.L845
.L858:
	.align	2
.L857:
	.word	enemy0
	.word	shadowOAM
	.word	player
	.word	1002
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.global	collisionMap
	.comm	firePalr,4,4
	.comm	wavePalr,4,4
	.comm	swordPalr,4,4
	.comm	cheat,4,4
	.comm	enemykilled,4,4
	.comm	BossOpened,4,4
	.comm	door3Opened,4,4
	.comm	door2Opened,4,4
	.comm	door1Opened,4,4
	.comm	hOfflimit,4,4
	.comm	screenBlock,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	wave,36,4
	.comm	blockers,80,4
	.comm	eyeballs,176,4
	.comm	fireballs,220,4
	.comm	minor1s,300,4
	.comm	enemy0,132,4
	.comm	player,240,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionmapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
