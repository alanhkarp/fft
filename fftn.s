	.file "fftn.f"
	.type	fftn_,@function
	.global seconds_
	.type	seconds_,@function
	.global factor_
	.type	factor_,@function
	.global reorderm_
	.type	reorderm_,@function
	.global __F90_PARSE_FMT
	.type	__F90_PARSE_FMT,@function
	.global __F90_START_IO
	.type	__F90_START_IO,@function
	.global __F90_DO_IO_ITEM
	.type	__F90_DO_IO_ITEM,@function
	.global __F90_END_IO
	.type	__F90_END_IO,@function
	.global __F90_F_STOP
	.type	__F90_F_STOP,@function

// Routine 6 ("FFTN"::2)

	.global __milli_div32I
	.type	__milli_div32I,@function
	.global	__milli_div32I
	.hidden		__milli_div32I
	.radix	C

	.psr	abi32

	.psr	msb

	.section .text = "ax", "progbits"
	.proc	fftn_
..L0:
//	$start		CMid981 = 		;; // A

..L2:
fftn_::
//file/line/col fftn.f/4/0
//	$entry		CMid982, r32, r33, r34, r35, r36, r37, r38 =  // A [fftn.f: 4/0]
	mov		r18 = ar.unat		   // M [fftn.f: 4/0]
	add		r11 = 0, sp		   // M [fftn.f: 4/0] [UVU: ]
	add		sp = -432, sp		   // I [fftn.f: 4/0] [UVU: ]
	addp4		r9 = 0, r34		   // M [fftn.f: 4/0] [UVuse]
	addp4		r8 = 0, r35		   // M [fftn.f: 4/0] [UVuse]
	add		r24 = 0, r0		;; // I
	alloc		r40 = ar.pfs, 7, 57, 6, 8  // M [fftn.f: 4/0] [UVU: ]
	add		r14 = -48, r11		   // M [fftn.f: 4/0]
	mov		r43 = pr		   // I [fftn.f: 4/0]
	add		r19 = -80, r11		   // M [fftn.f: 4/0]
	add		r17 = -40, r11		   // M [fftn.f: 4/0]
	add		r44 = -416, r11		;; // I [fftn.f: 4/0]
	add		r60 = 0, r0		   // M [fftn.f: 4/0]
	addp4		r21 = 0, r33		   // M
	mov		r41 = rp		   // I [fftn.f: 4/0]
	add		r15 = -284, r0		   // M
	add		r16 = 300, r0		;; // I
	mov		r42 = ar.lc		;; // I [fftn.f: 4/0]
	st8		[r19] = r18		   // M [fftn.f: 4/0]
	st8.spill	[r14] = r4, 16		   // M [fftn.f: 4/0]
	add		r4 = 0, gp		;; // I
	st8.spill	[r17] = r5, 16		   // M [fftn.f: 4/0]
	st8.spill	[r14] = r6, 16		   // M [fftn.f: 4/0]
	nop.i		0			;; // I
	st8.spill	[r17] = r7, 24		   // M [fftn.f: 4/0]
	stf.spill	[r14] = f2, 16		   // M [fftn.f: 4/0]
//	$fence					   // A [fftn.f: 4/0] [UVU: ]
	nop.i		0			   // I
	ld4		r46 = [r9]		   // M [fftn.f: 4/0]
	ld4		r8 = [r8]		   // M [fftn.f: 4/0]
	nop.i		0			;; // I
	cmp4.gt.unc	p6, p9 = 1, r46		   // M [fftn.f: 23/0]
	add		r9 = 1, r46		   // M
	sxt4		r59 = r8		   // I [fftn.f: 4/0]
	add		r10 = -1, r46		   // M
	add		r8 = 0, r38		   // I
	nop.b		0			;; // B
(p9)	cmp4.ge.unc	p8, p7 = 2, r9		   // M
(p9)	add		r25 = 0, r0		   // M
(p9)	add		r24 = 0, r0		   // I
	cmp.gt.unc	p1, p0 = 0, r59		   // M [fftn.f: 4/0]
	add		r9 = 0, r37		   // M
//file/line/col fftn.f/21/1/E,21/0,22/0,23/0,21/1/E,21/0,22/0,23/0
(p6)	br.dpnt.many	..L4			;; // B [fftn.f: 23/0]

..L69:
(p8)	add		r19 = 0, r0		   // M
	add		r17 = 4, r21		   // M
(p7)	zxt4		r19 = r10		   // I
	add		r11 = 0, r33		   // M
	add		r10 = 0, r36		   // M
	add		r18 = 0, r21		;; // I
	add		r22 = 1, r19		   // M
	add		r14 = 0, r32		;; // I
	extr.u		r20 = r22, 2, 62	;; // I
	cmp4.ge.unc	p6, p0 = r0, r20	   // M
	add		r23 = -1, r20		   // M
(p6)	br.dpnt.many	..L82			;; // B

..L81:
	add		r25 = 0, r0		   // M
	add		r24 = 0, r0		   // M
	mov		ar.lc = r23		   // I
	cmp.ne.or.andcm	p16, p17 = 42, r0	   // M
	cmp.eq.and	p18, p19 = 42, r0	;; // I
	mov		ar.ec = 2		;; // I

..L71:
(p16)	ld4		r23 = [r18], 8		   // M [fftn.f: 24/0]
(p16)	ld4		r21 = [r17], r16	   // M [fftn.f: 24/0]
(p19)	add		r25 = 0, r26		;; // I [fftn.f: 25/0]
(p16)	ld4		r26 = [r18], 4		   // M [fftn.f: 24/0]
(p16)	cmp4.lt.unc	p18, p0 = r23, r25	   // M [fftn.f: 25/0]
(p16)	add		r19 = r24, r23		   // I [fftn.f: 24/0]
(p16)	lfetch		[r17], r15		;; // M [fftn.f: 24/0]
(p18)	add		r23 = 0, r25		   // M [fftn.f: 25/0]
	nop.i		0			   // I
(p16)	ld4		r25 = [r18], 4		   // M [fftn.f: 24/0]
(p16)	add		r19 = r19, r21		;; // I [fftn.f: 24/0]
(p16)	add		r27 = r19, r26		   // I [fftn.f: 24/0]
(p16)	cmp4.lt.unc	p18, p0 = r21, r23	;; // M [fftn.f: 25/0]
(p16)	add		r24 = r27, r25		   // M [fftn.f: 24/0]
(p18)	add		r21 = 0, r23		;; // I [fftn.f: 25/0]
(p16)	cmp4.lt.unc	p18, p0 = r26, r21	   // M [fftn.f: 25/0]
	nop.i		0			;; // I
(p18)	add		r26 = 0, r21		;; // I [fftn.f: 25/0]
(p16)	cmp4.lt.unc	p18, p0 = r25, r26	   // M [fftn.f: 25/0]
	nop.m		0			   // M
//file/line/col fftn.f/24/0,25/0,26/0,25/0,26/0,25/0,26/0,25/0,26/0
	br.ctop.dptk.many ..L71			;; // B [fftn.f: 26/0]

..L79:
	shladd		r15 = r20, 2, r0	   // M
	add		r38 = 0, r8		   // M
	add		r37 = 0, r9		   // I
	add		r36 = 0, r10		   // M
	add		r33 = 0, r11		   // M
	add		r32 = 0, r14		;; // I
	sub		r8 = r22, r15		   // M
	add		r21 = 0, r18		;; // I
	cmp4.ne		p0, p6 = 0, r8		   // I
	add		r19 = -1, r8		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L68			;; // B

..L82:
	add		r8 = 0, r21		   // M
	mov		ar.lc = r19		   // I
	nop.i		0			;; // I

..L75:
//file/line/col fftn.f/24/0
	ld4		r9 = [r8], 4		;; // M [fftn.f: 24/0]
	cmp4.lt		p6, p0 = r9, r25	   // M [fftn.f: 25/0]
	add		r24 = r24, r9		;; // I [fftn.f: 24/0]
//file/line/col fftn.f/25/0
(p6)	add		r9 = 0, r25		;; // M [fftn.f: 25/0]
//file/line/col fftn.f/26/0
	add		r25 = 0, r9		   // M
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.cloop.dptk.many ..L75		;; // B [fftn.f: 26/0]

..L80:

..L68:

..L4:
//file/line/col fftn.f/27/0
	nop.m		0			   // M
	tbit.nz.unc	p6, p0 = r24, 6		   // I [fftn.f: 27/0] [UVuse]
(p6)	br.dpnt.many	..L8			;; // B [fftn.f: 27/0]

..L10:
	and		r9 = 63, r24		   // M [fftn.f: 27/0] [UVuse]
	add		r8 = 1, r0		;; // I [fftn.f: 27/0]
	shl		r69 = r8, r9		;; // I [fftn.f: 27/0]

..L9:
	cmp4.gt.unc	p6, p0 = 1, r46		   // M [fftn.f: 23/0]
//file/line/col fftn.f/28/0[2]
	add		r45 = 1, r0		   // M [fftn.f: 34/0] [UVU: ]
	add		r71 = 20, r44		   // I
	add		r74 = 96, r44		   // M
	add		r72 = 24, r44		   // M
//file/line/col fftn.f/32/0,33/0,34/0,21/1/E,21/0,22/0,23/0,21/1/E,21/0,22/0,23/0
(p6)	br.dpnt.many	..L49			;; // B [fftn.f: 34/0]

..L67:
	addp4		r8 = 0, r33		   // M
	add		r88 = 0, r60		   // M
	add		r75 = 2, r0		   // I
	add		r87 = 0, r69		   // M
	nop.i		0			;; // I
	add		r77 = 0, r8		;; // I

..L16:
//file/line/col fftn.f/35/0
	add		r11 = 128, r44		   // M
	ld4		r14 = [r77], 8		   // M [fftn.f: 35/0]
	add		r15 = 192, r44		   // I
	add		r10 = 256, r44		   // M
	add		r9 = 320, r44		   // M
	add		r8 = 384, r44		;; // I
	lfetch		[r11]			   // M
	lfetch		[r15]			   // M
	tbit.nz		p6, p0 = r14, 6		   // I [fftn.f: 35/0]
	add		r5 = 0, r87		;; // M
	lfetch		[r10]			   // M
	nop.i		0			   // I
	lfetch		[r9]			;; // M
	lfetch		[r8]			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L17			;; // B [fftn.f: 35/0]

..L19:
	and		r8 = 63, r14		   // M [fftn.f: 35/0]
	nop.i		0			;; // I
	shl		r8 = r45, r8		;; // I [fftn.f: 35/0]

..L18:
	add		r51 = 28, r44		   // M
	add		out0 = 32, r44		   // M
	add		r39 = @ltoff(.tcg0$rodata), gp // I [fftn.f: 45/0]
	add		r35 = 50, r0		   // M [fftn.f: 43/0]
	movl		r50 = 0x30c10c27	;; // I [fftn.f: 45/0]
	ld8		r47 = [r39]		   // M [fftn.f: 45/0]
	st4		[r51] = r8		   // M [fftn.f: 35/0] [UVU]
	add		r34 = 2, r0		   // I [fftn.f: 43/0]
	add		r33 = 128, r44		   // M
	stfs		[out0] = f0		   // M [fftn.f: 42/0]
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 42/0] [UVU]
	add		r6 = 16, r44		   // M
	stfs		[r44] = f8		   // M [fftn.f: 42/0] [UVU]
	add		out3 = 36, r44		   // I
	add		out5 = 40, r44		   // M
	add		gp = 0, r4		   // M [fftn.f: 42/0]
	add		out0 = 0, r51		;; // I [fftn.f: 43/0]
	st4		[out3] = r35		   // M [fftn.f: 43/0]
	add		out4 = @gprel(.tcg1$sdata), gp // M [fftn.f: 43/0]
	add		out1 = 0, r33		   // I [fftn.f: 43/0]
	st4		[out5] = r34		   // M [fftn.f: 43/0]
	add		out2 = 0, r6		   // M [fftn.f: 43/0]
	br.call.sptk.many rp = factor_		;; // B [fftn.f: 43/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 43/0]
	add		out0 = 0, r51		   // M [fftn.f: 44/0]
	add		out1 = 0, r38		   // I [fftn.f: 44/0]
	add		out2 = 0, r33		   // M [fftn.f: 44/0]
	add		out3 = 0, r6		   // M [fftn.f: 44/0]
	br.call.sptk.many rp = reorderm_	;; // B [fftn.f: 44/0] [UVU]
	add		r26 = @pltoff(__F90_PARSE_FMT), r0 // M [fftn.f: 45/0]
	add		r9 = 192, r47		   // M [fftn.f: 45/0]
	add		out1 = 112, r44		   // I
	add		r11 = 120, r44		   // M [fftn.f: 45/0]
	add		r10 = 121, r44		   // M [fftn.f: 45/0]
	add		gp = 0, r4		;; // I [fftn.f: 44/0]
	st4		[out1] = r9		   // M [fftn.f: 45/0] [UVU]
	add		r61 = r26, r4		   // M [fftn.f: 45/0]
	add		r48 = 187, r0		   // I [fftn.f: 45/0]
	st1		[r11] = r0, 2		   // M [fftn.f: 45/0] [UVU]
	add		r49 = 13, r0		   // M [fftn.f: 45/0]
	add		r9 = 116, r44		;; // I [fftn.f: 45/0]
	ld8		r8 = [r61]		   // M [fftn.f: 45/0]
	st1		[r10] = r45, 2		   // M [fftn.f: 45/0] [UVU]
	add		r62 = 8, r61		   // I [fftn.f: 45/0]
	add		r27 = @pltoff(__F90_START_IO), r0 // M [fftn.f: 45/0]
	st1		[r11] = r45		   // M [fftn.f: 45/0] [UVU]
	add		r23 = @pltoff(__F90_DO_IO_ITEM), r0 ;; // I [fftn.f: 45/0]
	ld8		gp = [r62]		   // M [fftn.f: 45/0]
	st1		[r10] = r48		   // M [fftn.f: 45/0] [UVU]
	mov		b6 = r8			   // I [fftn.f: 45/0]
	add		out0 = 0, r0		   // M [fftn.f: 45/0]
	st4		[r9] = r49		   // M [fftn.f: 45/0] [UVU]
	add		r14 = 0, r4		;; // I [fftn.f: 45/0]
	add		r63 = r27, r4		   // M [fftn.f: 45/0]
	add		r65 = r23, r4		   // M [fftn.f: 45/0]
	add		r33 = 0, r59		   // I
	add		r35 = 0, r59		   // M
	add		r89 = 0, r60		   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 45/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 45/0]
	ld8		r8 = [r63]		   // M [fftn.f: 45/0]
	add		r64 = 8, r63		   // I [fftn.f: 45/0]
	add		out0 = 0, r50		   // M [fftn.f: 45/0]
	add		out1 = 6, r0		   // M [fftn.f: 45/0]
	add		out2 = 0, r0		;; // I [fftn.f: 45/0]
	add		out3 = 0, r0		   // M [fftn.f: 45/0]
	ld8		gp = [r64]		   // M [fftn.f: 45/0]
	mov		b6 = r8			   // I [fftn.f: 45/0]
	add		out4 = 0, r0		   // M [fftn.f: 45/0]
	add		out5 = 0, r0		   // M [fftn.f: 45/0]
	add		r14 = 0, r4		;; // I [fftn.f: 45/0]
	add		r66 = 8, r65		   // M [fftn.f: 45/0]
