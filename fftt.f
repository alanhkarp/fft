@process directive(' dir:')
c fftt => Do radix-32 using an in-place method
c
      subroutine fftt ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 2 )
      complex d(0:*), coeff(0:*), temp, t
      complex t00, t01, t02, t03, t04, t05, t06, t07,
     *        t08, t09, t10, t11, t12, t13, t14, t15,
     *        t16, t17, t18, t19, t20, t21, t22, t23,
     *        t24, t25, t26, t27, t28, t29, t30, t31
      dimension lens(ndim), irev(0:*), ifac(nfmax), ipr(npr)
      data ipr/32, 2/
c
c Find total length, max length, sum of log of dimension,
c and largest log dimension
c
      lentotl = 0
      maxlenl = 0
      do i = 1, ndim
	 lentotl = lentotl + lens(i)
	 maxlenl = max(maxlenl,lens(i))
      enddo
      lentot = 2**lentotl
      maxlen = 2**maxlenl 
c
c Main loop over dimensions
c
      lip = 0
      lop = lentot
      do idim = 1, ndim
         lensidim = 2**lens(idim)
         ls = lip
         lip = lop
         lop = ls
c
c Build bit reversal index vector and array of coefficients
c
         call factor ( lensidim, ifac, nfac, nfmax, ipr, npr )
         call reorderm ( lensidim, irev, ifac, nfac )
         call coeffs ( lensidim, coeff )
c
c Copy d with bit reversal for first stage of FFT
c
         mask1 = lensidim - 1
         mask2 = not(lensidim-1)
c dir: ignore recrdeps(d)
         do i = 0, lentot - 1
            iseg = iand(i,mask2)
            ir = irev(iand(i,mask1))
            d(i+lip) = d(ir+lop+iseg)
         enddo
c
c Loop over array doing FFT for rest of stages
c
         if1 = lensidim
         if2 = lentot
         do ibfly = 1, nfac
            ls = lip
            lip = lop
            lop = ls
            ipfac = ifac(ibfly)
            lopfac = lentot/ipfac
c
c Now compute this butterfly
c
            if1 = if1/ipfac
            if2 = if2/ipfac
c
c Use special cases since all factors are powers of 2
c
            if ( ipfac .eq. 2 ) then
c
c Radix 2
c
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  iw = if1*(i/if2)
                  temp = coeff(iw)*d(2*i+lop+1)
	          d(i+lip       ) = d(2*i+lop)+temp
	          d(i+lip+lopfac) = d(2*i+lop)-temp
               enddo
            else if ( ipfac .eq. 32 ) then
c
c Radix 32 FFT is optimum for 32-bit words in 64KB cache using an
c in-place algorithm.
c
c dir: prefer vector
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  iw = if1*int(i/if2)
                  k = 32*i+lop
c Twiddle, bit reverse, do first radix-2 butterfly, and twiddle
                  t   = d(k   )
                  t01 = d(k+16)*coeff(16*iw)
                  t00 = t + t01
                  t01 = t - t01
                  t   = d(k+ 8)*coeff( 8*iw)
                  t03 = d(k+24)*coeff(24*iw)
                  t02 = t + t03
                  t03 = t - t03
                  t03 = cmplx(-imag(t03),real(t03))
                  t   = d(k+ 4)*coeff( 4*iw)
                  t05 = d(k+20)*coeff(20*iw)
                  t04 = t + t05
                  t05 = t - t05
                  t   = d(k+12)*coeff(12*iw)
                  t07 = d(k+28)*coeff(28*iw)
                  t06 = t + t07
                  t07 = t - t07
                  t07 = cmplx(-imag(t07),real(t07))
                  t   = d(k+ 2)*coeff( 2*iw)
                  t09 = d(k+18)*coeff(18*iw)
                  t08 = t + t09
                  t09 = t - t09
                  t   = d(k+10)*coeff(10*iw)
                  t11 = d(k+26)*coeff(26*iw)
                  t10 = t + t11
                  t11 = t - t11
                  t11 = cmplx(-imag(t11),real(t11))
                  t   = d(k+ 6)*coeff( 6*iw)
                  t13 = d(k+22)*coeff(22*iw)
                  t12 = t + t13
                  t13 = t - t13
                  t   = d(k+14)*coeff(14*iw)
                  t15 = d(k+30)*coeff(30*iw)
                  t14 = t + t15
                  t15 = t - t15
                  t15 = cmplx(-imag(t15),real(t15))
                  t   = d(k+ 1)*coeff(   iw)
                  t17 = d(k+17)*coeff(17*iw)
                  t16 = t + t17
                  t17 = t - t17
                  t   = d(k+ 9)*coeff( 9*iw)
                  t19 = d(k+25)*coeff(25*iw)
                  t18 = t + t19
                  t19 = t - t19
                  t19 = cmplx(-imag(t19),real(t19))
                  t   = d(k+ 5)*coeff( 5*iw)
                  t21 = d(k+21)*coeff(21*iw)
                  t20 = t + t21
                  t21 = t - t21
                  t   = d(k+13)*coeff(13*iw)
                  t23 = d(k+29)*coeff(29*iw)
                  t22 = t + t23
                  t23 = t - t23
                  t23 = cmplx(-imag(t23),real(t23))
                  t   = d(k+ 3)*coeff( 3*iw)
                  t25 = d(k+19)*coeff(19*iw)
                  t24 = t + t25
                  t25 = t - t25
                  t   = d(k+11)*coeff(11*iw)
                  t27 = d(k+27)*coeff(27*iw)
                  t26 = t + t27
                  t27 = t - t27
                  t27 = cmplx(-imag(t27),real(t27))
                  t   = d(k+ 7)*coeff( 7*iw)
                  t29 = d(k+23)*coeff(23*iw)
                  t28 = t + t29
                  t29 = t - t29
                  t   = d(k+15)*coeff(15*iw)
                  t31 = d(k+31)*coeff(31*iw)
                  t30 = t + t31
                  t31 = t - t31
                  t31 = cmplx(-imag(t31),real(t31))
