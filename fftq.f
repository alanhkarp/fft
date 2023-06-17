@process directive(' dir:')
c fftq => Like ffti but use fixed stride instead of gather
c
      subroutine fftq ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( minvec = 32 )
      complex d(0:*), temp
      complex coeff(0:*)
      dimension lens(ndim), irev(0:*)
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
      lopfac = lentot/2
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
         call reorder ( lensidim, irev )
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
         do ibfly = 1, lens(idim)
            ls = lip
            lip = lop
            lop = ls
c
c Now compute this butterfly
c
            if1 = if1/2
	    if2 = if2/2
            if ( if2 .lt. minvec ) then
               lvec = lopfac/if2
               do j = 0, if2 - 1
c dir: ignore recrdeps(d)
                  do k = 0, lvec - 1
                     i = j + k * if2
                     temp = coeff(k*if1)*d(2*i+lop+1)
	             d(i+lip       ) = d(2*i+lop)+temp
	             d(i+lip+lopfac) = d(2*i+lop)-temp
                  enddo
               enddo
            else
               do k = 0, lopfac - 1, if2
                  iw = if1*(k/if2)
c dir: ignore recrdeps(d)
                  do j = 0, if2 - 1
                     i = j + k
                     temp = coeff(iw)*d(2*i+lop+1)
                     d(i+lip       ) = d(2*i+lop) + temp
                     d(i+lip+lopfac) = d(2*i+lop) - temp
                  enddo
               enddo
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
