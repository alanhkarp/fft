@process directive(' dir:')
c fftm => Like fftl but use one column auxiliary array
c
      subroutine fftm ( d, lens, ndim, last, coeff, coeff4, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( nfmax = 50, npr = 2 )
      complex d(0:*), temp, t0, t1, t2, t3, d0, d1, d2, d3
      complex coeff(0:last/2-1,*), coeff4(0:last/4-1,3,*)
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
c
c Build bit reversal index vector and array of coefficients
c
         call factor ( lensidim, ifac, nfac, nfmax, ipr, npr )
         call reorderm ( lensidim, irev, ifac, nfac )
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
         icol = 1
         do ibfly = 1, nfac
            ls = lip
            lip = lop
            lop = ls
c
c Now compute this butterfly
c
            ipfac = ifac(ibfly)
            lopfac = lentot/ipfac
c
c Use special cases since all factors are powers of 2
c
            if ( ipfac .eq. 2 ) then
c
c Radix 2
c
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  temp = coeff(i,icol)*d(2*i+lop+1)
	          d(i+lip       ) = d(2*i+lop)+temp
	          d(i+lip+lopfac) = d(2*i+lop)-temp
               enddo
               icol = icol + 1
            else if ( ipfac .eq. 4 ) then
c
c Radix 4
c
               icol4 = (icol+1)/2
c dir: ignore recrdeps(d)
               do i = 0, lopfac - 1
                  t0 =        d(4*i+lop  )
                  temp = coeff4(i,1,icol4)
                  t1 = temp * d(4*i+lop+1)
                  temp = temp * coeff4(i,1,icol4)
                  t2 = temp * d(4*i+lop+2)
                  temp = temp * coeff4(i,1,icol4)
                  t3 = temp * d(4*i+lop+3)
                  d0 = t0 + t2
                  d1 = t1 + t3
                  d2 = t0 - t2
                  d3 = t1 - t3
                  d(i+lip         ) = d0 + d1
                  d(i+lip+  lopfac) = d2 + cmplx(-imag(d3),real(d3))
                  d(i+lip+2*lopfac) = d0 - d1
                  d(i+lip+3*lopfac) = d2 - cmplx(-imag(d3),real(d3))
               enddo
               icol = icol + 2
            else
               stop 'Radix not 2 or 4.'
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