c Second radix-2 butterfly and twiddle
                  t = t00
                  t00 = t + t02
                  t02 = t - t02
                  t = t01
                  t01 = t + t03
                  t03 = t - t03
                  t = t04
                  t04 = t + t06
                  t06 = t - t06
                  t06 = cmplx(-imag(t06),real(t06))
                  t = t05
                  t05 = t + t07
                  t07 = t - t07
                  t = real(coeff(lensidim/8))*t05
                  t05 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = real(coeff(lensidim/8))*t07
                  t07 = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  t = t08
                  t08 = t + t10
                  t10 = t - t10
                  t = t09
                  t09 = t + t11
                  t11 = t - t11
                  t = t12
                  t12 = t + t14
                  t14 = t - t14
                  t14 = cmplx(-imag(t14),real(t14))
                  t = t13
                  t13 = t + t15
                  t15 = t - t15
                  t = real(coeff(lensidim/8))*t13
                  t13 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = real(coeff(lensidim/8))*t15
                  t15 = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  t = t16
                  t16 = t + t18
                  t18 = t - t18
                  t = t17
                  t17 = t + t19
                  t19 = t - t19
                  t = t20
                  t20 = t + t22
                  t22 = t - t22
                  t22 = cmplx(-imag(t22),real(t22))
                  t = t21
                  t21 = t + t23
                  t23 = t - t23
                  t = real(coeff(lensidim/8))*t21
                  t21 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = real(coeff(lensidim/8))*t23
                  t23 = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  t = t24
                  t24 = t + t26
                  t26 = t - t26
                  t = t25
                  t25 = t + t27
                  t27 = t - t27
                  t = t28
                  t28 = t + t30
                  t30 = t - t30
                  t30 = cmplx(-imag(t30),real(t30))
                  t = t29
                  t29 = t + t31
                  t31 = t - t31
                  t = real(coeff(lensidim/8))*t29
                  t29 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = real(coeff(lensidim/8))*t31
                  t31 = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Third radix-2 butterfly and twiddle
                  t = t00
                  t00 = t + t04
                  t04 = t - t04
                  t = t01
                  t01 = t + t05
                  t05 = t - t05
                  t = t02
                  t02 = t + t06
                  t06 = t - t06
                  t = t03
                  t03 = t + t07
                  t07 = t - t07
                  t = t08
                  t08 = t + t12
                  t12 = t - t12
                  t12 = cmplx(-imag(t12),real(t12))
                  t = t09
                  t09 = t + t13
                  t13 = t - t13
                  t09 = coeff(  lensidim/16)*t09
                  t13 = coeff(5*lensidim/16)*t13
                  t = t10
                  t10 = t + t14
                  t14 = t - t14
                  t = real(coeff(lensidim/8))*t10
                  t10 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = real(coeff(lensidim/8))*t14
                  t14 = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  t = t11
                  t11 = t + t15
                  t15 = t - t15
                  t11 = coeff(3*lensidim/16)*t11
                  t15 = coeff(7*lensidim/16)*t15
                  t = t16
                  t16 = t + t20
                  t20 = t - t20
                  t = t17
                  t17 = t + t21
                  t21 = t - t21
                  t = t18
                  t18 = t + t22
                  t22 = t - t22
                  t = t19
                  t19 = t + t23
                  t23 = t - t23
                  t = t24
                  t24 = t + t28
                  t28 = t - t28
                  t28 = cmplx(-imag(t28),real(t28))
                  t = t25
                  t25 = t + t29
                  t29 = t - t29
                  t25 = coeff(  lensidim/16)*t25
                  t29 = coeff(5*lensidim/16)*t29
                  t = t26
                  t26 = t + t30
                  t30 = t - t30
                  t = real(coeff(lensidim/8))*t26
                  t26 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = real(coeff(lensidim/8))*t30
                  t30 = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  t = t27
                  t27 = t + t31
                  t31 = t - t31
                  t27 = coeff(3*lensidim/16)*t27
                  t31 = coeff(7*lensidim/16)*t31
