@process directive(' dir:')
c ffts => Do radix-16 as 2 radix-4 vs r
c
      subroutine ffts ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 2 )
      complex d(0:*), coeff(0:*), temp, t
      complex t0, t1, t2, t3, r0, r1, r2, r3,
     *        d0, d1, d2, d3, d4, d5, d6, d7,
     *        d8, d9, da, db, dc, dd, de, df
      dimension lens(ndim), irev(0:*), ifac(nfmax), ipr(npr)
      data ipr/ 16, 2/
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
c Do each radix 16 FFT with 2 radix 4 FFTs to optimize register use
c
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  k = 16*i + lop
                  iw = if1*(i/if2)
c Apply twiddle factors and bit reverse 
c Do first section of first radix-4 and twiddle for next butterfly
                  t0 =              d(k   )
                  t1 = coeff( 8*iw)*d(k+ 8)
                  t2 = coeff( 4*iw)*d(k+ 4)
                  t3 = coeff(12*iw)*d(k+12)
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d0 = r0 + r1
                  d4 = r2 + r3
                  d8 = r0 - r1
                  dc = r2 - r3
c Do second section of first radix-4 and twiddle for next butterfly
                  t0 = coeff( 2*iw)*d(k+ 2)
                  t1 = coeff(10*iw)*d(k+10)
                  t2 = coeff( 6*iw)*d(k+ 6)
                  t3 = coeff(14*iw)*d(k+14)
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d1 = r0 + r1
                  d5 = r2 + r3
                  t = d5 * real(coeff(lensidim/8))
                  d5 = cmplx(real(t)-imag(t),real(t)+imag(t))
                  d9 = r0 - r1
                  d9 = cmplx(-imag(d9),real(d9))
                  dd = r2 - r3
                  t = dd * real(coeff(lensidim/8))
                  dd = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Do third section of first radix-4 and twiddle for next butterfly
                  t0 = coeff(   iw)*d(k+ 1)
                  t1 = coeff( 9*iw)*d(k+ 9)
                  t2 = coeff( 5*iw)*d(k+ 5)
                  t3 = coeff(13*iw)*d(k+13)
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d2 = r0 + r1
                  d6 = r2 + r3
                  d6 =   coeff(  lensidim/16)*d6
                  da = r0 - r1
                  de = r2 - r3
                  da =   coeff(2*lensidim/16)*da
                  de =   coeff(3*lensidim/16)*de
c Do fourth section of first radix-4 and twiddle for next butterfly
                  t0 = coeff( 3*iw)*d(k+ 3)
                  t1 = coeff(11*iw)*d(k+11)
                  t2 = coeff( 7*iw)*d(k+ 7)
                  t3 = coeff(15*iw)*d(k+15)
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d3 = r0 + r1
                  d7 = r2 + r3
                  d7 =   coeff(3*lensidim/16)*d7
                  db = r0 - r1
                  db =   coeff(6*lensidim/16)*db
                  df = r2 - r3
                  df = - coeff(  lensidim/16)*df
c Do first section of second radix-4
                  t0 = d0
                  t1 = d1
                  t2 = d2
                  t3 = d3
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d(i+lip          ) = r0 + r1
                  d(i+lip+ 4*lopfac) = r2 + r3
                  d(i+lip+ 8*lopfac) = r0 - r1
                  d(i+lip+12*lopfac) = r2 - r3
c Do second section of second radix-4
                  t0 = d4
                  t1 = d5
                  t2 = d6
                  t3 = d7
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d(i+lip+   lopfac) = r0 + r1
                  d(i+lip+ 5*lopfac) = r2 + r3
                  d(i+lip+ 9*lopfac) = r0 - r1
                  d(i+lip+13*lopfac) = r2 - r3
c Do third section of second radix-4
                  t0 = d8
                  t1 = d9
                  t2 = da
                  t3 = db
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d(i+lip+ 2*lopfac) = r0 + r1
                  d(i+lip+ 6*lopfac) = r2 + r3
                  d(i+lip+10*lopfac) = r0 - r1
                  d(i+lip+14*lopfac) = r2 - r3
c Do fourth section of second radix-4
                  t0 = dc
                  t1 = dd
                  t2 = de
                  t3 = df
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d(i+lip+ 3*lopfac) = r0 + r1
                  d(i+lip+ 7*lopfac) = r2 + r3
                  d(i+lip+11*lopfac) = r0 - r1
                  d(i+lip+15*lopfac) = r2 - r3
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
