	.file	"fftbb.f"
	.psr	msb
	.radix	C
	.type	fftbb_,@function
	.global seconds_
	.type	seconds_,@function
	.global coeffs_
	.type	coeffs_,@function
	.global factor_
	.type	factor_,@function
	.global reorderm_
	.type	reorderm_,@function
	.global __F90_F_STOP
	.type	__F90_F_STOP,@function

// Routine 6 ("FFTBB"::2)

	.global _atanf
	.type	_atanf,@function
	.global _Cosf_2
	.type	_Cosf_2,@function
	.global _atanf
	.global	_atanf
	.type	_atanf,@function
	.global _Sinf_2
	.type	_Sinf_2,@function
	.global _Trigfstart_v2
	.type	_Trigfstart_v2,@function
	.global	_Trigfstart_v2
	.global __milli_div32I
	.type	__milli_div32I,@function
	.global	__milli_div32I
	.hidden		__milli_div32I
	.radix	C

	.psr	abi32

	.psr	msb

	.section .text = "ax", "progbits"
	.proc	fftbb_
..L0:
//	$start		CMid945 = 		;; // A

..L2:
fftbb_::
//file/line/col fftbb.f/4/0
//	$entry		CMid946, r32, r33, r34, r35, r36 =  // A [fftbb.f: 4/0]
	mov		r18 = ar.unat		   // M [fftbb.f: 4/0]
	add		r10 = 0, sp		   // M [fftbb.f: 4/0] [UVU: ]
	add		sp = -496, sp		   // I [fftbb.f: 4/0] [UVU: ]
	addp4		r8 = 0, r34		   // M [fftbb.f: 4/0] [UVuse]
	addp4		r17 = 0, r33		   // M
	add		r16 = 304, r0		;; // I
	alloc		r48 = ar.pfs, 5, 59, 6, 16 // M [fftbb.f: 4/0] [UVU: ]
	add		r11 = -192, r10		   // M [fftbb.f: 4/0]
	mov		r49 = rp		   // I [fftbb.f: 4/0]
	add		r14 = -184, r10		   // M [fftbb.f: 4/0]
	add		r19 = -224, r10		   // M [fftbb.f: 4/0]
	add		r52 = -464, r10		;; // I [fftbb.f: 4/0]
	add		r53 = 0, gp		   // M
	add		r59 = 0, r0		   // M
	mov		r50 = ar.lc		   // I [fftbb.f: 4/0]
	add		r95 = 0, r0		   // M [fftbb.f: 24/0] [UVU: ]
	add		r15 = -292, r0		;; // I
	mov		r51 = pr		;; // I [fftbb.f: 4/0]
	st8		[r19] = r18		   // M [fftbb.f: 4/0]
	st8.spill	[r11] = r4, 16		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	st8.spill	[r14] = r5, 16		   // M [fftbb.f: 4/0]
	st8.spill	[r11] = r6, 16		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	st8.spill	[r14] = r7, 24		   // M [fftbb.f: 4/0]
	stf.spill	[r11] = f2, 32		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	stf.spill	[r14] = f3, 32		   // M [fftbb.f: 4/0]
	stf.spill	[r11] = f4, 32		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	stf.spill	[r14] = f5, 32		   // M [fftbb.f: 4/0]
	stf.spill	[r11] = f16, 32		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	stf.spill	[r14] = f17, 32		   // M [fftbb.f: 4/0]
	stf.spill	[r11] = f18, 32		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	stf.spill	[r14] = f19, 32		   // M [fftbb.f: 4/0]
	stf.spill	[r11] = f20, 32		   // M [fftbb.f: 4/0]
	nop.i		0			;; // I
	stf.spill	[r14] = f21, 16		   // M [fftbb.f: 4/0]
//	$fence					   // A [fftbb.f: 4/0] [UVU: ]
	ld4		r55 = [r8]		   // M [fftbb.f: 4/0]
	add		r8 = 0, r36		;; // I
//file/line/col fftbb.f/24/1/E,24/0,25/0,26/0,25/0,26/0
	cmp4.gt.unc	p6, p0 = 1, r55		   // M [fftbb.f: 26/0]
	add		r9 = 1, r55		   // M
(p6)	br.dpnt.many	..L4			;; // B [fftbb.f: 26/0]

..L144:
	cmp4.ge.unc	p6, p7 = 2, r9		   // M
	add		r9 = -1, r55		   // M
	add		r24 = 0, r0		   // I
	add		r59 = 0, r0		   // M
	add		r18 = 0, r17		   // M
	add		r14 = 4, r17		;; // I
(p6)	add		r19 = 0, r0		   // M
	add		r10 = 0, r33		   // M
(p7)	zxt4		r19 = r9		   // I
	add		r11 = 0, r32		   // M
	add		r9 = 0, r35		;; // I
	add		r22 = 1, r19		;; // I
	nop.m		0			   // M
	extr.u		r20 = r22, 2, 62	;; // I
	cmp4.ge.unc	p6, p0 = r0, r20	   // I
	add		r21 = -1, r20		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L157			;; // B

..L156:
	add		r24 = 0, r0		   // M
	add		r59 = 0, r0		   // M
	mov		ar.lc = r21		   // I
	cmp.ne.or.andcm	p16, p17 = 42, r0	   // M
	cmp.eq.and	p18, p19 = 42, r0	;; // I
	mov		ar.ec = 2		;; // I

..L146:
(p16)	ld4		r23 = [r18], r16	   // M [fftbb.f: 27/0]
(p16)	ld4		r21 = [r14], 4		   // M [fftbb.f: 27/0]
(p19)	add		r24 = 0, r25		;; // I [fftbb.f: 28/0]
(p16)	lfetch		[r18], r15		   // M [fftbb.f: 27/0]
(p16)	ld4		r25 = [r14], 12		   // M [fftbb.f: 27/0]
(p16)	cmp4.lt.unc	p18, p0 = r23, r24	   // I [fftbb.f: 28/0]
(p16)	add		r19 = r59, r23		;; // M [fftbb.f: 27/0]
(p18)	add		r23 = 0, r24		   // M [fftbb.f: 28/0]
	nop.i		0			   // I
(p16)	ld4		r24 = [r18], 4		   // M [fftbb.f: 27/0]
(p16)	add		r17 = r19, r21		;; // I [fftbb.f: 27/0]
(p16)	add		r26 = r17, r25		   // I [fftbb.f: 27/0]
(p16)	cmp4.lt.unc	p18, p0 = r21, r23	;; // M [fftbb.f: 28/0]
(p16)	add		r59 = r26, r24		   // M [fftbb.f: 27/0]
(p18)	add		r21 = 0, r23		;; // I [fftbb.f: 28/0]
(p16)	cmp4.lt.unc	p18, p0 = r25, r21	   // M [fftbb.f: 28/0]
	nop.i		0			;; // I
(p18)	add		r25 = 0, r21		;; // I [fftbb.f: 28/0]
(p16)	cmp4.lt.unc	p18, p0 = r24, r25	   // M [fftbb.f: 28/0]
	nop.m		0			   // M
//file/line/col fftbb.f/27/0,28/0,29/0,28/0,29/0,28/0,29/0,28/0,29/0
	br.ctop.dptk.many ..L146		;; // B [fftbb.f: 29/0]

..L154:
	shladd		r14 = r20, 2, r0	   // M
	add		r36 = 0, r8		   // M
	add		r35 = 0, r9		   // I
	add		r33 = 0, r10		   // M
	add		r32 = 0, r11		   // M
	add		r17 = 0, r18		;; // I
	sub		r8 = r22, r14		;; // M
	cmp4.ne		p0, p6 = 0, r8		   // M
	add		r19 = -1, r8		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L143			;; // B

..L157:
	add		r8 = 0, r17		   // M
	mov		ar.lc = r19		   // I
	nop.i		0			;; // I

..L150:
//file/line/col fftbb.f/27/0
	ld4		r9 = [r8], 4		;; // M [fftbb.f: 27/0]
	cmp4.lt		p6, p0 = r9, r24	   // M [fftbb.f: 28/0]
	add		r59 = r59, r9		;; // I [fftbb.f: 27/0]
//file/line/col fftbb.f/28/0
(p6)	add		r9 = 0, r24		;; // M [fftbb.f: 28/0]
//file/line/col fftbb.f/29/0
	add		r24 = 0, r9		   // M
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.cloop.dptk.many ..L150		;; // B [fftbb.f: 29/0]

..L155:

..L143:

..L4:
//file/line/col fftbb.f/30/0
	nop.m		0			   // M
	tbit.nz.unc	p6, p0 = r59, 6		   // I [fftbb.f: 30/0] [UVuse]
(p6)	br.dpnt.many	..L8			;; // B [fftbb.f: 30/0]

..L10:
	and		r9 = 63, r59		   // M [fftbb.f: 30/0] [UVuse]
	add		r8 = 1, r0		;; // I [fftbb.f: 30/0]
	shl		r60 = r8, r9		;; // I [fftbb.f: 30/0]

..L9:
	cmp4.gt.unc	p1, p0 = 1, r55		   // M [fftbb.f: 26/0]
	add		r54 = 1, r0		   // M [fftbb.f: 38/0] [UVU: ]
	nop.i		0			   // I
	nop.m		0			   // M
//file/line/col fftbb.f/31/0[2]
	fmerge.s	f8 = f1, f1		   // F [fftbb.f: 32/0]
	br.call.sptk.many rp = _atanf		;; // B [fftbb.f: 32/0]
	add		gp = 0, r53		   // M [fftbb.f: 32/0]
	fmerge.s	f8 = f8, f8		   // F [fftbb.f: 32/0]
	br.call.sptk.many rp = _Trigfstart_v2	;; // B [fftbb.f: 32/0]
	add		gp = 0, r53		   // M [fftbb.f: 32/0]
	nop.m		0			   // M
	fmerge.s	f16 = f12, f12		   // F [fftbb.f: 32/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmerge.s	f5 = f11, f11		;; // F [fftbb.f: 32/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmerge.s	f4 = f10, f10		   // F [fftbb.f: 32/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmerge.s	f3 = f9, f9		;; // F [fftbb.f: 32/0]
	nop.m		0			   // M
	fmerge.s	f2 = f8, f8		   // F [fftbb.f: 32/0]
//file/line/col fftbb.f/32/0,36/0,37/0,38/0,25/0,26/0,25/0,26/0
(p1)	br.dpnt.many	..L14			;; // B [fftbb.f: 38/0]

..L142:
	addp4		r8 = 0, r33		   // M
	add		r66 = 2, r0		   // M
	add		r61 = 0, r60		   // I
	add		r33 = 0, r95		   // M
	nop.i		0			;; // I
	add		r68 = 0, r8		;; // I

..L16:
//file/line/col fftbb.f/39/0
	ld4		r92 = [r68], 4		   // M [fftbb.f: 39/0]
	add		r11 = 32, r52		   // M
	add		r10 = 96, r52		   // I
	add		r9 = 160, r52		   // M
	add		r8 = 224, r52		   // M
	add		r14 = 288, r52		;; // I
	lfetch		[r11]			   // M
	lfetch		[r10]			   // M
	tbit.nz		p6, p0 = r92, 6		;; // I [fftbb.f: 39/0]
	lfetch		[r9]			   // M
	lfetch		[r8]			   // M
	nop.i		0			;; // I
	lfetch		[r14]			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L17			;; // B [fftbb.f: 39/0]

..L19:
	and		r8 = 63, r92		   // M [fftbb.f: 39/0]
	nop.i		0			;; // I
	shl		r9 = r54, r8		;; // I [fftbb.f: 39/0]

..L18:
	add		r37 = 8, r52		   // M
	add		out0 = 12, r52		   // M
	add		r8 = -1, r60		   // I [fftbb.f: 57/0] [UVuse]
	add		r42 = @ltoff(.tcg0$data), gp // M [fftbb.f: 48/0]
	add		r40 = 50, r0		   // M [fftbb.f: 48/0]
	add		r39 = 3, r0		;; // I [fftbb.f: 48/0]
	st4		[r37] = r9		   // M [fftbb.f: 39/0] [UVU]
	stfs		[out0] = f0		   // M [fftbb.f: 46/0]
	cmp4.gt.unc	p1, p0 = r0, r8		   // I [fftbb.f: 57/0]
	add		r34 = 32, r52		   // M
//file/line/col fftbb.f/40/0,41/0,42/0,46/0
	add		r41 = 4, r52		   // M
	br.call.sptk.many rp = seconds_		;; // B [fftbb.f: 46/0] [UVU]
	add		gp = 0, r53		   // M [fftbb.f: 46/0]
//file/line/col fftbb.f/47/0[2]
	add		out0 = 0, r37		   // I [fftbb.f: 47/0]
	add		out1 = 0, r35		;; // I [fftbb.f: 47/0]
	add		r38 = @ltoff(.tcg1$rodata), gp // M [fftbb.f: 190/0]
	nop.m		0			   // M
	br.call.sptk.many rp = coeffs_		;; // B [fftbb.f: 47/0] [UVU]
	ld8		out4 = [r42]		   // M [fftbb.f: 48/0]
	ld8		r57 = [r38]		   // M [fftbb.f: 190/0]
	add		out3 = 16, r52		   // I
	add		out5 = 20, r52		   // M
	add		gp = 0, r53		   // M [fftbb.f: 47/0]
	add		out0 = 0, r37		;; // I [fftbb.f: 48/0]
//file/line/col fftbb.f/48/0[2]
	st4		[out3] = r40		   // M [fftbb.f: 48/0]
	st4		[out5] = r39		   // M [fftbb.f: 48/0]
	add		out1 = 0, r34		   // I [fftbb.f: 48/0]
	add		out2 = 0, r41		   // M [fftbb.f: 48/0]
	nop.m		0			   // M
	br.call.sptk.many rp = factor_		;; // B [fftbb.f: 48/0] [UVU]
	add		gp = 0, r53		   // M [fftbb.f: 48/0]
//file/line/col fftbb.f/49/0[2]
	add		out0 = 0, r37		   // M [fftbb.f: 49/0]
	add		out1 = 0, r36		   // I [fftbb.f: 49/0]
	add		out2 = 0, r34		   // M [fftbb.f: 49/0]
	add		out3 = 0, r41		   // M [fftbb.f: 49/0]
	br.call.sptk.many rp = reorderm_	;; // B [fftbb.f: 49/0] [UVU]
	add		out0 = 24, r52		   // M
	add		gp = 0, r53		;; // I [fftbb.f: 49/0]
	nop.i		0			   // I
//file/line/col fftbb.f/53/0
	stfs		[out0] = f0		   // M [fftbb.f: 53/0]
	nop.m		0			   // M
	br.call.sptk.many rp = seconds_		;; // B [fftbb.f: 53/0] [UVU]
	ld4		r8 = [r37]		   // M [fftbb.f: 54/0]
	add		gp = 0, r53		   // I [fftbb.f: 53/0]
	add		out0 = 0, r52		;; // I [fftbb.f: 65/0]
//file/line/col fftbb.f/54/0
	add		r24 = -1, r8		;; // M [fftbb.f: 54/0]
//file/line/col fftbb.f/55/0
	andcm		r22 = -1, r24		   // M [fftbb.f: 55/0]
//file/line/col fftbb.f/57/0
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p1)	br.dpnt.many	..L20			;; // B [fftbb.f: 57/0]

..L141:
	cmp4.ge.unc	p6, p7 = 1, r60		   // M
	add		r8 = -1, r60		   // M
	shladdp4	r15 = r33, 3, r32	   // I
	add		r20 = 0, r95		   // M
	add		r10 = -0x4d4, r0	   // M
	add		r11 = 0x4d8, r0		;; // I
(p6)	add		r16 = 0, r0		   // M
	add		r9 = 20, r15		   // M
(p7)	zxt4		r16 = r8		   // I
	add		r14 = 0, r15		   // M
	add		r8 = 60, r15		;; // I
	add		r25 = 1, r16		;; // I
	nop.m		0			   // M
	extr.u		r18 = r25, 3, 61	;; // I
	cmp4.ge.unc	p6, p0 = r0, r18	   // I
	add		r17 = -1, r18		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L177			;; // B

..L176:
	add		r20 = 0, r95		   // M
	mov		ar.lc = r17		   // I
	nop.i		0			;; // I

..L158:
//file/line/col fftbb.f/58/0
	ldfs		f11 = [r14], 4		   // M [fftbb.f: 60/0]
	ldfs.a		f9 = [r9], 8		   // M [fftbb.f: 60/0]
	and		r15 = r20, r24		   // I [fftbb.f: 59/0]
	and		r23 = r20, r22		   // M [fftbb.f: 58/0]
	add		r17 = 1, r20		   // M [fftbb.f: 61/0]
	add		r19 = 2, r20		;; // I [fftbb.f: 61/0]
	ldfs		f32 = [r14], 4		   // M [fftbb.f: 60/0]
//file/line/col fftbb.f/59/0
	shladdp4	r15 = r15, 2, r36	   // M [fftbb.f: 59/0] [UVuse]
	and		r16 = r17, r24		   // I [fftbb.f: 59/0]
	and		r26 = r17, r22		   // M [fftbb.f: 58/0]
	and		r17 = r19, r24		   // M [fftbb.f: 59/0]
	and		r21 = r19, r22		;; // I [fftbb.f: 58/0]
	ld4		r15 = [r15]		   // M [fftbb.f: 59/0] [UVuse]
	ldfs.a		f15 = [r14], 4		   // M [fftbb.f: 60/0]
	shladdp4	r16 = r16, 2, r36	   // I [fftbb.f: 59/0] [UVuse]
	ldfs.a		f8 = [r9], 12		   // M [fftbb.f: 60/0]
	shladdp4	r17 = r17, 2, r36	   // M [fftbb.f: 59/0] [UVuse]
	add		r19 = 3, r20		;; // I [fftbb.f: 61/0]
	ldfs.a		f10 = [r14], 4		   // M [fftbb.f: 60/0]
	ld4		r16 = [r16]		   // M [fftbb.f: 59/0] [UVuse]
	add		r27 = r15, r23		   // I [fftbb.f: 59/0]
	ld4		r15 = [r17]		   // M [fftbb.f: 59/0] [UVuse]
	and		r17 = r19, r24		   // M [fftbb.f: 59/0]
	and		r23 = r19, r22		;; // I [fftbb.f: 58/0]
	ldfs.a		f14 = [r14], 8		   // M [fftbb.f: 60/0]
//file/line/col fftbb.f/60/0
	add		r19 = r27, r61		   // M [fftbb.f: 60/0]
	add		r16 = r16, r26		   // I [fftbb.f: 59/0]
	add		r21 = r15, r21		   // M [fftbb.f: 59/0]
	shladdp4	r17 = r17, 2, r36	   // M [fftbb.f: 59/0] [UVuse]
	add		r15 = 4, r20		;; // I [fftbb.f: 61/0]
	ldfs.a		f13 = [r14], 8		   // M [fftbb.f: 60/0]
	ld4		r28 = [r17]		   // M [fftbb.f: 59/0] [UVuse]
	shladdp4	r27 = r19, 3, r32	   // I [fftbb.f: 60/0] [UVuse]
	add		r17 = r16, r61		   // M [fftbb.f: 60/0]
	add		r21 = r21, r61		   // M [fftbb.f: 60/0]
	and		r16 = r15, r24		;; // I [fftbb.f: 59/0]
	ldfs.a		f12 = [r14], 4		   // M [fftbb.f: 60/0]
	add		r19 = 4, r27		   // M [fftbb.f: 60/0]
	shladdp4	r26 = r17, 3, r32	   // I [fftbb.f: 60/0] [UVuse]
	shladdp4	r21 = r21, 3, r32	   // M [fftbb.f: 60/0] [UVuse]
	add		r28 = r28, r23		   // M [fftbb.f: 59/0]
	shladdp4	r16 = r16, 2, r36	;; // I [fftbb.f: 59/0] [UVuse]
	ldfs.a		f7 = [r14], 8		   // M [fftbb.f: 60/0]
	ld4		r23 = [r16]		   // M [fftbb.f: 59/0] [UVuse]
	add		r17 = 4, r26		   // I [fftbb.f: 60/0]
	add		r16 = 4, r21		   // M [fftbb.f: 60/0]
	add		r28 = r28, r61		   // M [fftbb.f: 60/0]
	and		r15 = r15, r22		;; // I [fftbb.f: 58/0]
	ldfs.a		f6 = [r14], -36		   // M [fftbb.f: 60/0]
	stfs		[r27] = f11		   // M [fftbb.f: 60/0] [UVuse]
	shladdp4	r27 = r28, 3, r32	   // I [fftbb.f: 60/0] [UVuse]
	add		r29 = r23, r15		   // M [fftbb.f: 59/0]
	add		r23 = 5, r20		   // M [fftbb.f: 61/0]
	add		r15 = 6, r20		;; // I [fftbb.f: 61/0]
	ldfs.c.clr	f15 = [r14], 4		   // M
	ldfs.a		f11 = [r9], 12		   // M [fftbb.f: 60/0]
	add		r28 = 4, r27		   // I [fftbb.f: 60/0]
	stfs		[r19] = f32		   // M [fftbb.f: 60/0] [UVuse]
	add		r19 = r29, r61		   // M [fftbb.f: 60/0]
	and		r29 = r23, r24		;; // I [fftbb.f: 59/0]