(p1)	add		r33 = 1, r59		   // M [fftn.f: 4/0]
(p1)	add		r35 = 3, r59		   // I [fftn.f: 4/0]
	add		r80 = 0, r60		   // M
	add		r34 = -1, r69		   // M [fftn.f: 53/0] [UVuse]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 45/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 45/0]
	ld8		r8 = [r65]		   // M [fftn.f: 45/0]
	extr		r33 = r33, 1, 63	   // I [fftn.f: 4/0]
	add		out0 = 32, r47		   // M [fftn.f: 45/0]
	add		out1 = 48, r47		   // M [fftn.f: 45/0]
	add		r14 = 0, r4		;; // I [fftn.f: 45/0]
	ld8		gp = [r66]		   // M [fftn.f: 45/0]
	cmp4.lt		p2, p0 = 0, r33		   // M [fftn.f: 4/0]
	mov		b6 = r8			   // I [fftn.f: 45/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 45/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 45/0]
	extr		r35 = r35, 2, 62	   // I [fftn.f: 4/0]
	add		out0 = 0, r44		;; // I [fftn.f: 45/0]
	add		r67 = @pltoff(__F90_END_IO), gp // M [fftn.f: 45/0]
	nop.m		0			   // M
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 45/0] [UVU]
	add		out0 = 44, r44		   // M
	ld8		r8 = [r65]		   // M [fftn.f: 45/0]
	add		gp = 0, r4		   // I [fftn.f: 45/0]
	add		out1 = 64, r47		   // M [fftn.f: 45/0]
	add		r14 = 0, r4		   // M [fftn.f: 45/0]
	add		r68 = 8, r67		;; // I [fftn.f: 45/0]
(p2)	add		r89 = 0, r33		   // M [fftn.f: 4/0]
	ld8		gp = [r66]		   // M [fftn.f: 45/0]
	mov		b6 = r8			   // I [fftn.f: 45/0]
	cmp4.gt		p2, p0 = 0, r34		   // M [fftn.f: 53/0]
	stfs		[out0] = f8		   // M [fftn.f: 45/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 45/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 45/0]
	ld8		r8 = [r67]		   // M [fftn.f: 45/0]
	cmp4.lt		p6, p0 = 0, r35		   // I [fftn.f: 4/0]
	add		r14 = 0, r4		   // M [fftn.f: 45/0]
	add		r82 = 208, r47		   // M [fftn.f: 58/0]
	add		r79 = 72, r44		;; // I [fftn.f: 58/0]
	ld8		gp = [r68]		   // M [fftn.f: 45/0]
(p6)	add		r80 = 0, r35		   // M [fftn.f: 4/0]
//file/line/col fftn.f/36/0,37/0,38/0,42/0,43/0[2],44/0[2],45/0[2]
	mov		b6 = r8			   // I [fftn.f: 45/0]
	add		r78 = 73, r44		   // M [fftn.f: 58/0]
	add		r39 = 74, r44		   // M [fftn.f: 58/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 45/0] [UVU]
	add		out0 = 48, r44		   // M
	add		gp = 0, r4		   // M [fftn.f: 45/0]
	add		r83 = 75, r44		   // I [fftn.f: 58/0]
	add		r81 = 68, r44		   // M [fftn.f: 58/0]
	add		r7 = 80, r47		   // M [fftn.f: 58/0]
	add		r95 = 96, r47		;; // I [fftn.f: 58/0]
	add		r34 = 4, r44		   // M
//file/line/col fftn.f/49/0
	stfd		[out0] = f0		   // M [fftn.f: 49/0]
	add		r35 = 112, r47		   // I [fftn.f: 58/0]
	add		r33 = 8, r44		   // M
	add		r73 = 80, r44		   // M
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 49/0] [UVU]
	ld4		r9 = [r51]		   // M [fftn.f: 50/0]
	ld8		r8 = [r61]		   // M [fftn.f: 58/0]
	add		gp = 0, r4		   // I [fftn.f: 49/0]
	add		out1 = 64, r44		   // M
	stfs		[r44] = f8		   // M [fftn.f: 49/0] [UVU]
	add		r51 = 224, r47		;; // I [fftn.f: 112/0]
//file/line/col fftn.f/50/0
	add		r28 = -1, r9		   // M [fftn.f: 50/0]
	add		r52 = 88, r44		   // M [fftn.f: 112/0]
	mov		b6 = r8			   // I [fftn.f: 58/0]
	add		r53 = 89, r44		   // M [fftn.f: 112/0]
	add		r54 = 90, r44		   // M [fftn.f: 112/0]
	add		r55 = 91, r44		;; // I [fftn.f: 112/0]
//file/line/col fftn.f/51/0
	andcm		r24 = -1, r28		   // M [fftn.f: 51/0]
//file/line/col fftn.f/53/0
	add		r56 = 84, r44		   // M [fftn.f: 112/0]
	add		r57 = 128, r47		   // I [fftn.f: 112/0]
	add		r70 = 12, r44		   // M
	add		r58 = 144, r47		   // M [fftn.f: 112/0]
	add		r76 = 0, r75		;; // I
	nop.m		0			   // M
	nop.m		0			   // M
(p2)	br.dpnt.many	..L20			;; // B [fftn.f: 53/0]

..L66:
	cmp4.ge.unc	p6, p7 = 1, r69		   // M
	add		r10 = -1, r69		   // M
	shladdp4	r9 = r5, 3, r32		   // I
	add		r21 = 0, r60		   // M
	add		r8 = -0x404, r0		;; // I
(p7)	zxt4		r10 = r10		   // I
(p6)	add		r10 = 0, r0		   // M
	add		r17 = 0x404, r9		;; // I
	add		r29 = 1, r10		;; // I
	nop.m		0			   // M
	extr.u		r19 = r29, 3, 61	;; // I
	cmp4.ge.unc	p6, p0 = r0, r19	   // I
	add		r11 = -1, r19		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L102			;; // B

..L101:
	add		r21 = 0, r60		   // M
	mov		ar.lc = r11		   // I
	nop.i		0			;; // I

..L83:
//file/line/col fftn.f/54/0
	and		r9 = r21, r28		   // M [fftn.f: 55/0]
	add		r10 = 1, r21		   // M [fftn.f: 57/0]
	add		r18 = 2, r21		   // I [fftn.f: 57/0]
	and		r84 = r21, r24		   // M [fftn.f: 54/0]
	add		r15 = 3, r21		   // M [fftn.f: 57/0]
	add		r14 = 4, r21		;; // I [fftn.f: 57/0]
//file/line/col fftn.f/55/0
	shladdp4	r9 = r9, 2, r38		   // M [fftn.f: 55/0] [UVuse]
	and		r16 = r10, r28		   // M [fftn.f: 55/0]
	and		r11 = r10, r24		   // I [fftn.f: 54/0]
	and		r10 = r18, r28		   // M [fftn.f: 55/0]
	and		r25 = r18, r24		   // M [fftn.f: 54/0]
	and		r18 = r15, r28		;; // I [fftn.f: 55/0]
	shladdp4	r10 = r10, 2, r38	   // M [fftn.f: 55/0] [UVuse]
	ld4		r9 = [r9]		   // M [fftn.f: 55/0] [UVuse]
	shladdp4	r16 = r16, 2, r38	   // I [fftn.f: 55/0] [UVuse]
	shladdp4	r22 = r18, 2, r38	   // M [fftn.f: 55/0] [UVuse]
	and		r20 = r15, r24		   // M [fftn.f: 54/0]
	and		r15 = r14, r28		;; // I [fftn.f: 55/0]
	ld4		r10 = [r10]		   // M [fftn.f: 55/0] [UVuse]
	ld4		r18 = [r16]		   // M [fftn.f: 55/0] [UVuse]
//file/line/col fftn.f/56/0
	add		r9 = r9, r88		   // I [fftn.f: 56/0]
	add		r16 = 5, r21		   // M [fftn.f: 57/0]
	shladdp4	r15 = r15, 2, r38	   // M [fftn.f: 55/0] [UVuse]
	and		r14 = r14, r24		;; // I [fftn.f: 54/0]
	ld4		r22 = [r22]		   // M [fftn.f: 55/0] [UVuse]
	add		r9 = r9, r84		   // M [fftn.f: 56/0]
	add		r10 = r10, r88		   // I [fftn.f: 56/0]
	ld4		r15 = [r15]		   // M [fftn.f: 55/0] [UVuse]
	add		r84 = r18, r88		   // M [fftn.f: 56/0]
	and		r18 = r16, r28		;; // I [fftn.f: 55/0]
	shladdp4	r9 = r9, 3, r32		   // M [fftn.f: 56/0] [UVuse]
	add		r10 = r10, r25		   // M [fftn.f: 56/0]
	add		r22 = r22, r88		   // I [fftn.f: 56/0]
	shladdp4	r18 = r18, 2, r38	   // M [fftn.f: 55/0] [UVuse]
	and		r16 = r16, r24		   // M [fftn.f: 54/0]
	add		r15 = r15, r88		;; // I [fftn.f: 56/0]
	add		r25 = 4, r9		   // M [fftn.f: 56/0]
	ldfs		f14 = [r9]		   // M [fftn.f: 56/0] [UVuse]
	add		r9 = r22, r20		   // I [fftn.f: 56/0]
	add		r11 = r84, r11		   // M [fftn.f: 56/0]
	shladdp4	r85 = r10, 3, r32	   // M [fftn.f: 56/0] [UVuse]
	add		r10 = r15, r14		;; // I [fftn.f: 56/0]
	ldfs		f33 = [r25]		   // M [fftn.f: 56/0] [UVuse]
	shladdp4	r86 = r9, 3, r32	   // M [fftn.f: 56/0] [UVuse]
	shladdp4	r84 = r11, 3, r32	   // I [fftn.f: 56/0] [UVuse]
	ld4		r9 = [r18]		   // M [fftn.f: 55/0] [UVuse]
	lfetch.nt1	[r17], r8		   // M [fftn.f: 56/0,56]
	shladdp4	r18 = r10, 3, r32	;; // I [fftn.f: 56/0] [UVuse]
	ldfs.a		f12 = [r84]		   // M [fftn.f: 56/0] [UVuse]
	ldfs.a		f15 = [r85]		   // M [fftn.f: 56/0] [UVuse]
	add		r20 = r9, r88		   // I [fftn.f: 56/0]
	ldfs.a		f13 = [r86]		   // M [fftn.f: 56/0] [UVuse]
	ldfs.a		f11 = [r18]		   // M [fftn.f: 56/0] [UVuse]
	add		r9 = 6, r21		;; // I [fftn.f: 57/0]
	add		r16 = r20, r16		   // M [fftn.f: 56/0]
	and		r20 = r9, r28		   // M [fftn.f: 55/0]
	and		r25 = r9, r24		   // I [fftn.f: 54/0]
	add		r9 = 7, r21		   // M [fftn.f: 57/0]
	add		r15 = 4, r84		   // M [fftn.f: 56/0]
	add		r14 = 4, r85		;; // I [fftn.f: 56/0]
	shladdp4	r20 = r20, 2, r38	   // M [fftn.f: 55/0] [UVuse]
	and		r87 = r9, r28		   // M [fftn.f: 55/0]
	shladdp4	r16 = r16, 3, r32	   // I [fftn.f: 56/0] [UVuse]
	add		r11 = 4, r86		   // M [fftn.f: 56/0]
	add		r10 = 4, r18		   // M [fftn.f: 56/0]
	and		r22 = r9, r24		;; // I [fftn.f: 54/0]
	ld4		r20 = [r20]		   // M [fftn.f: 55/0] [UVuse]
	ldfs.a		f10 = [r16]		   // M [fftn.f: 56/0] [UVuse]
	shladdp4	r87 = r87, 2, r38	   // I [fftn.f: 55/0] [UVuse]
	ldfs.a		f32 = [r15]		   // M [fftn.f: 56/0] [UVuse]
	ldfs.a		f9 = [r14]		   // M [fftn.f: 56/0] [UVuse]
	add		r9 = 4, r16		;; // I [fftn.f: 56/0]
	ld4		r87 = [r87]		   // M [fftn.f: 55/0] [UVuse]
	ldfs.a		f8 = [r11]		   // M [fftn.f: 56/0] [UVuse]
	add		r20 = r20, r88		   // I [fftn.f: 56/0]
	ldfs.a		f7 = [r10]		   // M [fftn.f: 56/0] [UVuse]
	ldfs.a		f6 = [r9]		   // M [fftn.f: 56/0] [UVuse]
	add		r21 = 8, r21		;; // I [fftn.f: 57/0]
	add		r20 = r20, r25		   // M [fftn.f: 56/0]
	add		r25 = r87, r88		;; // I [fftn.f: 56/0]
	add		r22 = r25, r22		   // I [fftn.f: 56/0]
	stfs		[r17] = f14, 4		   // M [fftn.f: 56/0]
	shladdp4	r20 = r20, 3, r32	;; // I [fftn.f: 56/0] [UVuse]
	shladdp4	r22 = r22, 3, r32	   // I [fftn.f: 56/0] [UVuse]
	ldfs.c.clr	f12 = [r84]		   // M
	stfs		[r17] = f33, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/57/0
	ldfs.c.clr	f32 = [r15]		   // M
	add		r15 = 4, r20		   // M [fftn.f: 56/0]
	add		r25 = 4, r22		   // I [fftn.f: 56/0]
	stfs		[r17] = f12, 4		   // M [fftn.f: 56/0]
	nop.i		0			   // I
	nop.b		0			;; // B
	ldfs.c.clr	f15 = [r85]		   // M
	ldfs.a		f33 = [r20]		   // M [fftn.f: 56/0] [UVuse]
	nop.i		0			   // I
	ldfs.a		f14 = [r22]		   // M [fftn.f: 56/0] [UVuse]
	stfs		[r17] = f32, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/55/0,56/0,57/0
	ldfs.c.clr	f9 = [r14]		   // M
	ldfs.a		f12 = [r15]		   // M [fftn.f: 56/0] [UVuse]
	nop.i		0			   // I
	ldfs.a		f32 = [r25]		   // M [fftn.f: 56/0] [UVuse]
	stfs		[r17] = f15, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	ldfs.c.clr	f13 = [r86]		   // M
	stfs		[r17] = f9, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/55/0,56/0,57/0
	ldfs.c.clr	f8 = [r11]		   // M
	stfs		[r17] = f13, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	ldfs.c.clr	f11 = [r18]		   // M
	stfs		[r17] = f8, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/55/0,56/0,57/0
	ldfs.c.clr	f7 = [r10]		   // M
	stfs		[r17] = f11, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	ldfs.c.clr	f10 = [r16]		   // M
	stfs		[r17] = f7, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/55/0,56/0,57/0
	ldfs.c.clr	f6 = [r9]		   // M
	stfs		[r17] = f10, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	ldfs.c.clr	f33 = [r20]		   // M
	stfs		[r17] = f6, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/55/0,56/0,57/0
	ldfs.c.clr	f12 = [r15]		   // M
	stfs		[r17] = f33, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	ldfs.c.clr	f14 = [r22]		   // M
	stfs		[r17] = f12, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
//file/line/col fftn.f/55/0,56/0,57/0
	ldfs.c.clr	f32 = [r25]		   // M
	stfs		[r17] = f14, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	stfs		[r17] = f32		   // M [fftn.f: 56/0]
	add		r17 = 0x408, r17	   // M
//file/line/col fftn.f/55/0,56/0,57/0
	br.cloop.dpnt.many ..L83		;; // B [fftn.f: 57/0]

..L99:
	shladd		r8 = r19, 3, r0		   // M
	add		r9 = -0x404, r17	;; // I
	sub		r8 = r29, r8		;; // I
	cmp4.ne		p0, p6 = 0, r8		   // M
	add		r10 = -1, r8		   // M
(p6)	br.dpnt.many	..L65			;; // B

..L102:
	add		r9 = 0, r9		   // M
	mov		ar.lc = r10		   // I
	nop.i		0			;; // I

..L91:
//file/line/col fftn.f/54/0
	and		r10 = r21, r28		   // M [fftn.f: 55/0]
	and		r8 = r21, r24		   // I [fftn.f: 54/0]
	add		r21 = 1, r21		;; // I [fftn.f: 57/0]
