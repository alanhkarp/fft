@process directive(' dir:')
c fftr => Use radix-16 to improve cache use vs l
c
      subroutine fftr ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 2 )
      complex d(0:*), coeff(0:*), temp, t
      complex t0, t1, t2, t3, t4, t5, t6, t7,
     *        t8, t9, ta, tb, tc, td, te, tf,
     *        d0, d1, d2, d3, d4, d5, d6, d7,
     *        d8, d9, da, db, dc, dd, de, df
      dimension lens(ndim), irev(0:*), ifac(nfmax), ipr(npr)
      data ipr/16, 2/
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
            else if ( ipfac .eq. 16 ) then
c
c Radix 16 FFT is optimum for 32-bit words in 64KB cache
c
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  iw = if1*int(i/if2)
c Apply twiddle factors, bit reverse, and do first radix-2 butterfly,
c and twiddle for next butterfly
                  t0 =              d(16*i+lop   )
                  t1 = coeff( 8*iw)*d(16*i+lop+ 8)
                  d0 = t0 + t1
                  d8 = t0 - t1
                  t2 = coeff( 4*iw)*d(16*i+lop+ 4)
                  t3 = coeff(12*iw)*d(16*i+lop+12)
                  d1 = t2 + t3
                  d9 = t2 - t3
                  d9 = cmplx(-imag(d9),real(d9)) 
                  t4 = coeff( 2*iw)*d(16*i+lop+ 2)
                  t5 = coeff(10*iw)*d(16*i+lop+10)
                  d2 = t4 + t5
                  da = t4 - t5
                  t6 = coeff( 6*iw)*d(16*i+lop+ 6)
                  t7 = coeff(14*iw)*d(16*i+lop+14)
                  d3 = t6 + t7
                  db = t6 - t7
                  db = cmplx(-imag(db),real(db)) 
                  t8 = coeff(   iw)*d(16*i+lop+ 1)
                  t9 = coeff( 9*iw)*d(16*i+lop+ 9)
                  d4 = t8 + t9
                  dc = t8 - t9
                  ta = coeff( 5*iw)*d(16*i+lop+ 5)
                  tb = coeff(13*iw)*d(16*i+lop+13)
                  d5 = ta + tb
                  dd = ta - tb
                  dd = cmplx(-imag(dd),real(dd)) 
                  tc = coeff( 3*iw)*d(16*i+lop+ 3)
                  td = coeff(11*iw)*d(16*i+lop+11)
                  d6 = tc + td
                  de = tc - td
                  te = coeff( 7*iw)*d(16*i+lop+ 7)
                  tf = coeff(15*iw)*d(16*i+lop+15)
                  d7 = te + tf
                  df = te - tf
                  df = cmplx(-imag(df),real(df)) 
c Second radix-2 butterfly and twiddle for next butterfly
                  t0 = d0 + d1
                  t1 = d2 + d3
                  t2 = d4 + d5
                  t3 = d6 + d7
                  t4 = d8 + d9
                  t5 = da + db
                  t = real(coeff(lensidim/8))*t5
                  t5 = cmplx(real(t)-imag(t),real(t)+imag(t))
                  t6 = dc + dd
                  t7 = de + df
                  t = real(coeff(lensidim/8))*t7
                  t7 = cmplx(real(t)-imag(t),real(t)+imag(t))
                  t8 = d0 - d1
                  t9 = d2 - d3
                  t9 = cmplx(-imag(t9),real(t9)) 
                  ta = d4 - d5
                  tb = d6 - d7
                  tb = cmplx(-imag(tb),real(tb)) 
                  tc = d8 - d9
                  td = da - db
                  t = real(coeff(lensidim/8))*td
                  td = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  te = dc - dd
                  tf = de - df
                  t = real(coeff(lensidim/8))*tf
                  tf = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Third radix-2 butterfly and twiddle for next butterfly
                  d0 = t0 + t1
                  d1 = t2 + t3
                  d2 = t4 + t5
                  d3 = t6 + t7
                  d3 = coeff(  lensidim/16)*d3
                  d4 = t8 + t9
                  d5 = ta + tb
                  t = real(coeff(lensidim/8))*d5
                  d5 = cmplx(real(t)-imag(t),real(t)+imag(t))
                  d6 = tc + td
                  d7 = te + tf
                  d7 = coeff(3*lensidim/16)*d7
                  d8 = t0 - t1
                  d9 = t2 - t3
                  d9 = cmplx(-imag(d9),real(d9)) 
                  da = t4 - t5
                  db = t6 - t7
                  db = coeff(5*lensidim/16)*db
                  dc = t8 - t9
                  dd = ta - tb
                  t = real(coeff(lensidim/8))*dd
                  dd = cmplx(-real(t)-imag(t),real(t)-imag(t))
                  de = tc - td
                  df = te - tf
                  df = coeff(7*lensidim/16)*df
c Fourth radix-2 butterfly
                  d(i+lip          ) = d0 + d1
                  d(i+lip+   lopfac) = d2 + d3
                  d(i+lip+ 2*lopfac) = d4 + d5
                  d(i+lip+ 3*lopfac) = d6 + d7
                  d(i+lip+ 4*lopfac) = d8 + d9
                  d(i+lip+ 5*lopfac) = da + db
                  d(i+lip+ 6*lopfac) = dc + dd
                  d(i+lip+ 7*lopfac) = de + df
                  d(i+lip+ 8*lopfac) = d0 - d1
                  d(i+lip+ 9*lopfac) = d2 - d3
                  d(i+lip+10*lopfac) = d4 - d5
                  d(i+lip+11*lopfac) = d6 - d7
                  d(i+lip+12*lopfac) = d8 - d9
                  d(i+lip+13*lopfac) = da - db
                  d(i+lip+14*lopfac) = dc - dd
                  d(i+lip+15*lopfac) = de - df
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