//file/line/col fftbb.f/61/0
	ldfs.c.clr	f10 = [r14], 4		   // M
	ldfs.a		f32 = [r9], -4		   // M [fftbb.f: 60/0]
	shladdp4	r19 = r19, 3, r32	   // I [fftbb.f: 60/0] [UVuse]
	stfs		[r26] = f15		   // M [fftbb.f: 60/0] [UVuse]
	shladdp4	r26 = r29, 2, r36	   // M [fftbb.f: 59/0] [UVuse]
	and		r29 = r23, r22		;; // I [fftbb.f: 58/0]
	ldfs.c.clr	f14 = [r14], 4		   // M
	ld4		r23 = [r26]		   // M [fftbb.f: 59/0] [UVuse]
	add		r26 = 4, r19		   // I [fftbb.f: 60/0]
	ldfs.a		f15 = [r9], -24		   // M [fftbb.f: 60/0]
	stfs		[r17] = f10		   // M [fftbb.f: 60/0] [UVuse]
	and		r17 = r15, r24		;; // I [fftbb.f: 59/0]
//file/line/col fftbb.f/59/0,60/0,61/0
	ldfs.c.clr	f9 = [r14], 8		   // M
	stfs		[r21] = f14		   // M [fftbb.f: 60/0] [UVuse]
	add		r21 = r23, r29		   // I [fftbb.f: 59/0]
	stfs		[r16] = f9		   // M [fftbb.f: 60/0] [UVuse]
	shladdp4	r16 = r17, 2, r36	   // M [fftbb.f: 59/0] [UVuse]
	and		r17 = r15, r22		;; // I [fftbb.f: 58/0]
	ldfs.c.clr	f8 = [r14], 4		   // M
//file/line/col fftbb.f/59/0,60/0,61/0
	ldfs.c.clr	f13 = [r9], 12		   // M
	add		r15 = r21, r61		   // I [fftbb.f: 60/0]
	stfs		[r28] = f8		   // M [fftbb.f: 60/0] [UVuse]
	stfs		[r27] = f13		   // M [fftbb.f: 60/0] [UVuse]
	add		r21 = 7, r20		;; // I [fftbb.f: 61/0]
//file/line/col fftbb.f/59/0,60/0,61/0
	ldfs.c.clr	f12 = [r14], 8		   // M
	ldfs.c.clr	f7 = [r9], 20		   // M
	shladdp4	r23 = r15, 3, r32	   // I [fftbb.f: 60/0] [UVuse]
	ldfs.a		f8 = [r8], 64		   // M [fftbb.f: 60/0]
	stfs		[r19] = f12		   // M [fftbb.f: 60/0] [UVuse]
	and		r19 = r21, r24		;; // I [fftbb.f: 59/0]
	ldfs.c.clr	f11 = [r14], 4		   // M
	ld4		r16 = [r16]		   // M [fftbb.f: 59/0] [UVuse]
	add		r15 = 4, r23		   // I [fftbb.f: 60/0]
	ldfs.a		f9 = [r9], -4		   // M [fftbb.f: 60/0]
	stfs		[r26] = f7		   // M [fftbb.f: 60/0] [UVuse]
	shladdp4	r19 = r19, 2, r36	;; // I [fftbb.f: 59/0] [UVuse]
//file/line/col fftbb.f/59/0,60/0,61/0
	ldfs.c.clr	f6 = [r14], r11		   // M
	ld4		r19 = [r19]		   // M [fftbb.f: 59/0] [UVuse]
	add		r16 = r16, r17		   // I [fftbb.f: 59/0]
	stfs		[r15] = f6		   // M [fftbb.f: 60/0] [UVuse]
	and		r15 = r21, r22		   // M [fftbb.f: 58/0]
	add		r20 = 8, r20		;; // I [fftbb.f: 61/0]
	lfetch.nt1	[r14], r10		   // M [fftbb.f: 60/0,60]
	ldfs.c.clr	f32 = [r9], 32		   // M
	add		r16 = r16, r61		   // I [fftbb.f: 60/0]
	stfs		[r23] = f11		   // M [fftbb.f: 60/0] [UVuse]
	add		r17 = r19, r15		;; // I [fftbb.f: 59/0]
//file/line/col fftbb.f/59/0,60/0,61/0
	shladdp4	r15 = r16, 3, r32	   // I [fftbb.f: 60/0] [UVuse]
	ldfs.c.clr	f15 = [r14], 8		   // M
	add		r17 = r17, r61		;; // I [fftbb.f: 60/0]
	add		r16 = 4, r15		   // I [fftbb.f: 60/0]
	stfs		[r15] = f15		   // M [fftbb.f: 60/0] [UVuse]
	shladdp4	r15 = r17, 3, r32	;; // I [fftbb.f: 60/0] [UVuse]
	add		r17 = 4, r15		   // I [fftbb.f: 60/0]
	ldfs.c.clr	f9 = [r14], 4		   // M
	stfs		[r16] = f32		   // M [fftbb.f: 60/0] [UVuse]
	nop.i		0			;; // I
//file/line/col fftbb.f/59/0,60/0,61/0
	ldfs.c.clr	f8 = [r14], 4		;; // M
	stfs		[r17] = f8		   // M [fftbb.f: 60/0] [UVuse]
	nop.i		0			;; // I
	stfs		[r15] = f9		   // M [fftbb.f: 60/0] [UVuse]
//file/line/col fftbb.f/59/0,60/0,61/0
	nop.m		0			   // M
	br.cloop.dpnt.many ..L158		;; // B [fftbb.f: 61/0]

..L174:
	shladd		r8 = r18, 3, r0		   // M
	add		r15 = 0, r14		;; // I
	sub		r8 = r25, r8		;; // I
	cmp4.ne		p0, p6 = 0, r8		   // M
	add		r16 = -1, r8		   // M
(p6)	br.dpnt.many	..L140			;; // B

..L177:
	add		r9 = 0, r15		   // M
	mov		ar.lc = r16		   // I
	nop.i		0			;; // I

..L166:
//file/line/col fftbb.f/58/0
	ldfs		f6 = [r9], 4		   // M [fftbb.f: 60/0]
	and		r10 = r20, r24		   // M [fftbb.f: 59/0]
	and		r8 = r20, r22		   // I [fftbb.f: 58/0]
	add		r20 = 1, r20		;; // M [fftbb.f: 61/0]
	ldfs		f7 = [r9], 4		   // M [fftbb.f: 60/0]
//file/line/col fftbb.f/59/0
	shladdp4	r10 = r10, 2, r36	;; // I [fftbb.f: 59/0] [UVuse]
	ld4		r10 = [r10]		   // M [fftbb.f: 59/0] [UVuse]
	nop.i		0			;; // I
	add		r8 = r10, r8		;; // I [fftbb.f: 59/0]
//file/line/col fftbb.f/60/0
	add		r8 = r8, r61		   // M [fftbb.f: 60/0]
	nop.i		0			;; // I
	shladdp4	r8 = r8, 3, r32		;; // I [fftbb.f: 60/0] [UVuse]
	add		r10 = 4, r8		;; // M [fftbb.f: 60/0]
	stfs		[r8] = f6		   // M [fftbb.f: 60/0] [UVuse]
	nop.i		0			;; // I
	stfs		[r10] = f7		   // M [fftbb.f: 60/0] [UVuse]
//file/line/col fftbb.f/61/0
	nop.m		0			   // M
	br.cloop.dptk.many ..L166		;; // B [fftbb.f: 61/0]

..L175:

..L140:

..L20:
//file/line/col fftbb.f/65/0
	add		r8 = 32, r52		   // M
	add		r65 = 2, r0		   // M
	sxt4		r58 = r60		   // I [fftbb.f: 73/0] [UVuse]
	add		r40 = -3, r92		   // M
	add		r89 = 0, r59		   // M
	sub		r86 = 3, r59		;; // I
	stfs		[r52] = f0		   // M [fftbb.f: 65/0]
	add		r67 = 0, r8		   // M
	add		r62 = 0, r33		   // I
	cmp4.ge.unc	p1, p0 = r55, r66	   // M [fftbb.f: 193/0] [UVuse]
	nop.m		0			   // M
	br.call.sptk.many rp = seconds_		;; // B [fftbb.f: 65/0] [UVU]
	ld4		r56 = [r41]		   // M [fftbb.f: 68/0]
	add		gp = 0, r53		;; // I [fftbb.f: 65/0]
//file/line/col fftbb.f/66/0,67/0,68/0
	cmp4.gt.unc	p6, p0 = 1, r56		   // I [fftbb.f: 68/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L114			;; // B [fftbb.f: 68/0]

..L26:
//file/line/col fftbb.f/69/0
	ld4		r34 = [r67], 4		   // M [fftbb.f: 72/0]
	add		out0 = 0, r58		   // M [fftbb.f: 73/0]
	add		r62 = 0, r61		   // I
	add		r61 = 0, r33		;; // M
	cmp4.eq.unc	p3, p4 = 2, r34		   // M [fftbb.f: 77/0]
//file/line/col fftbb.f/70/0,71/0,72/0,73/0
	sxt4		out1 = r34		   // I [fftbb.f: 73/0] [UVuse]
	cmp4.ne.unc	p2, p0 = 8, r34		   // M [fftbb.f: 125/0]
	nop.m		0			   // M
	br.call.sptk.many rp = __milli_div32I	;; // B [fftbb.f: 73/0]
(p3)	add		r89 = -1, r89		   // M [fftbb.f: 80/0] [UVuse]
(p4)	cmp4.eq.unc	p6, p0 = 4, r34		   // I [fftbb.f: 96/0]
	add		r39 = 0, r8		   // I [fftbb.f: 73/0]
//file/line/col fftbb.f/77/0[2]
(p3)	br.dpnt.many	..L28			   // B [fftbb.f: 77/0]
(p6)	br.dpnt.many	..L54			   // B [fftbb.f: 96/0]
(p2)	br.dpnt.many	..L78			;; // B [fftbb.f: 125/0]

..L79:
//file/line/col fftbb.f/125/3/E,126/0,127/0
	add		r89 = -3, r89		;; // M [fftbb.f: 127/0] [UVuse]
	nop.m		0			   // M
//file/line/col fftbb.f/132/0[2]
	tbit.nz.unc	p6, p0 = r89, 6		   // I [fftbb.f: 132/0] [UVuse]
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L80			;; // B [fftbb.f: 132/0]

..L82:
	and		r8 = 63, r89		   // M [fftbb.f: 132/0] [UVuse]
	nop.i		0			;; // I
	shl		r83 = r54, r8		;; // I [fftbb.f: 132/0]

..L81:
	add		r8 = -1, r39		   // M [fftbb.f: 133/0] [UVuse]
	add		r77 = -3, r92		   // M [fftbb.f: 126/0] [UVuse]
	sxt4		out1 = r83		   // I [fftbb.f: 133/0]
	add		r75 = -3, r40		   // M
	add		r73 = 3, r86		   // M
//file/line/col fftbb.f/133/0
	fmpy.s1		f17 = f2, f3		;; // F [fftbb.f: 32/0]
	add		r8 = r8, r83		;; // M [fftbb.f: 133/0,133,133]
	nop.m		0			   // M
	sxt4		out0 = r8		   // I [fftbb.f: 133/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.call.sptk.many rp = __milli_div32I	;; // B [fftbb.f: 133/0]
	cmp4.ge.unc	p6, p0 = r0, r8		;; // M [fftbb.f: 133/0]
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	fnma.s1		f6 = f4, f5, f17	;; // F [fftbb.f: 32/0]
	nop.m		0			   // M
	fma.s.s0	f20 = f16, f6, f2	   // F [fftbb.f: 32/0]
(p6)	br.dpnt.many	..L134			;; // B [fftbb.f: 133/0]

..L138:
	setf.sig	f6 = r83		   // M
	setf.sig	f7 = r8			   // M
	dep.z		r22 = r39, 5, 59	   // I
	shladd		r10 = r61, 3, r0	   // M
	shladd		r21 = r39, 2, r39	   // M
	shladd		r11 = r39, 1, r39	   // I
	sub		r8 = r0, r39		   // M
	add		r20 = 92, r0		   // M
	dep.z		r14 = r39, 6, 58	   // I
	cmp4.eq.unc	p8, p0 = 64, r40	   // M [fftbb.f: 134/0] [UVuse]
	add		r19 = 0, r95		   // M
	cmp4.eq.unc	p7, p0 = -64, r40	;; // I [fftbb.f: 134/0] [UVuse]
	add		r28 = 0, r95		   // M
	cmp4.eq.unc	p6, p0 = 64, r86	   // M [fftbb.f: 134/0]
	add		r18 = 0, r95		   // I
	cmp4.eq.unc	p9, p0 = -64, r86	   // M [fftbb.f: 134/0]
	add		r9 = 0, r95		   // M
	shladd		r15 = r39, 4, r0	;; // I
	shladd		r16 = r39, 3, r0	   // M
	shladd		r14 = r8, 3, r14	   // M
	shladd		r17 = r11, 4, r0	   // I
	shladd		r27 = r61, 3, r22	   // M
	shladd		r26 = r21, 3, r10	   // M
	shladd		r23 = r61, 3, r20	;; // I
	shladd		r8 = r11, 3, r10	   // M
(p8)	add		r19 = 1, r0		   // M [fftbb.f: 134/0]
(p7)	add		r28 = 1, r0		   // I [fftbb.f: 134/0]
(p6)	add		r18 = 1, r0		   // M [fftbb.f: 134/0]
(p9)	add		r9 = 1, r0		   // M [fftbb.f: 134/0]
	cmp4.ge.unc	p6, p7 = 1, r83		;; // I
	add		r90 = -1, r83		   // M
	add		r25 = r23, r17		   // M
	add		r24 = r23, r14		   // I
	add		r22 = r23, r16		   // M
	add		r21 = r23, r15		   // M
	add		r20 = 92, r8		;; // I
	add		r17 = 92, r27		   // M
	add		r16 = 92, r26		   // M
	shladd		r15 = r11, 4, r10	   // I
	add		r14 = r14, r10		   // M
	shladd		r11 = r39, 3, r10	   // M
	shladd		r10 = r39, 4, r10	;; // I
	or		r6 = r19, r28		   // M [fftbb.f: 134/0]
	or		r4 = r18, r9		   // M [fftbb.f: 134/0]
	dep.z		r19 = r83, 6, 58	   // I
	add		r18 = 0, r86		   // M
	xma.l		f6 = f6, f7, f0		   // F
(p7)	zxt4		r80 = r90		;; // I
(p6)	add		r80 = 0, r0		   // M
	add		r29 = 764, r0		   // M
	addp4		r84 = r27, r32		   // I
	addp4		r87 = r26, r32		   // M
	addp4		r69 = r25, r32		   // M
	addp4		r26 = r24, r32		;; // I
	addp4		r25 = r23, r32		   // M
	addp4		r24 = r22, r32		   // M
	addp4		r23 = r21, r32		   // I
	addp4		r22 = r20, r32		   // M
	addp4		r21 = r17, r32		   // M
	addp4		r20 = r16, r32		;; // I
	addp4		r70 = r15, r32		   // M
	shladdp4	r71 = r62, 3, r32	   // M
	addp4		r72 = r14, r32		   // I
	shladdp4	r74 = r61, 3, r32	   // M
	addp4		r76 = r11, r32		   // M
	addp4		r78 = r10, r32		;; // I
	getf.sig	r27 = f6		   // M
	addp4		r81 = r8, r32		   // M
	add		r93 = 0, r95		   // I
	add		r28 = 0, r83		   // M
	add		r9 = 0, r73		   // M
	add		r8 = 0, r75		;; // I
	add		r2 = 0, r77		   // M
	nop.i		0			   // I
	nop.i		0			;; // I

..L85:
//file/line/col fftbb.f/134/0
	cmp.eq.unc	p8, p0 = r0, r6		   // M [fftbb.f: 134/0]
	add		r11 = 0, r93		   // M
	add		r93 = r93, r83		   // I [fftbb.f: 188/0] [UVuse]
	add		r17 = 0, r28		   // M
	cmp4.gt.unc	p7, p6 = r0, r90	   // M [fftbb.f: 143/0]
(p8)	br.dpnt.many	..L86			;; // B [fftbb.f: 134/0]

..L87:
//file/line/col fftbb.f/134/1/E
	add		r10 = 0, r95		   // M
	nop.i		0			   // I
	nop.i		0			;; // I

..L88:
	shladd		r16 = r10, 1, r10	   // M [fftbb.f: 137/0] [UVuse]
	sub		r34 = r0, r10		   // M [fftbb.f: 141/0] [UVuse]
	shladd		r33 = r10, 1, r0	   // I [fftbb.f: 136/0] [UVuse]
	shladd		r15 = r10, 2, r0	   // M [fftbb.f: 138/0] [UVuse]
	shladd		r14 = r10, 2, r10	   // M [fftbb.f: 139/0] [UVuse]
//file/line/col fftbb.f/135/0
	shladdp4	r73 = r10, 3, r35	;; // I [fftbb.f: 135/0] [UVuse]
	add		r11 = r16, r16		   // M [fftbb.f: 140/0]
	shladd		r10 = r10, 3, r34	   // M [fftbb.f: 141/0] [UVuse]
	shladdp4	r75 = r33, 3, r35	   // I [fftbb.f: 136/0] [UVuse]
	shladdp4	r46 = r16, 3, r35	   // M [fftbb.f: 137/0] [UVuse]
	shladdp4	r44 = r15, 3, r35	   // M [fftbb.f: 138/0] [UVuse]
	shladdp4	r42 = r14, 3, r35	;; // I [fftbb.f: 139/0] [UVuse]
	shladdp4	r16 = r11, 3, r35	   // M [fftbb.f: 140/0] [UVuse]
	shladdp4	r14 = r10, 3, r35	   // M [fftbb.f: 141/0] [UVuse]
(p6)	add		r3 = 0, r35		   // I
(p6)	add		r10 = 0, r36		   // M
(p6)	add		r33 = 0, r20		   // M
(p6)	add		r34 = 0, r21		;; // I
(p6)	add		r35 = 0, r22		   // M
(p6)	add		r36 = 0, r23		   // M
(p6)	add		r37 = 0, r24		   // I
(p6)	add		r38 = 0, r25		   // M
(p6)	add		r39 = 0, r26		   // M
	add		r47 = 4, r73		;; // I [fftbb.f: 135/0]
	add		r77 = 4, r75		   // M [fftbb.f: 136/0]
	add		r45 = 4, r46		   // M [fftbb.f: 137/0]
	add		r43 = 4, r44		   // I [fftbb.f: 138/0]
	add		r41 = 4, r42		   // M [fftbb.f: 139/0]
	add		r15 = 4, r16		   // M [fftbb.f: 140/0]
	add		r11 = 4, r14		;; // I [fftbb.f: 141/0]
(p6)	lfetch.nt1	[r33], 64		   // M [fftbb.f: 184/0,184]
(p6)	lfetch.nt1	[r34], 64		   // M [fftbb.f: 183/0,183]
(p6)	add		r40 = 0, r69		   // I
	ldfs		f19 = [r73]		   // M [fftbb.f: 135/0] [UVuse]
	ldfs		f18 = [r47]		   // M [fftbb.f: 135/0] [UVuse]
(p6)	cmp.ne.or.andcm	p16, p17 = 42, r0	;; // I
(p6)	lfetch.nt1	[r35], 64		   // M [fftbb.f: 182/0,182]
(p6)	lfetch.nt1	[r36], 64		   // M [fftbb.f: 181/0,181]
(p6)	mov		ar.lc = r80		   // I
//file/line/col fftbb.f/136/0
	ldfs		f17 = [r75]		   // M [fftbb.f: 136/0] [UVuse]
	ldfs		f15 = [r77]		   // M [fftbb.f: 136/0] [UVuse]
(p6)	add		r47 = 0, r0		;; // I
(p6)	lfetch.nt1	[r37], 64		   // M [fftbb.f: 180/0,180]
(p6)	lfetch.nt1	[r38], 64		   // M [fftbb.f: 179/0,179]
(p6)	mov		ar.ec = 2		   // I
//file/line/col fftbb.f/137/0
	ldfs		f14 = [r46]		   // M [fftbb.f: 137/0] [UVuse]
	ldfs		f13 = [r45]		   // M [fftbb.f: 137/0] [UVuse]
(p6)	add		r45 = 0, r0		;; // I
(p6)	lfetch.nt1	[r39], 64		   // M [fftbb.f: 186/0,186]
//file/line/col fftbb.f/138/0
	ldfs		f12 = [r44]		   // M [fftbb.f: 138/0] [UVuse]
(p6)	add		r44 = 0, r0		   // I
	ldfs		f11 = [r43]		   // M [fftbb.f: 138/0] [UVuse]
//file/line/col fftbb.f/139/0
	ldfs		f10 = [r42]		   // M [fftbb.f: 139/0] [UVuse]
(p6)	add		r42 = 0, r0		;; // I
	ldfs		f9 = [r41]		   // M [fftbb.f: 139/0] [UVuse]
