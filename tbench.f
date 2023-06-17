c Benchmark FFT routine
c
c Collect statistics to handle load dependent results
c Run a variety of sizes
c
      parameter (log2max=20,last=2**log2max,ntests=10)
      parameter (ncol=log2max)
      complex coeff  (0:last   -1              ),
     *        coeff2 (0:last/ 2-1,   ncol      ),
     *        coeff4 (0:last/ 4-1, 3,(ncol+1)/2),
     *        coeff16(0:last/16-1,15,(ncol+3)/4)
      dimension log2len(10), lens(10), flops(log2max)
      dimension times(log2max,ntests),isizes(log2max,10),flpcnt(log2max)
      dimension irev(0:last-1), dreal(0:2*last-1,2)
      dimension irex(0:last-1)
      data lens/10*0/
c
c Read in dimensions
c
      write(*,*)'Enter number of dimensions and power of 2 for each'
C      read(*,*) ndim, (log2len(i),i=1,ndim)
      ndim  = 1
      log2len(1) = 12
      if ( ndim .le. 0 ) stop 'Dims<=0'
      if ( ndim .gt. 10 ) stop 'dims>10'
      ic = 0
      do idim = 1, ndim
         if ( log2len(idim) .eq. 0 ) stop 'Len = 1'
         jmax = log2len(idim)
         do jdim = jmax, 1, -1
            ic = ic + 1
C            log2len(idim) = jdim
            do jj = 1, ndim
               isizes(ic,jj) = log2len(jj)
            enddo
            lentotl = 0
            maxlenl = 0
            do i = 1, ndim
               lentotl = lentotl + log2len(i)
               maxlenl = max(maxlenl,log2len(i))
               lens(i) = 2**log2len(i)
            enddo
            if ( lentotl .gt. log2max ) stop 'Too big'
            lentot = 2**lentotl
            maxlen = 2**maxlenl
            flops(ic) = 1.e-6*5*lentot*lentotl
c
c Build simple input array
c
            iseed = 7
            do i = 0, lentot-1
               dreal(i,1) = ran2(iseed) - 0.5
               dreal(i,2) = ran2(iseed) - 0.5
            enddo
c
c Build bit reversal and coefficient array with extra columns
c
            call reorder ( maxlen, irev)
            call reorder2 ( lentot, maxlen, ndim, lens,
     *         irev, irex )
            call coeffs ( maxlen, coeff )
            call coeff24 ( coeff, coeff2, coeff4, coeff16,
     *         last, maxlenl, lentotl )
c
c Call FFT routine
c
            instr = 1
C            if ( lentotl .lt. 12 ) instr = 0
            istart = 0
            do it = 1, ntests
               t1 = seconds(0.0)
                  flpcnt(ic) =  fft(dreal(0,1),dreal(0,2),log2len,ndim,
     *               last,irex,coeff2,coeff4,coeff16,instr,istart)
               t2 = seconds(t1)
               times(ic,it) = t2
C               instr = 0
            enddo
         enddo
      enddo
c
c Collect statistics
c
      write(*,'(2a)')'Max flops, max dev, Ave. time, Flop count',
     *   ', Expected, Max/expected, Sizes'
      do i = 1, ic
         avef = 0.0
         avet = 0.0
         fmax = 0.0
         do j = 1, ntests
            avef = avef + flops(i)/times(i,j)
            avet = avet + times(i,j)
         enddo
         avef = avef/ntests
         avet = avet/ntests
         tmin = 1.e50
         do j = 1, ntests
            if ( times(i,j) .gt. 0.7*avet ) tmin = min(tmin,times(i,j))
         enddo
         fmax = flops(i)/tmin
         if ( i .eq. 1 ) fsave = fmax
         sd = 0.0
         do j = 1, ntests
            sd = max(sd,abs(flops(i)/times(i,j)-fmax))
         enddo
         expect = fsave*(flops(i)/flpcnt(i))*(flpcnt(1)/flops(1))
         write(*,'(f10.3,2f10.6,f10.0,f10.3,f10.6,10i5)')
     *     fmax,sd,avet,flpcnt(i),expect,fmax/expect,
     *     (isizes(i,id),id=1,ndim)
      enddo
c
      stop
      end