//file/line/col fftn.f/55/0
	shladdp4	r10 = r10, 2, r38	;; // M [fftn.f: 55/0] [UVuse]
	ld4		r10 = [r10]		   // M [fftn.f: 55/0] [UVuse]
	nop.i		0			;; // I
//file/line/col fftn.f/56/0
	add		r10 = r10, r88		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	add		r8 = r10, r8		;; // I [fftn.f: 56/0]
	shladdp4	r8 = r8, 3, r32		;; // M [fftn.f: 56/0] [UVuse]
	ldfs		f6 = [r8]		   // M [fftn.f: 56/0] [UVuse]
	add		r8 = 4, r8		;; // I [fftn.f: 56/0]
	ldfs		f7 = [r8]		;; // M [fftn.f: 56/0] [UVuse]
	stfs		[r9] = f6, 4		   // M [fftn.f: 56/0]
	nop.i		0			;; // I
	stfs		[r9] = f7, 4		   // M [fftn.f: 56/0]
//file/line/col fftn.f/57/0
	nop.m		0			   // M
	br.cloop.dptk.many ..L91		;; // B [fftn.f: 57/0]

..L100:

..L65:

..L20:
//file/line/col fftn.f/58/0
	ld8		gp = [r62]		   // M [fftn.f: 58/0]
	st4		[out1] = r82		   // M [fftn.f: 58/0] [UVU]
	add		r9 = @pltoff(__F90_F_STOP), r0 // I [fftn.f: 109/0]
	add		out0 = 0, r0		   // M [fftn.f: 58/0]
	st1		[r79] = r0		   // M [fftn.f: 58/0] [UVU]
	add		r14 = 0, r4		;; // I [fftn.f: 58/0]
	st1		[r78] = r45		   // M [fftn.f: 58/0] [UVU]
	add		r91 = r9, r4		   // M [fftn.f: 109/0]
	dep.z		r84 = r80, 5, 59	   // I
	st1		[r39] = r45		   // M [fftn.f: 58/0] [UVU]
	add		r78 = 128, r44		   // M
	shladd		r87 = r80, 3, r0	;; // I
	add		r82 = 420, r0		   // M
	st1		[r83] = r48		   // M [fftn.f: 58/0] [UVU]
	sxt4		r92 = r69		   // I [fftn.f: 69/0] [UVuse]
	add		r39 = 0, r88		   // M
	st4		[r81] = r49		   // M [fftn.f: 58/0] [UVU]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 58/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 58/0]
	ld8		r8 = [r63]		   // M [fftn.f: 58/0]
	add		out0 = 0, r50		   // I [fftn.f: 58/0]
	add		out1 = 6, r0		   // M [fftn.f: 58/0]
	add		out2 = 0, r0		   // M [fftn.f: 58/0]
	add		out3 = 0, r0		;; // I [fftn.f: 58/0]
	ld8		gp = [r64]		   // M [fftn.f: 58/0]
	add		out4 = 0, r0		   // M [fftn.f: 58/0]
	mov		b6 = r8			   // I [fftn.f: 58/0]
	add		out5 = 0, r0		   // M [fftn.f: 58/0]
	add		r14 = 0, r4		   // M [fftn.f: 58/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 58/0] [UVU]
	ld8		r8 = [r65]		   // M [fftn.f: 58/0]
	add		gp = 0, r4		   // M [fftn.f: 58/0]
	add		out0 = 0, r7		   // I [fftn.f: 58/0]
	setf.sig	f2 = r80		   // M
	add		out1 = 0, r95		   // M [fftn.f: 58/0]
	add		r14 = 0, r4		;; // I [fftn.f: 58/0]
	ld8		gp = [r66]		   // M [fftn.f: 58/0]
	addp4		r79 = 0, r36		   // M
	mov		b6 = r8			   // I [fftn.f: 58/0]
	add		r94 = 2, r0		   // M
	add		r85 = 988, r0		   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 58/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 58/0]
	add		out0 = 0, r44		   // M [fftn.f: 58/0]
	add		r81 = 2, r0		   // I
	add		r86 = 244, r0		   // M
	sub		r83 = r0, r80		   // M
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 58/0] [UVU]
	ld8		r8 = [r65]		   // M [fftn.f: 58/0]
	add		gp = 0, r4		   // M [fftn.f: 58/0]
	add		out0 = 0, r34		   // I [fftn.f: 58/0]
	stfs		[r34] = f8		   // M [fftn.f: 58/0]
	add		out1 = 0, r35		   // M [fftn.f: 58/0]
	add		r14 = 0, r4		;; // I [fftn.f: 58/0]
	ld8		gp = [r66]		   // M [fftn.f: 58/0]
	add		r93 = 256, r47		   // M [fftn.f: 109/0]
	mov		b6 = r8			   // I [fftn.f: 58/0]
	add		r78 = 0, r78		   // M
	sub		r84 = r87, r84		   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 58/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 58/0]
	ld8		r8 = [r67]		   // M [fftn.f: 58/0]
	add		r14 = 0, r4		   // I [fftn.f: 58/0]
	add		r90 = 8, r91		   // M [fftn.f: 109/0]
	addp4		r80 = r82, r36		   // M
	add		r87 = 0, r88		;; // I
	ld8		gp = [r68]		   // M [fftn.f: 58/0]
	add		r88 = 0, r5		   // M
//file/line/col fftn.f/58/0
	mov		b6 = r8			   // I [fftn.f: 58/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 58/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 58/0]
//file/line/col fftn.f/62/0
	stfs		[r33] = f0		   // M [fftn.f: 62/0]
	add		out0 = 0, r33		   // I [fftn.f: 62/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 62/0] [UVU]
	ld4		r95 = [r6]		   // M [fftn.f: 64/0]
	stfs		[r44] = f8		   // M [fftn.f: 62/0] [UVU]
	add		gp = 0, r4		;; // I [fftn.f: 62/0]
//file/line/col fftn.f/63/0,64/0
	cmp4.gt.unc	p6, p0 = 1, r95		   // M [fftn.f: 64/0]
	nop.m		0			   // M
(p6)	br.dpnt.many	..L24			;; // B [fftn.f: 64/0]

..L64:
	add		r88 = 0, r5		   // M
	add		r8 = 0, r39		   // I
	nop.i		0			;; // I

..L26:
//file/line/col fftn.f/65/0
	ld4		r34 = [r78], 4		   // M [fftn.f: 68/0]
	add		out0 = 0, r92		   // M [fftn.f: 69/0]
	add		r87 = 0, r88		   // I
	ld8		r33 = [r91]		   // M [fftn.f: 109/0]
	add		r88 = 0, r8		   // M
	add		r39 = 0, r79		;; // I
	cmp4.eq.unc	p2, p3 = 2, r34		   // M [fftn.f: 76/0]
//file/line/col fftn.f/66/0,67/0,68/0,69/0
	sxt4		out1 = r34		   // I [fftn.f: 69/0] [UVuse]
	br.call.sptk.many rp = __milli_div32I	;; // B [fftn.f: 69/0]
(p3)	cmp4.eq.unc	p6, p0 = 4, r34		   // M [fftn.f: 87/0]
	add		r9 = -1, r8		   // M [fftn.f: 81/0] [UVuse]
	mov		b6 = r33		   // I [fftn.f: 109/0]
	add		r14 = 0, r4		   // M [fftn.f: 109/0]
//file/line/col fftn.f/76/0[2]
(p2)	br.dpnt.many	..L28			   // B [fftn.f: 76/0]
(p6)	br.dpnt.many	..L35			;; // B [fftn.f: 87/0]

..L34:
//file/line/col fftn.f/109/0[2]
	add		out0 = 0, r93		   // M [fftn.f: 109/0]
	ld8		gp = [r90]		   // M [fftn.f: 109/0]
	add		out1 = 17, r0		   // I [fftn.f: 109/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.call.dptk.many rp = b6		;; // B [fftn.f: 109/0] [UVU]
//file/line/col fftn.f/110/0,110/1/E
	add		gp = 0, r4		   // M [fftn.f: 109/0]
	nop.i		0			   // I
	nop.i		0			;; // I

..L33:
//file/line/col fftn.f/111/0
	cmp4.le		p6, p0 = r81, r95	   // M [fftn.f: 111/0] [UVuse]
	add		r81 = 1, r81		   // M
	add		r8 = 0, r87		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dptk.many	..L26			;; // B [fftn.f: 111/0]

..L24:
//file/line/col fftn.f/112/0
	ld8		r8 = [r61]		   // M [fftn.f: 112/0]
	ld8		gp = [r62]		   // M [fftn.f: 112/0]
	add		out0 = 0, r0		   // I [fftn.f: 112/0]
	st4		[r73] = r51		   // M [fftn.f: 112/0] [UVU]
	st1		[r52] = r0		   // M [fftn.f: 112/0] [UVU]
	add		out1 = 0, r73		;; // I [fftn.f: 112/0]
	st1		[r53] = r45		   // M [fftn.f: 112/0] [UVU]
	st1		[r54] = r45		   // M [fftn.f: 112/0] [UVU]
	mov		b6 = r8			   // I [fftn.f: 112/0]
	add		r14 = 0, r4		   // M [fftn.f: 112/0]
	lfetch		[r77], -4		   // M [fftn.f: 35/0]
	add		r75 = 1, r75		;; // I
	st1		[r55] = r48		   // M [fftn.f: 112/0] [UVU]
	cmp4.le.unc	p2, p0 = r76, r46	   // M [fftn.f: 113/0]
	nop.i		0			   // I
	st4		[r56] = r49		   // M [fftn.f: 112/0] [UVU]
	nop.m		0			   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 112/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 112/0]
	ld8		r8 = [r63]		   // M [fftn.f: 112/0]
	add		out0 = 0, r50		   // I [fftn.f: 112/0]
	add		out1 = 6, r0		   // M [fftn.f: 112/0]
	add		out2 = 0, r0		   // M [fftn.f: 112/0]
	add		out3 = 0, r0		;; // I [fftn.f: 112/0]
	ld8		gp = [r64]		   // M [fftn.f: 112/0]
	add		out4 = 0, r0		   // M [fftn.f: 112/0]
	mov		b6 = r8			   // I [fftn.f: 112/0]
	add		out5 = 0, r0		   // M [fftn.f: 112/0]
	add		r14 = 0, r4		   // M [fftn.f: 112/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 112/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 112/0]
	add		out0 = 0, r47		   // M [fftn.f: 112/0]
	add		out1 = 0, r57		   // I [fftn.f: 112/0]
	ld8		r8 = [r65]		   // M [fftn.f: 112/0]
	add		r14 = 0, r4		;; // I [fftn.f: 112/0]
	mov		b6 = r8			   // I [fftn.f: 112/0]
	ld8		gp = [r66]		   // M [fftn.f: 112/0]
	nop.m		0			   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 112/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 112/0]
	add		out0 = 0, r44		   // M [fftn.f: 112/0]
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 112/0] [UVU]
	ld8		r8 = [r65]		   // M [fftn.f: 112/0]
	add		gp = 0, r4		   // M [fftn.f: 112/0]
	add		out0 = 0, r70		   // I [fftn.f: 112/0]
	stfs		[r70] = f8		   // M [fftn.f: 112/0]
	add		out1 = 0, r58		   // M [fftn.f: 112/0]
	add		r14 = 0, r4		;; // I [fftn.f: 112/0]
	ld8		gp = [r66]		   // M [fftn.f: 112/0]
	mov		b6 = r8			   // I [fftn.f: 112/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 112/0] [UVU]
	ld8		r8 = [r67]		   // M [fftn.f: 112/0]
	add		gp = 0, r4		   // I [fftn.f: 112/0]
//file/line/col fftn.f/112/0
	add		r14 = 0, r4		;; // I [fftn.f: 112/0]
	ld8		gp = [r68]		   // M [fftn.f: 112/0]
	mov		b6 = r8			   // I [fftn.f: 112/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 112/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 112/0]
//file/line/col fftn.f/113/0
	nop.m		0			   // M
(p2)	br.dptk.many	..L16			;; // B [fftn.f: 113/0]

..L14:
//file/line/col fftn.f/117/0
	cmp4.ne.unc	p2, p0 = r0, r88	   // M [fftn.f: 117/0]
	add		r36 = -1, r69		   // M [fftn.f: 120/0] [UVuse]
(p2)	br.dpnt.many	..L43			;; // B [fftn.f: 117/0]

..L48:
//file/line/col fftn.f/128/0
	add		r8 = 432, sp		   // M [fftn.f: 128/0]
	mov		rp = r41		;; // I
	mov		ar.pfs = r40		   // I
	add		r9 = -48, r8		   // M [fftn.f: 128/0]
	add		r10 = -40, r8		;; // I [fftn.f: 128/0]
	mov		ar.lc = r42		   // I
	ld8.fill	r4 = [r9], 16		   // M [fftn.f: 128/0]
	ld8.fill	r5 = [r10], 16		   // M [fftn.f: 128/0]
	nop.i		0			;; // I
	ld8.fill	r6 = [r9], 16		   // M [fftn.f: 128/0]
	ld8.fill	r7 = [r10], 24		   // M [fftn.f: 128/0]
	mov		pr = r43, 0x1fffe	;; // I [fftn.f: 128/0]
	ldf.fill	f2 = [r9], 16		   // M [fftn.f: 128/0]
	nop.i		0			;; // I
	add		r9 = -80, r8		;; // I [fftn.f: 128/0]
	ld8		r10 = [r9]		   // M [fftn.f: 128/0]
	add		sp = 0, r8		;; // I [fftn.f: 128/0] [UVU: ]
	nop.i		0			   // I
	mov		ar.unat = r10		   // M [fftn.f: 128/0]
	nop.m		0			   // M
	br.ret.sptk.many rp			;; // B [fftn.f: 128/0]

..L35:
//file/line/col fftn.f/87/3/E,91/0,93/0
	cmp4.gt.unc	p6, p0 = r0, r9		   // M [fftn.f: 93/0]
	shladd		r15 = r88, 3, r0	   // M
(p6)	br.dpnt.many	..L36			;; // B [fftn.f: 93/0]

..L63:
	cmp.gt.unc	p6, p0 = 0, r94		   // M [fftn.f: 91/0]
	add		r10 = 0, r94		   // M
	shladd		r16 = r8, 4, r15	   // I
	shladd		r14 = r8, 3, r15	   // M
	shladd		r9 = r8, 1, r8		   // M
	shladdp4	r11 = r88, 3, r32	;; // I
(p6)	add		r10 = 1, r94		   // M [fftn.f: 91/0]
	addp4		r16 = r16, r32		   // M
	addp4		r14 = r14, r32		   // I
	shladd		r15 = r9, 3, r15	   // M
	cmp4.ge.unc	p6, p7 = 1, r8		   // M
	add		r28 = 0, r36		;; // I
(p7)	add		r9 = -1, r8		   // M
	addp4		r15 = r15, r32		   // M
	extr		r10 = r10, 1, 63	   // I [fftn.f: 91/0]
	add		r29 = 0, r37		   // M
	add		r8 = 0, r38		   // M
	add		r33 = r86, r16		;; // I
	add		r34 = r86, r14		   // M
	lfetch.nt1	[r33], 56		   // M [fftn.f: 104/0,104]
	sxt4		r10 = r10		   // I [fftn.f: 91/0]
	add		r35 = r86, r11		   // M