//file/line/col fftbb.f/140/0
	ldfs		f8 = [r16]		   // M [fftbb.f: 140/0] [UVuse]
(p6)	add		r16 = 0, r0		   // I
	ldfs		f7 = [r15]		   // M [fftbb.f: 140/0] [UVuse]
//file/line/col fftbb.f/141/0
	ldfs		f6 = [r14]		   // M [fftbb.f: 141/0] [UVuse]
(p6)	add		r14 = 0, r0		;; // I
	ldfs		f21 = [r11]		   // M [fftbb.f: 141/0] [UVuse]
(p6)	invala					   // M
(p6)	add		r15 = 0, r0		   // I
(p6)	add		r11 = 0, r0		   // M
(p6)	add		r14 = 0, r0		   // M
//file/line/col fftbb.f/143/0[2]
(p7)	br.dpnt.many	..L98			;; // B [fftbb.f: 143/0]

..L137:
	add		r11 = 0, r32		   // M
	add		r7 = 0, r87		   // M
	add		r5 = 0, r84		   // I
	add		r94 = 0, r81		   // M
	add		r91 = 0, r78		   // M
	add		r88 = 0, r76		   // I
	add		r85 = 0, r74		   // M
	add		r82 = 0, r72		   // M
	add		r79 = 12, r71		   // I
	add		r77 = -20, r29		   // M
	sub		r75 = 4, r29		   // M
	add		r73 = 44, r71		;; // I
	add		r16 = 28, r71		   // M
	add		r15 = 60, r71		   // I
	add		r14 = 0, r70		;; // I

..L100:
(p16)	ldfs.a		f44 = [r79], -4		   // M [fftbb.f: 159/0]
(p16)	ldfs.a		f45 = [r73], -4		   // M [fftbb.f: 160/0]
(p17)	fadd.s.s0	f72 = f67, f66		   // F [fftbb.f: 179/0]
(p16)	ldfs.a		f46 = [r16], -4		   // M [fftbb.f: 161/0]
(p16)	ldfs.a		f47 = [r15], -4		   // M [fftbb.f: 162/0]
(p17)	fadd.s.s0	f73 = f70, f69		;; // F [fftbb.f: 179/0]   1   2
(p16)	ldfs.a		f43 = [r79], 12		   // M [fftbb.f: 159/0]
(p16)	ldfs.a		f40 = [r73], 12		   // M [fftbb.f: 160/0]
(p17)	fadd.s.s0	f54 = f58, f63		   // F [fftbb.f: 180/0]
(p16)	ldfs.a		f41 = [r16], 12		   // M [fftbb.f: 161/0]
(p16)	ldfs.a		f42 = [r15], -56	   // M [fftbb.f: 162/0]
(p17)	fadd.s.s0	f55 = f57, f61		;; // F [fftbb.f: 181/0]   2   4
(p16)	ldfs.a		f36 = [r79], r77	   // M [fftbb.f: 147/0]
(p16)	ldfs.a		f37 = [r73], -36	   // M [fftbb.f: 148/0]
(p17)	fadd.s.s0	f52 = f59, f60		   // F [fftbb.f: 180/0]
(p16)	ldfs.a		f38 = [r16], 12		   // M [fftbb.f: 146/0]
(p16)	ldfs.a		f39 = [r15], 32		   // M [fftbb.f: 145/0]
(p17)	fadd.s.s0	f53 = f56, f68		;; // F [fftbb.f: 181/0]   3   6
(p16)	lfetch.nt1	[r79], r75		   // M [fftbb.f: 145/0,162,148,160,146,161,147,159,159,147,161,146,160,148,145,162]
(p16)	ldfs.a		f33 = [r73], -8		   // M [fftbb.f: 147/0]
(p17)	fadd.s.s0	f50 = f64, f62		   // F [fftbb.f: 182/0]
(p16)	ldfs.a		f34 = [r16], 44		   // M [fftbb.f: 148/0]
(p16)	ldfs.a		f35 = [r15], 92		   // M [fftbb.f: 146/0]
(p17)	fadd.s.s0	f51 = f65, f71		;; // F [fftbb.f: 182/0]   4   8
(p16)	lfetch.nt1	[r40]			   // M [fftbb.f: 184/0,184,183,183,182,182,181,181,180,180,179,179,186,186]
(p16)	ldfs.a		f32 = [r79], -4		   // M [fftbb.f: 145/0]
(p17)	fsub.s.s0	f48 = f67, f66		   // F [fftbb.f: 183/0]
(p17)	stfs		[r85] = f72, 4		   // M [fftbb.f: 179/0] [UVU]
(p16)	add		r32 = 64, r40		   // M
(p17)	fsub.s.s0	f49 = f70, f69		;; // F [fftbb.f: 183/0]   5  10
(p17)	stfs		[r85] = f73, 4		   // M [fftbb.f: 179/0] [UVU]
(p17)	stfs		[r88] = f54, 4		   // M [fftbb.f: 180/0] [UVU]
(p17)	fsub.s.s0	f66 = f58, f63		   // F [fftbb.f: 184/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fsub.s.s0	f70 = f59, f60		;; // F [fftbb.f: 184/0]   6  12
(p17)	stfs		[r88] = f52, 4		   // M [fftbb.f: 180/0] [UVU]
(p17)	stfs		[r91] = f53, 4		   // M [fftbb.f: 181/0] [UVU]
(p17)	fsub.s.s0	f67 = f56, f68		   // F [fftbb.f: 185/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fsub.s.s0	f72 = f57, f61		;; // F [fftbb.f: 185/0]   7  14
(p17)	stfs		[r91] = f55, 4		   // M [fftbb.f: 181/0] [UVU]
(p17)	stfs		[r94] = f50, 4		   // M [fftbb.f: 182/0] [UVU]
(p17)	fsub.s.s0	f61 = f64, f62		   // F [fftbb.f: 186/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p17)	fsub.s.s0	f73 = f65, f71		;; // F [fftbb.f: 186/0]   8  16
(p17)	stfs		[r94] = f51, 4		   // M [fftbb.f: 182/0] [UVU]
(p17)	stfs		[r5] = f48, 4		   // M [fftbb.f: 183/0] [UVU]
(p16)	fmpy.s0		f50 = f44, f19		   // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f69 = f45, f10		;; // F [fftbb.f: 160/0]   9  18
(p17)	stfs		[r5] = f49, 4		   // M [fftbb.f: 183/0] [UVU]
(p17)	stfs		[r7] = f66, 4		   // M [fftbb.f: 184/0] [UVU]
(p16)	fmpy.s0		f64 = f46, f13		   // F [fftbb.f: 161/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f65 = f46, f14		;; // F [fftbb.f: 161/0]  10  20
(p17)	stfs		[r7] = f70, 4		   // M [fftbb.f: 184/0] [UVU]
(p17)	stfs		[r14] = f67, 4		   // M [fftbb.f: 185/0] [UVU]
(p16)	fmpy.s0		f62 = f47, f21		   // F [fftbb.f: 162/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f68 = f47, f6		;; // F [fftbb.f: 162/0]  11  22
(p17)	stfs		[r14] = f72, 4		   // M [fftbb.f: 185/0] [UVU]
(p17)	stfs		[r82] = f61, 4		   // M [fftbb.f: 186/0] [UVU]
(p16)	fmpy.s0		f67 = f44, f18		   // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f71 = f45, f9		;; // F [fftbb.f: 160/0]  12  24
(p16)	ldfs.c.clr	f39 = [r79], 24		   // M
(p16)	ldfs.c.clr	f43 = [r73], 8		   // M
(p16)	fma.s.s0	f66 = f43, f18, f50	   // F [fftbb.f: 159/0]
(p17)	stfs		[r82] = f73, 4		   // M [fftbb.f: 186/0] [UVU]
	nop.m		0			   // M
(p16)	fma.s.s0	f72 = f40, f9, f69	;; // F [fftbb.f: 160/0]  13  26
(p16)	chk.a.clr	f40, ..L247		   // M
(p16)	ldfs.c.clr	f41 = [r79], 32		   // M
(p16)	fms.s.s0	f61 = f41, f14, f64	   // F [fftbb.f: 161/0]

..L254:
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f73 = f41, f13, f65	;; // F [fftbb.f: 161/0]  14  28
(p16)	ldfs.c.clr	f42 = [r79], -8		   // M
(p16)	ldfs.c.clr	f33 = [r73], 16		   // M
(p16)	fms.s.s0	f60 = f42, f6, f62	   // F [fftbb.f: 162/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f59 = f42, f21, f68	;; // F [fftbb.f: 162/0]  15  30
(p16)	ldfs.c.clr	f34 = [r79], -44	   // M
(p16)	ldfs.c.clr	f35 = [r73], 4		   // M
(p16)	fms.s.s0	f56 = f43, f19, f67	   // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f58 = f40, f10, f71	;; // F [fftbb.f: 160/0]  16  32
(p16)	ldfs.c.clr	f32 = [r79], 48		   // M
(p16)	ldfs.c.clr	f38 = [r73], 72		   // M
(p16)	fsub.s.s0	f55 = f66, f72		   // F [fftbb.f: 165/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f57 = f36, f17		;; // F [fftbb.f: 147/0]  17  34
(p16)	chk.a.clr	f36, ..L248		   // M
(p16)	ldfs.c.clr	f37 = [r79], 24		   // M
(p16)	fmpy.s0		f48 = f37, f8		   // F [fftbb.f: 148/0]

..L255:
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f53 = f38, f11		;; // F [fftbb.f: 146/0]  18  36
(p16)	chk.a.clr	f44, ..L249		   // M
(p16)	chk.a.clr	f45, ..L250		   // M
(p16)	fsub.s.s0	f49 = f61, f60		   // F [fftbb.f: 166/0]

..L256:
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f51 = f73, f59		;; // F [fftbb.f: 166/0]  19  38
(p16)	chk.a.clr	f46, ..L251		   // M
(p16)	chk.a.clr	f47, ..L252		   // M
(p16)	fsub.s.s0	f69 = f56, f58		   // F [fftbb.f: 165/0]  

..L257:
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f70 = f38, f12		;; // F [fftbb.f: 146/0]  20  40
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f67 = f36, f15		   // F [fftbb.f: 147/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f68 = f33, f15, f57	;; // F [fftbb.f: 147/0]  21  42
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f64 = f37, f7		   // F [fftbb.f: 148/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f65 = f34, f7, f48	;; // F [fftbb.f: 148/0]  22  45
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmerge.ns	f48 = f51, f51		   // F [fftbb.f: 167/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f62 = f55, f49		;; // F [fftbb.f: 171/0]  23  46
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f51 = f55, f49		   // F [fftbb.f: 169/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f57 = f35, f12, f53	;; // F [fftbb.f: 146/0]  24 49
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f36 = f35, f11, f70	   // F [fftbb.f: 146/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f55 = f33, f17, f67	;; // F [fftbb.f: 147/0]  25  55
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f67 = f34, f8, f64	   // F [fftbb.f: 148/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f70 = f68, f65		;; // F [fftbb.f: 152/0]  26  58
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f37 = f69, f48		   // F [fftbb.f: 171/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f64 = f62, f0		;; // F [fftbb.f: 176/0]  27  60
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f35 = f66, f72		   // F [fftbb.f: 163/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f33 = f73, f59		;; // F [fftbb.f: 164/0]  28  62
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f72 = f69, f48		   // F [fftbb.f: 169/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f73 = f51, f0		;; // F [fftbb.f: 173/0]  29  64
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f66 = f51, f20		   // F [fftbb.f: 173/0]  
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmpy.s0		f69 = f62, f20		;; // F [fftbb.f: 176/0]  30  66
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f53 = f37, f20, f64	   // F [fftbb.f: 176/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f48 = f39, f57		;; // F [fftbb.f: 149/0]  31  69
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f51 = f32, f36		   // F [fftbb.f: 149/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f64 = f55, f67		;; // F [fftbb.f: 150/0]  32  71
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f34 = f68, f65		   // F [fftbb.f: 150/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f59 = f39, f57		;; // F [fftbb.f: 151/0]  33  73
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f65 = f32, f36		   // F [fftbb.f: 151/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f68 = f55, f67		;; // F [fftbb.f: 152/0]  34  75
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmerge.ns	f62 = f70, f70		   // F [fftbb.f: 153/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f67 = f56, f58		;; // F [fftbb.f: 163/0]  35  76
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f36 = f61, f60		   // F [fftbb.f: 164/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f70 = f35, f33		;; // F [fftbb.f: 170/0]  36  78
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fms.s.s0	f32 = f72, f20, f73	   // F [fftbb.f: 173/0]  
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f39 = f72, f0, f66	;; // F [fftbb.f: 173/0]  37  82
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fma.s.s0	f72 = f37, f0, f69	   // F [fftbb.f: 176/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmerge.ns	f73 = f53, f53		;; // F [fftbb.f: 177/0]  38  83
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f66 = f48, f64		   // F [fftbb.f: 154/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f69 = f51, f34		;; // F [fftbb.f: 154/0]  39  85
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f57 = f59, f62		   // F [fftbb.f: 155/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f58 = f65, f68		;; // F [fftbb.f: 155/0]  40  87
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f55 = f48, f64		   // F [fftbb.f: 156/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f56 = f51, f34		;; // F [fftbb.f: 156/0]  41  89
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f63 = f59, f62		   // F [fftbb.f: 157/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f64 = f65, f68		;; // F [fftbb.f: 157/0]  42  91
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f65 = f67, f36		   // F [fftbb.f: 168/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f68 = f35, f33		;; // F [fftbb.f: 168/0]  43  93
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f60 = f67, f36		   // F [fftbb.f: 170/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f62 = f32, f39		;; // F [fftbb.f: 174/0]  44  95
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fadd.s.s0	f59 = f32, f39		   // F [fftbb.f: 174/0]
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fmerge.ns	f67 = f70, f70		;; // F [fftbb.f: 175/0]  45  96
	nop.m		0			   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f61 = f73, f72		   // F [fftbb.f: 177/0]
	nop.m		0			   // M
(p16)	fsub.s.s0	f70 = f53, f72		   // F [fftbb.f: 177/0]  46  98
//file/line/col fftbb.f/144/0,145/0,146/0,147/0,148/0,149/0,150/0,151/0,152/0,153/0,154/0,155/0,156/0,157/0,159/0,160/0,161/0,162/0,163/0,164/0,165/0,166/0,167/0,168/0,169/0,170/0,171/0,173/0,174/0,175/0,176/0,177/0,179/0,180/0,181/0,182/0,183/0,184/0,185/0,186/0,187/0
	br.ctop.dptk.many ..L100		;; // B [fftbb.f: 187/0]

..L136:
	add		r36 = 0, r10		   // M
	add		r35 = 0, r3		   // I
	add		r32 = 0, r11		;; // I

..L98:
//file/line/col fftbb.f/188/0
	add		r28 = r83, r28		   // M
	shladdp4	r84 = r83, 3, r84	   // M
	shladdp4	r87 = r83, 3, r87	   // I
	shladdp4	r69 = r83, 3, r69	   // M
	shladdp4	r26 = r83, 3, r26	   // M
	shladdp4	r25 = r83, 3, r25	   // I
	shladdp4	r24 = r83, 3, r24	   // M
	shladdp4	r23 = r83, 3, r23	   // M
	shladdp4	r22 = r83, 3, r22	   // I
	shladdp4	r21 = r83, 3, r21	   // M
	shladdp4	r20 = r83, 3, r20	   // M
	shladdp4	r70 = r83, 3, r70	;; // I
	addp4		r71 = r19, r71		   // M
	shladdp4	r72 = r83, 3, r72	   // M
	shladdp4	r74 = r83, 3, r74	   // I
	shladdp4	r76 = r83, 3, r76	   // M
	shladdp4	r78 = r83, 3, r78	   // M
	shladdp4	r81 = r83, 3, r81	;; // I
	cmp4.ne.unc	p6, p0 = r17, r27	   // M [fftbb.f: 188/0]
	nop.m		0			   // M
(p6)	br.dptk.many	..L85			;; // B [fftbb.f: 188/0]

..L135:
	add		r77 = 0, r2		   // M
	add		r75 = 0, r8		   // I
	add		r73 = 0, r9		;; // I
	add		r86 = 0, r73		   // M
	add		r92 = 0, r77		   // I
	add		r40 = 0, r75		;; // I

..L52:
//file/line/col fftbb.f/192/0
	cmp4.le		p6, p0 = r65, r56	   // M [fftbb.f: 192/0] [UVuse]
	add		r65 = 1, r65		   // M
	add		r33 = 0, r62		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dptk.many	..L26			;; // B [fftbb.f: 192/0]

..L123:
	add		r33 = 0, r61		   // M
	nop.i		0			   // I
	nop.i		0			;; // I

..L24:
//file/line/col fftbb.f/193/0[2]
	lfetch		[r68], 0		   // M [fftbb.f: 39/0]
	add		r66 = 1, r66		   // M
	add		r61 = 0, r62		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p1)	br.dptk.many	..L16			;; // B [fftbb.f: 193/0]

..L122:
	add		r95 = 0, r33		   // M
	nop.i		0			   // I
	nop.i		0			;; // I

..L14:
//file/line/col fftbb.f/197/0[2]
	cmp4.eq.unc	p6, p0 = r0, r95	   // M [fftbb.f: 197/0]
	add		r14 = -1, r60		   // M [fftbb.f: 199/0] [UVuse]
	add		r8 = 0x5c4, r0		   // I
	shladdp4	r18 = r95, 3, r32	   // M
	add		r9 = 0, r32		   // M
	addp4		r19 = 0, r32		;; // I
	add		r33 = r8, r18		   // M
	addp4		r34 = r8, r9		   // M
	cmp4.gt.or	p6, p0 = r0, r14	   // I [fftbb.f: 199/0]
	add		r16 = 0, r18		   // M
//file/line/col fftbb.f/197/1/E,199/0
	nop.m		0			   // M
(p6)	br.dpnt.many	..L111			;; // B [fftbb.f: 199/0]

..L121:
	cmp4.ge.unc	p6, p7 = 1, r60		   // M
	add		r11 = 0, r19		   // M
	add		r9 = 32, r18		   // I
	add		r8 = 48, r18		   // M
	add		r10 = 16, r18		;; // I
(p7)	zxt4		r15 = r14		   // I
(p6)	add		r15 = 0, r0		   // M
	nop.i		0			;; // I
	add		r17 = 1, r15		;; // I
	nop.m		0			   // M
	extr.u		r14 = r17, 3, 61	;; // I
	cmp4.ge.unc	p6, p0 = r0, r14	   // I
	add		r20 = -1, r14		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L217			;; // B

..L216:
	lfetch.nt1	[r33], 128		   // M [fftbb.f: 200/0,200]
	mov		ar.lc = r20		;; // I
	mov		ar.ec = 1		;; // I

..L198:
//file/line/col fftbb.f/200/0
	ldfs		f36 = [r16], 4		   // M [fftbb.f: 200/0]
	ldfs.a		f34 = [r10], 4		   // M [fftbb.f: 200/0]
	nop.i		0			   // I
	ldfs.a		f32 = [r9], 4		   // M [fftbb.f: 200/0]
	ldfs.a		f14 = [r8], 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs		f12 = [r16], 4		   // M [fftbb.f: 200/0]
	ldfs.a		f10 = [r10], 8		   // M [fftbb.f: 200/0]
	nop.i		0			   // I
	ldfs.a		f8 = [r9], 8		   // M [fftbb.f: 200/0]
	ldfs.a		f6 = [r8], 8		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.a		f35 = [r16], 4		   // M [fftbb.f: 200/0]
	ldfs.a		f9 = [r10], 12		   // M [fftbb.f: 200/0]
	nop.i		0			   // I
	ldfs.a		f7 = [r9], 12		   // M [fftbb.f: 200/0]
	ldfs.a		f37 = [r8], 52		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	lfetch.nt1	[r34]			   // M [fftbb.f: 200/0,200]
	ldfs.a		f11 = [r16], 12		   // M [fftbb.f: 200/0]
	add		r32 = 128, r34		   // I
	ldfs.a		f15 = [r10], 40		   // M [fftbb.f: 200/0]
	ldfs.a		f13 = [r9], 40		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.a		f33 = [r16], -16	;; // M [fftbb.f: 200/0]
	stfs		[r11] = f36, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f35 = [r16], 4		   // M
	stfs		[r11] = f12, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f11 = [r16], 4		   // M
	stfs		[r11] = f35, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f34 = [r16], 4		   // M
	stfs		[r11] = f11, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f10 = [r16], 4		   // M
	stfs		[r11] = f34, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f33 = [r16], 4		   // M
	stfs		[r11] = f10, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f9 = [r16], 4		   // M
	stfs		[r11] = f33, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f32 = [r16], 4		   // M
	stfs		[r11] = f9, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f8 = [r16], 4		   // M
	stfs		[r11] = f32, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f15 = [r16], 4		   // M
	stfs		[r11] = f8, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f7 = [r16], 4		   // M
	stfs		[r11] = f15, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f14 = [r16], 4		   // M
	stfs		[r11] = f7, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f6 = [r16], 4		   // M
	stfs		[r11] = f14, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	ldfs.c.clr	f13 = [r16], 4		   // M
	stfs		[r11] = f6, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/201/0
	ldfs.c.clr	f37 = [r16], 4		   // M
	stfs		[r11] = f13, 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	stfs		[r11] = f37, 4		   // M [fftbb.f: 200/0]
