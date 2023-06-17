cprocess dc(big)
c Driver routine to test FFT subroutines
c
c Uses fourn and ran2 from Numerical Recipes
c
      parameter (log2max=20,last=2**log2max,ntests=29)
      parameter (ncol=log2max,instr=1)
      parameter (ix=1)
      complex ans(0:last-1), data(0:2*last-1+ix), datasave(0:last-1)
      complex temp, coeff(0:last-1),
     *        coeff2 (0:last/ 2-1,   ncol),
     *        coeff4 (0:last/ 4-1, 3,(ncol+1)/2),
     *        coeff8 (0:last/ 8-1, 7,(ncol+2)/3),
     *        coeff16(0:last/16-1,15,(ncol+3)/4)
      dimension log2len(10), lens(10), irev(0:last-1), irex(0:last-1)
      dimension testlist(ntests)
      character*6 tests(ntests)
      character*40 comments(ntests)
      dimension dreal(0:2*last-1+ix,2), aux1(2*last), aux2(2*last)
      equivalence (dreal,data), (aux1,coeff), (aux2,data)
      data lens/10*1/
c
c Put in the list of tests you want to do here.  Set the
c table below for the codes.  ktest is number of tests.
c
      data ktest/2/
      data testlist/ 3,21,27*0/
c
c Run all tests
c
c      data ktest/27/
c      data testlist/    2, 3, 4, 5, 6, 7, 8, 9,10,
c     *              11,12,13,14,15,16,17,18,19,20,
c     *              21,22,23,24,25,26,27,28,2*0/
      data tests/'fourn ','fft   ','ffta  ','fftb  ','fftc  ',
     *           'fftd  ','ffte  ','fftf  ','fftg  ','ffth  ',
     *           'ffti  ','fftj  ','fftk  ','fftl  ','fftm  ',
     *           'fftn  ','ffto  ','fftp  ','fftq  ','fftr  ',
     *           'ffts  ','fftt  ','fftu  ','fftv  ','fftw  ',
     *           'fftx  ','ffty  ','fftz  ','fftaa '/
      data comments/
     *   'Correct answer from Numerical Recipes   ',  !  1: fourn
     *   'Best result for 3090/VF                 ',  !  2: fft
     *   'Base case                               ',  !  3: ffta
     *   'Use shifts to compute coeffs index      ',  !  4: fftb
     *   'Avoid integer divide in coeffs index    ',  !  5: fftc
     *   'Reuse bit reversal and coeffs arrays    ',  !  6: fftd
     *   'Combine 1st pass with bit reversal      ',  !  7: ffte
     *   'Improve handling of bit reversal        ',  !  8: fftf
     *   'Use real arithmetic                     ',  !  9: fftg
     *   'Separate real and imaginary parts       ',  ! 10: ffth
     *   'Avoid gather scatter for long vectors   ',  ! 11: ffti
     *   'Use multiple column coefficient array   ',  ! 12: fftj
     *   'Gather coefficients before use          ',  ! 13: fftk
     *   'Use radix 2 and 4                       ',  ! 14: fftl
     *   'Use one column auxiliary array vs l     ',  ! 15: fftm
     *   'Use multiple column auxiliary array vs m',  ! 16: fftn
     *   'Use 2 radix-2 instead of radix-4 vs l   ',  ! 17: ffto
     *   'Separate real and imaginary parts vs l  ',  ! 18: fftp
     *   'Use fixed stride not gather vs i        ',  ! 19: fftq
     *   'Do radix-16 to improve cache use vs l   ',  ! 20: fftr
     *   'Do radix-16 as 2 radix-4 vs r           ',  ! 21: ffts
     *   'Do radix-32 with in-place method vs l   ',  ! 22: fftt
     *   'Do radix-32 as radix-4s and radix-2 vs t',  ! 23: fftu
     *   'Do radix-8 for completeness             ',  ! 24: fftv
     *   'Like fftd but do bit reversal once      ',  ! 25: fftw
     *   'Improve handling of long bit reversals  ',  ! 26: fftx
     *   'Use second dimension for flip/flop      ',  ! 27: ffty
     *   'Do radix-16 in a loop vs s              ',  ! 28: fftz
     *   'Like ffz but do bit reversal once       '/  ! 29: fftaa