(p6)	add		r9 = 0, r0		   // M
(p7)	zxt4		r9 = r9			;; // I
	lfetch.nt1	[r34], 56		   // M [fftn.f: 104/0,104]
	shladd		r17 = r10, 1, r10	   // M
	shladdp4	r10 = r87, 3, r32	   // I
	lfetch.nt1	[r35], 56		   // M [fftn.f: 104/0,104]
	add		r39 = r86, r15		   // M
	cmp.ne.or.andcm	p16, p17 = 42, r0	;; // I
	shladd		r17 = r17, 3, r0	   // M
	cmp.eq.and	p18, p0 = 42, r0	   // M
	mov		ar.lc = r9		   // I
	add		r9 = 0, r32		   // M
	add		r5 = 0, r16		   // M
	add		r26 = 4, r14		;; // I
	add		r25 = 4, r11		   // M
	setf.sig	f6 = r17		   // M
	mov		ar.ec = 3		   // I
	add		r22 = 8, r10		   // M
	add		r14 = 24, r10		   // M
	add		r11 = r10, r85		;; // I
	add		r10 = 0, r15		;; // M
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	xma.l		f6 = f2, f6, f0		;; // F
	getf.sig	r15 = f6		;; // M
	shladd		r17 = r83, 3, r15	   // M
	shladd		r16 = r83, 4, r15	   // I
	add		r15 = r15, r84		;; // M
	addp4		r17 = r17, r37		   // M
	addp4		r16 = r16, r37		   // I
	addp4		r15 = r15, r37		   // M
	nop.i		0			   // I
	nop.b		0			;; // B
	add		r36 = r86, r17		   // M
	add		r37 = r86, r16		   // M
	add		r38 = r86, r15		   // I
	add		r27 = 4, r17		   // M
	add		r24 = 4, r16		   // M
	add		r23 = 4, r15		;; // I
	lfetch.nt1	[r36], 56		   // M [fftn.f: 104/0,104]
	lfetch.nt1	[r37], 56		   // M [fftn.f: 104/0,104]
	nop.i		0			;; // I
	lfetch.nt1	[r38], 56		   // M [fftn.f: 104/0,104]
	invala					   // M
	nop.i		0			;; // I

..L38:
(p16)	ldfs.a		f54 = [r22], 4		   // M [fftn.f: 95/0]
(p16)	ldfs.a		f40 = [r14], 4		   // M [fftn.f: 97/0]
(p17)	fsub.s.s0	f71 = f76, f83		   // F [fftn.f: 101/0]
(p16)	ldfs		f58 = [r23], -4		   // M [fftn.f: 95/0]
(p16)	ldfs		f32 = [r27], -4		   // M [fftn.f: 97/0]
(p17)	fadd.s.s0	f84 = f76, f83		;; // F [fftn.f: 99/0]
(p16)	ldfs		f56 = [r23], 12		   // M [fftn.f: 95/0]
(p16)	ldfs.a		f52 = [r22], 4		   // M [fftn.f: 95/0]
(p17)	fadd.s.s0	f67 = f74, f75		   // F [fftn.f: 99/0]
(p16)	ldfs		f34 = [r27], 12		   // M [fftn.f: 97/0]
(p16)	ldfs.a		f42 = [r14], -28	   // M [fftn.f: 97/0]
(p17)	fsub.s.s0	f68 = f74, f75		;; // F [fftn.f: 101/0]
(p16)	ldfs.a		f48 = [r22], 4		   // M [fftn.f: 96/0]
(p16)	ldfs		f36 = [r24], -4		   // M [fftn.f: 96/0]
(p17)	fadd.s.s0	f65 = f47, f72		   // F [fftn.f: 98/0]
(p16)	ldfs.a		f50 = [r14], 4		   // M [fftn.f: 94/0]
(p16)	lfetch.nt1	[r11], 32		   // M [fftn.f: 94/0,97,96,95,95,96,94,97]
(p17)	fsub.s.s0	f66 = f47, f72		;; // F [fftn.f: 100/0]
(p16)	ldfs.a		f44 = [r22], 20		   // M [fftn.f: 96/0]
(p16)	ldfs		f38 = [r24], 12		   // M [fftn.f: 96/0]
(p17)	fadd.s.s0	f63 = f51, f79		   // F [fftn.f: 98/0]
(p16)	ldfs.a		f46 = [r14], 52		   // M [fftn.f: 94/0]
(p16)	lfetch.nt1	[r39]			   // M [fftn.f: 104/0,104,104,104,104,104,104,104,104,104,104,104]
(p17)	fsub.s.s0	f64 = f51, f79		;; // F [fftn.f: 100/0]
(p16)	add		r32 = 56, r39		   // M
(p18)	stfs		[r10] = f61, 4		   // M [fftn.f: 105/0] [UVU]
(p17)	fmerge.ns	f62 = f71, f71		;; // F [fftn.f: 103/0]
(p17)	chk.a.clr	f51, ..L136		   // M
(p17)	chk.a.clr	f55, ..L137		   // M
	nop.i		0			   // I

..L164:
(p18)	stfs		[r10] = f85, 4		   // M [fftn.f: 105/0] [UVU]
	nop.i		0			   // I
	nop.b		0			;; // B
(p17)	chk.a.clr	f49, ..L138		   // M
(p17)	chk.a.clr	f41, ..L139		   // M
(p17)	fadd.s.s0	f73 = f65, f84		   // F [fftn.f: 102/0]

..L165:
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fadd.s.s0	f85 = f66, f68		;; // F [fftn.f: 103/0]
(p17)	chk.a.clr	f47, ..L140		   // M
(p17)	chk.a.clr	f53, ..L141		   // M
(p17)	fadd.s.s0	f60 = f63, f67		   // F [fftn.f: 102/0]

..L166:
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fsub.s.s0	f61 = f63, f67		;; // F [fftn.f: 104/0]
(p17)	chk.a.clr	f45, ..L142		   // M
(p17)	chk.a.clr	f43, ..L143		   // M
(p16)	fmpy.s0		f69 = f58, f54		   // F [fftn.f: 95/0]

..L167:
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f80 = f32, f40		;; // F [fftn.f: 97/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f79 = f58, f52		   // F [fftn.f: 95/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f81 = f32, f42		;; // F [fftn.f: 97/0]
(p17)	stfs		[r25] = f73, -4		   // M [fftn.f: 102/0] [UVU]
(p17)	stfs		[r26] = f85, -4		   // M [fftn.f: 103/0] [UVU]
(p16)	fmpy.s0		f77 = f36, f48		   // F [fftn.f: 96/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fadd.s.s0	f78 = f64, f62		;; // F [fftn.f: 103/0]
(p17)	stfs		[r25] = f60, 12		   // M [fftn.f: 102/0] [UVU]
	nop.m		0			   // M
(p16)	fmpy.s0		f76 = f36, f44		   // F [fftn.f: 96/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fsub.s.s0	f83 = f65, f84		;; // F [fftn.f: 104/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f75 = f56, f52, f69	   // F [fftn.f: 95/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f82 = f34, f42, f80	;; // F [fftn.f: 97/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f73 = f56, f54, f79	   // F [fftn.f: 95/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f74 = f34, f40, f81	;; // F [fftn.f: 97/0]
(p17)	stfs		[r26] = f78, 12		   // M [fftn.f: 103/0] [UVU]
(p17)	stfs		[r5] = f61, 4		   // M [fftn.f: 104/0] [UVU]
(p16)	fma.s.s0	f71 = f38, f44, f77	   // F [fftn.f: 96/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fsub.s.s0	f60 = f64, f62		;; // F [fftn.f: 105/0]
(p17)	stfs		[r5] = f83, 4		   // M [fftn.f: 104/0] [UVU]
	nop.m		0			   // M
(p16)	fms.s.s0	f78 = f38, f48, f76	   // F [fftn.f: 96/0]
	nop.m		0			   // M
(p17)	fsub.s.s0	f84 = f66, f68		   // F [fftn.f: 105/0]
//file/line/col fftn.f/94/0,95/0,96/0,97/0,98/0,99/0,100/0,101/0,102/0,103/0,104/0,105/0,106/0
	br.ctop.dptk.many ..L38			;; // B [fftn.f: 106/0]

..L62:
	add		r38 = 0, r8		   // M
	add		r37 = 0, r29		   // M
	add		r36 = 0, r28		   // I
	add		r32 = 0, r9		   // M
	nop.i		0			   // I
	nop.b		0			;; // B

..L36:
//file/line/col fftn.f/107/0,108/0
	shladdp4	r80 = r89, 4, r80	   // M
	shladdp4	r79 = r89, 4, r79	   // M
	add		r94 = 2, r94		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L33			;; // B [fftn.f: 108/0]

..L28:
//file/line/col fftn.f/76/1/E,81/0
	cmp4.gt.unc	p6, p0 = r0, r9		   // M [fftn.f: 81/0]
	add		r10 = -1, r8		   // M
(p6)	br.dpnt.many	..L29			;; // B [fftn.f: 81/0]

..L61:
	cmp4.ge.unc	p6, p7 = 1, r8		   // M
	shladd		r14 = r88, 3, r0	   // M
	shladd		r11 = r87, 3, r0	   // I
	shladdp4	r9 = r88, 3, r32	;; // M
(p6)	add		r10 = 0, r0		   // M
(p7)	zxt4		r10 = r10		   // I
	shladd		r8 = r8, 3, r14		   // M
	add		r11 = 8, r11		;; // I
	add		r23 = 1, r10		   // I
	addp4		r8 = r8, r32		   // M
	addp4		r24 = r11, r32		;; // I
	extr.u		r21 = r23, 2, 62	;; // I
	cmp4.ge.unc	p6, p0 = r0, r21	   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L114			;; // B

..L113:
	add		r33 = 0, r80		   // M
	add		r34 = r82, r8		   // M
	mov		ar.ec = 1		   // I
	add		r10 = -1, r21		   // M
	add		r35 = r82, r9		   // M
	add		r20 = 0, r32		;; // I
	lfetch.nt1	[r33], 96		   // M [fftn.f: 82/0,82]
	add		r19 = 0, r36		   // M
	mov		ar.lc = r10		   // I
	lfetch.nt1	[r34], 96		   // M [fftn.f: 82/0,82]
	add		r18 = 0, r37		   // M
	add		r17 = 0, r38		;; // I
	add		r16 = 4, r8		   // M
	add		r15 = 4, r9		   // M
	add		r14 = 4, r39		   // I
	add		r22 = 20, r39		   // M
	add		r11 = 0, r24		   // M
	add		r10 = 828, r0		;; // I
	add		r9 = -792, r0		   // M
	add		r8 = 20, r24		   // I
	add		r24 = 36, r24		;; // I

..L103:
//file/line/col fftn.f/82/0
	ldfs		f6 = [r14], -4		   // M [fftn.f: 82/0]
	ldfs		f7 = [r11], 4		   // M [fftn.f: 82/0]
	nop.i		0			   // I
	ldfs.a		f46 = [r8], 12		   // M [fftn.f: 82/0]
	ldfs		f50 = [r22], -4		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	ldfs		f10 = [r11], -12	   // M [fftn.f: 82/0]
	ldfs		f9 = [r14], 12		   // M [fftn.f: 82/0]
	nop.i		0			   // I
	ldfs.a		f47 = [r8], -16		   // M [fftn.f: 82/0]
	ldfs		f54 = [r22], 36		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	ldfs.a		f35 = [r11], 4		   // M [fftn.f: 83/0]
	ldfs		f51 = [r14], -4		   // M [fftn.f: 82/0]
	nop.i		0			   // I
	ldfs.a		f48 = [r8], -4		   // M [fftn.f: 82/0]
	ldfs.a		f45 = [r24], -8		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	ldfs.a		f32 = [r11], 12		   // M [fftn.f: 83/0]
	ldfs		f56 = [r14], 20		   // M [fftn.f: 82/0]
	nop.i		0			   // I
	ldfs.a		f15 = [r8], 12		   // M [fftn.f: 83/0]
	ldfs.a		f14 = [r24], 24		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	ldfs.a		f34 = [r11], r10	   // M [fftn.f: 83/0]
	ldfs.a		f33 = [r8], 24		   // M [fftn.f: 83/0]
	nop.i		0			   // I
	ldfs		f49 = [r14], -4		   // M [fftn.f: 82/0]
	ldfs.a		f44 = [r24], -12	   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	ldfs		f52 = [r14], 12		   // M [fftn.f: 82/0]
	lfetch.nt1	[r11], r9		   // M [fftn.f: 84/0,82,83,83,84,82]
	nop.i		0			   // I
	lfetch.nt1	[r35]			   // M [fftn.f: 82/0,82,82,82]
	add		r32 = 96, r35		;; // I
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f8 = f6, f7		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f6 = f6, f10		   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f39 = f50, f47		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f43 = f51, f46		   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f40 = f51, f48		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f42 = f50, f45		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f38 = f9, f10, f8	   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f57 = f49, f44		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f55 = f9, f7, f6	   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f36 = f54, f45, f39	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f53 = f56, f48, f43	   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f37 = f56, f46, f40	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f41 = f54, f47, f42	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f32, f38		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f32, f38		;; // F [fftn.f: 84/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftn.f/83/0
	fadd.s.s0	f13 = f35, f55		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f9 = f35, f55		;; // F [fftn.f: 84/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f34, f53		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f15, f37		;; // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f15, f37		   // F [fftn.f: 84/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f8 = f34, f53		;; // F [fftn.f: 84/0]
	stfs		[r15] = f10, -4		   // M [fftn.f: 83/0]
	nop.m		0			   // M
	fadd.s.s0	f58 = f33, f41		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f14, f36		;; // F [fftn.f: 83/0]
	chk.a.clr	f32, ..L152		   // M
	stfs		[r15] = f13, 12		   // M [fftn.f: 83/0]
	fsub.s.s0	f13 = f14, f36		   // F [fftn.f: 84/0]

..L168:
	stfs		[r16] = f7, -4		   // M [fftn.f: 84/0]
	nop.m		0			   // M
	fsub.s.s0	f7 = f33, f41		;; // F [fftn.f: 84/0]
//file/line/col fftn.f/84/0
	chk.a.clr	f35, ..L151		   // M
	chk.a.clr	f46, ..L145		   // M
	nop.i		0			   // I

..L169:
	ldfs.a		f32 = [r11], 4		   // M [fftn.f: 83/0]
	stfs		[r16] = f9, 12		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
//file/line/col fftn.f/85/0
	chk.a.clr	f48, ..L147		   // M
	chk.a.nc	f15, ..L149		   // M
	nop.i		0			   // I

..L170:
	ldfs.a		f9 = [r11], -4		   // M [fftn.f: 82/0]
	stfs		[r15] = f11, -4		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	chk.a.nc	f34, ..L153		   // M
	chk.a.clr	f15, ..L157		   // M
	nop.i		0			   // I

..L171:
	stfs		[r15] = f12, 12		   // M [fftn.f: 83/0]
	stfs		[r16] = f6, -4		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
	chk.a.clr	f34, ..L156		   // M
	chk.a.clr	f45, ..L148		   // M
	nop.i		0			   // I

..L172:
	ldfs.a		f11 = [r11], -4		   // M [fftn.f: 84/0]
	stfs		[r16] = f8, 12		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
//file/line/col fftn.f/83/0,84/0,85/0
	chk.a.clr	f47, ..L146		   // M
	chk.a.nc	f14, ..L150		   // M
	nop.i		0			   // I

..L173:
	ldfs.a		f6 = [r11], 4		   // M [fftn.f: 83/0]
	stfs		[r15] = f10, -4		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	chk.a.nc	f33, ..L154		   // M
	chk.a.clr	f14, ..L159		   // M
	nop.i		0			   // I

..L174:
	stfs		[r15] = f58, 8		   // M [fftn.f: 83/0]
	stfs		[r16] = f13, -4		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
	chk.a.clr	f33, ..L158		   // M
	chk.a.clr	f44, ..L155		   // M
	nop.i		0			   // I

..L175:
	stfs		[r16] = f7, 8		;; // M [fftn.f: 84/0]
	ldfs.c.clr	f32 = [r11], -4		   // M
	nop.i		0			   // I
