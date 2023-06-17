c@process directive(' dir:')
c fftbb => Combine fftz and fftaa
c
      subroutine fftbb ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 3 )
      complex d(0:*), temp, t, cc,
     *  cc0,cc1,cc2,cc3,cc4,cc5,cc6,cc7, 
     *   t0, t1, t2, t3, r0, r1, r2, r3,
     *   d0, d1, d2, d3, d4, d5, d6, d7
      complex coeff(0:*)
      dimension lens(ndim), irev(0:*), ifac(nfmax), ipr(npr)
      data ipr/8, 4, 2/
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
      cc0 = cmplx(cos(atan(1.0)),sin(atan(1.0)))
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
         time = seconds(0.0)
         call coeffs ( lensidim, coeff )
         call factor ( lensidim, ifac, nfac, nfmax, ipr, npr )
         call reorderm ( lensidim, irev, ifac, nfac )
c
c Copy d with bit reversal for first stage of FFT
c
         time = seconds(0.0)
         mask1 = lensidim - 1
         mask2 = not(lensidim-1)
c dir: ignore recrdeps(d)
         do i = 0, lentot - 1
           iseg = iand(i,mask2)
           ir = irev(iand(i,mask1)) + iseg
           d(ir+lip) = d(i+lop)
         enddo
c
c Loop over array doing FFT for rest of stages
c
         time = seconds(0.0)
         if1 = lens(idim)
         if2 = lentotl
         do ibfly = 1, nfac
            ls = lip
            lip = lop
            lop = ls
            ipfac = ifac(ibfly)
            lopfac = lentot/ipfac
c
c Use special cases since all factors are powers of 2
c
            if ( ipfac .eq. 2 ) then           ! line 77
	       
	       if1 = if1 - 1
	       if2 = if2 - 1
c
c Radix 2
c
c dir: ignore recrdeps(d)
               if2e = 2**if2
               do k = 0, lopfac-1, if2e         ! line 86
	          iw = ishft(ishft(k,-if2),if1)
		  cc = coeff(iw)
                  do j = 0, if2e - 1
                     i = j + k
                     temp = cc*d(2*i+lop+1)
                     d(i+lip       ) = d(2*i+lop) + temp
                     d(i+lip+lopfac) = d(2*i+lop) - temp
                  enddo
               enddo
            else if ( ipfac .eq. 4 ) then     ! line 96
	       if1 = if1 - 2
	       if2 = if2 - 2
c
c Radix 4
c
               if2e = 2**if2
	       do i = 0, lopfac - 1, if2e     ! line 103
		  iw = ishft(ishft(i,-if2),if1)
		  cc1 = coeff(  iw)
		  cc2 = coeff(2*iw)
		  cc3 = coeff(3*iw)
		  do j = 0, if2e - 1
		     k = 4*(i+j) + lop
		     t0 = d(k  )
		     t2 = d(k+1) * cc1
		     t1 = d(k+2) * cc2
		     t3 = d(k+3) * cc3
		     d0 = t0 + t1
		     d1 = t2 + t3
		     d2 = t0 - t1
		     d3 = t2 - t3
		     d3 = cmplx(-imag(d3),real(d3))
		     d(i+lip         ) = d0 + d1
		     d(i+lip+  lopfac) = d2 + d3
		     d(i+lip*2*lopfac) = d0 - d1
		     d(i+lip+3*lopfac) = d2 - d3
		  enddo
               enddo
            else if ( ipfac .eq. 8 ) then        ! line 125
	       if1 = if1 - 3
	       if2 = if2 - 3
c
c Radix 8
c
c dir: ignore recrdeps(d)
               if2e = 2**if2
               do i = 0, lopfac - 1, if2e       ! line 133
		  iw = ishft(ishft(i,-if2),if1)
		  cc1 = coeff(  iw)
		  cc2 = coeff(2*iw)
		  cc3 = coeff(3*iw)
		  cc4 = coeff(4*iw)
		  cc5 = coeff(5*iw)
		  cc6 = coeff(6*iw)
		  cc7 = coeff(7*iw)
c Apply twiddle factors, bit reverse, and do first section of radix-4
                  do j = 0, if2e - 1
		     k = 8*(i + j) + lop
                     t0 = d(k  )
                     t1 = d(k+4)*cc4
                     t2 = d(k+2)*cc2
                     t3 = d(k+6)*cc6
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
                     t0 = d(k+1)*cc1
                     t1 = d(k+5)*cc5
                     t2 = d(k+3)*cc3
                     t3 = d(k+7)*cc7
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
                     t  = d3 * real(cc0)
                     d3 = cmplx(real(t)-imag(t),real(t)+imag(t))
                     d5 = cmplx(-imag(d5),real(d5))
                     t = d7 * real(cc0)
                     d7 = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Do radix-2
                     d(i+j+lip         ) = d0 + d1
                     d(i+j+lip+  lopfac) = d2 + d3
                     d(i+j+lip+2*lopfac) = d4 + d5
                     d(i+j+lip+3*lopfac) = d6 + d7
                     d(i+j+lip+4*lopfac) = d0 - d1
                     d(i+j+lip+5*lopfac) = d2 - d3
                     d(i+j+lip+6*lopfac) = d4 - d5
                     d(i+j+lip+7*lopfac) = d6 - d7
                  enddo
               enddo                                  ! line 188
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
