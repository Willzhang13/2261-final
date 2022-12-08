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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	push	{r4, lr}
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+24
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.word	DMANow
	.word	startPal
	.word	startTiles
	.word	100726784
	.word	startMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #7936
	mov	r2, #4864
	ldr	r1, .L8
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r2, .L8+4
	strh	r1, [r3, #10]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #0
	ldr	r3, .L8+8
	ldr	r0, .L8+12
	ldrh	ip, [r3, #48]
	ldr	r2, .L8+16
	ldr	r3, .L8+20
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	23300
	.word	hideSprites
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToIns
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToIns, %function
goToIns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r3, #3728
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+16
	mov	r0, #3
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	stopSound
	.word	DMANow
	.word	insPal
	.word	insTiles
	.word	100726784
	.word	insMap
	.word	state
	.size	goToIns, .-goToIns
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L20
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+4
	mov	lr, pc
	bx	r4
	mov	r3, #864
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L20+12
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L20+20
	ldr	r1, .L20+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L20+28
	ldr	r1, .L20+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L20+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	background0Pal
	.word	UITiles
	.word	100726784
	.word	UIMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L34
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L33
.L22:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToIns
.L32:
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L34+16
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L34+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L23
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.size	start, .-start
	.align	2
	.global	ins
	.syntax unified
	.arm
	.fpu softvfp
	.type	ins, %function
ins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L48
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L37
	ldr	r2, .L48+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L37:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L47
.L36:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToStart
.L46:
	ldr	r3, .L48+8
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L48+12
	ldr	r3, .L48+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L48+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L37
.L49:
	.align	2
.L48:
	.word	oldButtons
	.word	buttons
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.size	ins, .-ins
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #3
	ldr	r2, .L52
	ldr	r3, .L52+4
	ldr	r5, .L52+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L52+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1456
	mov	r2, #100663296
	ldr	r1, .L52+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L52+20
	ldr	r1, .L52+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	pausedPal
	.word	pausedTiles
	.word	100726784
	.word	pausedMap
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L67
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r2, .L67+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L66
.L55:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L66:
	push	{r4, lr}
	ldr	r3, .L67+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L68:
	.align	2
.L67:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	ldr	r2, .L71
	push	{r4, lr}
	ldr	r3, .L71+4
	ldr	r4, .L71+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+12
	mov	lr, pc
	bx	r4
	mov	r3, #2112
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L71+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L71+20
	ldr	r1, .L71+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L71+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L71+36
	ldr	r3, .L71+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	stopSound
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L75
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L76:
	.align	2
.L75:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	ldr	r2, .L79
	push	{r4, lr}
	ldr	r3, .L79+4
	ldr	r4, .L79+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+12
	mov	lr, pc
	bx	r4
	mov	r3, #2160
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L79+20
	ldr	r1, .L79+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L79+36
	ldr	r3, .L79+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	stopSound
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L92+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
.L82:
	ldr	r3, .L92+16
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L90
.L83:
	ldr	r3, .L92+20
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L91
	pop	{r4, lr}
	bx	lr
.L91:
	pop	{r4, lr}
	b	goToLose
.L90:
	bl	goToWin
	b	.L83
.L89:
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L82
.L93:
	.align	2
.L92:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	bossAlive
	.word	playerAlive
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L109
	ldr	fp, .L109+4
	ldr	r3, .L109+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L109+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L109+16
	ldr	r9, .L109+20
	ldr	r8, .L109+24
	ldr	r7, .L109+28
	ldr	r4, .L109+32
.L96:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L105
.L98:
	.word	.L103
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L97
.L97:
	tst	r0, #8
	beq	.L105
	ldr	r3, .L109+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L99:
	tst	r0, #8
	beq	.L105
	ldr	r3, .L109+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L100:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L101:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L102:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L103:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L105:
	mov	r0, r3
	b	.L96
.L110:
	.align	2
.L109:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	ins
	.word	pause
	.word	67109120
	.word	lose.part.0
	.word	win.part.0
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