//file/line/col fftn.f/83/0,84/0,85/0
	ldfs.c.clr	f9 = [r8], 36		   // M
	ldfs.a		f7 = [r24], 60		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
	ldfs.c.clr	f6 = [r11], 24		   // M
	nop.i		0			   // I
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f8 = f49, f9		   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f9 = f52, f9, f57	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f8 = f52, f44, f8	   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f6 = f6, f9		;; // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f10 = f7, f9		;; // F [fftn.f: 84/0]
	stfs		[r15] = f6, 4		   // M [fftn.f: 83/0]
	nop.m		0			   // M
	fadd.s.s0	f6 = f32, f8		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f12 = f11, f8		;; // F [fftn.f: 84/0]
	chk.a.clr	f7, ..L161		;; // M
	stfs		[r16] = f10, 4		   // M [fftn.f: 84/0]
	nop.i		0			;; // I

..L176:
	stfs		[r15] = f6, 8		;; // M [fftn.f: 83/0]
	chk.a.clr	f11, ..L160		   // M
	nop.i		0			   // I

..L177:
	stfs		[r16] = f12, 8		   // M [fftn.f: 84/0]
//file/line/col fftn.f/83/0,84/0,85/0
	nop.m		0			   // M
	br.ctop.dptk.many ..L103		;; // B [fftn.f: 85/0]

..L111:
	shladd		r10 = r21, 2, r0	   // M
	add		r24 = 0, r11		   // M
	add		r39 = -4, r14		   // I
	add		r9 = -4, r15		   // M
	add		r8 = -4, r16		   // M
	add		r38 = 0, r17		;; // I
	sub		r10 = r23, r10		   // M
	add		r37 = 0, r18		   // M
	add		r36 = 0, r19		   // I
	add		r32 = 0, r20		;; // M
	cmp4.ne		p0, p6 = 0, r10		   // M
	add		r10 = -1, r10		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L60			;; // B

..L114:
	add		r11 = 4, r8		   // M
	add		r9 = 4, r9		   // M
	mov		ar.lc = r10		   // I
	add		r10 = 4, r39		   // M
	add		r8 = 0, r24		   // I
	nop.b		0			;; // B

..L107:
//file/line/col fftn.f/82/0
	ldfs		f7 = [r10], -4		   // M [fftn.f: 82/0]
	ldfs		f8 = [r8], 4		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	ldfs		f12 = [r8], -12		   // M [fftn.f: 82/0]
	ldfs		f10 = [r10], 12		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	ldfs.a		f11 = [r8], 4		;; // M [fftn.f: 83/0]
	ldfs.a		f9 = [r8], 20		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f6 = f7, f8		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f7 = f7, f12		;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f12 = f10, f12, f6	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f10 = f10, f8, f7	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f7 = f9, f12		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f13 = f9, f12		;; // F [fftn.f: 84/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftn.f/83/0
	fadd.s.s0	f8 = f11, f10		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f11, f10		;; // F [fftn.f: 84/0]
	stfs		[r9] = f7, -4		;; // M [fftn.f: 83/0]
	chk.a.clr	f9, ..L163		   // M
	nop.i		0			   // I

..L178:
	stfs		[r9] = f8, 12		   // M [fftn.f: 83/0]
	stfs		[r11] = f13, -4		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
//file/line/col fftn.f/84/0
	chk.a.clr	f11, ..L162		   // M
	stfs		[r11] = f6, 12		   // M [fftn.f: 84/0]
//file/line/col fftn.f/85/0
	br.cloop.dptk.many ..L107		;; // B [fftn.f: 85/0]

..L112:

..L60:

..L29:
//file/line/col fftn.f/86/0,87/0
	shladdp4	r80 = r89, 3, r80	   // M
	shladdp4	r79 = r89, 3, r79	   // M
	add		r94 = 1, r94		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L33			;; // B [fftn.f: 87/0]

..L43:
//file/line/col fftn.f/117/1/E,118/0
	cmp4.gt.unc	p1, p6 = r0, r36	   // M [fftn.f: 120/0]
	stfs		[r71] = f0		   // M [fftn.f: 118/0]
	add		r8 = 0x5c4, r0		   // I
	shladdp4	r35 = r88, 3, r32	   // M
	add		r9 = 0, r32		   // M
	add		out0 = 0, r71		;; // I [fftn.f: 118/0]
(p6)	cmp4.ge.unc	p4, p3 = 1, r69		   // M
	add		r33 = r8, r35		   // M
(p6)	addp4		r32 = 0, r32		   // I
	addp4		r34 = r8, r9		   // M
	add		r46 = 16, r35		   // M
	br.call.dptk.many rp = seconds_		;; // B [fftn.f: 118/0] [UVU]
(p4)	add		r36 = 0, r0		   // M
	add		r14 = 0, r35		   // M
(p3)	zxt4		r36 = r36		   // I
	add		r9 = 32, r35		   // M
	add		r8 = 48, r35		   // M
//file/line/col fftn.f/120/0
(p1)	br.dpnt.many	..L54			;; // B [fftn.f: 120/0]

..L57:
//file/line/col fftn.f/120/0
	add		r15 = 1, r36		   // M
	add		r10 = 0, r32		   // I
(p2)	add		gp = 0, r4		;; // I [fftn.f: 118/0]
	nop.m		0			   // M
	extr.u		r11 = r15, 3, 61	;; // I
	cmp4.ge.unc	p6, p0 = r0, r11	   // I
	add		r16 = -1, r11		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L134			;; // B

..L133:
	lfetch.nt1	[r33], 128		   // M [fftn.f: 121/0,121]
	mov		ar.lc = r16		;; // I
	mov		ar.ec = 1		;; // I

..L115:
//file/line/col fftn.f/121/0
	ldfs		f37 = [r14], 4		   // M [fftn.f: 121/0]
	ldfs.a		f35 = [r46], 4		   // M [fftn.f: 121/0]
	nop.i		0			   // I
	ldfs.a		f33 = [r9], 4		   // M [fftn.f: 121/0]
	ldfs.a		f15 = [r8], 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs		f13 = [r14], 4		   // M [fftn.f: 121/0]
	ldfs.a		f11 = [r46], 8		   // M [fftn.f: 121/0]
	nop.i		0			   // I
	ldfs.a		f9 = [r9], 8		   // M [fftn.f: 121/0]
	ldfs.a		f6 = [r8], 8		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.a		f36 = [r14], 4		   // M [fftn.f: 121/0]
	ldfs.a		f10 = [r46], 12		   // M [fftn.f: 121/0]
	nop.i		0			   // I
	ldfs.a		f7 = [r9], 12		   // M [fftn.f: 121/0]
	ldfs.a		f38 = [r8], 52		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.a		f12 = [r14], 12		   // M [fftn.f: 121/0]
	ldfs.a		f32 = [r46], 40		   // M [fftn.f: 121/0]
	nop.i		0			   // I
	ldfs.a		f14 = [r9], 40		   // M [fftn.f: 121/0]
	lfetch.nt1	[r34]			   // M [fftn.f: 121/0,121]
	add		r32 = 128, r34		;; // I
	ldfs.a		f34 = [r14], -16	;; // M [fftn.f: 121/0]
	stfs		[r10] = f37, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f36 = [r14], 4		   // M
	stfs		[r10] = f13, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f12 = [r14], 4		   // M
	stfs		[r10] = f36, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f35 = [r14], 4		   // M
	stfs		[r10] = f12, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f11 = [r14], 4		   // M
	stfs		[r10] = f35, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f34 = [r14], 4		   // M
	stfs		[r10] = f11, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f10 = [r14], 4		   // M
	stfs		[r10] = f34, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f33 = [r14], 4		   // M
	stfs		[r10] = f10, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f9 = [r14], 4		   // M
	stfs		[r10] = f33, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f32 = [r14], 4		   // M
	stfs		[r10] = f9, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f7 = [r14], 4		   // M
	stfs		[r10] = f32, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f15 = [r14], 4		   // M
	stfs		[r10] = f7, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f6 = [r14], 4		   // M
	stfs		[r10] = f15, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	ldfs.c.clr	f14 = [r14], 4		   // M
	stfs		[r10] = f6, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
//file/line/col fftn.f/122/0
	ldfs.c.clr	f38 = [r14], 4		   // M
	stfs		[r10] = f14, 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	stfs		[r10] = f38, 4		   // M [fftn.f: 121/0]
//file/line/col fftn.f/122/0
	nop.m		0			   // M
	br.ctop.dpnt.many ..L115		;; // B [fftn.f: 122/0]

..L131:
	shladd		r8 = r11, 3, r0		   // M
	add		r35 = 0, r14		   // I
	add		r32 = 0, r10		;; // I
	sub		r8 = r15, r8		;; // M
	cmp4.ne		p0, p6 = 0, r8		   // M
	add		r36 = -1, r8		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L56			;; // B

..L134:
	add		r8 = 0, r32		   // M
	mov		ar.lc = r36		   // I
	add		r9 = 0, r35		;; // I

..L123:
//file/line/col fftn.f/121/0
	ldfs		f6 = [r9], 4		;; // M [fftn.f: 121/0]
	ldfs		f7 = [r9], 4		   // M [fftn.f: 121/0]
	nop.i		0			;; // I
	stfs		[r8] = f6, 4		;; // M [fftn.f: 121/0]
	stfs		[r8] = f7, 4		   // M [fftn.f: 121/0]
//file/line/col fftn.f/122/0
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.cloop.dptk.many ..L123		;; // B [fftn.f: 122/0]

..L132:

..L56:

..L44:
//file/line/col fftn.f/123/0
	add		r15 = 104, r44		   // M [fftn.f: 123/0]
	add		r10 = @ltoff(.tcg0$rodata), gp // M [fftn.f: 123/0]
	add		r11 = @pltoff(__F90_PARSE_FMT), gp // I [fftn.f: 123/0]
	add		r9 = 187, r0		   // M [fftn.f: 123/0]
	add		r8 = 13, r0		   // M [fftn.f: 123/0]
	add		r16 = @pltoff(__F90_START_IO), r0 ;; // I [fftn.f: 123/0]
	ld8		r36 = [r10]		   // M [fftn.f: 123/0]
	ld8		r10 = [r11], 8		   // M [fftn.f: 123/0]
	add		out0 = 0, r0		   // I [fftn.f: 123/0]
	st1		[r15] = r0, 1		   // M [fftn.f: 123/0] [UVU]
	stfs		[r44] = f8		   // M [fftn.f: 118/0] [UVU]
	add		out1 = 0, r74		;; // I [fftn.f: 123/0]
	ld8		gp = [r11]		   // M [fftn.f: 123/0]
	add		r11 = 240, r36		   // M [fftn.f: 123/0]
	mov		b6 = r10		   // I [fftn.f: 123/0]
	st1		[r15] = r45, 1		   // M [fftn.f: 123/0] [UVU]
	add		r10 = @pltoff(__F90_DO_IO_ITEM), r0 // M [fftn.f: 123/0]
	add		r14 = 0, r4		;; // I [fftn.f: 123/0]
	st1		[r15] = r45, 1		   // M [fftn.f: 123/0] [UVU]
	st4		[r74] = r11		   // M [fftn.f: 123/0] [UVU]
	add		r11 = @pltoff(__F90_END_IO), r0 // I [fftn.f: 123/0]
	add		r35 = r16, r4		   // M [fftn.f: 123/0]
	add		r34 = r10, r4		;; // I [fftn.f: 123/0]
	add		r38 = r11, r4		   // I [fftn.f: 123/0]
	st1		[r15] = r9, -7		   // M [fftn.f: 123/0] [UVU]
	add		r37 = 8, r35		   // M [fftn.f: 123/0]
	add		r33 = 8, r34		;; // I [fftn.f: 123/0]
	st4		[r15] = r8		   // M [fftn.f: 123/0] [UVU]
	add		r32 = 8, r38		   // M [fftn.f: 123/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 123/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 123/0]
	ld8		r8 = [r35]		   // M [fftn.f: 123/0]
	add		out1 = 6, r0		   // I [fftn.f: 123/0]
	add		out2 = 0, r0		   // M [fftn.f: 123/0]
	add		out3 = 0, r0		   // M [fftn.f: 123/0]
	add		out4 = 0, r0		;; // I [fftn.f: 123/0]
	ld8		gp = [r37]		   // M [fftn.f: 123/0]
	add		out5 = 0, r0		   // M [fftn.f: 123/0]
	mov		b6 = r8			   // I [fftn.f: 123/0]
	add		r14 = 0, r4		   // M [fftn.f: 123/0]
	movl		out0 = 0x30c10c27	;; // I [fftn.f: 123/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 123/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 123/0]
	add		out0 = 16, r36		   // M [fftn.f: 123/0]
	add		out1 = 160, r36		   // I [fftn.f: 123/0]
	ld8		r8 = [r34]		   // M [fftn.f: 123/0]
	add		r14 = 0, r4		;; // I [fftn.f: 123/0]
	mov		b6 = r8			   // I [fftn.f: 123/0]
	ld8		gp = [r33]		   // M [fftn.f: 123/0]
	nop.m		0			   // M
	br.call.sptk.many rp = b6		;; // B [fftn.f: 123/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 123/0]
	add		out0 = 0, r44		   // M [fftn.f: 123/0]
	br.call.sptk.many rp = seconds_		;; // B [fftn.f: 123/0] [UVU]
	ld8		r8 = [r34]		   // M [fftn.f: 123/0]
	add		gp = 0, r4		   // M [fftn.f: 123/0]
	add		out1 = 176, r36		   // I [fftn.f: 123/0]
	stfs		[r72] = f8		   // M [fftn.f: 123/0]
	add		out0 = 0, r72		   // M [fftn.f: 123/0]
	add		r14 = 0, r4		;; // I [fftn.f: 123/0]
	ld8		gp = [r33]		   // M [fftn.f: 123/0]
	mov		b6 = r8			   // I [fftn.f: 123/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 123/0] [UVU]
	ld8		r8 = [r38]		   // M [fftn.f: 123/0]
	add		gp = 0, r4		   // I [fftn.f: 123/0]
//file/line/col fftn.f/123/0
	add		r14 = 0, r4		;; // I [fftn.f: 123/0]
	ld8		gp = [r32]		   // M [fftn.f: 123/0]
	mov		b6 = r8			   // I [fftn.f: 123/0]
	br.call.sptk.many rp = b6		;; // B [fftn.f: 123/0] [UVU]
	add		gp = 0, r4		   // M [fftn.f: 123/0]
//file/line/col fftn.f/124/0,124/1/E
	nop.m		0			   // M
	br.sptk.many	..L48			;; // B [fftn.f: 124/0]

..L49:
	add		r88 = 0, r60		   // M
	nop.m		0			   // M
	br.sptk.many	..L14			;; // B

..L54:
//file/line/col fftn.f/120/0
(p2)	add		gp = 0, r4		   // M [fftn.f: 118/0]
	nop.m		0			   // M
	br.sptk.many	..L44			;; // B

..L8:
	sub		r9 = 0, r24		   // M [fftn.f: 27/0] [UVuse]
	add		r8 = 1, r0		;; // I [fftn.f: 27/0]
	and		r9 = 63, r9		;; // I [fftn.f: 27/0]
	nop.m		0			   // M
	shr.u		r69 = r8, r9		   // I [fftn.f: 27/0]
	br.sptk.many	..L9			;; // B [fftn.f: 27/0]

..L17:
	sub		r8 = 0, r14		   // M [fftn.f: 35/0]
	nop.i		0			;; // I
	and		r8 = 63, r8		;; // I [fftn.f: 35/0]
	nop.m		0			   // M
	shr.u		r8 = r45, r8		   // I [fftn.f: 35/0]
	br.sptk.many	..L18			;; // B [fftn.f: 35/0]

..L136:
	add		r21 = -40, r22		;; // M