//file/line/col fftbb.f/201/0
	nop.m		0			   // M
	br.ctop.dpnt.many ..L198		;; // B [fftbb.f: 201/0]

..L214:
	shladd		r8 = r14, 3, r0		   // M
	add		r18 = 0, r16		   // I
	add		r19 = 0, r11		;; // I
	sub		r8 = r17, r8		;; // M
	cmp4.ne		p0, p6 = 0, r8		   // M
	add		r15 = -1, r8		   // I
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L120			;; // B

..L217:
	add		r8 = 0, r19		   // M
	mov		ar.lc = r15		   // I
	add		r9 = 0, r18		;; // I

..L206:
//file/line/col fftbb.f/200/0
	ldfs		f6 = [r9], 4		;; // M [fftbb.f: 200/0]
	ldfs		f7 = [r9], 4		   // M [fftbb.f: 200/0]
	nop.i		0			;; // I
	stfs		[r8] = f6, 4		;; // M [fftbb.f: 200/0]
	stfs		[r8] = f7, 4		   // M [fftbb.f: 200/0]
//file/line/col fftbb.f/201/0
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.cloop.dptk.many ..L206		;; // B [fftbb.f: 201/0]

..L215:

..L120:

..L111:
//file/line/col fftbb.f/206/0
	add		r8 = 496, sp		   // M [fftbb.f: 206/0]
	mov		rp = r49		;; // I
	mov		ar.pfs = r48		   // I
	add		r9 = -192, r8		   // M [fftbb.f: 206/0]
	add		r10 = -184, r8		;; // I [fftbb.f: 206/0]
	mov		ar.lc = r50		   // I
	ld8.fill	r4 = [r9], 16		   // M [fftbb.f: 206/0]
	ld8.fill	r5 = [r10], 16		   // M [fftbb.f: 206/0]
	nop.i		0			;; // I
	ld8.fill	r6 = [r9], 16		   // M [fftbb.f: 206/0]
	ld8.fill	r7 = [r10], 24		   // M [fftbb.f: 206/0]
	mov		pr = r51, 0x1fffe	;; // I [fftbb.f: 206/0]
	ldf.fill	f2 = [r9], 32		   // M [fftbb.f: 206/0]
	ldf.fill	f3 = [r10], 32		   // M [fftbb.f: 206/0]
	nop.i		0			;; // I
	ldf.fill	f4 = [r9], 32		   // M [fftbb.f: 206/0]
	ldf.fill	f5 = [r10], 32		   // M [fftbb.f: 206/0]
	nop.i		0			;; // I
	ldf.fill	f16 = [r9], 32		   // M [fftbb.f: 206/0]
	ldf.fill	f17 = [r10], 32		   // M [fftbb.f: 206/0]
	nop.i		0			;; // I
	ldf.fill	f18 = [r9], 32		   // M [fftbb.f: 206/0]
	ldf.fill	f19 = [r10], 32		   // M [fftbb.f: 206/0]
	nop.i		0			;; // I
	ldf.fill	f20 = [r9], 32		   // M [fftbb.f: 206/0]
	ldf.fill	f21 = [r10], 16		   // M [fftbb.f: 206/0]
	nop.i		0			;; // I
	add		r9 = -224, r8		;; // M [fftbb.f: 206/0]
	ld8		r10 = [r9]		   // M [fftbb.f: 206/0]
	add		sp = 0, r8		;; // I [fftbb.f: 206/0] [UVU: ]
	mov		ar.unat = r10		   // M [fftbb.f: 206/0]
	nop.m		0			   // M
	br.ret.sptk.many rp			;; // B [fftbb.f: 206/0]

..L86:
//file/line/col fftbb.f/134/2/E[2]
	cmp.eq.unc	p8, p0 = r0, r4		   // M [fftbb.f: 134/0]
//file/line/col fftbb.f/134/3/E
	add		r10 = 0, r95		   // M
(p8)	br.dpnt.many	..L89			;; // B [fftbb.f: 134/0]

..L91:
	nop.m		0			   // M
	tbit.nz.unc	p8, p0 = r2, 6		   // I [fftbb.f: 134/0]
(p8)	br.dpnt.many	..L95			;; // B [fftbb.f: 134/0]

..L97:
	and		r11 = 63, r2		   // M [fftbb.f: 134/0] [UVuse]
	nop.i		0			;; // I
	shl		r10 = r10, r11		;; // I [fftbb.f: 134/0]

..L96:
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L88			;; // B [fftbb.f: 134/0]

..L89:
//file/line/col fftbb.f/134/4/E[2]
	nop.m		0			   // M
	tbit.nz.unc	p8, p0 = r18, 6		   // I [fftbb.f: 134/0]
(p8)	br.dpnt.many	..L92			;; // B [fftbb.f: 134/0]

..L94:
	and		r10 = 63, r86		   // M [fftbb.f: 134/0]
	nop.i		0			;; // I
	shl		r10 = r11, r10		;; // I [fftbb.f: 134/0] [UVuse]

..L93:
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L91			;; // B [fftbb.f: 134/0]

..L28:
//file/line/col fftbb.f/77/1/E,79/0,80/0,85/0[2]
	nop.m		0			   // M
	tbit.nz.unc	p6, p0 = r89, 6		   // I [fftbb.f: 85/0] [UVuse]
(p6)	br.dpnt.many	..L29			;; // B [fftbb.f: 85/0]

..L31:
	and		r8 = 63, r89		   // M [fftbb.f: 85/0] [UVuse]
	nop.i		0			;; // I
	shl		r71 = r54, r8		;; // I [fftbb.f: 85/0]

..L30:
	add		r8 = -1, r39		   // M [fftbb.f: 86/0] [UVuse]
//file/line/col fftbb.f/86/0
	add		r72 = -1, r92		   // M [fftbb.f: 79/0] [UVuse]
	sxt4		out1 = r71		   // I [fftbb.f: 86/0]
	add		r70 = -1, r40		   // M
	add		r69 = 1, r86		;; // I
	add		r8 = r8, r71		;; // I [fftbb.f: 86/0,86,86]
	nop.m		0			   // M
	sxt4		out0 = r8		   // I [fftbb.f: 86/0]
	br.call.sptk.many rp = __milli_div32I	;; // B [fftbb.f: 86/0]
	cmp4.ge.unc	p6, p0 = r0, r8		   // M [fftbb.f: 86/0]
	nop.m		0			   // M
(p6)	br.dpnt.many	..L124			;; // B [fftbb.f: 86/0]

..L128:
	setf.sig	f6 = r71		   // M
	setf.sig	f7 = r8			   // M
	cmp4.ge.unc	p6, p7 = 1, r71		   // I
	add		r19 = -1, r71		   // M
	add		r8 = 452, r0		   // M
	cmp4.eq.unc	p8, p0 = 62, r40	;; // I [fftbb.f: 87/0] [UVuse]
(p6)	add		r64 = 0, r0		   // M
	add		r16 = 0, r95		   // M
(p7)	zxt4		r64 = r19		   // I
	cmp4.eq.unc	p7, p0 = -66, r40	   // M [fftbb.f: 87/0] [UVuse]
	add		r17 = 0, r95		   // M
	cmp4.eq.unc	p6, p0 = 66, r86	;; // I [fftbb.f: 87/0]
	add		r15 = 0, r95		   // M
	cmp4.eq.unc	p9, p0 = -62, r86	   // M [fftbb.f: 87/0]
	add		r9 = 0, r95		   // I
	shladd		r11 = r61, 3, r0	   // M
	shladd		r18 = r39, 3, r0	   // M
	shladd		r10 = r62, 3, r0	;; // I
	add		r20 = 1, r64		   // M
	shladd		r14 = r61, 3, r8	   // M
(p8)	add		r16 = 1, r0		   // I [fftbb.f: 87/0]
(p7)	add		r17 = 1, r0		   // M [fftbb.f: 87/0]
(p6)	add		r15 = 1, r0		   // M [fftbb.f: 87/0]
(p9)	add		r9 = 1, r0		;; // I [fftbb.f: 87/0]
	add		r10 = 8, r10		   // M
	add		r8 = r14, r18		   // M
	extr.u		r21 = r20, 2, 62	   // I
	shladd		r11 = r39, 3, r11	   // M
	or		r22 = r16, r17		   // M [fftbb.f: 87/0]
	add		r23 = -2, r86		;; // I [fftbb.f: 87/0]
	or		r18 = r15, r9		   // M [fftbb.f: 87/0]
	add		r16 = -1, r21		   // M
	addp4		r15 = r14, r32		   // I
	addp4		r10 = r10, r32		   // M
	addp4		r9 = r8, r32		   // M
	shladdp4	r8 = r61, 3, r32	;; // I
	addp4		r24 = r11, r32		   // M
	add		r17 = 0, r95		   // M
	xma.l		f6 = f6, f7, f0		   // F
	add		r14 = 0, r71		;; // M
	getf.sig	r11 = f6		   // M
	nop.i		0			;; // I

..L34:
//file/line/col fftbb.f/87/0
	cmp.eq.unc	p7, p0 = r0, r22	   // M [fftbb.f: 87/0]
	cmp4.gt.unc	p9, p6 = r0, r19	   // M [fftbb.f: 89/0]
	cmp4.ne.unc	p8, p0 = r14, r11	   // I [fftbb.f: 95/0] [UVuse]
//file/line/col fftbb.f/87/1/E
	add		r25 = 0, r95		   // M
//file/line/col fftbb.f/87/3/E
	add		r26 = 0, r95		   // M
(p7)	br.dpnt.many	..L35			;; // B [fftbb.f: 87/0]

..L37:
(p6)	cmp4.ge.unc	p7, p10 = r0, r21	   // M
	add		r33 = 0, r9		   // M
//file/line/col fftbb.f/88/0
	shladdp4	r25 = r25, 3, r35	   // I [fftbb.f: 88/0] [UVuse]
(p6)	add		r40 = 0, r24		   // M
(p6)	add		r39 = 0, r8		   // M
(p6)	add		r38 = 0, r10		;; // I
(p10)	lfetch.nt1	[r33], 64		   // M [fftbb.f: 93/0,93]
(p6)	add		r37 = 0, r64		   // M
(p10)	mov		ar.lc = r16		   // I
(p10)	add		r34 = 0, r15		   // M
	add		r41 = 4, r25		   // M [fftbb.f: 88/0]
(p10)	add		r78 = 0, r32		;; // I
(p10)	add		r77 = 0, r35		   // M
(p10)	add		r76 = 0, r36		   // M
(p10)	mov		ar.ec = 1		   // I
(p10)	add		r75 = 4, r40		   // M
(p10)	add		r74 = 4, r39		   // M
(p10)	add		r73 = 0, r38		;; // I
	ldfs		f18 = [r25]		   // M [fftbb.f: 88/0] [UVuse]
(p10)	add		r29 = 900, r0		   // M
(p10)	add		r28 = -908, r0		   // I
(p10)	add		r27 = 20, r38		   // M
(p10)	add		r26 = 36, r38		   // M
(p10)	add		r25 = 52, r38		;; // I
	ldfs		f17 = [r41]		   // M [fftbb.f: 88/0] [UVuse]
	add		r17 = r17, r71		   // M [fftbb.f: 95/0] [UVuse]
	add		r14 = r71, r14		   // I
	shladdp4	r10 = r71, 4, r10	   // M
	shladdp4	r9 = r71, 3, r9		   // M
//file/line/col fftbb.f/89/0[2]
(p9)	br.dpnt.many	..L115			;; // B [fftbb.f: 89/0]

..L127:
	shladdp4	r8 = r71, 3, r8		   // M
	shladdp4	r24 = r71, 3, r24	   // M
(p7)	br.dpnt.many	..L197			;; // B

..L186:
//file/line/col fftbb.f/90/0,91/0
	ldfs		f8 = [r73], r29		   // M [fftbb.f: 91/0]
	ldfs.a		f49 = [r27], -16	   // M [fftbb.f: 91/0]
	nop.i		0			   // I
	ldfs.a		f48 = [r26], -4		   // M [fftbb.f: 91/0]
	ldfs.a		f46 = [r25], -4		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I                   1   0
	lfetch.nt1	[r73], r28		   // M [fftbb.f: 93/0,91,92,92,93,91]
	ldfs		f7 = [r27], 12		   // M [fftbb.f: 91/0]
	nop.i		0			   // I
	ldfs.a		f52 = [r26], 8		   // M [fftbb.f: 91/0]
	ldfs.a		f50 = [r25], -4		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I                   2   0
	lfetch.nt1	[r34]			   // M [fftbb.f: 93/0,93]
	ldfs.a		f35 = [r73], 4		   // M [fftbb.f: 92/0]
	add		r32 = 64, r34		   // I
	ldfs.a		f55 = [r27], -4		   // M [fftbb.f: 91/0]
	ldfs.a		f32 = [r26], -12	   // M [fftbb.f: 92/0]
	nop.i		0			;; // I                   3   0
	ldfs.a		f56 = [r73], 12		   // M [fftbb.f: 92/0]
	ldfs.a		f15 = [r27], 12		   // M [fftbb.f: 92/0]
	nop.i		0			   // I
	ldfs.a		f14 = [r26], 12		   // M [fftbb.f: 92/0]
	ldfs.a		f13 = [r25], 72		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I                   4   0
	ldfs.a		f34 = [r73], 4		   // M [fftbb.f: 92/0]
	ldfs.a		f33 = [r27], 4		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I                   5   0
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f9 = f17, f8		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f47 = f17, f49		;; // F [fftbb.f: 91/0]   6   2
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f6 = f17, f7		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f45 = f17, f48		;; // F [fftbb.f: 91/0]   7   4
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f42 = f17, f55		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f41 = f17, f52		;; // F [fftbb.f: 91/0]   8   6
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f40 = f17, f50		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f44 = f17, f46		;; // F [fftbb.f: 91/0]   9   8
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f39 = f18, f7, f9	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f54 = f18, f55, f47	;; // F [fftbb.f: 91/0]  10  12
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f57 = f18, f8, f6	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f53 = f18, f52, f45	;; // F [fftbb.f: 91/0]  11  16
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f38 = f18, f49, f42	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f37 = f18, f48, f41	;; // F [fftbb.f: 91/0]  12  20
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f43 = f18, f50, f44	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f36 = f18, f46, f40	;; // F [fftbb.f: 91/0]  13  24
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f56, f39		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f56, f39		;; // F [fftbb.f: 93/0]  14  26
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/92/0
	fadd.s.s0	f58 = f35, f57		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f35, f57		;; // F [fftbb.f: 93/0]  15  28
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f34, f54		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f51 = f15, f38		;; // F [fftbb.f: 92/0]  16  30
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f9 = f14, f37		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f33, f53		;; // F [fftbb.f: 92/0]  17  32
	stfs		[r74] = f8, -4		   // M [fftbb.f: 92/0]
	nop.m		0			   // M
	fadd.s.s0	f8 = f13, f36		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f32, f43		;; // F [fftbb.f: 92/0]  18  34
	chk.a.clr	f56, ..L238		   // M
	stfs		[r74] = f58, 12		   // M [fftbb.f: 92/0]
	fsub.s.s0	f39 = f13, f36		   // F [fftbb.f: 93/0]

..L258:
	stfs		[r75] = f6, -4		   // M [fftbb.f: 93/0]
	nop.i		0			   // I
	nop.i		0			;; // I                  19  35
//file/line/col fftbb.f/93/0
	chk.a.clr	f35, ..L237		   // M
	chk.a.clr	f49, ..L227		   // M
	nop.i		0			   // I

..L259:
	ldfs.a		f6 = [r73], -4		   // M [fftbb.f: 93/0]
	stfs		[r75] = f7, 12		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I                  20  35
//file/line/col fftbb.f/94/0
	chk.a.clr	f55, ..L232		   // M
	chk.a.clr	f15, ..L234		   // M
	nop.i		0			   // I

..L260:
	ldfs.a		f7 = [r73], 4		   // M [fftbb.f: 93/0]
	stfs		[r74] = f51, -4		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I                  21  35
	chk.a.clr	f34, ..L239		   // M
	ldfs.c.clr	f6 = [r73], -4		   // M
	nop.i		0			   // I

..L261:
	ldfs.a		f15 = [r27], -4		   // M [fftbb.f: 93/0]
	stfs		[r74] = f12, 12		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I                  22  35
	ldfs.c.clr	f7 = [r73], 56		   // M
	ldfs.a		f35 = [r27], 60		   // M [fftbb.f: 93/0]
	nop.i		0			   // I
	ldfs.a		f12 = [r26], 60		;; // M [fftbb.f: 93/0]  23  35
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f6, f38		;; // F [fftbb.f: 93/0]  24  36
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f34 = f7, f54		;; // F [fftbb.f: 93/0]  25  37
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f42 = f15, f37		;; // F [fftbb.f: 93/0]  26  38
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f35, f53		   // F [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f12, f43		;; // F [fftbb.f: 93/0]  27  40
	stfs		[r75] = f38, -4		;; // M [fftbb.f: 93/0]
	chk.a.clr	f48, ..L228		   // M
	nop.i		0			   // I

..L262:
	chk.a.clr	f14, ..L235		   // M
	stfs		[r75] = f34, 12		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I                  28  40

..L263:
//file/line/col fftbb.f/91/0,92/0,93/0,94/0
	chk.a.clr	f52, ..L230		   // M
	chk.a.clr	f33, ..L240		   // M
	nop.i		0			   // I

..L264:
	stfs		[r74] = f9, -4		;; // M [fftbb.f: 92/0] 29  40
	chk.a.clr	f15, ..L242		   // M
	nop.i		0			   // I

..L265:
	stfs		[r74] = f11, 8		   // M [fftbb.f: 92/0]
	stfs		[r75] = f42, -4		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I                 30  40
	chk.a.clr	f35, ..L243		   // M
	chk.a.clr	f46, ..L229		   // M
	nop.i		0			   // I

..L266:
	stfs		[r75] = f7, 8		;; // M [fftbb.f: 93/0] 31  40
//file/line/col fftbb.f/91/0,92/0,93/0,94/0
	chk.a.clr	f50, ..L231		   // M
	nop.i		0			   // I

..L267:
	chk.a.clr	f32, ..L233		   // M
	stfs		[r74] = f10, 4		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I                 32  40

..L268:
	chk.a.nc	f13, ..L236		   // M
	chk.a.clr	f12, ..L244		   // M
	nop.i		0			   // I

..L269:
	stfs		[r74] = f8, 8		   // M [fftbb.f: 92/0]
	stfs		[r75] = f6, 4		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I                 33  40
	chk.a.clr	f13, ..L241		   // M
	stfs		[r75] = f39, 8		   // M [fftbb.f: 93/0]
//file/line/col fftbb.f/91/0,92/0,93/0,94/0
	br.ctop.dptk.many ..L186		;; // B [fftbb.f: 94/0]

..L194:
	shladd		r25 = r21, 2, r0	   // M
	add		r38 = 0, r73		   // M
	add		r39 = -4, r74		   // I
	add		r40 = -4, r75		   // M
	add		r36 = 0, r76		   // M
	add		r35 = 0, r77		;; // I
	sub		r25 = r20, r25		   // M
	add		r32 = 0, r78		;; // I
	cmp4.ne		p0, p6 = 0, r25		   // I
	add		r37 = -1, r25		   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L126			;; // B

..L197:
	add		r26 = 4, r40		   // M
	add		r27 = 4, r39		   // M
	mov		ar.lc = r37		   // I
	add		r25 = 0, r38		   // M
	nop.i		0			   // I
	nop.b		0			;; // B

..L190:
//file/line/col fftbb.f/90/0,91/0
	ldfs		f8 = [r25], 4		;; // M [fftbb.f: 91/0]
	ldfs		f7 = [r25], -12		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	ldfs.a		f11 = [r25], 4		;; // M [fftbb.f: 92/0]
	ldfs.a		f9 = [r25], 20		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f10 = f17, f8		;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f6 = f17, f7		;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f12 = f18, f7, f10	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f10 = f18, f8, f6	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f7 = f9, f12		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f13 = f9, f12		;; // F [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/92/0
	fadd.s.s0	f8 = f11, f10		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f11, f10		;; // F [fftbb.f: 93/0]
	stfs		[r27] = f7, -4		;; // M [fftbb.f: 92/0]
	chk.a.clr	f9, ..L246		   // M
	nop.i		0			   // I

..L270:
	stfs		[r27] = f8, 12		   // M [fftbb.f: 92/0]
	stfs		[r26] = f13, -4		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I
//file/line/col fftbb.f/93/0
	chk.a.clr	f11, ..L245		   // M
	stfs		[r26] = f6, 12		   // M [fftbb.f: 93/0]
//file/line/col fftbb.f/94/0
	br.cloop.dptk.many ..L190		;; // B [fftbb.f: 94/0]

..L195:

..L126:

..L47:
//file/line/col fftbb.f/95/0
	shladdp4	r15 = r71, 3, r15	   // M
	nop.m		0			   // M
(p8)	br.dptk.many	..L34			;; // B [fftbb.f: 95/0]

..L125:
	add		r86 = 0, r69		   // M
	add		r92 = 0, r72		   // M
	add		r40 = 0, r70		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L52			;; // B

..L35:
//file/line/col fftbb.f/87/2/E[2]
	cmp.eq.unc	p10, p0 = r0, r18	   // M [fftbb.f: 87/0]
	tbit.nz.unc	p7, p0 = r72, 6		   // I [fftbb.f: 87/0]
(p10)	br.dpnt.many	..L38			;; // B [fftbb.f: 87/0]

..L40:
	nop.m		0			   // M
	nop.m		0			   // M
(p7)	br.dpnt.many	..L44			;; // B [fftbb.f: 87/0]

..L46:
	and		r25 = 63, r72		   // M [fftbb.f: 87/0] [UVuse]
	nop.i		0			;; // I
	shl		r25 = r26, r25		;; // I [fftbb.f: 87/0]

..L45:
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L37			;; // B [fftbb.f: 87/0]

..L38:
//file/line/col fftbb.f/87/4/E[2]
	nop.m		0			   // M
	tbit.nz.unc	p10, p0 = r23, 6	   // I [fftbb.f: 87/0]
(p10)	br.dpnt.many	..L41			;; // B [fftbb.f: 87/0]

..L43:
	and		r25 = 63, r23		   // M [fftbb.f: 87/0]
	nop.i		0			;; // I
	shl		r26 = r17, r25		;; // I [fftbb.f: 87/0] [UVuse]

..L42:
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L40			;; // B [fftbb.f: 87/0]

..L54:
//file/line/col fftbb.f/96/3/E,97/0,98/0
	add		r89 = -2, r89		;; // M [fftbb.f: 98/0] [UVuse]
	nop.m		0			   // M
//file/line/col fftbb.f/102/0[2]
	tbit.nz.unc	p6, p0 = r89, 6		   // I [fftbb.f: 102/0] [UVuse]
	nop.m		0			   // M
	nop.m		0			   // M
(p6)	br.dpnt.many	..L55			;; // B [fftbb.f: 102/0]

..L57:
	and		r8 = 63, r89		   // M [fftbb.f: 102/0] [UVuse]
	nop.i		0			;; // I
	shl		r37 = r54, r8		;; // I [fftbb.f: 102/0]

..L56:
	add		r8 = -1, r39		   // M [fftbb.f: 103/0] [UVuse]
//file/line/col fftbb.f/103/0
	add		r38 = -2, r92		   // M [fftbb.f: 97/0] [UVuse]
	sxt4		out1 = r37		   // I [fftbb.f: 103/0]
	add		r34 = -2, r40		   // M
	add		r33 = 2, r86		;; // I
	add		r8 = r8, r37		;; // I [fftbb.f: 103/0,103,103]
	nop.m		0			   // M
	sxt4		out0 = r8		   // I [fftbb.f: 103/0]
	br.call.sptk.many rp = __milli_div32I	;; // B [fftbb.f: 103/0]
	cmp4.ge		p6, p0 = 0, r8		   // M [fftbb.f: 103/0]
	nop.m		0			   // M
(p6)	br.dpnt.many	..L129			;; // B [fftbb.f: 103/0]

..L133:
	setf.sig	f9 = r61		   // M
	setf.sig	f11 = r37		   // M
	add		r10 = 2, r0		   // I
	shladd		r9 = r37, 3, r0		   // M
	shladd		r14 = r39, 4, r0	   // M
	cmp4.ge		p6, p7 = 1, r37		;; // I
	setf.sig	f7 = r10		   // M
	setf.sig	f12 = r9		   // M
	add		r29 = -1, r37		   // I
(p6)	add		r17 = 0, r0		   // M
	shladd		r10 = r39, 1, r39	   // M
	shladd		r11 = r61, 3, r0	;; // I
	setf.sig	f8 = r14		   // M
	setf.sig	f10 = r8		   // M
(p7)	zxt4		r17 = r29		   // I
	cmp4.eq		p8, p0 = 63, r40	   // M [fftbb.f: 104/0] [UVuse]
	add		r15 = 0, r95		   // M
	cmp4.eq		p7, p0 = -65, r40	;; // I [fftbb.f: 104/0] [UVuse]
	add		r16 = 0, r95		   // M
	cmp4.eq		p6, p0 = 65, r86	   // M [fftbb.f: 104/0]
	add		r14 = 0, r95		   // I
	cmp4.eq		p9, p0 = -63, r86	   // M [fftbb.f: 104/0]
	add		r8 = 0, r95		   // M
	add		r40 = 1, r17		;; // I
	shladd		r10 = r10, 3, r11	   // M
	shladd		r17 = r39, 3, r11	   // M
	extr.u		r39 = r40, 1, 63	   // I
(p8)	add		r15 = 1, r0		   // M [fftbb.f: 104/0]
(p7)	add		r16 = 1, r0		   // M [fftbb.f: 104/0]
	sxt4		r11 = r9		;; // I
(p6)	add		r14 = 1, r0		   // M [fftbb.f: 104/0]
(p9)	add		r8 = 1, r0		   // M [fftbb.f: 104/0]
	dep.z		r41 = r37, 5, 59	   // I
	addp4		r28 = r10, r32		   // M
	addp4		r18 = r17, r32		   // M
	shladdp4	r9 = r61, 3, r32	;; // I
	or		r42 = r15, r16		   // M [fftbb.f: 104/0]
	add		r43 = -1, r86		   // M [fftbb.f: 104/0]
	or		r27 = r14, r8		   // I [fftbb.f: 104/0]
	add		r22 = -1, r39		   // M
	shladdp4	r17 = r62, 3, r32	   // M
	add		r23 = 0, r95		;; // I
	add		r26 = 0, r9		   // M
	add		r25 = 0, r18		   // M
	xma.l		f6 = f7, f12, f0	   // F
	add		r24 = 0, r28		   // M
	add		r21 = 0, r37		   // M
	xma.l		f7 = f7, f12, f0	;; // F
	add		r14 = 0, r11		   // M
	nop.m		0			   // M
	xma.l		f8 = f9, f8, f0		   // F
	nop.m		0			   // M
	nop.m		0			   // M
	xma.l		f9 = f11, f10, f0	;; // F
	getf.sig	r8 = f6			;; // M
	getf.sig	r15 = f7		   // M
	nop.i		0			;; // I
	getf.sig	r11 = f8		;; // M
	getf.sig	r20 = f9		   // M
	nop.i		0			;; // I
	add		r10 = 4, r8		   // M
	sxt4		r8 = r8			;; // I
	sxt4		r44 = r10		   // I
	add		r10 = 4, r15		   // M
	add		r8 = r8, r9		   // M
	sxt4		r15 = r15		;; // I
	addp4		r19 = r11, r32		   // M
	add		r11 = r15, r28		   // M
	sxt4		r16 = r10		   // I
	add		r10 = r15, r18		   // M
	add		r9 = r44, r9		   // I
	nop.b		0			;; // B
	add		r44 = 0, r19		   // M
	add		r45 = r16, r28		   // M
	add		r28 = r16, r19		   // I
	add		r15 = r15, r19		   // M
	add		r16 = r16, r18		   // I
	nop.b		0			;; // B

..L60:
//file/line/col fftbb.f/104/0
	cmp.eq.unc	p7, p0 = r0, r42	   // M [fftbb.f: 104/0]
	add		r76 = 776, r0		   // M
	cmp4.gt.unc	p8, p6 = r0, r29	   // I [fftbb.f: 108/0]
//file/line/col fftbb.f/104/1/E
	add		r74 = 0, r95		   // M
//file/line/col fftbb.f/104/3/E
	add		r18 = 0, r95		   // M
(p7)	br.dpnt.many	..L61			;; // B [fftbb.f: 104/0]

..L63:
	shladd		r73 = r74, 1, r0	   // M [fftbb.f: 106/0] [UVuse]
	shladd		r77 = r74, 1, r74	   // M [fftbb.f: 107/0] [UVuse]
	shladdp4	r74 = r74, 3, r35	   // I [fftbb.f: 105/0] [UVuse]
(p6)	add		r63 = 0, r17		   // M
(p6)	cmp4.ge.unc	p7, p9 = r0, r39	   // M
(p6)	add		r75 = 4, r26		;; // I [fftbb.f: 119/0]
	ldfs		f48 = [r74]		   // M [fftbb.f: 105/0] [UVuse]
	shladdp4	r73 = r73, 3, r35	   // M [fftbb.f: 106/0] [UVuse]
(p9)	mov		ar.lc = r22		   // I
	shladdp4	r77 = r77, 3, r35	   // M [fftbb.f: 107/0] [UVuse]
	add		r74 = 4, r74		   // M [fftbb.f: 105/0]
(p6)	add		r69 = 4, r25		;; // I [fftbb.f: 120/0]
	ldfs		f39 = [r73]		   // M [fftbb.f: 106/0] [UVuse]
	ldfs		f35 = [r77]		   // M [fftbb.f: 107/0] [UVuse]
	add		r73 = 4, r73		   // I [fftbb.f: 106/0]
	ldfs		f43 = [r74]		   // M [fftbb.f: 105/0] [UVuse]
	add		r77 = 4, r77		   // M [fftbb.f: 107/0]
(p6)	add		r47 = 4, r44		;; // I [fftbb.f: 121/0]
	ldfs		f37 = [r73]		   // M [fftbb.f: 106/0] [UVuse]
	ldfs		f33 = [r77]		   // M [fftbb.f: 107/0] [UVuse]
(p6)	add		r46 = 4, r24		   // I [fftbb.f: 122/0]
(p9)	add		r72 = 12, r63		   // M
(p9)	add		r71 = -780, r0		   // M
(p9)	add		r70 = 28, r63		;; // I
(p9)	add		r19 = 60, r63		   // M
(p9)	add		r18 = 44, r63		   // M
	nop.i		0			   // I
	nop.m		0			   // M
//file/line/col fftbb.f/105/0,106/0,107/0,108/0[2]
(p8)	br.dpnt.many	..L73			   // B [fftbb.f: 108/0]
(p7)	br.dpnt.many	..L185			;; // B

..L178:
//file/line/col fftbb.f/109/0
	ldfs		f8 = [r72], 8		   // M [fftbb.f: 111/0]
	ldfs		f6 = [r70], -24		   // M [fftbb.f: 113/0]
	nop.i		0			   // I
	ldfs.a		f12 = [r19], -20	   // M [fftbb.f: 113/0]
	ldfs.a		f50 = [r18], 12		   // M [fftbb.f: 111/0]
	nop.i		0			;; // I                    1   0
	ldfs		f7 = [r72], r76		   // M [fftbb.f: 112/0]
	ldfs		f38 = [r70], 4		   // M [fftbb.f: 110/0]
	nop.i		0			   // I
	ldfs.a		f40 = [r19], -16	   // M [fftbb.f: 111/0]
	ldfs.a		f13 = [r18], -4		   // M [fftbb.f: 113/0]
	nop.i		0			;; // I                    2   0
	lfetch.nt1	[r72], r71		   // M [fftbb.f: 110/0,113,112,111,111,112,110,113]
	ldfs		f42 = [r70], -8		   // M [fftbb.f: 111/0]
	nop.i		0			   // I
	ldfs		f14 = [r19], 24		   // M [fftbb.f: 113/0]
	ldfs.a		f32 = [r18], -20	   // M [fftbb.f: 112/0]
	nop.i		0			;; // I                    3   0
	ldfs		f11 = [r72], 20		   // M [fftbb.f: 112/0]
//file/line/col fftbb.f/110/0
	ldfs		f9 = [r70], 92		   // M [fftbb.f: 110/0]
	nop.i		0			   // I
	ldfs.a		f34 = [r19], 76		   // M [fftbb.f: 112/0]
	ldfs.a		f49 = [r18], 76		   // M [fftbb.f: 110/0]
	nop.i		0			;; // I                    4   0
	ldfs.a		f44 = [r72], 40		   // M [fftbb.f: 110/0]
	nop.i		0			   // I
	nop.i		0			;; // I                    5   0
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/111/0
	fmpy.s0		f41 = f8, f43		   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f8 = f8, f48		;; // F [fftbb.f: 111/0]   6   2
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f45 = f7, f39		   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f15 = f6, f33		;; // F [fftbb.f: 113/0]   7   4
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f6 = f6, f35		   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f7 = f7, f37		;; // F [fftbb.f: 112/0]   8   6
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f36 = f50, f48		   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f10 = f12, f35		;; // F [fftbb.f: 113/0]   9   8
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f41 = f42, f48, f41	   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f42 = f42, f43, f8	;; // F [fftbb.f: 111/0]  10  12
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f51 = f11, f37, f45	   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f8 = f14, f35, f15	;; // F [fftbb.f: 113/0]  11  16
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f47 = f14, f33, f6	   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/112/0
	fms.s.s0	f46 = f11, f39, f7	;; // F [fftbb.f: 112/0]  12  20
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f11 = f12, f33		   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f45 = f50, f43		;; // F [fftbb.f: 111/0]  13  22
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f14 = f32, f39		   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f15 = f32, f37		;; // F [fftbb.f: 112/0]  14  24
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f53 = f38, f51		   // F [fftbb.f: 114/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f38, f51		;; // F [fftbb.f: 116/0]  15  26
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f7 = f42, f47		   // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f41, f8		;; // F [fftbb.f: 117/0]  16  28
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f42 = f42, f47		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/113/0,114/0
	fadd.s.s0	f52 = f9, f46		;; // F [fftbb.f: 114/0]  18  30
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/115/0
	fadd.s.s0	f47 = f41, f8		   // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/116/0
	fsub.s.s0	f46 = f9, f46		;; // F [fftbb.f: 116/0]  19  32
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f41 = f40, f43, f36	   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f9 = f13, f33, f10	;; // F [fftbb.f: 113/0]  20  36
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f51 = f53, f7		   // F [fftbb.f: 119/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f38, f6		;; // F [fftbb.f: 120/0]  21  38
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/117/0,118/0
	fmerge.ns	f42 = f42, f42		   // F [fftbb.f: 118/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f53, f7		;; // F [fftbb.f: 121/0]  22  39
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f38, f6		   // F [fftbb.f: 122/0]
	nop.m		0			   // M
	nop.m		0			   // M
//file/line/col fftbb.f/119/0
	fadd.s.s0	f38 = f52, f47		;; // F [fftbb.f: 119/0]  23  41
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f52 = f52, f47		   // F [fftbb.f: 121/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f47 = f34, f37, f14	;; // F [fftbb.f: 112/0]  24  44
	stfs		[r75] = f51		   // M [fftbb.f: 119/0] [UVuse]
	stfs		[r69] = f8		   // M [fftbb.f: 120/0] [UVuse]
	fms.s.s0	f8 = f13, f35, f11	   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f51 = f40, f48, f45	;; // F [fftbb.f: 111/0]  25  48
	stfs		[r47] = f7		   // M [fftbb.f: 121/0] [UVuse]
	nop.m		0			   // M
	fadd.s.s0	f53 = f46, f42		   // F [fftbb.f: 120/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f42 = f46, f42		;; // F [fftbb.f: 122/0]  26  50
	stfs		[r46] = f6		   // M [fftbb.f: 122/0] [UVuse]
	stfs		[r26] = f38		   // M [fftbb.f: 119/0] [UVuse]
	fms.s.s0	f46 = f34, f39, f15	   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f41, f9		;; // F [fftbb.f: 117/0]  27  53
	chk.a.clr	f12, ..L219		   // M
	chk.a.clr	f50, ..L220		   // M
	fadd.s.s0	f54 = f41, f9		   // F [fftbb.f: 115/0]

..L271:
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f50 = f44, f47		;; // F [fftbb.f: 116/0]  28  55
	chk.a.clr	f32, ..L223		   // M
	chk.a.clr	f44, ..L226		   // M
	fadd.s.s0	f32 = f44, f47		   // F [fftbb.f: 114/0]

..L272:
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f51, f8		;; // F [fftbb.f: 117/0]  29  57
//file/line/col fftbb.f/120/0
	stfs		[r25] = f53		   // M [fftbb.f: 120/0] [UVuse]
//file/line/col fftbb.f/121/0
	stfs		[r44] = f52		   // M [fftbb.f: 121/0] [UVuse]
	fadd.s.s0	f12 = f51, f8		;; // F [fftbb.f: 115/0]  30  59
//file/line/col fftbb.f/122/0
	stfs		[r24] = f42		   // M [fftbb.f: 122/0] [UVuse]
	nop.m		0			   // M
	fadd.s.s0	f42 = f49, f46		   // F [fftbb.f: 114/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmerge.ns	f6 = f38, f38		;; // F [fftbb.f: 118/0]  31  60
	chk.a.clr	f40, ..L221		   // M
	chk.a.clr	f13, ..L222		   // M
	fsub.s.s0	f10 = f49, f46		;; // F [fftbb.f: 116/0]  32  61

..L273:
	chk.a.clr	f34, ..L224		   // M
//file/line/col fftbb.f/123/0
	chk.a.clr	f49, ..L225		   // M
	fsub.s.s0	f11 = f32, f54		   // F [fftbb.f: 121/0]

..L274:
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f13 = f32, f54		;; // F [fftbb.f: 119/0]  33  64
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f50, f7		   // F [fftbb.f: 120/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f50, f7		;; // F [fftbb.f: 122/0]  34  66
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f14 = f42, f12		   // F [fftbb.f: 119/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f9 = f42, f12		;; // F [fftbb.f: 121/0]  35  68
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f10, f6		   // F [fftbb.f: 120/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f10, f6		;; // F [fftbb.f: 122/0]  36  70
	stfs		[r75] = f13		;; // M [fftbb.f: 119/0] [UVuse]
	stfs		[r69] = f8		   // M [fftbb.f: 120/0] [UVuse]
	nop.i		0			   // I
	stfs		[r47] = f11		;; // M [fftbb.f: 121/0] [UVuse]  37  70
	stfs		[r26] = f14		   // M [fftbb.f: 119/0] [UVuse]
	nop.i		0			   // I
	stfs		[r46] = f7		;; // M [fftbb.f: 122/0] [UVuse]  38  70
	stfs		[r25] = f12		   // M [fftbb.f: 120/0] [UVuse]
	nop.i		0			   // I
	stfs		[r44] = f9		;; // M [fftbb.f: 121/0] [UVuse]  39  70
	stfs		[r24] = f6		   // M [fftbb.f: 122/0] [UVuse]
//file/line/col fftbb.f/110/0,111/0,112/0,113/0,114/0,115/0,116/0,117/0,118/0,119/0,120/0,121/0,122/0,123/0
	nop.i		0			   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.cloop.dptk.many ..L178		;; // B [fftbb.f: 123/0]  40  70

..L182:
	add		r63 = -12, r72		   // M
	tbit.nz.unc	p0, p6 = r40, 0		   // I
(p6)	br.dpnt.many	..L131			;; // B

..L185:
	add		r71 = 12, r63		   // M
	add		r73 = 28, r63		   // M
	add		r72 = 8, r63		   // I
	add		r70 = 20, r63		   // M
	add		r18 = 24, r63		   // M
	add		r19 = 16, r63		;; // I
	ldfs		f9 = [r71], -8		   // M [fftbb.f: 111/0] [UVuse]
	ldfs		f32 = [r73]		   // M [fftbb.f: 113/0] [UVuse]
	nop.i		0			   // I
	ldfs		f13 = [r72]		   // M [fftbb.f: 111/0] [UVuse]
	ldfs		f8 = [r70]		   // M [fftbb.f: 112/0] [UVuse]
	nop.i		0			;; // I
	ldfs		f7 = [r18]		   // M [fftbb.f: 113/0] [UVuse]
	ldfs		f10 = [r19]		   // M [fftbb.f: 112/0] [UVuse]
	nop.i		0			   // I
	ldfs		f15 = [r63]		   // M [fftbb.f: 110/0] [UVuse]
	ldfs		f14 = [r71]		   // M [fftbb.f: 110/0] [UVuse]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f11 = f9, f48		   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f6 = f32, f35		;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f12 = f9, f43		   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f9 = f8, f37		;; // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f8 = f8, f39		   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f32 = f32, f33		;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f11 = f13, f43, f11	   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f33 = f7, f33, f6	;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f12 = f13, f48, f12	   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f9 = f10, f39, f9	;; // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f8 = f10, f37, f8	   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f7 = f7, f35, f32	;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f11, f33		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f13 = f11, f33		;; // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f32 = f15, f9		   // F [fftbb.f: 114/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f9 = f15, f9		;; // F [fftbb.f: 116/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f14, f8		   // F [fftbb.f: 114/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f15 = f12, f7		;; // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f14 = f14, f8		   // F [fftbb.f: 116/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f12 = f12, f7		;; // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmerge.ns	f33 = f6, f6		;; // F [fftbb.f: 118/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f32, f15		   // F [fftbb.f: 119/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f10, f13		;; // F [fftbb.f: 119/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f7 = f14, f12		   // F [fftbb.f: 120/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f32, f15		;; // F [fftbb.f: 121/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f15 = f9, f33		   // F [fftbb.f: 120/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f10 = f10, f13		;; // F [fftbb.f: 121/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f9 = f9, f33		   // F [fftbb.f: 122/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f12 = f14, f12		;; // F [fftbb.f: 122/0]
	stfs		[r26] = f11		   // M [fftbb.f: 119/0] [UVuse]
	stfs		[r75] = f8		   // M [fftbb.f: 119/0] [UVuse]
	nop.i		0			;; // I
	stfs		[r69] = f7		;; // M [fftbb.f: 120/0] [UVuse]
	stfs		[r25] = f15		   // M [fftbb.f: 120/0] [UVuse]
	nop.i		0			   // I
	stfs		[r44] = f6		;; // M [fftbb.f: 121/0] [UVuse]
	stfs		[r47] = f10		   // M [fftbb.f: 121/0] [UVuse]
	nop.i		0			   // I
	stfs		[r24] = f9		;; // M [fftbb.f: 122/0] [UVuse]
