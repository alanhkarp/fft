@process directive(' dir:')
c fftg => Like ffta but use real arithmetic
c
      subroutine fftg ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      dimension d(2,0:*)
      dimension coeff(2,0:*)
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
            d(1,i+lip) = d(1,ir+lop+iseg)
            d(2,i+lip) = d(2,ir+lop+iseg)
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
               iw = if1*(i/if2)
               tr = coeff(1,iw)*d(1,2*i+lop+1)
     *             -coeff(2,iw)*d(2,2*i+lop+1)
	       d(1,i+lip       ) = d(1,2*i+lop)+tr
	       d(1,i+lip+lopfac) = d(1,2*i+lop)-tr
               ti = coeff(1,iw)*d(2,2*i+lop+1)
     *             +coeff(2,iw)*d(1,2*i+lop+1)
	       d(2,i+lip       ) = d(2,2*i+lop)+ti
	       d(2,i+lip+lopfac) = d(2,2*i+lop)-ti
            enddo
         enddo
      enddo
c
c If result is in bottom half of array, copy to top half
c
      if ( lip .ne. 0 ) then
c dir: ignore recrdeps(d)
	 do i = 0, lentot - 1
	    d(1,i) = d(1,i+lip)
	    d(2,i) = d(2,i+lip)
         enddo
      endif
c 
c Done
c
      end
