@process directive(' dir:')
c fftw => Like ffta but do bit reversal once
c
      subroutine fftw ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
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
      lip = lentot
      lop = 0
c
c Copy d with bit reversal on first stage of FFT
c
      time = seconds(0.0)
c dir: ignore recrdeps(d)
      do i = 0, lentot - 1
         d(i+lip) = d(irev(i)+lop)
      enddo
c     write(*,'(a,f12.6)')'Bit reversal',seconds(time)
c
c Main loop over dimensions
c
      do idim = 1, ndim
         lensidim = 2**lens(idim)
c
c Loop over array doing FFT for rest of stages
c
         if1 = maxlen
         if2 = lentot
         do ibfly = 1, lens(idim)
            ls = lip
            lip = lop
            lop = ls
c
c Now compute remaining stages of butterfly
c
            if1 = if1/2
            if2 = if2/2
c dir: ignore recrdeps(d)
            do i = 0, lentot/2 - 1
               iw = if1*(i/if2)
               temp = coeff(iw)*d(2*i+lop+1)
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
