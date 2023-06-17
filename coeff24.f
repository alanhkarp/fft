c Subroutine to compute auxiliary coefficient arrays
c 
      subroutine coeff24 (last, maxlenl, lentotl,
     *   coeff, coeff2, coeff4, coeff8, coeff16 )
      complex coeff  (0:*),
     *        coeff2 (0:last/ 2-1,   *),
     *        coeff4 (0:last/ 4-1, 3,*),
     *        coeff8 (0:last/ 8-1, 7,*),
     *        coeff16(0:last/16-1,15,*)
c
      maxlen = 2**maxlenl
      lentot = 2**lentotl
c
c Build all columns needed for radix 2 FFT
c
      if1 = maxlen
      if2 = lentot
      do k = 1, maxlenl
         if1 = if1/2
         if2 = if2/2
         do i = 0, lentot/2-1
            iw = if1*int(i/if2)
            coeff2(i,k) = coeff(iw)
         enddo
         irep = 2*irep
      enddo
c
c Build all columns needed for radix 4 FFT
c
      if1 = maxlen
      if2 = lentot
      do k = 1, maxlenl/2
         if1 = if1/4
         if2 = if2/4
         do i = 0, lentot/4 - 1
            iw = if1*int(i/if2)
            coeff4(i,1,k) = coeff(  iw)
            coeff4(i,2,k) = coeff(2*iw)
            coeff4(i,3,k) = coeff(3*iw)
         enddo
      enddo
c
c Build all columns needed for radix 8 FFT
c
      if1 = maxlen
      if2 = lentot
      do k = 1, maxlenl/3
         if1 = if1/8
         if2 = if2/8
         do i = 0, lentot/8 - 1
            iw = if1*int(i/if2)
            do j = 1, 7
               coeff8(i,j,k) = coeff(j*iw)
            enddo
         enddo
      enddo
c
c Build all columns needed for radix 16 FFT
c
      if1 = maxlen
      if2 = lentot
      do k = 1, maxlenl/4
         if1 = if1/16
         if2 = if2/16
         do i = 0, lentot/16 - 1
            iw = if1*int(i/if2)
            do j = 1, 15
               coeff16(i,j,k) = coeff(j*iw)
            enddo
         enddo
      enddo
c
      end