//file/line/col fftbb.f/109/0,110/0,111/0,112/0,113/0,114/0,115/0,116/0,117/0,118/0,119/0,120/0,121/0,122/0,123/0
	stfs		[r46] = f12		   // M [fftbb.f: 122/0] [UVuse]
	nop.i		0			;; // I

..L131:

..L73:
//file/line/col fftbb.f/124/0
	lfetch.nt1	[r45], r14		   // M [fftbb.f: 122/0,122]
	lfetch.nt1	[r11], r14		   // M [fftbb.f: 122/0,122]
	add		r23 = r23, r37		   // I [fftbb.f: 124/0] [UVuse]
	cmp4.ne		p6, p0 = r21, r20	   // M [fftbb.f: 124/0] [UVuse]
	add		r21 = r37, r21		   // M
	shladdp4	r24 = r37, 3, r24	;; // I
	lfetch.nt1	[r28], r14		   // M [fftbb.f: 121/0,121]
	lfetch.nt1	[r15], r14		   // M [fftbb.f: 121/0,121]
	shladdp4	r44 = r37, 3, r44	   // I
	shladdp4	r25 = r37, 3, r25	   // M
	shladdp4	r26 = r37, 3, r26	   // M
	addp4		r17 = r41, r17		;; // I
	lfetch.nt1	[r16], r14		   // M [fftbb.f: 120/0,120]
	lfetch.nt1	[r10], r14		   // M [fftbb.f: 120/0,120]
	nop.i		0			;; // I
	lfetch.nt1	[r9], r14		   // M [fftbb.f: 119/0,119]
	lfetch.nt1	[r8], r14		   // M [fftbb.f: 119/0,119]
(p6)	br.dptk.many	..L60			;; // B [fftbb.f: 124/0]

..L130:
	add		r86 = 0, r33		   // M
	add		r92 = 0, r38		   // M
	add		r40 = 0, r34		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L52			;; // B

..L61:
//file/line/col fftbb.f/104/2/E[2]
	cmp.eq.unc	p9, p0 = r0, r27	   // M [fftbb.f: 104/0]
	tbit.nz.unc	p7, p0 = r38, 6		   // I [fftbb.f: 104/0]
(p9)	br.dpnt.many	..L64			;; // B [fftbb.f: 104/0]

..L66:
	nop.m		0			   // M
	nop.m		0			   // M
(p7)	br.dpnt.many	..L70			;; // B [fftbb.f: 104/0]

..L72:
	and		r19 = 63, r38		   // M [fftbb.f: 104/0] [UVuse]
	nop.i		0			;; // I
	shl		r74 = r18, r19		;; // I [fftbb.f: 104/0]

..L71:
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L63			;; // B [fftbb.f: 104/0]

..L64:
//file/line/col fftbb.f/104/4/E[2]
	nop.m		0			   // M
	tbit.nz.unc	p9, p0 = r43, 6		   // I [fftbb.f: 104/0]
(p9)	br.dpnt.many	..L67			;; // B [fftbb.f: 104/0]

..L69:
	and		r18 = 63, r43		   // M [fftbb.f: 104/0]
	nop.i		0			;; // I
	shl		r18 = r23, r18		;; // I [fftbb.f: 104/0] [UVuse]

..L68:
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L66			;; // B [fftbb.f: 104/0]

..L115:
	shladdp4	r8 = r71, 3, r8		   // M
	shladdp4	r24 = r71, 3, r24	   // M
	br.sptk.many	..L47			;; // B

..L78:
//file/line/col fftbb.f/190/0[2]
	add		out0 = 0, r57		   // M [fftbb.f: 190/0]
	add		out1 = 17, r0		   // M [fftbb.f: 190/0]
	br.call.sptk.many rp = __F90_F_STOP	;; // B [fftbb.f: 190/0] [noret] [UVU]

..L114:
	add		r33 = 0, r61		   // M
	nop.m		0			   // M
	br.sptk.many	..L24			;; // B

..L134:
	add		r86 = 0, r73		   // M
	add		r92 = 0, r77		   // M
	add		r40 = 0, r75		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L52			;; // B

..L124:
	add		r86 = 0, r69		   // M
	add		r92 = 0, r72		   // M
	add		r40 = 0, r70		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L52			;; // B

..L129:
	add		r86 = 0, r33		   // M
	add		r92 = 0, r38		   // M
	add		r40 = 0, r34		   // I
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L52			;; // B

..L8:
	sub		r9 = 0, r59		   // M [fftbb.f: 30/0] [UVuse]
	add		r8 = 1, r0		;; // I [fftbb.f: 30/0]
	and		r9 = 63, r9		;; // I [fftbb.f: 30/0]
	nop.m		0			   // M
	shr.u		r60 = r8, r9		   // I [fftbb.f: 30/0]
	br.sptk.many	..L9			;; // B [fftbb.f: 30/0]

..L17:
	sub		r8 = 0, r92		   // M [fftbb.f: 39/0]
	nop.i		0			;; // I
	and		r8 = 63, r8		;; // I [fftbb.f: 39/0]
	nop.m		0			   // M
	shr.u		r9 = r54, r8		   // I [fftbb.f: 39/0]
	br.sptk.many	..L18			;; // B [fftbb.f: 39/0]

..L29:
	add		r8 = -2, r86		   // M [fftbb.f: 85/0]
	nop.i		0			;; // I
	and		r8 = 63, r8		;; // I [fftbb.f: 85/0]
	nop.m		0			   // M
	shr.u		r71 = r54, r8		   // I [fftbb.f: 85/0]
	br.sptk.many	..L30			;; // B [fftbb.f: 85/0]

..L44:
	sub		r25 = 1, r92		   // M [fftbb.f: 87/0]
	zxt4		r26 = r26		;; // I [fftbb.f: 87/0]
	and		r25 = 63, r25		;; // I [fftbb.f: 87/0]
	nop.m		0			   // M
	shr.u		r25 = r26, r25		   // I [fftbb.f: 87/0]
	br.sptk.many	..L37			;; // B [fftbb.f: 87/0]

..L41:
	and		r26 = 63, r89		   // M [fftbb.f: 87/0] [UVuse]
	zxt4		r25 = r17		;; // I [fftbb.f: 87/0] [UVuse]
	shr.u		r26 = r25, r26		   // I [fftbb.f: 87/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L40			;; // B [fftbb.f: 87/0]

..L55:
	add		r8 = -1, r86		   // M [fftbb.f: 102/0]
	nop.i		0			;; // I
	and		r8 = 63, r8		;; // I [fftbb.f: 102/0]
	nop.m		0			   // M
	shr.u		r37 = r54, r8		   // I [fftbb.f: 102/0]
	br.sptk.many	..L56			;; // B [fftbb.f: 102/0]

..L70:
	sub		r19 = 2, r92		   // M [fftbb.f: 104/0]
	zxt4		r18 = r18		;; // I [fftbb.f: 104/0]
	and		r19 = 63, r19		;; // I [fftbb.f: 104/0]
	nop.m		0			   // M
	shr.u		r74 = r18, r19		   // I [fftbb.f: 104/0]
	br.sptk.many	..L63			;; // B [fftbb.f: 104/0]

..L67:
	and		r19 = 63, r89		   // M [fftbb.f: 104/0] [UVuse]
	zxt4		r18 = r23		;; // I [fftbb.f: 104/0] [UVuse]
	shr.u		r18 = r18, r19		   // I [fftbb.f: 104/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L66			;; // B [fftbb.f: 104/0]

..L80:
	and		r8 = 63, r86		;; // M [fftbb.f: 132/0]
	nop.m		0			   // M
	shr.u		r83 = r54, r8		   // I [fftbb.f: 132/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L81			;; // B [fftbb.f: 132/0]

..L95:
	sub		r11 = 3, r92		   // M [fftbb.f: 134/0]
	zxt4		r10 = r10		;; // I [fftbb.f: 134/0]
	and		r11 = 63, r11		;; // I [fftbb.f: 134/0]
	nop.m		0			   // M
	shr.u		r10 = r10, r11		   // I [fftbb.f: 134/0]
	br.sptk.many	..L88			;; // B [fftbb.f: 134/0]

..L92:
	and		r10 = 63, r89		   // M [fftbb.f: 134/0] [UVuse]
	zxt4		r11 = r11		;; // I [fftbb.f: 134/0] [UVuse]
	shr.u		r10 = r11, r10		   // I [fftbb.f: 134/0]
	nop.m		0			   // M
	nop.m		0			   // M
	br.sptk.many	..L91			;; // B [fftbb.f: 134/0]

..L219:
	add		r63 = -16, r72		;; // M
	ldfs		f12 = [r63]		   // M [fftbb.f: 113/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f10 = f12, f35		   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f11 = f12, f33		;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f9 = f13, f33, f10	   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f8 = f13, f35, f11	;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f41, f9		   // F [fftbb.f: 117/0]
	chk.a.clr	f50, ..L220		   // M
	fadd.s.s0	f54 = f41, f9		   // F [fftbb.f: 115/0]
	br.sptk.few	..L271			;; // B

..L220:
	add		r63 = -32, r72		;; // M
	ldfs		f50 = [r63]		   // M [fftbb.f: 111/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f36 = f50, f48		   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f45 = f50, f43		;; // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f41 = f40, f43, f36	   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f51 = f40, f48, f45	;; // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f41, f9		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	fadd.s.s0	f54 = f41, f9		   // F [fftbb.f: 115/0]
	br.sptk.few	..L271			;; // B

..L221:
	add		r63 = -36, r72		;; // M
	ldfs		f40 = [r63]		   // M [fftbb.f: 111/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f41 = f40, f43, f36	   // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f51 = f40, f48, f45	;; // F [fftbb.f: 111/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f41, f9		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f54 = f41, f9		;; // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f51, f8		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f51, f8		;; // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmerge.ns	f6 = f38, f38		   // F [fftbb.f: 118/0]
	chk.a.clr	f13, ..L222		   // M
	fsub.s.s0	f10 = f49, f46		   // F [fftbb.f: 116/0]
	br.sptk.few	..L273			;; // B

..L222:
	add		r63 = -20, r72		;; // M
	ldfs		f13 = [r63]		   // M [fftbb.f: 113/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f9 = f13, f33, f10	   // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f8 = f13, f35, f11	;; // F [fftbb.f: 113/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f10 = f49, f46		;; // F [fftbb.f: 116/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f38 = f41, f9		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f54 = f41, f9		;; // F [fftbb.f: 115/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f51, f8		   // F [fftbb.f: 117/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f51, f8		;; // F [fftbb.f: 115/0]
	nop.m		0			   // M
	fmerge.ns	f6 = f38, f38		   // F [fftbb.f: 118/0]
	br.sptk.few	..L273			;; // B

..L223:
	add		r63 = -24, r72		;; // M
	ldfs		f32 = [r63]		   // M [fftbb.f: 112/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f14 = f32, f39		   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f15 = f32, f37		;; // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f47 = f34, f37, f14	   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f46 = f34, f39, f15	;; // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f50 = f44, f47		   // F [fftbb.f: 116/0]
	chk.a.clr	f44, ..L226		   // M
	fadd.s.s0	f32 = f44, f47		   // F [fftbb.f: 114/0]
	br.sptk.few	..L272			;; // B

..L224:
	add		r63 = -28, r72		;; // M
	ldfs		f34 = [r63]		   // M [fftbb.f: 112/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f47 = f34, f37, f14	   // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f46 = f34, f39, f15	;; // F [fftbb.f: 112/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f50 = f44, f47		   // F [fftbb.f: 116/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f32 = f44, f47		;; // F [fftbb.f: 114/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f42 = f49, f46		   // F [fftbb.f: 114/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f10 = f49, f46		;; // F [fftbb.f: 116/0]
//file/line/col fftbb.f/123/0
	chk.a.clr	f49, ..L225		;; // M
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	fsub.s.s0	f11 = f32, f54		   // F [fftbb.f: 121/0]
	br.sptk.few	..L274			;; // B

..L225:
	add		r63 = -44, r72		   // M
	nop.m		0			   // M
	fsub.s.s0	f11 = f32, f54		;; // F [fftbb.f: 121/0]
	ldfs		f49 = [r63]		   // M [fftbb.f: 110/0]
	nop.i		0			   // I
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f42 = f49, f46		   // F [fftbb.f: 114/0]
	nop.m		0			   // M
	fsub.s.s0	f10 = f49, f46		   // F [fftbb.f: 116/0]
	br.sptk.few	..L274			;; // B

..L226:
	add		r63 = -40, r72		;; // M
	ldfs		f44 = [r63]		   // M [fftbb.f: 110/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f50 = f44, f47		   // F [fftbb.f: 116/0]
	nop.m		0			   // M
	fadd.s.s0	f32 = f44, f47		   // F [fftbb.f: 114/0]
	br.sptk.few	..L272			;; // B

..L227:
	add		r35 = 8, r73		;; // M
	ldfs		f49 = [r35]		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f47 = f17, f49		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f38 = f18, f49, f42	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f54 = f18, f55, f47	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f51 = f15, f38		;; // F [fftbb.f: 92/0]
	nop.m		0			   // M
	fadd.s.s0	f12 = f34, f54		   // F [fftbb.f: 92/0]
	br.sptk.few	..L259			;; // B

..L228:
	add		r35 = -28, r73		;; // M
	ldfs		f48 = [r35]		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f45 = f17, f48		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f37 = f18, f48, f41	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f53 = f18, f52, f45	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f9 = f14, f37		;; // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f42 = f15, f37		;; // F [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f33, f53		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	fsub.s.s0	f7 = f35, f53		   // F [fftbb.f: 93/0]
	br.sptk.few	..L262			;; // B

..L229:
	add		r35 = -12, r73		;; // M
	ldfs		f46 = [r35]		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f44 = f17, f46		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f36 = f18, f46, f40	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f43 = f18, f50, f44	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f13, f36		;; // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f39 = f13, f36		;; // F [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f32, f43		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	fsub.s.s0	f6 = f12, f43		   // F [fftbb.f: 93/0]
	br.sptk.few	..L266			;; // B

..L230:
	add		r35 = -32, r73		;; // M
	ldfs		f52 = [r35]		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f41 = f17, f52		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f53 = f18, f52, f45	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f37 = f18, f48, f41	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f11 = f33, f53		;; // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f35, f53		;; // F [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f9 = f14, f37		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f42 = f15, f37		;; // F [fftbb.f: 93/0]
	chk.a.clr	f33, ..L240		   // M
	nop.m		0			   // M
	br.sptk.few	..L264			;; // B

..L231:
	add		r35 = -16, r73		;; // M
	ldfs		f50 = [r35]		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f40 = f17, f50		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f43 = f18, f50, f44	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f36 = f18, f46, f40	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f32, f43		;; // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f12, f43		;; // F [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f13, f36		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	fsub.s.s0	f39 = f13, f36		   // F [fftbb.f: 93/0]
	br.sptk.few	..L267			;; // B

..L232:
	add		r35 = 8, r73		;; // M
	ldfs		f55 = [r35]		   // M [fftbb.f: 91/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f42 = f17, f55		   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f54 = f18, f55, f47	;; // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f38 = f18, f49, f42	   // F [fftbb.f: 91/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f12 = f34, f54		;; // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f51 = f15, f38		   // F [fftbb.f: 92/0]
	chk.a.clr	f15, ..L234		   // M
	nop.m		0			   // M
	br.sptk.few	..L260			;; // B

..L233:
	add		r35 = -24, r73		;; // M
	ldfs		f32 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f10 = f32, f43		;; // F [fftbb.f: 92/0]
	stfs		[r74] = f10, 4		   // M [fftbb.f: 92/0]
	nop.m		0			   // M
	br.sptk.few	..L268			;; // B

..L234:
	add		r35 = 4, r73		;; // M
	ldfs		f15 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fadd.s.s0	f51 = f15, f38		   // F [fftbb.f: 92/0]
	br.sptk.few	..L260			;; // B

..L235:
	add		r35 = -36, r73		;; // M
	ldfs		f14 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			   // I
	stfs		[r75] = f34, 12		;; // M [fftbb.f: 93/0]
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	fadd.s.s0	f9 = f14, f37		   // F [fftbb.f: 92/0]
	br.sptk.few	..L263			;; // B

..L236:
	add		r35 = -20, r73		;; // M
	ldfs.a		f13 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fadd.s.s0	f8 = f13, f36		   // F [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f39 = f13, f36		;; // F [fftbb.f: 93/0]
	chk.a.clr	f12, ..L244		   // M
	nop.m		0			   // M
	br.sptk.few	..L269			;; // B

..L237:
	add		r35 = -20, r73		;; // M
	ldfs		f35 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f35, f57		   // F [fftbb.f: 93/0]
	chk.a.clr	f49, ..L227		   // M
	nop.m		0			   // M
	br.sptk.few	..L259			;; // B

..L238:
	add		r35 = -16, r73		;; // M
	ldfs		f56 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			   // I
	stfs		[r74] = f58, 12		   // M [fftbb.f: 92/0]
	nop.i		0			   // I
	nop.b		0			;; // B
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f56, f39		   // F [fftbb.f: 93/0]
	nop.m		0			   // M
	fsub.s.s0	f39 = f13, f36		   // F [fftbb.f: 93/0]
	br.sptk.few	..L258			;; // B

..L239:
	add		r35 = -4, r73		   // M
	ldfs.c.clr	f6 = [r73], -4		   // M
	nop.i		0			;; // I
	ldfs		f34 = [r35]		;; // M [fftbb.f: 92/0]
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	fadd.s.s0	f12 = f34, f54		   // F [fftbb.f: 92/0]
	br.sptk.few	..L261			;; // B

..L240:
	add		r35 = -40, r73		;; // M
	ldfs		f33 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fadd.s.s0	f11 = f33, f53		   // F [fftbb.f: 92/0]
	br.sptk.few	..L264			;; // B

..L241:
	add		r35 = -20, r73		;; // M
	ldfs		f13 = [r35]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f39 = f13, f36		;; // F [fftbb.f: 93/0]
	stfs		[r75] = f39, 8		   // M [fftbb.f: 93/0]
//file/line/col fftbb.f/91/0,92/0,93/0,94/0
	br.ctop.dptk.many ..L186		   // B [fftbb.f: 94/0]
	br.sptk.few	..L194			;; // B

..L242:
	add		r35 = -36, r73		;; // M
	ldfs		f15 = [r35]		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f42 = f15, f37		   // F [fftbb.f: 93/0]
	br.sptk.few	..L265			;; // B

..L243:
	add		r35 = -40, r73		;; // M
	ldfs		f35 = [r35]		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f7 = f35, f53		   // F [fftbb.f: 93/0]
	chk.a.clr	f46, ..L229		   // M
	nop.m		0			   // M
	br.sptk.few	..L266			;; // B

..L244:
	add		r35 = -24, r73		;; // M
	ldfs		f12 = [r35]		   // M [fftbb.f: 93/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f6 = f12, f43		   // F [fftbb.f: 93/0]
	br.sptk.few	..L269			;; // B

..L245:
	add		r28 = -24, r25		;; // M
	ldfs		f11 = [r28]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f6 = f11, f10		;; // F [fftbb.f: 93/0]
	stfs		[r26] = f6, 12		   // M [fftbb.f: 93/0]
//file/line/col fftbb.f/94/0
	br.cloop.dptk.many ..L190		   // B [fftbb.f: 94/0]
	br.sptk.few	..L195			;; // B

..L246:
	add		r28 = -20, r25		;; // M
	ldfs		f9 = [r28]		   // M [fftbb.f: 92/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	fsub.s.s0	f13 = f9, f12		   // F [fftbb.f: 93/0]
	br.sptk.few	..L270			;; // B

..L247:
	add		out0 = 16, r79		   // M
(p16)	ldfs.c.clr	f41 = [r79], 32		   // M
(p16)	fms.s.s0	f61 = f41, f14, f64	;; // F [fftbb.f: 161/0]
	ldfs		f40 = [out0]		;; // M [fftbb.f: 160/0]
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	fma.s.s0	f72 = f40, f9, f69	   // F [fftbb.f: 160/0]
	br.sptk.few	..L254			;; // B

