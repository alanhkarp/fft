@process directive(' dir:')
c fftz => Large radix
c
      subroutine fftz ( d, lens, ndimx, coeff, irev )
      pragma alias(qfft,'_fftz_')
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      save t2, t3, t4, t5, t6, t7, t8, t9, ta, tb, tc
      save ifacx, nfacx, ipr, iflag
      parameter ( nfmax = 50, npr = 5, maxprl = 12, maxpr = 2**maxprl)
      complex d(0:*), coeff(0:*), temp, t
      complex dd(0:maxpr-1,2), coeffx(0:maxpr-1)
      dimension lens(*), irev(0:*), ifac(nfmax), ifacx(nfmax), ipr(npr),
     *   irv(0:maxpr-1)
      data ipr/ maxpr, 16, 4, 4, 2/
      log2(k) = int(0.9 + log(float(k))/log(2.0))
c
c Find total length, max length, sum of log of dimension,
c and largest log dimension
c
      t0 = seconds(0.0)
      ndim = abs(ndimx)
      lentotl = 0
      maxlenl = 0
      do i = 1, ndim
	 lentotl = lentotl + lens(i)
	 maxlenl = max(maxlenl,lens(i))
      enddo
      lentot = 2**lentotl
      maxlen = 2**maxlenl 
      if ( ndimx .lt. 0 ) then
         t3 = t3 + seconds(t0)
      else
      iflag = 0
         t3 = 0.0
c        write(*,*)
c        write(*,*)'Outer only'
c        write(*,'(a,f10.6)')'Set up',seconds(t0)
         t2 = seconds(t0)
      endif
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
      times = seconds(0.0)
      if ( ndimx .gt. 0 ) then
         call factor ( lensidim, ifac, nfac, nfmax, ipr, npr )
         call reorderm ( lensidim, irev, ifac, nfac )
         call coeffs ( lensidim, coeff )
      else
         nfac = nfacx
         do i = 1, nfac
            ifac(i) = ifacx(i)
         enddo
      endif
      if ( ndimx .lt. 0 ) then
         t4 = t4 + seconds(times)
      else
         t4 = 0.0
c        write(*,'(a,f10.6)')'Factor, reorder, coeffs',seconds(times)
         t2 = t2 + seconds(times)
      endif
c
c Copy d with bit reversal for first stage of FFT
c
      times = seconds(0.0)
         mask1 = lensidim - 1
         mask2 = not(lensidim-1)
c dir: ignore recrdeps(d)
         do i = 0, lentot - 1
            iseg = iand(i,mask2)
            ir = irev(iand(i,mask1))
            d(i+lip) = d(ir+lop+iseg)
         enddo
c     if(lentot.eq.4)write(*,'(4f10.3)')(d(i+lip),i=0,lentot-1)
      if ( ndimx .lt. 0 ) then
         t5 = t5 + seconds(times)
      else
         t5 = 0.0
c        write(*,'(a,f10.6)')'Bit reversal',seconds(times)
         t2 = t2 + seconds(times)
      endif
c
c Loop over array doing FFT for rest of stages
c
c        if1 = lensidim/ifac(1)
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
c           if ( ibfly .lt. nfac ) if1 = if1/ifac(ibfly+1)
            if1 = if1/ipfac
            if2 = if2/ipfac
c
c Use special cases since all factors are powers of 2
c
            if ( ipfac .eq. 2 ) then
c
c Radix 2
c
      times = seconds(0.0)
c dir: ignore recrdeps(d)
c     if(ndimx.gt.0)write(*,'(4f10.3)')(d(i+lop),i=0,lentot-1)
               do i = 0, lopfac - 1
                  iw = if1*(i/if2)
c     if(ndimx.gt.0)write(*,'(2i5,2f10.3)')i,iw,coeff(iw)
                  temp = coeff(iw)*d(2*i+1+lop)
	          d(i+lip       ) = d(2*i+lop) + temp
	          d(i+lip+lopfac) = d(2*i+lop) - temp
               enddo
c     if(ibfly.eq.2)write(*,'(4f10.3)')(d(i+lip),i=0,lentot-1)
      if ( ndimx .lt. 0 ) then
         t6 = t6 + seconds(times)
      else
         tc = tc + seconds(times)
         t2 = t2 + seconds(times)
      endif
            else
c
c Do large radix FFTs using recursively smaller ones
c
      t6 = 0.0