c
c Read in dimensions
c
      write(*,*) 'Enter number of dimensions and power of 2 for each'
      read(*,*) ndim, (log2len(i),i=1,ndim)
      if ( ndim .le. 0 ) stop 'Number of dimensions <= 0.'
      if ( ndim .gt. 10 ) stop 'Number of dimensions > 10.'
      lentotl = 0
      maxlenl = 0
      do i = 1, ndim
         if ( log2len(i) .eq. 0 ) stop 'Length of 1 not allowed.'
         lentotl = lentotl + log2len(i)
         lens(i) = 2**log2len(i)
         maxlenl = max(maxlenl,log2len(i))
      enddo
      lentot = 2**lentotl
      maxlen = 2**maxlenl
      if ( lentotl .gt. log2max ) stop 'Total size of array too big.'
      flops = 1.e-6*5*lentot*lentotl
c
c Build coefficient array for ESSL routines
c
c     if ( ndim .eq. 1 ) then
c        call scft  ( 1, ans, 1, 1, ans, 1, 1, lens(1),
c    *     1, -1, 1.0, aux1, 2*last, aux2, 2*last )
c     else if ( ndim .eq. 2 ) then
c        call scft2 ( 1, ans, 1, lens(1), ans, 1, lens(1),
c    *     lens(1), lens(2), -1, 1.0, aux1, 2*last, aux2, 2*last )
c     endif
c
c Build simple input array
c
      iseed = 7
      do i = 0, lentot-1
         dr = ran2(iseed) - 0.5
         di = ran2(iseed) - 0.5
         datasave(i) = cmplx(dr,di)
         ans(i) = datasave(i)
      enddo
c     call surand ( 7.d0, 2*lentot, datasave )
c
c Now call FFT routine from Numerical Recipes for right answer
c if ndim > 3 or appropriate ESSL routine otherwise
c
      write(*,'(a)')'Version  CPU sec   Mflops  Error     Comments'
      t1 = seconds(0.0)
c     if ( ndim .eq. 1 ) then
c        call scft  ( 0, ans, 1, 1, ans, 1, 1, lens(1),
c    *     1, -1, 1.0, aux1, 2*last, aux2, 2*last )
c        t2 = seconds(t1)
c        write(*,'(a,3x,f7.3,2x,f7.3,1p,e10.2,2x,a)')
c    *      'scft  ',t2,flops/t2,0.0,comments(1)
c     else if ( ndim .eq. 2 ) then
c        call scft2 ( 0, ans, 1, lens(1), ans, 1, lens(1),
c    *     lens(1), lens(2), -1, 1.0, aux1, 2*last, aux2, 2*last )
c        t2 = seconds(t1)
c        write(*,'(a,3x,f7.3,2x,f7.3,1p,e10.2,2x,a)')
c    *      'scft2 ',t2,flops/t2,0.0,comments(1)
c     else if ( ndim .eq. 3 ) then
c        call scft3 ( ans, lens(2), lens(3), ans, lens(2), lens(3),
c    *     lens(1), lens(2), lens(3), -1, 1.0, aux1, 2*last )
c        t2 = seconds(t1)
c        write(*,'(a,3x,f7.3,2x,f7.3,1p,e10.2,2x,a)')
c    *      'scft3 ',t2,flops/t2,0.0,comments(1)
c     else
         call fourn(ans,lens,ndim,1)
         t2 = seconds(t1)
         write(*,'(a,3x,f7.3,2x,f7.3,1p,e10.2,2x,a)')
     *      'fourn ',t2,flops/t2,0.0,comments(1)
c     endif
c
c Loop over tests
c
      ib = 5
      icl = 12
      do jtest = 1, ktest
         itest = testlist(jtest)
