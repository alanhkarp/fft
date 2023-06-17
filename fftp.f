@process directive(' dir:')
c fftp => Like fftl but separate real and imaginary parts of d
c
      subroutine fftp ( dr, di, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 2 )
      complex coeff(0:*), dc, temp, t0, t1, t2, t3, d0, d1, d2, d3, d3i
      dimension dr(0:*), di(0:*)
      dimension lens(ndim), irev(0:*), ifac(nfmax), ipr(npr)
      data ipr/4, 2/
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
         rlens = lensidim
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
c dir: ignore recrdeps(dr,di)
         do i = 0, lentot - 1
            iseg = iand(i,mask2)
            ir = irev(iand(i,mask1))
            dr(i+lip) = dr(ir+lop+iseg)
            di(i+lip) = di(ir+lop+iseg)
         enddo
c
c Loop over array doing FFT for rest of stages
c
         if1 = lensidim
         if2 = lentot
         rp = 1.0
         irp = 1
         do ibfly = 1, nfac
            ls = lip
            lip = lop
            lop = ls
            ipfac = ifac(ibfly)
            lopfac = lentot/ipfac
c
c Now compute this butterfly
c
            rp = rp/ipfac
            if1 = if1/ipfac
            if2 = if2/ipfac
            f2i = 1.d0/if2
c
c Use special cases since all factors are powers of 2
c
            if ( ipfac .eq. 2 ) then
c
c Radix 2
c
c dir: ignore recrdeps(dr,di)
               do i = 0, lopfac - 1
                  iw = if1*(i/if2)
                  dc = cmplx(dr(2*i+lop+1),di(2*i+lop+1))
                  temp = coeff(iw)*dc
                  dc = cmplx(dr(2*i+lop),di(2*i+lop))
                  t0 = dc + temp
	          dr(i+lip       ) = real(t0)
	          di(i+lip       ) = imag(t0)
                  t0 = dc - temp
	          dr(i+lip+lopfac) = real(t0)
	          di(i+lip+lopfac) = imag(t0)
               enddo
            else if ( ipfac .eq. 4 ) then
c
c Radix 4
c
c dir: ignore recrdeps(dr,di)
               do i = 0, lopfac - 1
                  iw1 = if1*  int(i/if2)
                  iw2 = if1*2*int(i/if2)
                  iw3 = if1*3*int(i/if2)
                  dc = cmplx(dr(4*i+lop  ),di(4*i+lop  ))
                  t0 = dc
                  dc = cmplx(dr(4*i+lop+1),di(4*i+lop+1))
                  t1 = dc * coeff(iw1)
                  dc = cmplx(dr(4*i+lop+2),di(4*i+lop+2))
                  t2 = dc * coeff(iw2)
                  dc = cmplx(dr(4*i+lop+3),di(4*i+lop+3))
                  t3 = dc * coeff(iw3)
                  d0 = t0 + t2
                  d1 = t1 + t3
                  d2 = t0 - t2
                  d3 = t1 - t3
                  d3i = cmplx(-imag(d3),real(d3))
                  dc = d0 + d1
                  dr(i+lip         ) = real(dc)
                  di(i+lip         ) = imag(dc)
                  dc = d2 + d3i
                  dr(i+lip+  lopfac) = real(dc)
                  di(i+lip+  lopfac) = imag(dc)
                  dc = d0 - d1
                  dr(i+lip+2*lopfac) = real(dc)
                  di(i+lip+2*lopfac) = imag(dc)
                  dc = d2 - d3i
                  dr(i+lip+3*lopfac) = real(dc)
                  di(i+lip+3*lopfac) = imag(dc)
               enddo
            else
               stop 'Radix not 2 or 4.'
            endif
            irp = irp * ipfac
         enddo
      enddo
c
c If result is in bottom half of array, copy to top half
c
      if ( lip .ne. 0 ) then
c dir: ignore recrdeps(dr,di)
	 do i = 0, lentot - 1
	    dr(i) = dr(i+lip)
	    di(i) = di(i+lip)
         enddo
      endif
c 
c Done
c
      end