c Fourth radix-2 butterfly
                  t = t00
                  t00 = t + t08
                  t08 = t - t08
                  t = t01
                  t01 = t + t09
                  t09 = t - t09
                  t = t02
                  t02 = t + t10
                  t10 = t - t10
                  t = t03
                  t03 = t + t11
                  t11 = t - t11
                  t = t04
                  t04 = t + t12
                  t12 = t - t12
                  t = t05
                  t05 = t + t13
                  t13 = t - t13
                  t = t06
                  t06 = t + t14
                  t14 = t - t14
                  t = t07
                  t07 = t + t15
                  t15 = t - t15
                  t = t16
                  t16 = t + t24
                  t24 = t - t24
                  t24 = cmplx(-imag(t24),real(t24))
                  t = t17
                  t17 = t + t25
                  t25 = t - t25
                  t25 = coeff( 9*lensidim/32)*t25
                  t17 = coeff(   lensidim/32)*t17
                  t = t18
                  t18 = t + t26
                  t26 = t - t26
                  t26 = coeff(10*lensidim/32)*t26
                  t18 = coeff( 2*lensidim/32)*t18
                  t = t19 
                  t19 = t + t27
                  t27 = t - t27
                  t27 = coeff(11*lensidim/32)*t27
                  t19 = coeff( 3*lensidim/32)*t19
                  t = t20
                  t20 = t + t28
                  t28 = t - t28
                  t = real(coeff(lensidim/8))*t28
                  t28 = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  t = real(coeff(lensidim/8))*t20
                  t20 = cmplx( real(t)-imag(t),real(t)+imag(t))
                  t = t21
                  t21 = t + t29
                  t29 = t - t29
                  t21 = coeff( 5*lensidim/32)*t21
                  t29 = coeff(13*lensidim/32)*t29
                  t = t22
                  t22 = t + t30
                  t30 = t - t30
                  t22 = coeff( 6*lensidim/32)*t22
                  t30 = coeff(14*lensidim/32)*t30
                  t = t23
                  t23 = t + t31
                  t31 = t - t31
                  t23 = coeff( 7*lensidim/32)*t23
                  t31 = coeff(15*lensidim/32)*t31
c Fifth radix-2 butterfly
                  d(i+lip          ) = t00 + t16
                  d(i+lip+16*lopfac) = t00 - t16
                  d(i+lip+   lopfac) = t01 + t17
                  d(i+lip+17*lopfac) = t01 - t17
                  d(i+lip+ 2*lopfac) = t02 + t18
                  d(i+lip+18*lopfac) = t02 - t18
                  d(i+lip+ 3*lopfac) = t03 + t19
                  d(i+lip+19*lopfac) = t03 - t19
                  d(i+lip+ 4*lopfac) = t04 + t20
                  d(i+lip+20*lopfac) = t04 - t20
                  d(i+lip+ 5*lopfac) = t05 + t21
                  d(i+lip+21*lopfac) = t05 - t21
                  d(i+lip+ 6*lopfac) = t06 + t22
                  d(i+lip+22*lopfac) = t06 - t22
                  d(i+lip+ 7*lopfac) = t07 + t23
                  d(i+lip+23*lopfac) = t07 - t23
                  d(i+lip+ 8*lopfac) = t08 + t24
                  d(i+lip+24*lopfac) = t08 - t24
                  d(i+lip+ 9*lopfac) = t09 + t25
                  d(i+lip+25*lopfac) = t09 - t25
                  d(i+lip+10*lopfac) = t10 + t26
                  d(i+lip+26*lopfac) = t10 - t26
                  d(i+lip+11*lopfac) = t11 + t27
                  d(i+lip+27*lopfac) = t11 - t27
                  d(i+lip+12*lopfac) = t12 + t28
                  d(i+lip+28*lopfac) = t12 - t28
                  d(i+lip+13*lopfac) = t13 + t29
                  d(i+lip+29*lopfac) = t13 - t29
                  d(i+lip+14*lopfac) = t14 + t30
                  d(i+lip+30*lopfac) = t14 - t30
                  d(i+lip+15*lopfac) = t15 + t31
                  d(i+lip+31*lopfac) = t15 - t31
               enddo
            else
               stop 'Factor not in list'
            endif
         enddo
      enddo
c
c If result is in bottom half of array, copy to top half
c
      if ( lip .ne. 0 ) then
c dir: ignore recrdeps(d)
	 do i = 0, lentot - 1
	    d(i) = d(i+lip)
         enddo
      endif
c 
c Done
c
      end