c
c Build bit reversal index vector and array of coefficients
c
         call coeffs ( maxlen, coeff )
         call coeff24 ( last, maxlenl, lentotl, 
     *     coeff, coeff2, coeff4, coeff8, coeff16 )
         istart = 0
         ic = 2**icl
         if ( tests(itest) .eq. 'fft   '.and. lens(1) .gt. ic ) then
            call reorder ( ic, irev )
            do j = ic, maxlen-1, ic
               do i = 0, ic - 1
                  irev(i+j) = irev(i) + j
               enddo
            enddo
            call reorder3 ( lentot, maxlen, ndim, lens, irev, irex )
         else
            call reorder ( maxlen, irev )
            call reorder2 ( lentot, maxlen, ndim, lens, irev, irex )
         endif
c
c Copy to data for first use
c
         do i = 0, lentot-1
            if ( tests(itest) .ne. 'fft   ' .and.
     *           tests(itest) .ne. 'ffth  ' .and.
     *           tests(itest) .ne. 'fftp  ' ) then
               data(i) = datasave(i)
            else
               dreal(i,1) = real(datasave(i))
               dreal(i,2) = aimag(datasave(i))
            endif
         enddo
c
c Call next test routine
c
         t1 = seconds(0.0)
         if ( itest .eq. 2 ) then
            call fft(dreal(0,1),dreal(0,2),log2len,ndim,last,irex,
     *        coeff2,coeff4,coeff16,instr,istart,icl,ib,lentot)
         elseif ( itest .eq.  3 ) then
            call ffta(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq.  4 ) then
            call fftb(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq.  5 ) then
            call fftc(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq.  6 ) then
            call fftd(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq.  7 ) then
            call ffte(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq.  8 ) then
            call fftf(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq.  9 ) then
            call fftg(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 10 ) then
            call ffth(dreal(0,1),dreal(0,2),log2len,ndim,coeff,irev)
         elseif ( itest .eq. 11 ) then
            call ffti(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 12 ) then
            call fftj(data,log2len,ndim,last,coeff2,irev)
         elseif ( itest .eq. 13 ) then
            call fftk(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 14 ) then
            call fftl(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 15 ) then
            call fftm(data,log2len,ndim,last,coeff2,coeff4,irev)
         elseif ( itest .eq. 16 ) then
            call fftn(data,log2len,ndim,last,coeff2,coeff4,irev)
         elseif ( itest .eq. 17 ) then
            call ffto(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 18 ) then
            call fftp(dreal(0,1),dreal(0,2),log2len,ndim,coeff,irev)
         elseif ( itest .eq. 19 ) then
            call fftq(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 20 ) then
            call fftr(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 21 ) then
            call ffts(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 22 ) then
            call fftt(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 23 ) then
            call fftu(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 24 ) then
            call fftv(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 25 ) then
            call fftw(data,log2len,ndim,coeff,irex)
         elseif ( itest .eq. 26 ) then
            call fftx(data,log2len,ndim,coeff,irev)
         elseif ( itest .eq. 27 ) then
            call ffty(data,log2len,ndim,coeff,irev,lentot)
         elseif ( itest .eq. 28 ) then
            call fftz(data,log2len,ndim,coeff,irev,irex)
         endif
         t2 = seconds(t1)
c
c     Check errors
c
         err = 0.0
         big = 0.0
         do i = 0, lentot-1
            if ( tests(itest) .ne. 'fft   ' .and.
     *           tests(itest) .ne. 'ffth  ' .and.
     *           tests(itest) .ne. 'fftp  ' ) then
               temp = data(i+istart)
            else
               temp = cmplx(dreal(i+istart,1),dreal(i+istart,2))
            endif
            err = max(err,abs(temp-ans(i)))
            big = max(big,abs(data(i)))
         enddo
         write(*,'(a,3x,f7.3,2x,f7.3,1p,e10.2,2x,a)')
     *      tests(itest),t2,flops/t2,err/big,comments(itest)
      enddo
c
      end
