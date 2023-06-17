c Compute flops for FFT
c
c Run a variety of sizes
c
      dimension log2len(10), lens(10)
      dimension first(3), rest(3)
      data first/4.0,16.0,168.0/
      data rest /10.0,34.0,258.0/
      data lens/10*0/
c
c Read in dimensions
c
      write(*,*)'Enter number of dimensions and power of 2 for each'
      read(*,*) ndim, (log2len(i),i=1,ndim)
      if ( ndim .le. 0 ) stop 'Dims<=0'
      if ( ndim .gt. 10 ) stop 'dims>10'
      ic = 0
      do idim = 1, ndim
         if ( log2len(idim) .eq. 0 ) stop 'Len = 1'
         jmax = log2len(idim)
         do jdim = jmax, 1, -1
            ic = ic + 1
            log2len(idim) = jdim
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
c Flop counts for radix-2
c
      stop
      end
