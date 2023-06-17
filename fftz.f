@process directive(' dir:')
c fftz => Large radix
c
      subroutine fftz ( d, lens, ndimx, coeff, irev, irex )
      pragma alias(qfft,'_fftz_')
c
c d       = array to be transformed of length product lens
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c coeff   = array of length at least (max 2**lens)/2
c irev    = integer work array of length at least max 2**lens
c
      save t2, t3, t4, t5, t6, t7, t8, t9, ta, tb, tc
      save ipr, icount
      parameter ( nfmax = 50, npr = 5, maxprl = 12, maxpr = 2**maxprl)
      complex d(0:*), coeff(0:*), temp, t
      complex dd(0:maxpr-1,2), coeffx(0:maxpr-1)
      dimension lens(*), irev(0:*), irex(0:*), ifac(nfmax), ipr(npr)
      data ipr/ maxpr, 2, 2, 2, 2/
      log2(k) = int(0.9 + log(float(k))/log(2.0))
c
c Find total length, max length, sum of log of dimension,
c and largest log dimension
c
      if ( ndimx .gt. 0 ) then
         t2 = 0.0
         t3 = 0.0
         t4 = 0.0
         t5 = 0.0
         t6 = 0.0
         t7 = 0.0
         t8 = 0.0
         t9 = 0.0
         ta = 0.0
         tb = 0.0
         tc = 0.0
      endif
      ndim = abs(ndimx)
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
      times = seconds(0.0)
      if ( ndimx .gt. 0 ) then
         ifs = 1
         icount = 0
         call coeffs ( lensidim, coeff )
      else
         ifs = npr
         do i = npr, 1, -1
            if ( lentot .gt. ipr(i) ) ifs = i
         enddo
      endif
      call factor ( lensidim, ifac, nfac, nfmax, ipr(ifs), npr-ifs+1 )
      call reorderm ( lensidim, irev, ifac, nfac )
      if ( ndimx .gt. 0 ) then
         t9 = seconds(times)
         write(*,'(a,t15,f10.6)')'Coeffs, etc.',t9
      else
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
      if ( ndimx .gt. 0 ) then
         ta = seconds(times)
         write(*,'(a,t15,f10.6)')'Bit reversal',ta
      else
         t3 = t3 + seconds(times)
      endif
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
               do i = 0, lopfac - 1
                  iw = if1*(i/if2)
                  temp = coeff(iw)*d(2*i+1+lop)
	          d(i+lip       ) = d(2*i+lop) + temp
	          d(i+lip+lopfac) = d(2*i+lop) - temp
               enddo
      if ( ndimx .gt. 0 ) then
         tc = tc + seconds(times)
      else
         t4 = t4 + seconds(times)
      endif
            else
c
c Do large radix FFTs using recursively smaller ones
c
c
c Find starting point for factors
c
      times = seconds(0.0)
               icount = icount + lopfac
               is = icount - lopfac
               call reorder  ( lopfac, irex(is) )
               do j = 0, ipfac - 1
                  coeffx(j) = coeff(j*lensidim/ipfac)
               enddo
      t5 = t5 + seconds(times)
               do ii = 0, lopfac - 1
                  i = irex(ii+is)
                  iw = if1*(i/if2)
c Set twiddled array of proper length
      times = seconds(0.0)
                  do j = 0, ipfac - 1
                     k = i*ipfac + j
                     dd(j,1) = d(k+lop)*coeff(j*iw)
                  enddo
      t6 = t6 + seconds(times)
c Do next smaller radix FFT
                  call qfft ( dd,log2(ipfac),-1,coeffx,irev,irex(is) )
c Put results back in the correct place
      times = seconds(0.0)
                  do j = 0, ipfac - 1
                     d(i+lip+j*lopfac) = dd(j,1)
                  enddo
      t7 = t7 + seconds(times)
               enddo
               icount = icount - lopfac
            endif
         enddo
      enddo
c
c If result is in bottom half of array, copy to top half
c
      if ( lip .ne. 0 ) then
      times = seconds(0.0)
c dir: ignore recrdeps(d)
	 do i = 0, lentot - 1
	    d(i) = d(i+lip)
         enddo
      if ( ndimx .gt. 0 ) then
         tb = seconds(times)
         write(*,'(a,t15,f10.6)')'Copy to top',tb
      else
         t8 = t8 + seconds(times)
      endif
      endif
      if ( ndimx .gt. 0 ) then
         write(*,'(a,t15,f10.6)')'Radix 2',tc
         write(*,*)
         write(*,*)'Inner times'
         write(*,'(a,t15,f10.6)')'Coeffs, etc.',t2
         write(*,'(a,t15,f10.6)')'Bit reversal',t3
         write(*,'(a,t15,f10.6)')'Radix 2',t4
         write(*,'(a,t15,f10.6)')'Copy coeffs',t5
         write(*,'(a,t15,f10.6)')'Copy data',t6
         write(*,'(a,t15,f10.6)')'Put data back',t7
         write(*,'(a,t15,f10.6)')'Copy to top',t8
         write(*,*)
         write(*,*)'Totals'
         write(*,'(a,t15,f10.6)')'Coeffs, etc.',t2+t9
         write(*,'(a,t15,f10.6)')'Bit reversal',t3+ta
         write(*,'(a,t15,f10.6)')'Radix 2',t4+tc
         write(*,'(a,t15,f10.6)')'Copy to top',t8+tb
         write(*,'(a,t15,f10.6)')'Extra work',t5+t6+t7
         write(*,'(a,t15,f10.6)')'Total',t2+t3+t4+t5+t6+t7+t9+ta+tb+tc
      endif
c 
c Done
c
      end
