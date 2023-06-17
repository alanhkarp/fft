@process directive(' dir:')
c fftj => Like ffta but use multiple column coefficient array
c
      subroutine fftj ( d, lens, ndim, last, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      complex d(0:*), temp
      complex coeff(0:last/2-1,*)
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
c Build bit reversal index vector but not array of coefficients
c
         call reorder ( lensidim, irev )
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
c dir: ignore recrdeps(d)
            do i = 0, lopfac - 1
               temp = coeff(i,ibfly)*d(2*i+lop+1)
	       d(i+lip       ) = d(2*i+lop)+temp
	       d(i+lip+lopfac) = d(2*i+lop)-temp
            enddo
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