..L248:
	add		out0 = -32, r79		   // M
(p16)	ldfs.c.clr	f37 = [r79], 24		   // M
(p16)	fmpy.s0		f48 = f37, f8		;; // F [fftbb.f: 148/0]
	ldfs		f36 = [out0]		;; // M [fftbb.f: 147/0]
	nop.m		0			   // M
	nop.i		0			   // I
	nop.m		0			   // M
	fmpy.s0		f57 = f36, f17		   // F [fftbb.f: 147/0]
	br.sptk.few	..L255			;; // B

..L249:
//file/line/col fftbb.f/144/0
	add		out0 = -64, r79		;; // M
	ldfs		f44 = [out0]		   // M [fftbb.f: 159/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f50 = f44, f19		   // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f67 = f44, f18		;; // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f66 = f43, f18, f50	   // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f56 = f43, f19, f67	;; // F [fftbb.f: 159/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f55 = f66, f72		   // F [fftbb.f: 165/0]
(p16)	chk.a.clr	f45, ..L250		   // M
(p16)	fsub.s.s0	f49 = f61, f60		   // F [fftbb.f: 166/0]
	br.sptk.few	..L256			;; // B

..L250:
	add		out0 = -32, r79		   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f49 = f61, f60		;; // F [fftbb.f: 166/0]
	ldfs		f45 = [out0]		   // M [fftbb.f: 160/0]
	nop.i		0			   // I
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f69 = f45, f10		   // F [fftbb.f: 160/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f71 = f45, f9		;; // F [fftbb.f: 160/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f72 = f40, f9, f69	   // F [fftbb.f: 160/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f58 = f40, f10, f71	;; // F [fftbb.f: 160/0]
	nop.m		0			   // M
	fsub.s.s0	f55 = f66, f72		   // F [fftbb.f: 165/0]
	br.sptk.few	..L256			;; // B

..L251:
	add		out0 = -48, r79		;; // M
	ldfs		f46 = [out0]		   // M [fftbb.f: 161/0]
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f64 = f46, f13		   // F [fftbb.f: 161/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f65 = f46, f14		;; // F [fftbb.f: 161/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f61 = f41, f14, f64	   // F [fftbb.f: 161/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f73 = f41, f13, f65	;; // F [fftbb.f: 161/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f49 = f61, f60		   // F [fftbb.f: 166/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f51 = f73, f59		;; // F [fftbb.f: 166/0]
(p16)	chk.a.clr	f47, ..L252		   // M
(p16)	fsub.s.s0	f69 = f56, f58		   // F [fftbb.f: 165/0]
	br.sptk.few	..L257			;; // B

..L252:
	add		out0 = -16, r79		   // M
	nop.m		0			   // M
(p16)	fsub.s.s0	f69 = f56, f58		;; // F [fftbb.f: 165/0]
	ldfs		f47 = [out0]		   // M [fftbb.f: 162/0]
	nop.i		0			   // I
	nop.i		0			;; // I
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f62 = f47, f21		   // F [fftbb.f: 162/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fmpy.s0		f68 = f47, f6		;; // F [fftbb.f: 162/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fms.s.s0	f60 = f42, f6, f62	   // F [fftbb.f: 162/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fma.s.s0	f59 = f42, f21, f68	;; // F [fftbb.f: 162/0]
	nop.m		0			   // M
	nop.m		0			   // M
	fsub.s.s0	f49 = f61, f60		   // F [fftbb.f: 166/0]
	nop.m		0			   // M
	fsub.s.s0	f51 = f73, f59		   // F [fftbb.f: 166/0]
	br.sptk.few	..L257			;; // B

..L1:
//	$end					;; // A

	.endp	fftbb_

// ===
	.section .IA_64.unwind = "a", "unwind"
	.align 4
	data4.ua @segrel(.text)
	data4.ua @segrel(.text+14032)
	data4.ua @segrel(.tcg$unwind_info_block0000)

// ===
	.section .IA_64.unwind_info = "a", "progbits"
	.align 4
	data4.ua @segrel(.llo$annot_info_block0000)
.tcg$unwind_info_block0000:	data1	0x00, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x0d
	data1	0x60, 0x28, 0xe4, 0x08, 0xb0, 0xb1, 0xe6, 0x06
	data1	0xb1, 0x30, 0xe8, 0x11, 0xb1, 0xb3, 0xec, 0x12
	data1	0xed, 0x3c, 0xea, 0x0e, 0xb2, 0xb2, 0xb9, 0xf0
	data1	0x03, 0xff, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x02
	data1	0x28, 0x91, 0x45, 0x14, 0x51, 0xe0, 0x02, 0x1f
	data1	0xe2, 0x04, 0x61, 0xa2, 0x08, 0x81, 0xc0, 0x03
	data1	0x61, 0xfd, 0x0b, 0xa1

// ===


// ===
	.section .data = "aw", "progbits"
	.align 16
.tcg0$data:	data1	0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04
	data1	0x00, 0x00, 0x00, 0x02

// ===
	.section .rodata = "a", "progbits"
	.align 16
.tcg1$rodata:	stringz	"Radix not 2 or 8."
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 2 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 4 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 9 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 9 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 7 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 8 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 8 DOITER (J)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 7 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 5 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 6 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 6 DOITER (J)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 5 DOITER (K)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 3 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 3 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 1 END DOITER"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 1 DOITER (I)"
	data1	0x00, 0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 11 END DOITER"
	data1	0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 11 DOITER (I)"
	data1	0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 10 END DOITER"
	data1	0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 10 DOITER (J)"
	data1	0x00, 0x00, 0x00
	stringz	"$HP$ _LOOPINFO 2 DOITER (IDIM)"
	data1	0x00
	string 	"$HP$ _LOOPINFO 4 DOITER (IBFLY)"

// ===
	.section .rodata = "a", "progbits"
	.align 8

// ===
	.section .HP.opt_annot = "a", "annot"
	.align 8
.llo$annot_info_block0000:	data1	0x00, 0xac, 0x01, 0xfe, 0xf8, 0x20, 0xff, 0xc0
	data1	0x00, 0x00, 0xc0, 0x00, 0x20, 0x00, 0x01, 0x02
	data1	0x84, 0x00, 0x02, 0x88, 0x02, 0x00, 0x0f, 0x00

// ===
	.section .debug_procs_abbrev = "", "progbits"
	.align 1
$DEBUG_PROCS_ABBREV_CE0002_fftbb_f:	data1	0x03, 0x11, 0x01, 0x10, 0x06, 0x90, 0x40, 0x06
	data1	0x03, 0x08, 0x13, 0x0b, 0x95, 0x40, 0x0b, 0x25
	data1	0x08, 0x1b, 0x08, 0x01, 0x13, 0x00, 0x00, 0x07
	data1	0x2e, 0x01, 0x94, 0x40, 0x0b, 0x96, 0x40, 0x06
	data1	0x11, 0x01, 0x12, 0x01, 0x97, 0x40, 0x01, 0x98
	data1	0x40, 0x01, 0x00, 0x00, 0x00

// ===
	.section .debug_procs_info = "", "progbits"
	.align 1
	data1	0x00, 0x00, 0x00, 0x4b, 0x00, 0x02
	data4.ua @secrel($DEBUG_PROCS_ABBREV_CE0002_fftbb_f)
	data1	0x04, 0x03
	data4.ua @secrel($dbglline_CE0002_fftbb_f)
	data4.ua @secrel($dbgaline_CE0002_fftbb_f)
	stringz	"fftbb.f"
	data1	0x08, 0x01, 0x47, 0x00
	stringz	"/nis.home/karp/fft"
	data1	0x00, 0x00, 0x00, 0x00, 0x07, 0x02, 0x00, 0x00
	data1	0x00, 0x00
	data4.ua .text
	data4.ua .text+14032
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	data1	0x00, 0x00

// ===
	.section .debug_line = "", "progbits"
	.align 8
$dbglline_CE0002_fftbb_f:	data1	0x00, 0x00, 0x02, 0x3f, 0x00, 0x02, 0x00, 0x00
	data1	0x00, 0x10, 0x04, 0x01, 0x00, 0x05, 0x0a, 0x01
	data1	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	data1	0x00, 0x00, 0x00, 0x05, 0x02
	data4.ua .text
	data1	0x00, 0x0c, 0x03
	stringz	"fftbb.f"
	data1	0x00, 0x00, 0x00, 0x00, 0x05, 0x02
	data4.ua .text
	data1	0x04, 0x01, 0x0d, 0x06, 0x05, 0x01, 0x02, 0x38
	data1	0x03, 0x14, 0x01, 0x06, 0x05, 0x00, 0x0a, 0x0b
	data1	0x0b, 0x03, 0x7f, 0x01, 0x0b, 0x02, 0x3e, 0x03
	data1	0x01, 0x01, 0x0b, 0x0b, 0x03, 0x7f, 0x01, 0x0b
	data1	0x03, 0x7f, 0x01, 0x0b, 0x03, 0x7f, 0x01, 0x0b
	data1	0x02, 0x16, 0x03, 0x7e, 0x01, 0x1f, 0x10, 0x2e
	data1	0x4c, 0x88, 0x0e, 0x0b, 0x0b, 0x03, 0x73, 0x01
	data1	0x0b, 0x03, 0x7f, 0x01, 0x0b, 0x02, 0x0a, 0x03
	data1	0x0d, 0x01, 0xc4, 0x0b, 0x0b, 0x0e, 0x1f, 0x56
	data1	0x38, 0x45, 0x33, 0x10, 0x11, 0xb5, 0x38, 0x83
	data1	0xf6, 0x02, 0x10, 0x03, 0x7e, 0x01, 0x0b, 0x0b
	data1	0x02, 0x09, 0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02
	data1	0x07, 0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02, 0x10
	data1	0x03, 0x7e, 0x01, 0x0b, 0x0b, 0x02, 0x0e, 0x03
	data1	0x7e, 0x01, 0x0b, 0x0b, 0x02, 0x0e, 0x03, 0x7e
	data1	0x01, 0x0b, 0x0b, 0x02, 0x05, 0x03, 0x7e, 0x01
	data1	0x0b, 0x0b, 0x02, 0x0f, 0x03, 0x7d, 0x01, 0x29
	data1	0x29, 0x38, 0x1d
	string 	"e\X0b\X0b))\X0b\X0b\X0b@"
	data1	0x06, 0x05, 0x03, 0x02, 0x04, 0x03, 0x30, 0x01
	data1	0x06, 0x05, 0x00, 0x0b, 0x0b, 0x02, 0x02, 0x03
	data1	0x05, 0x01, 0x5b, 0x02, 0x7a, 0x03, 0x01, 0x01
	data1	0x06, 0x05, 0x01, 0x32, 0x06, 0x05, 0x00, 0x3d
	data1	0xf1, 0x33, 0x24, 0x1f, 0x1f, 0x1f, 0x39, 0x02
	data1	0x84, 0x03, 0x03, 0x01, 0x01
	string 	"\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\f\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\f\X0b\X0b\X0b\X0b\f\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b)"
	data1	0xc2, 0x47, 0x4a, 0x06, 0x05, 0x01, 0x4b, 0x06
	data1	0x05, 0x00, 0x0c, 0x92, 0xd3, 0x32, 0x32, 0x32
	data1	0x32, 0x32, 0x32, 0x23, 0x02, 0x13, 0x03, 0x7f
	data1	0x01, 0x29, 0x02, 0x06, 0x03, 0x05, 0x01, 0x06
	data1	0x05, 0x02, 0x02, 0x2c, 0x03, 0xb8, 0x7f, 0x01
	data1	0x06, 0x06, 0x05, 0x03, 0x0f, 0x06, 0x06, 0x05
	data1	0x04, 0x55, 0x06, 0x06, 0x05, 0x01, 0x02, 0x0c
	data1	0x03, 0x47, 0x01, 0x06, 0x05, 0x00, 0x0c, 0x0b
	data1	0x03, 0x05, 0x01, 0x38, 0x02, 0x47, 0x03, 0x01
	data1	0x01, 0x06, 0x05, 0x01, 0x1e, 0x06, 0x06, 0x05
	data1	0x03, 0x0f, 0x06, 0x05, 0x00, 0x24, 0xbf, 0x29
	data1	0x0b, 0x02, 0x6e, 0x03, 0x01, 0x01, 0xc9, 0x33
	data1	0x02, 0x34, 0x03, 0x7d, 0x01, 0x0b, 0x0b, 0x0b
	data1	0x02, 0x11, 0x03, 0x7d, 0x01, 0x0b, 0x0b, 0x0b
	data1	0x02, 0x11, 0x03, 0x7d, 0x01, 0x0b, 0x0b, 0x0b
	data1	0x02, 0x1a, 0x03, 0x7c, 0x01, 0x0b, 0xb5, 0x51
	data1	0x15, 0x15, 0x06, 0x05, 0x02, 0x02, 0x0c, 0x03
	data1	0x78, 0x01, 0x06, 0x06, 0x05, 0x04, 0x5a, 0x06
	data1	0x06, 0x05, 0x03, 0x02, 0x0c, 0x03, 0x09, 0x01
	data1	0x06, 0x05, 0x00, 0x0b, 0x0b, 0x18, 0x42, 0x02
	data1	0x77, 0x03, 0x01, 0x01, 0x06, 0x05, 0x01, 0x1e
	data1	0x06, 0x06, 0x05, 0x03, 0x0f, 0x06, 0x05, 0x00
	data1	0xd3, 0x0b, 0x0b, 0x0b, 0x1a, 0x88, 0x4c, 0x02
	data1	0x34, 0x03, 0x01, 0x01, 0xd3, 0x0b, 0x1f, 0x1f
	data1	0x6f, 0x0b, 0x47, 0x02, 0x32, 0x03, 0x01, 0x01
	data1	0x10, 0x1a, 0x4c, 0x02, 0x2d, 0x03, 0x73, 0x01
	string 	"\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b"
	data1	0x02, 0xa3, 0x01, 0x03, 0x72, 0x01
	string 	"\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b\X0b"
	data1	0x1a, 0x06, 0x05, 0x02, 0x02, 0x20, 0x03, 0x6c
	data1	0x01, 0x06, 0x06, 0x05, 0x04, 0x5a, 0x06, 0x05
	data1	0x00, 0x02, 0x10, 0x03, 0xd6, 0x00, 0x01, 0x02
	data1	0xb0, 0x02, 0x03, 0xbd, 0x7f, 0x01, 0x02, 0xc5
	data1	0x02, 0x03, 0x60, 0x01, 0x0b, 0x0b, 0x0b, 0xe6
	data1	0x02, 0x27, 0x03, 0x32, 0x01, 0x02, 0x04, 0x00
	data1	0x01, 0x01

// ===
	.section .debug_actual = "", "progbits"
	.align 8