(p16)	add		r21 = -20, r21		;; // I
(p16)	add		r21 = -4, r21		;; // M
(p16)	add		r21 = -4, r21		;; // I
(p16)	add		r21 = -4, r21		;; // M
	ldfs		f51 = [r21]		;; // M [fftn.f: 94/0]
	fadd.s.s0	f63 = f51, f79		   // F [fftn.f: 98/0]
	fsub.s.s0	f64 = f51, f79		   // F [fftn.f: 100/0]
(p17)	chk.a.clr	f55, ..L137		   // M
	br.sptk.few	..L164			;; // B

..L137:
//file/line/col fftn.f/94/0
	add		r20 = -32, r22		   // M
	nop.i		0			;; // I
(p16)	add		r20 = -20, r20		;; // I
(p16)	add		r20 = -4, r20		   // M
	nop.i		0			;; // I
(p16)	add		r20 = -4, r20		;; // I
(p16)	add		r20 = -4, r20		;; // M
	ldfs		f55 = [r20]		   // M [fftn.f: 95/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f70 = f59, f55		   // F [fftn.f: 95/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f74 = f57, f55, f80	;; // F [fftn.f: 95/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f76 = f57, f53, f70	   // F [fftn.f: 95/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f67 = f74, f75		;; // F [fftn.f: 99/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f68 = f74, f75		;; // F [fftn.f: 101/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f71 = f76, f83		   // F [fftn.f: 101/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f84 = f76, f83		;; // F [fftn.f: 99/0]
	nop.m		0			   // M
	fmerge.ns	f62 = f71, f71		   // F [fftn.f: 103/0]
	br.sptk.few	..L164			;; // B

..L138:
	add		r19 = -24, r22		;; // M
(p16)	add		r19 = -20, r19		;; // I
(p16)	add		r19 = -4, r19		;; // M
(p16)	add		r19 = -4, r19		;; // I
(p16)	add		r19 = -4, r19		;; // M
	ldfs		f49 = [r19]		;; // M [fftn.f: 96/0]
	fmpy.s0		f78 = f37, f49		   // F [fftn.f: 96/0]
	fms.s.s0	f79 = f39, f49, f77	;; // F [fftn.f: 96/0]
	fma.s.s0	f72 = f39, f45, f78	   // F [fftn.f: 96/0]
	fadd.s.s0	f63 = f51, f79		;; // F [fftn.f: 98/0]
	fsub.s.s0	f64 = f51, f79		;; // F [fftn.f: 100/0]
	fadd.s.s0	f65 = f47, f72		   // F [fftn.f: 98/0]
	fsub.s.s0	f66 = f47, f72		   // F [fftn.f: 100/0]
(p17)	chk.a.clr	f41, ..L139		;; // M
(p17)	fadd.s.s0	f73 = f65, f84		   // F [fftn.f: 102/0]
	br.sptk.few	..L165			;; // B

..L139:
	add		r18 = -16, r22		;; // M
(p16)	add		r18 = -20, r18		;; // I
(p16)	add		r18 = -4, r18		;; // M
(p16)	add		r18 = -4, r18		;; // I
(p16)	add		r18 = -4, r18		;; // M
	ldfs		f41 = [r18]		;; // M [fftn.f: 97/0]
	fmpy.s0		f81 = f33, f41		   // F [fftn.f: 97/0]
	fms.s.s0	f75 = f35, f41, f82	;; // F [fftn.f: 97/0]
	fma.s.s0	f83 = f35, f43, f81	   // F [fftn.f: 97/0]
	fadd.s.s0	f67 = f74, f75		;; // F [fftn.f: 99/0]
	fsub.s.s0	f68 = f74, f75		;; // F [fftn.f: 101/0]
	fsub.s.s0	f71 = f76, f83		   // F [fftn.f: 101/0]
	fadd.s.s0	f84 = f76, f83		;; // F [fftn.f: 99/0]
	fmerge.ns	f62 = f71, f71		   // F [fftn.f: 103/0]
(p17)	fadd.s.s0	f73 = f65, f84		   // F [fftn.f: 102/0]
	br.sptk.few	..L165			;; // B

..L140:
	add		r17 = -36, r22		;; // M
(p16)	add		r17 = -20, r17		;; // I
(p16)	add		r17 = -4, r17		;; // M
(p16)	add		r17 = -4, r17		;; // I
(p16)	add		r17 = -4, r17		;; // M
	ldfs		f47 = [r17]		;; // M [fftn.f: 94/0]
	fadd.s.s0	f65 = f47, f72		   // F [fftn.f: 98/0]
	fsub.s.s0	f66 = f47, f72		;; // F [fftn.f: 100/0]
	fadd.s.s0	f73 = f65, f84		   // F [fftn.f: 102/0]
	fadd.s.s0	f85 = f66, f68		;; // F [fftn.f: 103/0]
(p17)	chk.a.clr	f53, ..L141		;; // M
(p17)	fadd.s.s0	f60 = f63, f67		   // F [fftn.f: 102/0]
	br.sptk.few	..L166			;; // B

..L141:
	add		r16 = -28, r22		;; // M
(p16)	add		r16 = -20, r16		;; // I
(p16)	add		r16 = -4, r16		;; // M
(p16)	add		r16 = -4, r16		;; // I
(p16)	add		r16 = -4, r16		;; // M
	ldfs		f53 = [r16]		;; // M [fftn.f: 95/0]
	fmpy.s0		f80 = f59, f53		   // F [fftn.f: 95/0]
	fma.s.s0	f76 = f57, f53, f70	;; // F [fftn.f: 95/0]
	fms.s.s0	f74 = f57, f55, f80	   // F [fftn.f: 95/0]
	fsub.s.s0	f71 = f76, f83		;; // F [fftn.f: 101/0]
	fadd.s.s0	f84 = f76, f83		;; // F [fftn.f: 99/0]
	fsub.s.s0	f68 = f74, f75		   // F [fftn.f: 101/0]
	fadd.s.s0	f67 = f74, f75		;; // F [fftn.f: 99/0]
	fmerge.ns	f62 = f71, f71		   // F [fftn.f: 103/0]
	fadd.s.s0	f73 = f65, f84		;; // F [fftn.f: 102/0]
	fadd.s.s0	f85 = f66, f68		   // F [fftn.f: 103/0]
(p17)	fadd.s.s0	f60 = f63, f67		   // F [fftn.f: 102/0]
	br.sptk.few	..L166			;; // B

..L142:
	add		r15 = -20, r22		;; // M
(p16)	add		r15 = -20, r15		;; // I
(p16)	add		r15 = -4, r15		;; // M
(p16)	add		r15 = -4, r15		;; // I
(p16)	add		r15 = -4, r15		;; // M
	ldfs		f45 = [r15]		;; // M [fftn.f: 96/0]
	fmpy.s0		f77 = f37, f45		   // F [fftn.f: 96/0]
	fma.s.s0	f72 = f39, f45, f78	;; // F [fftn.f: 96/0]
	fms.s.s0	f79 = f39, f49, f77	   // F [fftn.f: 96/0]
	fadd.s.s0	f65 = f47, f72		;; // F [fftn.f: 98/0]
	fsub.s.s0	f66 = f47, f72		;; // F [fftn.f: 100/0]
	fadd.s.s0	f63 = f51, f79		   // F [fftn.f: 98/0]
	fsub.s.s0	f64 = f51, f79		;; // F [fftn.f: 100/0]
	fadd.s.s0	f73 = f65, f84		   // F [fftn.f: 102/0]
	fadd.s.s0	f85 = f66, f68		;; // F [fftn.f: 103/0]
	fadd.s.s0	f60 = f63, f67		   // F [fftn.f: 102/0]
	fsub.s.s0	f61 = f63, f67		;; // F [fftn.f: 104/0]
(p17)	chk.a.clr	f43, ..L143		   // M
(p16)	fmpy.s0		f69 = f58, f54		   // F [fftn.f: 95/0]
	br.sptk.few	..L167			;; // B

..L143:
	add		r6 = -12, r22		;; // M
(p16)	add		r6 = -20, r6		;; // I
(p16)	add		r6 = -4, r6		;; // M
(p16)	add		r6 = -4, r6		;; // I
(p16)	add		r6 = -4, r6		;; // M
	ldfs		f43 = [r6]		;; // M [fftn.f: 97/0]
	fmpy.s0		f82 = f33, f43		   // F [fftn.f: 97/0]
	fma.s.s0	f83 = f35, f43, f81	;; // F [fftn.f: 97/0]
	fms.s.s0	f75 = f35, f41, f82	   // F [fftn.f: 97/0]
	fsub.s.s0	f71 = f76, f83		;; // F [fftn.f: 101/0]
	fadd.s.s0	f84 = f76, f83		;; // F [fftn.f: 99/0]
	fadd.s.s0	f67 = f74, f75		   // F [fftn.f: 99/0]
	fsub.s.s0	f68 = f74, f75		;; // F [fftn.f: 101/0]
	fmerge.ns	f62 = f71, f71		   // F [fftn.f: 103/0]
	fadd.s.s0	f73 = f65, f84		;; // F [fftn.f: 102/0]
	fadd.s.s0	f85 = f66, f68		   // F [fftn.f: 103/0]
	fadd.s.s0	f60 = f63, f67		;; // F [fftn.f: 102/0]
	fsub.s.s0	f61 = f63, f67		   // F [fftn.f: 104/0]
(p16)	fmpy.s0		f69 = f58, f54		   // F [fftn.f: 95/0]
	br.sptk.few	..L167			;; // B

..L145:
	add		r25 = -24, r11		;; // M
	ldfs		f46 = [r25]		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f43 = f51, f46		   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f37 = f56, f46, f40	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f53 = f56, f48, f43	   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f15, f37		;; // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f15, f37		;; // F [fftn.f: 84/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f34, f53		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	fsub.s.s0	f8 = f34, f53		   // F [fftn.f: 84/0]
	br.sptk.few	..L169			;; // B

..L146:
	add		r25 = -8, r11		;; // M
	ldfs		f47 = [r25]		;; // M [fftn.f: 82/0]
	fmpy.s0		f39 = f50, f47		   // F [fftn.f: 82/0]
	fms.s.s0	f41 = f54, f47, f42	;; // F [fftn.f: 82/0]
	fma.s.s0	f36 = f54, f45, f39	   // F [fftn.f: 82/0]
	fadd.s.s0	f58 = f33, f41		;; // F [fftn.f: 83/0]
	fsub.s.s0	f7 = f33, f41		;; // F [fftn.f: 84/0]
	fadd.s.s0	f10 = f14, f36		   // F [fftn.f: 83/0]
	fsub.s.s0	f13 = f14, f36		;; // F [fftn.f: 84/0]
	chk.a.nc	f14, ..L150		   // M
	br.sptk.few	..L173			;; // B

..L147:
	add		r25 = -32, r11		;; // M
	ldfs		f48 = [r25]		;; // M [fftn.f: 82/0]
	fmpy.s0		f40 = f51, f48		   // F [fftn.f: 82/0]
	fms.s.s0	f53 = f56, f48, f43	;; // F [fftn.f: 82/0]
	fma.s.s0	f37 = f56, f46, f40	   // F [fftn.f: 82/0]
	fadd.s.s0	f12 = f34, f53		;; // F [fftn.f: 83/0]
	fsub.s.s0	f8 = f34, f53		;; // F [fftn.f: 84/0]
	fadd.s.s0	f11 = f15, f37		   // F [fftn.f: 83/0]
	fsub.s.s0	f6 = f15, f37		;; // F [fftn.f: 84/0]
	chk.a.nc	f15, ..L149		   // M
	br.sptk.few	..L170			;; // B

..L148:
	add		r25 = -8, r11		;; // M
	ldfs		f45 = [r25]		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f42 = f50, f45		   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f36 = f54, f45, f39	;; // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f41 = f54, f47, f42	   // F [fftn.f: 82/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f14, f36		;; // F [fftn.f: 83/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f13 = f14, f36		;; // F [fftn.f: 84/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f58 = f33, f41		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	fsub.s.s0	f7 = f33, f41		   // F [fftn.f: 84/0]
	br.sptk.few	..L172			;; // B

..L149:
	add		r25 = -36, r11		;; // M
	ldfs.a		f15 = [r25]		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f15, f37		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	fsub.s.s0	f6 = f15, f37		   // F [fftn.f: 84/0]
	br.sptk.few	..L170			;; // B

..L150:
	add		r25 = -12, r11		;; // M
	ldfs.a		f14 = [r25]		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f14, f36		   // F [fftn.f: 83/0]
	nop.m		0			   // M
	fsub.s.s0	f13 = f14, f36		   // F [fftn.f: 84/0]
	br.sptk.few	..L173			;; // B

..L151:
	add		r25 = -52, r11		;; // M
	ldfs		f35 = [r25]		;; // M [fftn.f: 83/0]
	fsub.s.s0	f9 = f35, f55		   // F [fftn.f: 84/0]
	chk.a.clr	f46, ..L145		   // M
	br.sptk.few	..L169			;; // B

..L152:
	add		r25 = -48, r11		;; // M
	ldfs		f32 = [r25]		;; // M [fftn.f: 83/0]
	fsub.s.s0	f7 = f32, f38		   // F [fftn.f: 84/0]
	stfs		[r15] = f13, 12		;; // M [fftn.f: 83/0]
	fsub.s.s0	f13 = f14, f36		   // F [fftn.f: 84/0]
	br.sptk.few	..L168			;; // B

..L153:
	add		r25 = -36, r11		;; // M
	ldfs.a		f34 = [r25]		;; // M [fftn.f: 83/0]
	fadd.s.s0	f12 = f34, f53		   // F [fftn.f: 83/0]
	fsub.s.s0	f8 = f34, f53		   // F [fftn.f: 84/0]
	chk.a.clr	f15, ..L157		   // M
	br.sptk.few	..L171			;; // B

..L154:
	add		r25 = -20, r11		;; // M
	ldfs.a		f33 = [r25]		;; // M [fftn.f: 83/0]
	fadd.s.s0	f58 = f33, f41		   // F [fftn.f: 83/0]
	fsub.s.s0	f7 = f33, f41		   // F [fftn.f: 84/0]
	chk.a.clr	f14, ..L159		   // M
	br.sptk.few	..L174			;; // B

..L155:
	add		r25 = 8, r11		;; // M
	ldfs		f44 = [r25]		   // M [fftn.f: 82/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fmpy.s0		f57 = f49, f44		   // F [fftn.f: 82/0]
	br.sptk.few	..L175			;; // B

..L156:
	add		r25 = -36, r11		;; // M
	ldfs		f34 = [r25]		;; // M [fftn.f: 83/0]
	fsub.s.s0	f8 = f34, f53		   // F [fftn.f: 84/0]
	chk.a.clr	f45, ..L148		   // M
	br.sptk.few	..L172			;; // B

..L157:
	add		r25 = -32, r11		;; // M
	ldfs		f15 = [r25]		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f6 = f15, f37		   // F [fftn.f: 84/0]
	br.sptk.few	..L171			;; // B

..L158:
	add		r25 = -20, r11		;; // M
	ldfs		f33 = [r25]		;; // M [fftn.f: 83/0]
	fsub.s.s0	f7 = f33, f41		   // F [fftn.f: 84/0]
	chk.a.clr	f44, ..L155		   // M
	br.sptk.few	..L175			;; // B

..L159:
	add		r25 = -16, r11		;; // M
	ldfs		f14 = [r25]		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f13 = f14, f36		   // F [fftn.f: 84/0]
	br.sptk.few	..L174			;; // B

..L160:
	add		r25 = -20, r11		;; // M
	ldfs		f11 = [r25]		   // M [fftn.f: 84/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f12 = f11, f8		   // F [fftn.f: 84/0]
	br.sptk.few	..L177			;; // B