c     if(ipfac.eq.4)write(*,'(4f10.3)')(d(i+lop),i=0,lentot-1)
c
c Find starting point for factors
c
      times = seconds(0.0)
               ifs = npr
               do i = npr, 1, -1
                  if ( ipfac .gt. ipr(i) ) ifs = i
               enddo
               call factor ( ipfac, ifacx, nfacx, nfmax, ipr(ifs),
     *               npr-ifs+1)
               call reorderm ( ipfac, irv, ifacx, nfacx )
c     write(*,'(a,f10.6)')'Factor and reorder',seconds(times)
      t2 = t2 + seconds(times)
      times = seconds(0.0)
               do j = 0, ipfac - 1
                  coeffx(j) = coeff(j*lensidim/ipfac)
               enddo
c     if(ipfac.eq.16)write(*,'(2f10.3)')(coeffx(j),j=0,ipfac-1)
c     write(*,'(a,f10.6)')'Copy coeffs',seconds(times)
      t2 = t2 + seconds(times)
c     if(ipfac.eq.4)write(*,'(8i5)')(irv(i),i=0,ipfac-1)
               do k = 0, lopfac - 1
      if(ipfac.eq.4)write(*,'(3i5)')k,if1,if2
      times = seconds(0.0)
                  iw = if1*(k/if2)
c Set twiddled array of proper length
                  do j = 0, ipfac - 1
                     i = k*ipfac + j
c     if(ipfac.eq.4)write(*,'(4f10.3)')coeff(j*iw),d(i+lop)
                     dd(j,1) = d(i+lop)*coeff(j*iw)
                  enddo
      if(ipfac.eq.4)
     * write(*,'(4f10.3)')(dd(j,1),j=0,ipfac-1)
      if ( k .eq. 0 ) t8 = 0.0
      t8 = t8 + seconds(times)
c     if ( k .eq. lopfac-1) write(*,'(a,f10.6)')'Copy data',t8
      t2 = t2 + seconds(times)
c Do next smaller radix FFT
                  call qfft ( dd, log2(ipfac), -1, coeffx, irv )
c     if(ipfac.eq.16)write(*,'(4f10.3)')(dd(j,1),j=0,ipfac-1)
      times = seconds(0.0)
c Put results back in the correct place
                  do j = 0, ipfac - 1
                     d(k+lip+j*lopfac) = dd(j,1)
                  enddo
      if ( k .eq. 0 ) ta = 0.0
      ta = ta + seconds(times)
c     if ( k .eq. lopfac-1) write(*,'(a,f10.6)')'Put data back',ta
      t2 = t2 + seconds(times)
               enddo
c     if(ipfac.eq.16)write(*,'(4f10.3)')(d(j+lip),j=0,lentot-1)
            endif
c Twiddle for next butterfly
c           if ( ibfly .lt. nfac ) then
c dir: ignore recrdeps(d)
c              do k = 0, lopfac - 1
c                 do m = 0, ipfac - 1
c                    i = k*ipfac + m
c                    iw = iand(i,ifac(ibfly+1)-1)*if1*(i/if2)
c                    d(i+lip) = d(i+lip)*coeff(iw)
c                 enddo
c              enddo
c           endif
c     if(ipfac.eq.16)write(*,'(4f10.3)')(d(i+lip),i=0,lentot-1)
         enddo
      enddo
c     if(ndimx.gt.0)write(*,'(4f10.3)')(d(i+lip),i=0,lentot-1)
c
c If result is in bottom half of array, copy to top half
c
      if ( lip .ne. 0 ) then
      times = seconds(0.0)
c dir: ignore recrdeps(d)
	 do i = 0, lentot - 1
	    d(i) = d(i+lip)
         enddo
      if ( ndimx .lt. 0 ) then
         t7 = t7 + seconds(times)
      else
         t7 = 0.0
c        write(*,'(a,f10.6)')'Copy to top',seconds(times)
      t2 = t2 + seconds(times)
      endif
      endif
      if ( ndimx .gt. 0 ) then
c        write(*,'(a,f10.6)')'Radix 2o',tc
c        write(*,'(a,f10.6)')'Outer total',t2
c        write(*,*)
c        write(*,*)'Inner only'
c        write(*,'(a,f10.6)')'Set up',t3
c        write(*,'(a,f10.6)')'Factor, reorder, coeffs',t4
c        write(*,'(a,f10.6)')'Bit reversal',t5
c        write(*,'(a,f10.6)')'Radix 2i',t6
c        write(*,'(a,f10.6)')'Copy to top',t7
c        write(*,'(a,f10.6)')'Inner total',tb
c        write(*,*)
      else
         tb = tb + seconds(t0)
      endif
c 
c Done
c
      end