$dbgaline_CE0002_fftbb_f:	data1	0x00, 0x00, 0x08, 0x2b, 0x00, 0x02, 0x00, 0x00
	data1	0x00, 0x0e, 0x04, 0x01, 0x00, 0x05, 0x0a, 0x01
	data1	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	data1	0x00, 0x05, 0x02
	data4.ua .text
	data1	0x00, 0x05, 0x02
	data4.ua .text
	data1	0x0b, 0x00, 0x01, 0x11, 0x0f, 0x00, 0x01, 0x11
	data1	0x0f, 0x00, 0x01, 0x11, 0x28, 0x00, 0x01, 0x11
	data1	0x48, 0x02, 0x02, 0x03, 0x7e, 0x01, 0x02, 0x22
	data1	0x03, 0x1c, 0x01, 0x02, 0x24, 0x03, 0x74, 0x01
	data1	0x15, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x15, 0x02
	data1	0x02, 0x03, 0x7f, 0x01, 0x10, 0x02, 0x03, 0x03
	data1	0x7f, 0x01, 0x1f, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x10, 0x33, 0x02, 0x16, 0x03, 0x7e, 0x01, 0x10
	data1	0x02, 0x01, 0x03, 0x7f, 0x01, 0x15, 0x29, 0x1a
	data1	0x02, 0x07, 0x03, 0x09, 0x01, 0x00, 0x01, 0x11
	data1	0x02, 0x01, 0x03, 0x7c, 0x01, 0x02, 0x04, 0x03
	data1	0x7d, 0x01, 0x8a, 0x02, 0x0a, 0x03, 0x05, 0x01
	data1	0x02, 0x1a, 0x03, 0x0b, 0x01, 0x02, 0x02, 0x03
	data1	0x7b, 0x01, 0x00, 0x01, 0x11, 0x02, 0x04, 0x03
	data1	0x7a, 0x01, 0x13, 0x02, 0x01, 0x03, 0x07, 0x01
	data1	0x00, 0x01, 0x11, 0x02, 0x04, 0x03, 0x79, 0x01
	data1	0x1a, 0x02, 0x03, 0x03, 0xd9, 0x01, 0x01, 0x00
	data1	0x01, 0x11, 0x02, 0x02, 0x03, 0xa7, 0x7e, 0x01
	data1	0x15, 0x02, 0x01, 0x03, 0xd8, 0x01, 0x01, 0x02
	data1	0x04, 0x03, 0xa7, 0x7e, 0x01, 0x10, 0x00, 0x01
	data1	0x11, 0x32, 0x1a, 0x00, 0x01, 0x11
	stringz	"#)"
	data1	0x01, 0x11, 0x14, 0x15, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x02, 0x01, 0x03, 0x21, 0x01, 0x02, 0x02
	data1	0x03, 0x60, 0x01, 0x10, 0x24, 0x02, 0x1e, 0x03
	data1	0x1c, 0x01, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x02
	data1	0x02, 0x03, 0x7f, 0x01, 0x12, 0x02, 0x03, 0x03
	data1	0x7f, 0x01, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x02
	data1	0x03, 0x03, 0x7f, 0x01, 0x10, 0x02, 0x01, 0x03
	data1	0x7f, 0x01, 0x15, 0x10, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x15, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x11
	data1	0x02, 0x02, 0x03, 0x7f, 0x01, 0x02, 0x01, 0x03
	data1	0x7f, 0x01, 0x02, 0x05, 0x03, 0x7f, 0x01, 0x16
	data1	0x02, 0x02, 0x03, 0x7f, 0x01, 0x20, 0x02, 0x02
	data1	0x03, 0x7f, 0x01, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x10, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x15, 0x02
	data1	0x05, 0x03, 0x7f, 0x01, 0x1a, 0x02, 0x01, 0x03
	data1	0x7f, 0x01, 0x10, 0x02, 0x04, 0x03, 0x7e, 0x01
	data1	0x16, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x11, 0x02
	data1	0x04, 0x03, 0x7f, 0x01, 0x02, 0x05, 0x03, 0x7f
	data1	0x01, 0x1a, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x02
	data1	0x01, 0x03, 0x7f, 0x01, 0x1a, 0x10, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x1a, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x15, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x02
	data1	0x01, 0x03, 0x7f, 0x01, 0x20, 0x1f, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x29, 0x02
	data1	0x01, 0x03, 0x7e, 0x01, 0x12, 0x02, 0x02, 0x03
	data1	0x7f, 0x01, 0x02, 0x05, 0x03, 0x7f, 0x01, 0x10
	data1	0x6f, 0x02, 0x0e, 0x03, 0x7f, 0x01, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x17, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x29, 0x3d, 0x02, 0x04, 0x03
	data1	0x09, 0x01, 0x02, 0x06, 0x03, 0x78, 0x01, 0x02
	data1	0x04, 0x03, 0xc4, 0x00, 0x01, 0x00, 0x01, 0x11
	data1	0x02, 0x02, 0x03, 0xbc, 0x7f, 0x01, 0x17, 0x02
	data1	0x01, 0x03, 0x7d, 0x01, 0x12, 0x2c, 0x10, 0x1f
	data1	0x02, 0x01, 0x03, 0x7f, 0x01, 0x1e, 0x02, 0x02
	data1	0x03, 0xd1, 0x00, 0x01, 0x02, 0x02, 0x03, 0xaf
	data1	0x7f, 0x01, 0x15, 0x21, 0x15, 0x3d, 0x02, 0x01
	data1	0x03, 0x7d, 0x01, 0x12, 0x02, 0x04, 0x03, 0x41
	data1	0x01, 0x02, 0x02, 0x03, 0x3f, 0x01, 0x02, 0x0e
	data1	0x03, 0x41, 0x01, 0x02, 0x04, 0x03, 0x3f, 0x01
	data1	0x51, 0x02, 0x5a, 0x03, 0x33, 0x01, 0x02, 0x03
	data1	0x03, 0x56, 0x01, 0x02, 0x01, 0x03, 0x77, 0x01
	data1	0x2c, 0x13, 0x02, 0x01, 0x03, 0x7b, 0x01, 0x16
	data1	0x10, 0x02, 0x01, 0x03, 0x7c, 0x01, 0x02, 0x02
	data1	0x03, 0x05, 0x01, 0x10, 0x02, 0x01, 0x03, 0x7b
	data1	0x01, 0x15, 0x10, 0x10, 0x15, 0x10, 0x02, 0x0d
	data1	0x03, 0x7a, 0x01, 0x15, 0x10, 0x10, 0x15, 0x10
	data1	0x10, 0x02, 0x02, 0x03, 0x27, 0x01, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x02, 0x03, 0x03, 0x54, 0x01
	data1	0x02, 0x04, 0x03, 0x2b, 0x01, 0x02, 0x01, 0x03
	data1	0x7f, 0x01, 0x02, 0x03, 0x03, 0x57, 0x01, 0x02
	data1	0x04, 0x03, 0x28, 0x01, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x02, 0x03, 0x03, 0x5a, 0x01, 0x02, 0x04
	data1	0x03, 0x2d, 0x01, 0x02, 0x01, 0x03, 0x54, 0x01
	data1	0x1f, 0x1f, 0x1f, 0x38, 0x02, 0x16, 0x03, 0x0f
	data1	0x01, 0x10, 0x02, 0x01, 0x03, 0x11, 0x01, 0x02
	data1	0x02, 0x03, 0x70, 0x01, 0x10, 0x02, 0x01, 0x03
	data1	0x0f, 0x01, 0x02, 0x02, 0x03, 0x6e, 0x01, 0x10
	data1	0x02, 0x01, 0x03, 0x12, 0x01, 0x02, 0x02, 0x03
	data1	0x6f, 0x01, 0x10, 0x02, 0x01, 0x03, 0x11, 0x01
	data1	0x02, 0x02, 0x03, 0x61, 0x01, 0x10, 0x02, 0x01
	data1	0x03, 0x1d, 0x01, 0x02, 0x02, 0x03, 0x61, 0x01
	data1	0x02, 0x01, 0x03, 0x7f, 0x01, 0x02, 0x01, 0x03
	data1	0x21, 0x01, 0x02, 0x02, 0x03, 0x5f, 0x01, 0x03
	data1	0x10, 0x01, 0x03, 0x73, 0x01, 0x03, 0x0b, 0x01
	data1	0x03, 0x73, 0x01, 0x03, 0x0e, 0x01, 0x03, 0x73
	data1	0x01, 0x03, 0x0b, 0x01, 0x03, 0x75, 0x01, 0x03
	data1	0x0d, 0x01, 0x03, 0x72, 0x01, 0x03, 0x0d, 0x01
	data1	0x03, 0x75, 0x01, 0x03, 0x7d, 0x01, 0x03, 0x10
	data1	0x01, 0x02, 0x01, 0x03, 0x72, 0x01, 0x02, 0x01
	data1	0x03, 0x20, 0x01, 0x02, 0x02, 0x03, 0x61, 0x01
	data1	0x02, 0x01, 0x03, 0x7e, 0x01, 0x02, 0x01, 0x03
	data1	0x21, 0x01, 0x16, 0x03, 0x7f, 0x01, 0x03, 0x7f
	data1	0x01, 0x03, 0x7f, 0x01, 0x03, 0x7f, 0x01, 0x03
	data1	0x7f, 0x01, 0x03, 0x07, 0x01, 0x02, 0x01, 0x03
	data1	0x5a, 0x01, 0x02, 0x01, 0x03, 0x23, 0x01, 0x00
	data1	0x01, 0x11, 0x02, 0x02, 0x03, 0x7c, 0x01, 0x18
	data1	0x00, 0x01, 0x11, 0x02, 0x02, 0x03, 0x7c, 0x01
	data1	0x00, 0x01, 0x11, 0x10, 0x13, 0x00, 0x01, 0x11
	data1	0x02, 0x06, 0x03, 0x7c, 0x01, 0x00, 0x01, 0x11
	data1	0x10, 0x13, 0x00, 0x01, 0x11, 0x02, 0x06, 0x03
	data1	0x7c, 0x01, 0x00, 0x01, 0x11, 0x10, 0x13, 0x00
	data1	0x01, 0x11, 0x02, 0x06, 0x03, 0x7c, 0x01, 0x00
	data1	0x01, 0x11, 0x10, 0x02, 0x01, 0x03, 0x6a, 0x01
	data1	0x1f, 0x00, 0x01, 0x11, 0x02, 0x02, 0x03, 0x15
	data1	0x01, 0x00, 0x01, 0x11, 0x10, 0x02, 0x01, 0x03
	data1	0x6b, 0x01, 0x00, 0x01, 0x11, 0x02, 0x06, 0x03
	data1	0x15, 0x01, 0x00, 0x01, 0x11, 0x10, 0x02, 0x01
	data1	0x03, 0x6b, 0x01, 0x00, 0x01, 0x11, 0x02, 0x06
	data1	0x03, 0x15, 0x01, 0x00, 0x01, 0x11, 0x10, 0x02
	data1	0x01, 0x03, 0x67, 0x01, 0x1f, 0x02, 0x04, 0x03
	data1	0x7f, 0x01, 0x00, 0x01, 0x11, 0x02, 0x02, 0x03
	data1	0x19, 0x01, 0x02, 0x02, 0x03, 0x68, 0x01, 0x1f
	data1	0x33, 0x02, 0x08, 0x03, 0x7d, 0x01, 0x1f, 0x02
	data1	0x04, 0x03, 0x05, 0x01, 0x02, 0x04, 0x03, 0x6f
	data1	0x01, 0x1f, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x02
	data1	0x04, 0x03, 0x13, 0x01, 0x02, 0x08, 0x03, 0x7f
	data1	0x01, 0x02, 0x04, 0x03, 0x6e, 0x01, 0x1f, 0x33
	data1	0x02, 0x08, 0x03, 0x12, 0x01, 0x22, 0x02, 0x04
	data1	0x03, 0x7e, 0x01, 0x02, 0x04, 0x03, 0x6a, 0x01
	data1	0x33, 0x1f, 0x22, 0x02, 0x04, 0x03, 0x12, 0x01
	data1	0x22, 0x02, 0x04, 0x03, 0x74, 0x01, 0x1f, 0x02
	data1	0x04, 0x03, 0x05, 0x01, 0x21, 0x35, 0x02, 0x08
	data1	0x03, 0x67, 0x01, 0x33, 0x33, 0x33, 0x1f, 0x02
	data1	0x04, 0x03, 0x09, 0x01, 0x1f, 0x02, 0x04, 0x03
	data1	0x06, 0x01, 0x20, 0x35, 0x1f, 0x02, 0x04, 0x03
	data1	0x6b, 0x01, 0x33, 0x33, 0x33, 0x02, 0x08, 0x03
	data1	0x0a, 0x01, 0x34, 0x21, 0x33, 0x20, 0x02, 0x04
	data1	0x03, 0x09, 0x01, 0xa1, 0x47, 0x02, 0x0c, 0x03
	data1	0x94, 0x7f, 0x01, 0x02, 0x06, 0x03, 0xed, 0x00
	data1	0x01, 0x29, 0x11, 0x02, 0x23, 0x03, 0x0a, 0x01
	data1	0x02, 0x62, 0x03, 0x01, 0x01, 0x02, 0x12, 0x03
	data1	0x7f, 0x01, 0x3d, 0x15, 0x00, 0x01, 0x11, 0xc8
	data1	0x00, 0x01, 0x18, 0x1e, 0x02, 0x02, 0x03, 0xbc
	data1	0x7f, 0x01, 0x02, 0x1d, 0x03, 0xcb, 0x00, 0x01
	data1	0x2e, 0x02, 0x01, 0x03, 0x7d, 0x01, 0x12, 0x6f
	data1	0x02, 0x33, 0x03, 0x04, 0x01, 0x02, 0x01, 0x03
	data1	0x17, 0x01, 0x02, 0x04, 0x03, 0x65, 0x01, 0x21
	data1	0x02, 0x06, 0x03, 0xda, 0x00, 0x01, 0x02, 0x05
	data1	0x03, 0xa6, 0x7f, 0x01, 0x02, 0x14, 0x03, 0x18
	data1	0x01, 0x02, 0x05, 0x03, 0x69, 0x01, 0x02, 0x06
	data1	0x03, 0xd7, 0x00, 0x01, 0x34, 0x03, 0x7e, 0x01
	data1	0x0b, 0x0b, 0x03, 0x7e, 0x01, 0x34, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x02, 0x03, 0x03, 0x7f, 0x01
	data1	0x10, 0x02, 0x11, 0x03, 0x7f, 0x01, 0x02, 0x40
	data1	0x03, 0x01, 0x01, 0x1f, 0x02, 0x04, 0x03, 0x7f
	data1	0x01, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x83
	data1	0x02, 0x13, 0x03, 0x7f, 0x01, 0x2e, 0x02, 0x01
	data1	0x03, 0x7f, 0x01, 0x1f, 0x02, 0x27, 0x03, 0x7f
	data1	0x01, 0x24, 0x02, 0x0c, 0x03, 0x7f, 0x01, 0x33
	data1	0x25, 0x02, 0x1a, 0x03, 0x7c, 0x01, 0x1f, 0x02
	data1	0x06, 0x03, 0x7f, 0x01, 0x5b, 0x1f, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x1f, 0x02, 0x02, 0x03, 0x7f
	data1	0x01, 0x24, 0x25, 0x02, 0x04, 0x03, 0xbc, 0x7f
	data1	0x01, 0x02, 0x0a, 0x03, 0x65, 0x01, 0x02, 0x1c
	data1	0x03, 0x20, 0x01, 0x15, 0x3d, 0x02, 0x01, 0x03
	data1	0x7d, 0x01, 0x12, 0xb5, 0x02, 0x56, 0x03, 0x06
	data1	0x01, 0x02, 0x04, 0x03, 0x7a, 0x01, 0x18, 0x10
	data1	0x02, 0x01, 0x03, 0x7e, 0x01, 0x02, 0x04, 0x03
	data1	0x2b, 0x01, 0x02, 0x02, 0x03, 0x55, 0x01, 0x10
	data1	0x1a, 0x02, 0x01, 0x03, 0x7e, 0x01, 0x02, 0x01
	data1	0x03, 0x2c, 0x01, 0x02, 0x02, 0x03, 0x55, 0x01
	data1	0x10, 0x02, 0x01, 0x03, 0x7f, 0x01, 0x02, 0x02
	data1	0x03, 0x7f, 0x01, 0x11, 0x02, 0x01, 0x03, 0x2b
	data1	0x01, 0x02, 0x02, 0x03, 0x54, 0x01, 0x10, 0x02
	data1	0x01, 0x03, 0x2c, 0x01, 0x02, 0x0b, 0x03, 0x55
	data1	0x01, 0x02, 0x03, 0x03, 0x20, 0x01, 0x11, 0x02
	data1	0x04, 0x03, 0x7e, 0x01, 0x1a, 0x02, 0x01, 0x03
	data1	0x7e, 0x01, 0x1a, 0x11, 0x02, 0x03, 0x03, 0x7d
	data1	0x01, 0x0d, 0x03, 0x7f, 0x01, 0x03, 0x7f, 0x01
	data1	0x0b, 0x03, 0x7e, 0x01, 0x0d, 0x02, 0x01, 0x03
	data1	0x7e, 0x01, 0x1b, 0x02, 0x01, 0x03, 0x7f, 0x01
	data1	0x02, 0x04, 0x03, 0x7e, 0x01, 0x1b, 0x02, 0x01
	data1	0x03, 0x7e, 0x01, 0x38, 0x33, 0x1f, 0x02, 0x08
	data1	0x03, 0x7f, 0x01, 0x02, 0x04, 0x03, 0x7f, 0x01
	data1	0x20, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x33, 0x1f
	data1	0x02, 0x08, 0x03, 0x7f, 0x01, 0x1f, 0x02, 0x04
	data1	0x03, 0x7e, 0x01, 0x1f, 0x34, 0x20, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x20, 0x02, 0x08, 0x03, 0x7d
	data1	0x01, 0x1f, 0x1f, 0x02, 0x04, 0x03, 0x7b, 0x01
	data1	0x20, 0x02, 0x04, 0x03, 0x06, 0x01, 0x1f, 0x02
	data1	0x04, 0x03, 0x7e, 0x01, 0x21, 0x1f, 0x02, 0x04
	data1	0x03, 0x7d, 0x01, 0x20, 0x02, 0x04, 0x03, 0x77
	data1	0x01, 0x02, 0x02, 0x03, 0x07, 0x01, 0x10, 0x02
	data1	0x01, 0x03, 0x79, 0x01, 0x02, 0x04, 0x03, 0x7e
	data1	0x01, 0x02, 0x02, 0x03, 0x0a, 0x01, 0x02, 0x02
	data1	0x03, 0x7f, 0x01, 0x20, 0x02, 0x03, 0x03, 0x7d
	data1	0x01, 0x02, 0x01, 0x03, 0x79, 0x01, 0x02, 0x04
	data1	0x03, 0x05, 0x01, 0x02, 0x04, 0x03, 0x7e, 0x01
	data1	0x1f, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x21, 0x17
	data1	0x10, 0x02, 0x01, 0x03, 0x7a, 0x01, 0x02, 0x02
	data1	0x03, 0x07, 0x01, 0x02, 0x02, 0x03, 0x78, 0x01
	data1	0x22, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x02, 0x04
	data1	0x03, 0x05, 0x01, 0x02, 0x04, 0x03, 0x7e, 0x01
	data1	0x1f, 0x20, 0x02, 0x04, 0x03, 0x7d, 0x01, 0x20
	data1	0x02, 0x04, 0x03, 0x7f, 0x01, 0x20, 0x02, 0x02
	data1	0x03, 0x7d, 0x01, 0x10, 0x1a, 0x02, 0x01, 0x03
	data1	0x7e, 0x01, 0x1c, 0x02, 0x01, 0x03, 0x7e, 0x01
	data1	0x1a, 0x10, 0x02, 0x05, 0x03, 0x06, 0x01, 0x02
	data1	0x0e, 0x03, 0x6f, 0x01, 0x11, 0x02, 0x03, 0x03
	data1	0x7e, 0x01, 0x10, 0x1a, 0x02, 0x01, 0x03, 0x7f
	data1	0x01, 0x02, 0x03, 0x03, 0x7e, 0x01, 0x29, 0x20
	data1	0x02, 0x04, 0x03, 0x7e, 0x01, 0x1f, 0x33, 0x02
	data1	0x04, 0x03, 0x7e, 0x01, 0x20, 0x02, 0x04, 0x03
	data1	0x7e, 0x01, 0x1f, 0x33, 0x22, 0x02, 0x04, 0x03
	data1	0x7e, 0x01, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x20
	data1	0x02, 0x04, 0x03, 0x7e, 0x01, 0x1f, 0x1f, 0x1f
	data1	0x1f, 0x1f, 0x33, 0x1f, 0x02, 0x04, 0x03, 0x7f
	data1	0x01, 0x1f, 0x1f, 0x02, 0x06, 0x03, 0x7d, 0x01
	data1	0x1f, 0x1f, 0x1f, 0x2a, 0x02, 0x06, 0x03, 0x7d
	data1	0x01, 0x02, 0x08, 0x03, 0x7f, 0x01, 0x02, 0x04
	data1	0x03, 0x7f, 0x01, 0x02, 0x02, 0x03, 0x05, 0x01
	data1	0x02, 0x0a, 0x03, 0x4d, 0x01, 0x02, 0x20, 0x03
	data1	0x36, 0x01, 0x00, 0x01, 0x11, 0x14, 0x02, 0x1e
	data1	0x03, 0x98, 0x7e, 0x01, 0x02, 0x08, 0x03, 0x0a
	data1	0x01, 0x02, 0x08, 0x03, 0x83, 0x01, 0x01, 0x34
	data1	0x02, 0x10, 0x03, 0x21, 0x01, 0x34, 0x02, 0x10
	data1	0x03, 0x8e, 0x7f, 0x01, 0x34, 0x02, 0x11, 0x03
	data1	0x98, 0x01, 0x01, 0x77, 0x02, 0x03, 0x03, 0x7e
	data1	0x01, 0x02, 0x04, 0x03, 0x7c, 0x01, 0x02, 0x15
	data1	0x03, 0x06, 0x01, 0x02, 0x03, 0x03, 0x7e, 0x01
	data1	0x02, 0x04, 0x03, 0x7c, 0x01, 0x02, 0x0d, 0x03
	data1	0x06, 0x01, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x20
	data1	0x02, 0x04, 0x03, 0x7e, 0x01, 0x21, 0x02, 0x03
	data1	0x03, 0x7e, 0x01, 0x02, 0x04, 0x03, 0x7d, 0x01
	data1	0x4e, 0x1f, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x20
	data1	0x02, 0x04, 0x03, 0x7e, 0x01, 0x1c, 0x02, 0x04
	data1	0x03, 0x7a, 0x01, 0x77, 0x02, 0x03, 0x03, 0x7e
	data1	0x01, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x4f, 0x02
	data1	0x04, 0x03, 0x7e, 0x01, 0x34, 0x02, 0x07, 0x03
	data1	0x05, 0x01, 0x02, 0x07, 0x03, 0x75, 0x01, 0x2c
	data1	0x1b, 0x02, 0x04, 0x03, 0x7a, 0x01, 0x02, 0x05
	data1	0x03, 0x06, 0x01, 0x02, 0x03, 0x03, 0x7e, 0x01
	data1	0x02, 0x04, 0x03, 0x0f, 0x01, 0x60, 0x02, 0x07
	data1	0x03, 0x7f, 0x01, 0x60, 0x1f, 0x02, 0x04, 0x03
	data1	0x7f, 0x01, 0x1a, 0x02, 0x04, 0x03, 0x7e, 0x01
	data1	0x60, 0x1f, 0x02, 0x04, 0x03, 0x7f, 0x01, 0x1a
	data1	0x02, 0x04, 0x03, 0x7e, 0x01, 0x60, 0x1f, 0x02
	data1	0x04, 0x03, 0x7f, 0x01, 0x1f, 0x02, 0x07, 0x03
	data1	0x7e, 0x01, 0x60, 0x1f, 0x02, 0x04, 0x03, 0x7f
	data1	0x01, 0x1a, 0x02, 0x04, 0x03, 0x7e, 0x01, 0x60
	data1	0xb5, 0x02, 0x05, 0x03, 0x7f, 0x01, 0x4c, 0x02
	data1	0x07, 0x03, 0x7f, 0x01, 0x24, 0x02, 0x07, 0x03
	data1	0x7f, 0x01, 0x38, 0x02, 0x0a, 0x03, 0x7f, 0x01
	data1	0x79, 0x1b, 0x02, 0x08, 0x03, 0x7e, 0x01, 0x02
	data1	0x1c, 0x03, 0x7f, 0x01, 0x24, 0x1b, 0x02, 0x08
	data1	0x03, 0x7d, 0x01, 0x1f, 0x02, 0x05, 0x03, 0xf0
	data1	0x7e, 0x01, 0x02, 0x02, 0x03, 0x7f, 0x01, 0x02
	data1	0x0a, 0x03, 0x75, 0x01, 0x02, 0x02, 0x03, 0x7f
	data1	0x01, 0x02, 0x09, 0x03, 0x0b, 0x01, 0x02, 0x15
	data1	0x03, 0x06, 0x01, 0x1a, 0x02, 0x07, 0x03, 0x7a
	data1	0x01, 0x02, 0x15, 0x03, 0x05, 0x01, 0x02, 0x04
	data1	0x03, 0x7c, 0x01, 0x02, 0x15, 0x03, 0x05, 0x01
	data1	0x02, 0x07, 0x03, 0x7f, 0x01, 0x02, 0x07, 0x03
	data1	0x7d, 0x01, 0x7c, 0x02, 0x04, 0x00, 0x01, 0x01

// ===
	.section .note = "", "note"
	.align 4
	data1	0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x02, 0x9d
	data1	0x00, 0x00, 0x00, 0x01
	stringz	"HP"
	data1	0x00
	stringz	"HPF90   HPFORTRAN90                         -hp\"-Oq02,al,ag,cn,sz,ic,vo,Mf,po,es,rs,Rf,Pr,sp,in,cl,om,vc,Pi,fa,Pe,Rr,pa,pv,nf,cp,lx,Pg,ug,Lu,lb,uj,dn,sg,pt,kt,em,np,ar,rp,dl,Fs,bp,wp,pc,Mp,lr,cx,cr,pi,so,Rc,fa,ft,fe,ap,st,Lc,Bl,ib,pl,sd,ll,rl,dl,lt,ol,fl,lm,ts,rd,Dp,If!,-Ol12indirect!,-Ol13aggressive!,-Ubridge=asm,-Ubridge=DD32,-Ubridge=DSblended,-Ubridge=cache_info:3072:128:12,-Ubridge=ppu,-Ubridge=math_ielf_path:/opt/fortran90/lib/ielf/math/hpux32,-Ubridge=compdir:/nis.home/karp/fft$,-Ubridge=sourcefile:fftbb.f$\"\n/nis.home/karp/fft\nf90com32 options = -noargov -cm -w95 -nbs -auto -WB -OI -O2 -O8 -O9 -I/opt/fortran90/include+ -MD/opt/fortran90/include/hpux32+ "
	data1	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	data1	0x00, 0x00, 0x2b, 0x00, 0x00, 0x00, 0x04
	stringz	"HP"
	data1	0x00
	stringz	"fftbb.f\n/nis.home/karp/fft\nFORTRAN 32 bits"
	data1	0x00