..L161:
	add		r25 = -24, r11		;; // M
	ldfs		f7 = [r25]		;; // M [fftn.f: 84/0]
	fsub.s.s0	f10 = f7, f9		;; // F [fftn.f: 84/0]
	stfs		[r16] = f10, 4		   // M [fftn.f: 84/0]
	br.sptk.few	..L176			;; // B

..L162:
	add		r14 = -24, r8		;; // M
	ldfs		f11 = [r14]		;; // M [fftn.f: 83/0]
	fsub.s.s0	f6 = f11, f10		;; // F [fftn.f: 84/0]
	stfs		[r11] = f6, 12		   // M [fftn.f: 84/0]
//file/line/col fftn.f/85/0
	br.cloop.dptk.many ..L107		;; // B [fftn.f: 85/0]
	br.sptk.few	..L112			;; // B

..L163:
	add		r14 = -20, r8		;; // M
	ldfs		f9 = [r14]		   // M [fftn.f: 83/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f13 = f9, f12		   // F [fftn.f: 84/0]
	br.sptk.few	..L178			;; // B

..L1:
//	$end					;; // A

	.endp	fftn_

// ===
	.section .IA_64.unwind = "a", "unwind"
	.align 4
	.radix C
	data4.ua @segrel(.text+16)
	data4.ua @segrel(.text+10096)
	data4.ua @segrel(.tcg$unwind_info_block0000)

// ===
	.section .IA_64.unwind_info = "a", "progbits"
	.align 4
	data4.ua @segrel(.llo$annot_info_block0000)
.tcg$unwind_info_block0000:	data1	0x00, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x0c
	data1	0x1a, 0xe4, 0x0e, 0xb0, 0xa9, 0xe6, 0x06, 0xb1
	data1	0x28, 0xe8, 0x08, 0xb1, 0xab, 0xec, 0x12, 0xed
	data1	0x18, 0xea, 0x11, 0xb2, 0xaa, 0xdf, 0xc1, 0xb8
	data1	0x00, 0x00, 0x00, 0x00, 0x02, 0x28, 0x90, 0xe0
	data1	0x02, 0x1b, 0xe2, 0x04, 0x61, 0x8f, 0x05, 0x81
	data1	0xc0, 0x04, 0x61, 0xb9, 0x09, 0xa1, 0x00, 0x00

// ===


// ===
	.section .sdata = "asw", "progbits"
	.align 8
.tcg1$sdata:	data1	0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02

// ===
	.section .rodata = "a", "progbits"
	.align 16
.tcg0$rodata:	stringz	"Radix 2"
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	stringz	"Copy to top"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"Factor, etc."
	data1	0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xf4, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00
	stringz	"Bit reversal"
	data1	0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xf4, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xf9, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xf5, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00
	stringz	"(a,t15,f10.6)"
	data1	0x00, 0x00
	stringz	"(a,t15,f10.6)"
	data1	0x00, 0x00
	stringz	"(a,t15,f10.6)"
	data1	0x00, 0x00
	stringz	"(a,t15,f10.6)"
	data1	0x00, 0x00
	stringz	"Radix not 2 or 4."
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 7 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 7 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 2 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 4 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 6 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 6 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 5 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 5 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 3 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 3 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 1 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 1 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 2 DOITER (IDIM)"
	data1	0x00
	string 	"$HP$ _LOOPINFO 4 DOITER (IBFLY)"

// ===
	.section .rodata = "a", "progbits"
	.align 8

// ===
	.section .HP.opt_annot = "a", "annot"
	.align 8
.llo$annot_info_block0000:	data1	0x00, 0xac, 0x01, 0xbe, 0xfc, 0x20, 0xff, 0xff
	data1	0x00, 0x38, 0xc0, 0x00, 0x20, 0x0c, 0x01, 0x02
	data1	0x84, 0x00, 0x02, 0x88, 0x02, 0x00, 0x0f, 0x00

// ===
	.section .debug_procs_abbrev = "", "progbits"
	.align 1
$DEBUG_PROCS_ABBREV_CE0002_fftn_f:	data1	0x03, 0x11, 0x01, 0x10, 0x06, 0x90, 0x40, 0x06
	data1	0x03, 0x08, 0x13, 0x0b, 0x95, 0x40, 0x0b, 0x25
	data1	0x08, 0x1b, 0x08, 0x01, 0x13, 0x00, 0x00, 0x07
	data1	0x2e, 0x01, 0x94, 0x40, 0x0b, 0x96, 0x40, 0x06
	data1	0x11, 0x01, 0x12, 0x01, 0x97, 0x40, 0x01, 0x98
	data1	0x40, 0x01, 0x00, 0x00, 0x00

// ===
	.section .debug_procs_info = "", "progbits"
	.align 1
	data1	0x00, 0x00, 0x00, 0x4a, 0x00, 0x02
	data4.ua @secrel($DEBUG_PROCS_ABBREV_CE0002_fftn_f)
	data1	0x04, 0x03
	data4.ua @secrel($dbglline_CE0002_fftn_f)
	data4.ua @secrel($dbgaline_CE0002_fftn_f)
	stringz	"fftn.f"
	data1	0x08, 0x01, 0x47, 0x00
	stringz	"/nis.home/karp/fft"
	data1	0x00, 0x00, 0x00, 0x00, 0x07, 0x02, 0x00, 0x00
	data1	0x00, 0x00
	data4.ua .text+16
	data4.ua .text+10096
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00

// ===
	.section .debug_line = "", "progbits"
	.align 8
$dbglline_CE0002_fftn_f:	data1	0x00, 0x00, 0x01, 0x9d, 0x00, 0x02, 0x00, 0x00
	data1	0x00, 0x10, 0x04, 0x01, 0x00, 0x05, 0x0a, 0x01
	data1	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	data1	0x00, 0x00, 0x00, 0x05, 0x02
	data4.ua .text
	data1	0x00, 0x0b, 0x03
	stringz	"fftn.f"
	data1	0x00, 0x00, 0x00, 0x00, 0x05, 0x02
	data4.ua .text
	data1	0x04, 0x01, 0x21, 0x06, 0x05, 0x01, 0x02, 0x36
	data1	0x03, 0x11, 0x01, 0x06, 0x05, 0x00, 0x0a, 0x0b
	data1	0x0b, 0x06, 0x05, 0x01, 0x03, 0x7e, 0x01, 0x06
	data1	0x05, 0x00, 0x0a, 0x0b, 0x0b, 0x02, 0x34, 0x03
	data1	0x01, 0x01, 0x0b, 0x0b, 0x03, 0x7f, 0x01, 0x0b
	data1	0x03, 0x7f, 0x01, 0x0b, 0x03, 0x7f, 0x01, 0x0b
	data1	0x02, 0x16, 0x03, 0x7e, 0x01, 0x1f, 0x10, 0x2e
	data1	0x38, 0x27, 0x0b, 0x0b, 0x06, 0x05, 0x01, 0x03
	data1	0x73, 0x01, 0x06, 0x05, 0x00, 0x0a, 0x0b, 0x0b
	data1	0x06, 0x05, 0x01, 0x03, 0x7e, 0x01, 0x06, 0x05
	data1	0x00, 0x0a, 0x0b, 0x0b, 0x02, 0x0a, 0x03, 0x0c
	data1	0x01, 0x02, 0xb6, 0x01, 0x03, 0x01, 0x01, 0x0b
	data1	0x0b, 0x0e, 0x0b, 0x0b, 0x0b, 0x59, 0x56, 0x33
	data1	0x11, 0xba, 0x33, 0x65, 0x02, 0x5a, 0x03, 0x01
	data1	0x01, 0x02, 0x10, 0x03, 0x7e, 0x01, 0x0b, 0x0b
	data1	0x02, 0x0c, 0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02
	data1	0x08, 0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02, 0x08
	data1	0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02, 0x08, 0x03
	data1	0x7e, 0x01, 0x0b, 0x0b, 0x02, 0x08, 0x03, 0x7e
	data1	0x01, 0x0b, 0x0b, 0x02, 0x06, 0x03, 0x7e, 0x01
	data1	0x0b, 0x0b, 0x02, 0x0e, 0x03, 0x7d, 0x01, 0x1f
	data1	0x1f, 0x4c, 0x1a, 0x02, 0x5a, 0x01
	string 	"1B\X0b38\X0b\X0b\X0b"
	data1	0x02, 0x08, 0x03, 0x07, 0x01, 0x02, 0x03, 0x03
	data1	0x21, 0x01, 0x33, 0x06, 0x05, 0x01, 0x0a, 0x06
	data1	0x05, 0x00, 0x1f, 0x33, 0x02, 0x46, 0x01, 0x2e
	data1	0x1d, 0x02, 0x04, 0x03, 0x0b, 0x01, 0x06, 0x05
	data1	0x03, 0x02, 0x1c, 0x03, 0x57, 0x01, 0x06, 0x05
	data1	0x00, 0x0e, 0x0c, 0x02, 0xda, 0x01, 0x03, 0x01
	data1	0x01
	string 	"\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b=\X0b"
	data1	0x06, 0x05, 0x01, 0x02, 0x08, 0x03, 0x60, 0x01
	data1	0x06, 0x05, 0x00, 0x03, 0x05, 0x01, 0x02, 0x34
	data1	0x03, 0x01, 0x01, 0x02, 0x6e, 0x03, 0x01, 0x01
	data1	0xc9, 0x33, 0x02, 0x18, 0x03, 0x7e, 0x01, 0x0b
	data1	0x0b, 0x02, 0x18, 0x03, 0x7e, 0x01, 0x0b, 0x0b
	data1	0x02, 0x2d, 0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02
	data1	0x1f, 0x03, 0x7d, 0x01, 0xc9, 0x51, 0x15, 0x15
	data1	0x0b, 0x06, 0x05, 0x01, 0x02, 0x08, 0x03, 0x1e
	data1	0x01, 0x06, 0x05, 0x00, 0x0b, 0x7a, 0x14, 0x5b
	data1	0xd3, 0x32, 0x32, 0x32, 0x32, 0x32, 0x32, 0x23
	data1	0x02, 0x13, 0x03, 0x7f, 0x01, 0x29, 0x29, 0x02
	data1	0x5a, 0x01, 0x2e, 0x06, 0x05, 0x01, 0x0a, 0x06
	data1	0x05, 0x00, 0x02, 0x07, 0x03, 0x7c, 0x01, 0x02
	data1	0x2c, 0x03, 0x66, 0x01, 0x02, 0x8d, 0x05, 0x03
	data1	0x77, 0x01, 0x02, 0x04, 0x00, 0x01, 0x01

// ===
	.section .debug_actual = "", "progbits"
	.align 8
