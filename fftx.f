@process directive(' dir:')
c fftx => Improve handling of long bit reversals
c
      subroutine fftx ( d, lens, ndim, coeff, irev )
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      parameter ( icache = 12, jblk = 4, jcache = 2**icache )
      complex d(0:*), temp
      complex coeff(0:*)
      dimension lens(ndim), irev(0:*), irev2(0:2**jblk-1)
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
c Use special code if this dimension does not fit in cache
c unless it will need too many passses over the data.
c
         call coeffs ( lensidim, coeff )
      time = seconds(0.0)
         ld = lensidim
         ntimes = lens(idim) - icache
         if ( ntimes .gt. 0 .and. ntimes .lt. 7*jblk ) then
c
c Do a radix lensidim/iblk bit reversal using a fixed stride load
c
            n = lens(idim) - icache
            do n = lens(idim)-icache, 1, -jblk
               iblk = 2**min(jblk,n)
               call reorder ( iblk, irev2 )
               leff = ld/iblk
               do l = 0, lentot - 1, ld
                  do m = 0, iblk - 1
                     j = irev2(m)
c dir: ignore recrdeps(d)
                     do i = 0, leff - 1
                        d(i+lip+m*leff+l) = d(iblk*i+lop+j+l)
                     enddo
                  enddo
               enddo
               ld = leff
               ls = lip
               lip = lop
               lop = ls
            enddo
c     write(*,'(a,f12.6)')'Fixed stride',seconds(time)
         endif  
c
c Now reorder each sub part
c
      t2 = seconds(0.0)
         call reorder ( ld, irev )
         ifac = lentot/(lensidim/ld)
         mask1 = ld - 1
         mask2 = not(ld-1)
         do j = 0, lensidim/ld - 1
c dir: ignore recrdeps(d)
            do k = 0, ifac - 1
               i = k + j*ifac
               iseg = iand(i,mask2)
               ir = irev(iand(i,mask1))
               d(i+lip) = d(ir+lop+iseg)
            enddo
         enddo
c     write(*,'(a,f12.6)')'Second part ',seconds(t2)
c     write(*,'(a,f12.6)')'Bit reversal',seconds(time)
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
