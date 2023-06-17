@process directive(' dir:')
c fftv => Like ffta but use radix 2 and 8
c
      subroutine fftv ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 2 )
      complex d(0:*), temp, t,
     *   t0, t1, t2, t3, r0, r1, r2, r3,
     *   d0, d1, d2, d3, d4, d5, d6, d7
      complex coeff(0:*)
      dimension lens(ndim), irev(0:*), ifac(nfmax), ipr(npr)
      data ipr/8, 2/
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
            else if ( ipfac .eq. 8 ) then
c
c Radix 8
c
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  iw = if1*int(i/if2)
                  k = 8*i + lop
c Apply twiddle factors, bit reverse, and do first section of radix-4
                  t0 = d(k  )
                  t1 = d(k+4)*coeff(4*iw)
                  t2 = d(k+2)*coeff(2*iw)
                  t3 = d(k+6)*coeff(6*iw)
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d0 = r0 + r1
                  d2 = r2 + r3
                  d4 = r0 - r1
                  d6 = r2 - r3
c Do second section of radix-4
                  t0 = d(k+1)*coeff(  iw)
                  t1 = d(k+5)*coeff(5*iw)
                  t2 = d(k+3)*coeff(3*iw)
                  t3 = d(k+7)*coeff(7*iw)
                  r0 = t0 + t1
                  r1 = t2 + t3
                  r2 = t0 - t1
                  r3 = t2 - t3
                  r3 = cmplx(-imag(r3),real(r3))
                  d1 = r0 + r1
                  d3 = r2 + r3
                  d5 = r0 - r1
                  d7 = r2 - r3
c Twiddle for radix-2
                  t  = d3 * real(coeff(lensidim/8))
                  d3 = cmplx(real(t)-imag(t),real(t)+imag(t))
                  d5 = cmplx(-imag(d5),real(d5))
                  t = d7 * real(coeff(lensidim/8))
                  d7 = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Do radix-2
                  d(i+lip         ) = d0 + d1
                  d(i+lip+  lopfac) = d2 + d3
                  d(i+lip+2*lopfac) = d4 + d5
                  d(i+lip+3*lopfac) = d6 + d7
                  d(i+lip+4*lopfac) = d0 - d1
                  d(i+lip+5*lopfac) = d2 - d3
                  d(i+lip+6*lopfac) = d4 - d5
                  d(i+lip+7*lopfac) = d6 - d7
               enddo
            else
               stop 'Radix not 2 or 8.'
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