$dbgaline_CE0002_fftn_f:	data1	0x00, 0x00, 0x06, 0x57, 0x00, 0x02, 0x00, 0x00
	data1	0x00, 0x0e, 0x04, 0x01, 0x00, 0x05, 0x0a, 0x01
	data1	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	data1	0x00, 0x05, 0x02
	data4.ua .text
	data1	0x00, 0x05, 0x02
	data4.ua .text
	data1	0x1f, 0x00, 0x01, 0x11, 0x0f, 0x00, 0x01, 0x11
	data1	0x0f, 0x00, 0x01, 0x11, 0x28, 0x02, 0x20, 0x03
	data1	0x21, 0x01, 0x02, 0x02, 0x03, 0x5f, 0x01, 0x02
	data1	0x0c, 0x03, 0x21, 0x01, 0x02, 0x1a, 0x03, 0x71
	data1	0x01, 0x15, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x10
	data1	0x02, 0x01, 0x03, 0x7f, 0x01, 0x1a, 0x02, 0x03
	data1	0x03, 0x7f, 0x01, 0x1f, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x10, 0x33, 0x02, 0x16, 0x03, 0x7e, 0x01
	data1	0x10, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x15, 0x29
	data1	0x1a, 0x02, 0x07, 0x03, 0x0c, 0x01, 0x00, 0x01
	data1	0x11, 0x02, 0x01, 0x03, 0x78, 0x01, 0x02, 0x10
	data1	0x03, 0x09, 0x01, 0x02, 0x1d, 0x03, 0x07, 0x01
	data1	0x02, 0x02, 0x03, 0x7e, 0x01, 0x11, 0x00, 0x01
	data1	0x11, 0x02, 0x04, 0x03, 0x79, 0x01, 0x02, 0x01
	data1	0x03, 0x05, 0x01, 0x02, 0x03, 0x03, 0x7f, 0x01
	data1	0x00, 0x01, 0x11, 0x0f, 0x00, 0x01, 0x11, 0x19
	data1	0x24, 0x00, 0x01, 0x11, 0x32, 0x1a, 0x00, 0x01
	data1	0x11, 0x23, 0x15, 0x02, 0x06, 0x03, 0x7f, 0x01
	data1	0x00, 0x01, 0x11, 0x15, 0x00, 0x01, 0x11, 0x1e
	data1	0x00, 0x01, 0x11, 0x23, 0x00, 0x01, 0x11, 0x1e
	data1	0x00, 0x01, 0x11, 0x1e, 0x00, 0x01, 0x11, 0x1e
	data1	0x00, 0x01, 0x11, 0x37, 0x02, 0x13, 0x03, 0x57
	data1	0x01, 0x02, 0x04, 0x03, 0x2d, 0x01, 0x00, 0x01
	data1	0x11, 0x02, 0x01, 0x03, 0x7c, 0x01, 0x02, 0x04
	data1	0x03, 0x57, 0x01, 0x02, 0x02, 0x03, 0x29, 0x01
	data1	0x02, 0x05, 0x03, 0x57, 0x01, 0x02, 0x01, 0x03
	data1	0x29, 0x01, 0x00, 0x01, 0x11, 0x1e, 0x02, 0x03
	data1	0x03, 0x57, 0x01, 0x02, 0x01, 0x03, 0x29, 0x01
	data1	0x14, 0x00, 0x01, 0x11, 0x14, 0x32, 0x02, 0x02
	data1	0x03, 0x57, 0x01, 0x02, 0x01, 0x03, 0x29, 0x01
	data1	0x1d, 0x02, 0x01, 0x03, 0x7c, 0x01, 0x00, 0x01
	data1	0x11, 0x0f, 0x19, 0x02, 0x01, 0x03, 0x57, 0x01
	data1	0x02, 0x02, 0x03, 0x29, 0x01, 0x02, 0x01, 0x03
	data1	0x22, 0x01, 0x02, 0x03, 0x03, 0x5e, 0x01, 0x02
	data1	0x01, 0x03, 0x57, 0x01, 0x02, 0x01, 0x03, 0x29
	data1	0x01, 0x02, 0x02, 0x03, 0x22, 0x01, 0x00, 0x01
	data1	0x11, 0x02, 0x02, 0x03, 0x5e, 0x01, 0x02, 0x04
	data1	0x03, 0x22, 0x01, 0x02, 0x07, 0x03, 0x5f, 0x01
	data1	0x02, 0x01, 0x03, 0x21, 0x01, 0x00, 0x01, 0x11
	data1	0x02, 0x04, 0x03, 0x5f, 0x01, 0x15, 0x02, 0x01
	data1	0x03, 0x20, 0x01, 0x02, 0x01, 0x03, 0x5f, 0x01
	data1	0x00, 0x01, 0x11, 0x19, 0x02, 0x01, 0x03, 0x30
	data1	0x01, 0x02, 0x02, 0x03, 0x51, 0x01, 0x02, 0x01
	data1	0x03, 0x2f, 0x01, 0x02, 0x01, 0x03, 0x71, 0x01
	data1	0x02, 0x02, 0x03, 0x0f, 0x01, 0x02, 0x04, 0x03
	data1	0x52, 0x01, 0x02, 0x01, 0x03, 0x2e, 0x01, 0x02
	data1	0x09, 0x03, 0x53, 0x01, 0x02, 0x1a, 0x03, 0x1b
	data1	0x01, 0x11, 0x02, 0x03, 0x03, 0x7d, 0x01, 0x12
	data1	0x02, 0x03, 0x03, 0x7e, 0x01, 0x02, 0x02, 0x03
	data1	0x7f, 0x01, 0x15, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x10, 0x02, 0x07, 0x03, 0x7f, 0x01, 0x10, 0x1f
	data1	0x15, 0x02, 0x01, 0x03, 0x7e, 0x01, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x15, 0x10, 0x02, 0x03, 0x03
	data1	0x7f, 0x01, 0x10, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x15, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x11, 0x02, 0x0e, 0x03, 0x7f
	data1	0x01, 0x10, 0x38, 0x02, 0x02, 0x03, 0x7f, 0x01
	data1	0x02, 0x01, 0x03, 0x7f, 0x01, 0x02, 0x01, 0x03
	data1	0x7f, 0x01, 0x17, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x02, 0x03, 0x03, 0x7f, 0x01, 0x15, 0x02, 0x04
	data1	0x03, 0x7e, 0x01, 0x15, 0x10, 0x02, 0x01, 0x03
	data1	0x7f, 0x01, 0x15, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x10, 0x24, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x02
	data1	0x4e, 0x03, 0x01, 0x01, 0x02, 0x0e, 0x03, 0x7e
	data1	0x01, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x12, 0x02
	data1	0x02, 0x03, 0x7e, 0x01, 0x1f, 0x51, 0x15, 0x00
	data1	0x01, 0x11, 0x0f, 0x02, 0x01, 0x03, 0x0b, 0x01
	data1	0x02, 0x02, 0x03, 0x75, 0x01, 0x00, 0x01, 0x11
	data1	0x0f, 0x00, 0x01, 0x11, 0x19, 0x02, 0x01, 0x03
	data1	0x0b, 0x01, 0x00, 0x01, 0x11, 0x02, 0x03, 0x03
	data1	0x75, 0x01, 0x00, 0x01, 0x11, 0x23, 0x02, 0x01
	data1	0x03, 0x09, 0x01, 0x00, 0x01, 0x11, 0x02, 0x03
	data1	0x03, 0x77, 0x01, 0x00, 0x01, 0x11, 0x0f, 0x00
	data1	0x01, 0x11, 0x5a, 0x00, 0x01, 0x11, 0x5a, 0x00
	data1	0x01, 0x11, 0x32, 0x02, 0x0b, 0x03, 0x0b, 0x01
	data1	0x02, 0x01, 0x03, 0x75, 0x01, 0x00, 0x01, 0x11
	data1	0x1e, 0x1a, 0x02, 0x03, 0x03, 0x0a, 0x01, 0x02
	data1	0x04, 0x03, 0x76, 0x01, 0x00, 0x01, 0x11, 0x28
	data1	0x1a, 0x00, 0x01, 0x11, 0x23, 0x16, 0x00, 0x01
	data1	0x11, 0x02, 0x01, 0x03, 0x7e, 0x01, 0x1b, 0x36
	data1	0x10, 0x1b, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x02
	data1	0x01, 0x03, 0x7f, 0x01, 0x02, 0x03, 0x03, 0x31
	data1	0x01, 0x02, 0x01, 0x03, 0x6d, 0x01, 0x02, 0x01
	data1	0x03, 0x64, 0x01, 0x02, 0x03, 0x03, 0x7f, 0x01
	data1	0x02, 0x01, 0x03, 0x30, 0x01, 0x02, 0x02, 0x03
	data1	0x51, 0x01, 0x00, 0x01, 0x11
	stringz	"(+3"
	data1	0x01, 0x11, 0x1e, 0x00, 0x01, 0x11, 0x0f, 0x00
	data1	0x01, 0x11, 0x19, 0x00, 0x01, 0x11, 0x0f, 0x02
	data1	0x04, 0x03, 0x48, 0x01, 0x00, 0x01, 0x11, 0x02
	data1	0x03, 0x03, 0x38, 0x01, 0x11, 0x00, 0x01, 0x11
	data1	0x02, 0x03, 0x03, 0x7e, 0x01, 0x00, 0x01, 0x11
	data1	0x14, 0x00, 0x01, 0x11, 0x5a, 0x00, 0x01, 0x11
	data1	0x46, 0x00, 0x01, 0x11, 0x1e, 0x00, 0x01, 0x11
	data1	0x46, 0x15, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x10
	data1	0x00, 0x01, 0x11, 0x1e, 0x1f, 0x15, 0x02, 0x01
	data1	0x03, 0x3c, 0x01, 0x02, 0x01, 0x03, 0x44, 0x01
	data1	0x15, 0x00, 0x01, 0x11, 0x73, 0x00, 0x01, 0x18
	data1	0x23, 0x17, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x02
	data1	0x19, 0x03, 0x0c, 0x01, 0x02, 0x01, 0x03, 0x74
	data1	0x01, 0x02, 0x06, 0x03, 0x0c, 0x01, 0x02, 0x3c
	data1	0x03, 0x77, 0x01, 0x11, 0x13, 0x02, 0x02, 0x03
	data1	0x7a, 0x01, 0x11, 0x11, 0x02, 0x02, 0x03, 0x7c
	data1	0x01, 0x18, 0x02, 0x02, 0x03, 0x7e, 0x01, 0x18
	data1	0x02, 0x02, 0x03, 0x7b, 0x01, 0x16, 0x02, 0x02
	data1	0x03, 0x34, 0x01, 0x02, 0x01, 0x03, 0x4b, 0x01
	data1	0x03, 0x7f, 0x01, 0x03, 0x7f, 0x01, 0x0b, 0x03
	data1	0x36, 0x01, 0x03, 0x4b, 0x01, 0x12, 0x02, 0x02
	data1	0x03, 0x7c, 0x01, 0x16, 0x02, 0x02, 0x03, 0x34
	data1	0x01, 0x02, 0x01, 0x03, 0x52, 0x01, 0x02, 0x01
	data1	0x03, 0x7c, 0x01, 0x00, 0x01, 0x11, 0x02, 0x03
	data1	0x03, 0x05, 0x01, 0x02, 0x01, 0x03, 0x7e, 0x01
	data1	0x00, 0x01, 0x11, 0x2a, 0x02, 0x06, 0x03, 0x7d
	data1	0x01, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x20
	data1	0x02, 0x04, 0x03, 0x77, 0x01, 0x20, 0x02, 0x04
	data1	0x03, 0x7e, 0x01, 0x20, 0x00, 0x01, 0x11, 0x02
	data1	0x02, 0x03, 0x05, 0x01, 0x00, 0x01, 0x11, 0x10
	data1	0x02, 0x01, 0x03, 0x79, 0x01, 0x02, 0x04, 0x03
	data1	0x07, 0x01, 0x00, 0x01, 0x11, 0x02, 0x02, 0x03
	data1	0x7f, 0x01, 0x02, 0x02, 0x03, 0x7a, 0x01, 0x02
	data1	0x04, 0x03, 0x08, 0x01, 0x02, 0x04, 0x03, 0x77
	data1	0x01, 0x20, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x20
	data1	0x00, 0x01, 0x11, 0x02, 0x02, 0x03, 0x06, 0x01
	data1	0x00, 0x01, 0x11, 0x10, 0x02, 0x01, 0x03, 0x78
	data1	0x01, 0x02, 0x04, 0x03, 0x09, 0x01, 0x00, 0x01
	data1	0x11, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x02, 0x02
	data1	0x03, 0x78, 0x01, 0x02, 0x03, 0x03, 0x09, 0x01
	data1	0x10, 0x5c, 0x16, 0x02, 0x20, 0x03, 0x0e, 0x01
	data1	0xbf, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x2e, 0x02
	data1	0x01, 0x03, 0x7f, 0x01, 0x1a, 0x02, 0x08, 0x03
	data1	0x7f, 0x01, 0x25, 0x03, 0x7e, 0x01, 0x0b, 0x0b
	data1	0x03, 0x7e, 0x01, 0x02, 0x3d, 0x03, 0x01, 0x01
	data1	0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x1f, 0x02
	data1	0x04, 0x03, 0x7f, 0x01, 0x33, 0x02, 0x06, 0x03
	data1	0x7f, 0x01, 0x3d, 0x02, 0x0a, 0x03, 0x7f, 0x01
	data1	0x10, 0x02, 0x07, 0x03, 0x7e, 0x01, 0x10, 0x33
	data1	0x02, 0x0f, 0x03, 0x7f, 0x01, 0x38, 0x02, 0x15
	data1	0x03, 0x7e, 0x01, 0x47, 0x1f, 0x02, 0x02, 0x03
	data1	0x7f, 0x01, 0x29, 0x02, 0x06, 0x03, 0x7f, 0x01
	data1	0x1f, 0x02, 0x02, 0x03, 0x19, 0x01, 0x02, 0x1e
	data1	0x03, 0x65, 0x01, 0x33, 0x02, 0x06, 0x03, 0x7f
	data1	0x01, 0x5b, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x1f, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x24, 0x02
	data1	0x05, 0x03, 0x19, 0x01, 0x02, 0x08, 0x03, 0x6a
	data1	0x01, 0x02, 0x02, 0x03, 0x14, 0x01, 0x02, 0x01
	data1	0x03, 0x6e, 0x01, 0x00, 0x01, 0x11, 0x4b, 0x02
	data1	0x08, 0x03, 0x12, 0x01, 0x02, 0x04, 0x03, 0x6e
	data1	0x01, 0x02, 0x0a, 0x03, 0x0c, 0x01, 0x02, 0x62
	data1	0x03, 0x01, 0x01, 0x02, 0x12, 0x03, 0x7f, 0x01
	data1	0x3d, 0x15, 0x00, 0x01, 0x11, 0x46, 0x00, 0x01
	data1	0x11, 0x02, 0x01, 0x03, 0x72, 0x01, 0x02, 0x01
	data1	0x03, 0x0e, 0x01, 0x00, 0x01, 0x11, 0x28, 0x00
	data1	0x01, 0x11, 0x1e, 0x00, 0x01, 0x11, 0x0f, 0x10
	data1	0x02, 0x02, 0x03, 0x7f, 0x01, 0x15, 0x00, 0x01
	data1	0x11, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x00, 0x01
	data1	0x11, 0x1e, 0x10, 0x00, 0x01, 0x11, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x00, 0x01, 0x11, 0x6e, 0x00
	data1	0x01, 0x11, 0x46, 0x00, 0x01, 0x11, 0x1e, 0x00
	data1	0x01, 0x11, 0x46, 0x15, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x10, 0x00, 0x01, 0x11, 0x1e, 0x1f, 0x02
	data1	0x06, 0x03, 0x70, 0x01, 0x02, 0x04, 0x03, 0x8e
	data1	0x7f, 0x01, 0x02, 0x08, 0x03, 0x0d, 0x01, 0x02
	data1	0x11, 0x03, 0xf8, 0x00, 0x01, 0x02, 0x03, 0x03
	data1	0x4c, 0x01, 0x20, 0x02, 0x11, 0x03, 0x7b, 0x01
	data1	0x63, 0x20, 0x02, 0x08, 0x03, 0x7e, 0x01, 0x1d
	data1	0x02, 0x0c, 0x03, 0x79, 0x01, 0x57, 0x20, 0x02
	data1	0x04, 0x03, 0x7e, 0x01, 0x20, 0x34, 0x02, 0x0d
	data1	0x03, 0x7b, 0x01, 0x57, 0x20, 0x02, 0x08, 0x03
	data1	0x7e, 0x01, 0x22, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x02, 0x0d, 0x03, 0x30, 0x01, 0x02, 0x03, 0x03
	data1	0x4c, 0x01, 0x20, 0x20, 0x1f, 0x02, 0x08, 0x03
	data1	0x7f, 0x01, 0x02, 0x0d, 0x03, 0x79, 0x01, 0x02
	data1	0x0f, 0x03, 0x06, 0x01, 0x02, 0x04, 0x03, 0x7e
	data1	0x01, 0x20, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x22
	data1	0x02, 0x04, 0x03, 0x7f, 0x01, 0x1f, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x02, 0x0d, 0x03, 0x7a, 0x01
	data1	0x57, 0x20, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x20
	data1	0x20, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x20
	data1	0x02, 0x05, 0x03, 0x77, 0x01, 0x48, 0x59, 0x02
	data1	0x04, 0x03, 0x7e, 0x01, 0x34, 0x20, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x1f, 0x02, 0x04, 0x03, 0x7f
	data1	0x01, 0x20, 0x02, 0x04, 0x03, 0x77, 0x01, 0x02
	data1	0x05, 0x03, 0x1d, 0x01, 0x60, 0x1f, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x1a, 0x02, 0x04, 0x03, 0x7e
	data1	0x01, 0x56, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x1f, 0x02, 0x09, 0x03, 0x7e, 0x01, 0x56, 0x1f
	data1	0x02, 0x04, 0x03, 0x7f, 0x01, 0x1f, 0x02, 0x09
	data1	0x03, 0x7e, 0x01, 0x60, 0x1f, 0x02, 0x04, 0x03
	data1	0x7f, 0x01, 0x1a, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x33, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x33, 0x02
	data1	0x04, 0x03, 0x7f, 0x01, 0x1a, 0x02, 0x09, 0x03
	data1	0x7f, 0x01, 0x1a, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x1f, 0x02, 0x05, 0x03, 0x7f, 0x01, 0x2e, 0x02
	data1	0x09, 0x03, 0x7f, 0x01, 0x2e, 0x02, 0x09, 0x03
	data1	0x7e, 0x01, 0x33, 0x1a, 0x02, 0x09, 0x03, 0x7f
	data1	0x01, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x1a
	data1	0x02, 0x09, 0x03, 0x7f, 0x01, 0x1f, 0x02, 0x18
	data1	0x03, 0x7f, 0x01, 0x1a, 0x02, 0x05, 0x03, 0x19
	data1	0x01, 0x02, 0x08, 0x03, 0x66, 0x01, 0x1f, 0x02
	data1	0x04, 0x00, 0x01, 0x01

// ===
	.section .note = "", "note"
	.align 4
	data1	0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x99
	data1	0x00, 0x00, 0x00, 0x01
	stringz	"HP"
	data1	0x00
	stringz	"HPF90   HPFORTRAN90                         -hp\"-Oq02,al,ag,cn,sz,ic,vo,Mf,po,es,rs,Rf,Pr,sp,in,cl,om,vc,Pi,fa,Pe,Rr,pa,pv,nf,cp,lx,Pg,ug,Lu,lb,uj,dn,sg,pt,kt,em,np,ar,rp,dl,Fs,bp,wp,pc,Mp,lr,cx,cr,pi,so,Rc,fa,ft,fe,ap,st,Lc,Bl,ib,sd,ll,rl,dl,lt,ol,fl,lm,ts,rd,Dp,If!,-Ol11indirect!,-Ol12aggressive!,-Ubridge=asm,-Ubridge=DD32,-Ubridge=DSblended,-Ubridge=cache_info:3072:128:12,-Ubridge=ppu,-Ubridge=math_ielf_path:/opt/fortran90/lib/ielf/math/hpux32,-Ubridge=compdir:/nis.home/karp/fft$,-Ubridge=sourcefile:fftn.f$\"\n/nis.home/karp/fft\nf90com32 options = -noargov -cm -w95 -nbs -auto -WB -OI -O2 -O8 -O9 -I/opt/fortran90/include+ -MD/opt/fortran90/include/hpux32+ "
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	data1	0x00, 0x00, 0x2a, 0x00, 0x00, 0x00, 0x04
	stringz	"HP"
	data1	0x00
	stringz	"fftn.f\n/nis.home/karp/fft\nFORTRAN 32 bits"
	data1	0x00, 0x00
