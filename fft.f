@process directive(' dir:')
c
c Best FFT for the 3090
c Incorporates ffta, fftc, ffte, ffth, ffti, fftn, fftp, ffts
c
      function fft ( dr, di, lens, ndim, last, irev,
     *   coeff2, coeff4, coef16, instr, istart, ic, ib, ldd )
c
c Arguments
c
c dr      = real part of array to be transformed
c di      = imaginary part of array to be transformed
c lens    = log2 length of each dimension
c ndim    = number of dimensions
c last    = length of arrays
c irev    = bit reversal index array
c coef2   = coefficient array for radix-2
c coeff4  = coefficient array for radix-4
c coef16  = coefficient array for radix-16
c instr   = write timing info if non zero
c istart  = data in top half if istart is zero
c ic      = longest string to use for bit reversal
c
c Parameters
c
c minvec  = shortest vector loop used
c nfmax   = maximum number of factors in lengths
c npr     = number of "primes" in list
c
      parameter ( minvec = 128, nfmax = 50, npr = 3 )
      dimension dr(0:ldd-1,2), di(0:ldd-1,2), irev(0:*)
      complex t0, t1, t2, t3, r0, r1, r2, r3, temp, t, c
      complex d0, d1, d2, d3, d4, d5, d6, d7,
     *        d8, d9, da, db, dc, dd, de, df
      complex coef1, coef2, coef3,
     *   coeff2 (0:last/ 2-1,   *), 
     *   coeff4 (0:last/ 4-1, 3,*),
     *   coef16(0:last/16-1,15,*)
      dimension lens(ndim), ifac(nfmax), ipr(npr)
      dimension irev2(0:2**13-1)
      data ipr/16, 4, 2/
      cmr(xr,xi,c) = xr*real(c) - xi*imag(c)
      cmi(xr,xi,c) = xi*real(c) + xr*imag(c)
c
c Initialize flop count
c
      times = seconds(0.0)
      fft = 0.0
c
c Build short table of coefficients for radix-16
c angle = 2 pi / 16
c
      angle = 0.5*atan(1.0)
      coef1 = cmplx(cos(  angle),sin(  angle))
      coef2 = cmplx(cos(2*angle),sin(2*angle))
      coef3 = cmplx(cos(3*angle),sin(3*angle))
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
      if ( istart .eq. 0 ) then
         lip = 2
         lop = 1
      else
         lip = 1
         lop = 2
      endif
      if ( instr .ne. 0 )
     *   write(*,'(a,f10.6)')'Set-up',seconds(times)
c
c Copy d with bit reversal for first stage of FFT
c Assumes cache line size is 32 words, cache holds lengths up to 2**ic
c
      times = seconds(0.0)
      ld = 2**lens(1)
      ntimes = lens(1) - ic
      if ( ntimes .gt. 0 .and. ntimes .lt. 35 ) then
c
c Do a radix lensidim/iblk bit reversal using a fixed stride load
c
         do n = ntimes, 1, -ib
            iblk = 2**min(ib,n)
            call reorder ( iblk, irev2 )
            leff = ld/iblk
            do l = 0, lentot - 1, ld
               if ( iblk .eq. 32 ) then
c dir: ignore recrdeps(dr)
                  do i = 0, leff - 1
                     dr(i        +l,lip) = dr(iblk*i   +l,lop)
                     dr(i+   leff+l,lip) = dr(iblk*i+16+l,lop)
                     dr(i+ 2*leff+l,lip) = dr(iblk*i+ 8+l,lop)
                     dr(i+ 3*leff+l,lip) = dr(iblk*i+24+l,lop)
                     dr(i+ 4*leff+l,lip) = dr(iblk*i+ 4+l,lop)
                     dr(i+ 5*leff+l,lip) = dr(iblk*i+20+l,lop)
                     dr(i+ 6*leff+l,lip) = dr(iblk*i+12+l,lop)
                     dr(i+ 7*leff+l,lip) = dr(iblk*i+28+l,lop)
                     dr(i+ 8*leff+l,lip) = dr(iblk*i+ 2+l,lop)
                     dr(i+ 9*leff+l,lip) = dr(iblk*i+18+l,lop)
                     dr(i+10*leff+l,lip) = dr(iblk*i+10+l,lop)
                     dr(i+11*leff+l,lip) = dr(iblk*i+26+l,lop)
                     dr(i+12*leff+l,lip) = dr(iblk*i+ 6+l,lop)
                     dr(i+13*leff+l,lip) = dr(iblk*i+22+l,lop)
                     dr(i+14*leff+l,lip) = dr(iblk*i+14+l,lop)
                     dr(i+15*leff+l,lip) = dr(iblk*i+30+l,lop)
                     dr(i+16*leff+l,lip) = dr(iblk*i+ 1+l,lop)
                     dr(i+17*leff+l,lip) = dr(iblk*i+17+l,lop)
                     dr(i+18*leff+l,lip) = dr(iblk*i+ 9+l,lop)
                     dr(i+19*leff+l,lip) = dr(iblk*i+25+l,lop)
                     dr(i+20*leff+l,lip) = dr(iblk*i+ 5+l,lop)
                     dr(i+21*leff+l,lip) = dr(iblk*i+21+l,lop)
                     dr(i+22*leff+l,lip) = dr(iblk*i+13+l,lop)
                     dr(i+23*leff+l,lip) = dr(iblk*i+29+l,lop)
                     dr(i+24*leff+l,lip) = dr(iblk*i+ 3+l,lop)
                     dr(i+25*leff+l,lip) = dr(iblk*i+19+l,lop)
                     dr(i+26*leff+l,lip) = dr(iblk*i+11+l,lop)
                     dr(i+27*leff+l,lip) = dr(iblk*i+27+l,lop)
                     dr(i+28*leff+l,lip) = dr(iblk*i+ 7+l,lop)
                     dr(i+29*leff+l,lip) = dr(iblk*i+23+l,lop)
                     dr(i+30*leff+l,lip) = dr(iblk*i+15+l,lop)
                     dr(i+31*leff+l,lip) = dr(iblk*i+31+l,lop)
                  enddo
c dir: ignore recrdeps(di)
                  do i = 0, leff - 1
                     di(i        +l,lip) = di(iblk*i   +l,lop)
                     di(i+   leff+l,lip) = di(iblk*i+16+l,lop)
                     di(i+ 2*leff+l,lip) = di(iblk*i+ 8+l,lop)
                     di(i+ 3*leff+l,lip) = di(iblk*i+24+l,lop)
                     di(i+ 4*leff+l,lip) = di(iblk*i+ 4+l,lop)
                     di(i+ 5*leff+l,lip) = di(iblk*i+20+l,lop)
                     di(i+ 6*leff+l,lip) = di(iblk*i+12+l,lop)
                     di(i+ 7*leff+l,lip) = di(iblk*i+28+l,lop)
                     di(i+ 8*leff+l,lip) = di(iblk*i+ 2+l,lop)
                     di(i+ 9*leff+l,lip) = di(iblk*i+18+l,lop)
                     di(i+10*leff+l,lip) = di(iblk*i+10+l,lop)
                     di(i+11*leff+l,lip) = di(iblk*i+26+l,lop)
                     di(i+12*leff+l,lip) = di(iblk*i+ 6+l,lop)
                     di(i+13*leff+l,lip) = di(iblk*i+22+l,lop)
                     di(i+14*leff+l,lip) = di(iblk*i+14+l,lop)
                     di(i+15*leff+l,lip) = di(iblk*i+30+l,lop)
                     di(i+16*leff+l,lip) = di(iblk*i+ 1+l,lop)
                     di(i+17*leff+l,lip) = di(iblk*i+17+l,lop)
                     di(i+18*leff+l,lip) = di(iblk*i+ 9+l,lop)
                     di(i+19*leff+l,lip) = di(iblk*i+25+l,lop)
                     di(i+20*leff+l,lip) = di(iblk*i+ 5+l,lop)
                     di(i+21*leff+l,lip) = di(iblk*i+21+l,lop)
                     di(i+22*leff+l,lip) = di(iblk*i+13+l,lop)
                     di(i+23*leff+l,lip) = di(iblk*i+29+l,lop)
                     di(i+24*leff+l,lip) = di(iblk*i+ 3+l,lop)
                     di(i+25*leff+l,lip) = di(iblk*i+19+l,lop)
                     di(i+26*leff+l,lip) = di(iblk*i+11+l,lop)
                     di(i+27*leff+l,lip) = di(iblk*i+27+l,lop)
                     di(i+28*leff+l,lip) = di(iblk*i+ 7+l,lop)
                     di(i+29*leff+l,lip) = di(iblk*i+23+l,lop)
                     di(i+30*leff+l,lip) = di(iblk*i+15+l,lop)
                     di(i+31*leff+l,lip) = di(iblk*i+31+l,lop)
                  enddo
               elseif ( iblk .eq. 16 ) then
c dir: ignore recrdeps(dr)
                  do i = 0, leff - 1
                     dr(i        +l,lip) = dr(iblk*i   +l,lop)
                     dr(i+   leff+l,lip) = dr(iblk*i+ 8+l,lop)
                     dr(i+ 2*leff+l,lip) = dr(iblk*i+ 4+l,lop)
                     dr(i+ 3*leff+l,lip) = dr(iblk*i+12+l,lop)
                     dr(i+ 4*leff+l,lip) = dr(iblk*i+ 2+l,lop)
                     dr(i+ 5*leff+l,lip) = dr(iblk*i+10+l,lop)
                     dr(i+ 6*leff+l,lip) = dr(iblk*i+ 6+l,lop)
                     dr(i+ 7*leff+l,lip) = dr(iblk*i+14+l,lop)
                     dr(i+ 8*leff+l,lip) = dr(iblk*i+ 1+l,lop)
                     dr(i+ 9*leff+l,lip) = dr(iblk*i+ 9+l,lop)
                     dr(i+10*leff+l,lip) = dr(iblk*i+ 5+l,lop)
                     dr(i+11*leff+l,lip) = dr(iblk*i+13+l,lop)
                     dr(i+12*leff+l,lip) = dr(iblk*i+ 3+l,lop)
                     dr(i+13*leff+l,lip) = dr(iblk*i+11+l,lop)
                     dr(i+14*leff+l,lip) = dr(iblk*i+ 7+l,lop)
                     dr(i+15*leff+l,lip) = dr(iblk*i+15+l,lop)
                  enddo
c dir: ignore recrdeps(di)
                  do i = 0, leff - 1
                     di(i        +l,lip) = di(iblk*i   +l,lop)
                     di(i+   leff+l,lip) = di(iblk*i+ 8+l,lop)
                     di(i+ 2*leff+l,lip) = di(iblk*i+ 4+l,lop)
                     di(i+ 3*leff+l,lip) = di(iblk*i+12+l,lop)
                     di(i+ 4*leff+l,lip) = di(iblk*i+ 2+l,lop)
                     di(i+ 5*leff+l,lip) = di(iblk*i+10+l,lop)
                     di(i+ 6*leff+l,lip) = di(iblk*i+ 6+l,lop)
                     di(i+ 7*leff+l,lip) = di(iblk*i+14+l,lop)
                     di(i+ 8*leff+l,lip) = di(iblk*i+ 1+l,lop)
                     di(i+ 9*leff+l,lip) = di(iblk*i+ 9+l,lop)
                     di(i+10*leff+l,lip) = di(iblk*i+ 5+l,lop)
                     di(i+11*leff+l,lip) = di(iblk*i+13+l,lop)
                     di(i+12*leff+l,lip) = di(iblk*i+ 3+l,lop)
                     di(i+13*leff+l,lip) = di(iblk*i+11+l,lop)
                     di(i+14*leff+l,lip) = di(iblk*i+ 7+l,lop)
                     di(i+15*leff+l,lip) = di(iblk*i+15+l,lop)
                  enddo
               elseif ( iblk .eq. 8 ) then
c dir: ignore recrdeps(dr,di)
                  do i = 0, leff - 1
                     dr(i        +l,lip) = dr(iblk*i   +l,lop)
                     dr(i+   leff+l,lip) = dr(iblk*i+ 4+l,lop)
                     dr(i+ 2*leff+l,lip) = dr(iblk*i+ 2+l,lop)
                     dr(i+ 3*leff+l,lip) = dr(iblk*i+ 6+l,lop)
                     dr(i+ 4*leff+l,lip) = dr(iblk*i+ 1+l,lop)
                     dr(i+ 5*leff+l,lip) = dr(iblk*i+ 5+l,lop)
                     dr(i+ 6*leff+l,lip) = dr(iblk*i+ 3+l,lop)
                     dr(i+ 7*leff+l,lip) = dr(iblk*i+ 7+l,lop)
                     di(i        +l,lip) = di(iblk*i   +l,lop)
                     di(i+   leff+l,lip) = di(iblk*i+ 4+l,lop)
                     di(i+ 2*leff+l,lip) = di(iblk*i+ 2+l,lop)
                     di(i+ 3*leff+l,lip) = di(iblk*i+ 6+l,lop)
                     di(i+ 4*leff+l,lip) = di(iblk*i+ 1+l,lop)
                     di(i+ 5*leff+l,lip) = di(iblk*i+ 5+l,lop)
                     di(i+ 6*leff+l,lip) = di(iblk*i+ 3+l,lop)
                     di(i+ 7*leff+l,lip) = di(iblk*i+ 7+l,lop)
                  enddo
               elseif ( iblk .eq. 4 ) then
c dir: ignore recrdeps(dr,di)
                  do i = 0, leff - 1
                     dr(i        +l,lip) = dr(iblk*i   +l,lop)
                     dr(i+   leff+l,lip) = dr(iblk*i+ 2+l,lop)
                     dr(i+ 2*leff+l,lip) = dr(iblk*i+ 1+l,lop)
                     dr(i+ 3*leff+l,lip) = dr(iblk*i+ 3+l,lop)
                     di(i        +l,lip) = di(iblk*i   +l,lop)
                     di(i+   leff+l,lip) = di(iblk*i+ 2+l,lop)
                     di(i+ 2*leff+l,lip) = di(iblk*i+ 1+l,lop)
                     di(i+ 3*leff+l,lip) = di(iblk*i+ 3+l,lop)
                  enddo
               elseif ( iblk .eq. 2 ) then
c dir: ignore recrdeps(dr,di)
                  do i = 0, leff - 1
                     dr(i        +l,lip) = dr(2*i   +l,lop)
                     dr(i+   leff+l,lip) = dr(2*i+ 1+l,lop)
                     di(i        +l,lip) = di(2*i   +l,lop)
                     di(i+   leff+l,lip) = di(2*i+ 1+l,lop)
                  enddo
               else
                  do m = 0, iblk - 1
                     j = irev2(m)
c dir: ignore recrdeps(dr)
                     do i = 0, leff - 1
                        dr(i+m*leff+l,lip) = dr(iblk*i+j+l,lop)
                     enddo
c dir: ignore recrdeps(di)
                     do i = 0, leff - 1
                        di(i+m*leff+l,lip) = di(iblk*i+j+l,lop)
                     enddo
                  enddo
               endif
            enddo
            ld = leff
            ls = lip
            lip = lop
            lop = ls
         enddo
         if ( instr .ne. 0 )
     *      write(*,'(a,f10.6)')'Fixed stride',seconds(times)
      endif
c
c Now reorder each sub part
c
      t2 = seconds(0.0)
c dir: ignore recrdeps(dr,di)
      do i = 0, lentot - 1
         dr(i,lip) = dr(irev(i),lop)
      enddo
c dir: ignore recrdeps(dr,di)
      do i = 0, lentot - 1
         di(i,lip) = di(irev(i),lop)
      enddo
      if ( instr .ne. 0 )
     *   write(*,'(a,f10.6)')'Gather      ',seconds(t2)
      if ( instr .ne. 0 )
     *   write(*,'(a,f10.6)')'Bit reversal',seconds(times)
c
c Main loop over dimensions
c
      do idim = 1, ndim
         lensidim = 2**lens(idim)
c
c Find prime factors
c
         times = seconds(0.0)
         call factor ( lensidim, ifac, nfac, nfmax, ipr, npr )
         if ( instr .ne. 0 )
     *      write(*,'(a,f10.6)')'factor',seconds(times)
c
c First butterfly needs no multiplies
c
         times = seconds(0.0)
         ls = lip
         lip = lop
         lop = ls
         lopfac = lentot/ifac(1)
         icol = 1
         if ( ifac(1) .eq. 2 ) then
c dir: ignore recrdeps(dr,di)
            do i = 0, lopfac - 1
               d0r = dr(2*i,lop)
               dr(i       ,lip) = d0r + dr(2*i+1,lop)
               dr(i+lopfac,lip) = d0r - dr(2*i+1,lop)
               d0i = di(2*i,lop)
               di(i       ,lip) = d0i + di(2*i+1,lop)
               di(i+lopfac,lip) = d0i - di(2*i+1,lop)
            enddo
            icol = icol + 1
            f = 4*lopfac
         else if ( ifac(1) .eq. 4 ) then
c dir: ignore recrdeps(dr,di)
            do i = 0, lopfac - 1
               d0x = dr(4*i  ,lop)
               d2x = dr(4*i+2,lop)
               d0r = d0x + dr(4*i+1,lop)
               d1r = d2x + dr(4*i+3,lop)
               d2r = d0x - dr(4*i+1,lop)
               d3r = d2x - dr(4*i+3,lop)
               d0x = di(4*i  ,lop)
               d2x = di(4*i+2,lop)
               d0i = d0x + di(4*i+1,lop)
               d1i = d2x + di(4*i+3,lop)
               d2i = d0x - di(4*i+1,lop)
               d3i = d2x - di(4*i+3,lop)
               dr(i         ,lip) = d0r + d1r
               dr(i+  lopfac,lip) = d2r - d3i
               dr(i+2*lopfac,lip) = d0r - d1r
               dr(i+3*lopfac,lip) = d2r + d3i
               di(i         ,lip) = d0i + d1i
               di(i+  lopfac,lip) = d2i + d3r
               di(i+2*lopfac,lip) = d0i - d1i
               di(i+3*lopfac,lip) = d2i - d3r
            enddo
            icol = icol + 2
            f = 16*lopfac
         else if ( ifac(1) .eq. 16 ) then
c dir: ignore recrdeps(dr,di)
            do i = 0, lopfac - 1
               k = 16*i
c First section of 4
               r0 = cmplx(dr(k   ,lop),di(k   ,lop))
     *            + cmplx(dr(k+ 1,lop),di(k+ 1,lop))
               r1 = cmplx(dr(k+ 2,lop),di(k+ 2,lop))
     *            + cmplx(dr(k+ 3,lop),di(k+ 3,lop))
               r2 = cmplx(dr(k   ,lop),di(k   ,lop))
     *            - cmplx(dr(k+ 1,lop),di(k+ 1,lop))
               r3 = cmplx(dr(k+ 2,lop),di(k+ 2,lop))
     *            - cmplx(dr(k+ 3,lop),di(k+ 3,lop))
               r3 = cmplx(-imag(r3),real(r3))
               d0 = r0 + r1
               d4 = r2 + r3
               d8 = r0 - r1
               dc = r2 - r3
c Second section of 4
               r0 = cmplx(dr(k+ 4,lop),di(k+ 4,lop))
     *            + cmplx(dr(k+ 5,lop),di(k+ 5,lop))
               r1 = cmplx(dr(k+ 6,lop),di(k+ 6,lop))
     *            + cmplx(dr(k+ 7,lop),di(k+ 7,lop))
               r2 = cmplx(dr(k+ 4,lop),di(k+ 4,lop))
     *            - cmplx(dr(k+ 5,lop),di(k+ 5,lop))
               r3 = cmplx(dr(k+ 6,lop),di(k+ 6,lop))
     *            - cmplx(dr(k+ 7,lop),di(k+ 7,lop))
               r3 = cmplx(-imag(r3),real(r3))
               d1 = r0 + r1
               d5 = r2 + r3
               d9 = r0 - r1
               dd = r2 - r3
               t = d5 * real(coef2)
               d5 = cmplx(real(t)-imag(t),real(t)+imag(t))
               d9 = cmplx(-imag(d9),real(d9))
               t = dd * real(coef2)
               dd = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Third section of 4
               r0 = cmplx(dr(k+ 8,lop),di(k+ 8,lop))
     *            + cmplx(dr(k+ 9,lop),di(k+ 9,lop))
               r1 = cmplx(dr(k+10,lop),di(k+10,lop))
     *            + cmplx(dr(k+11,lop),di(k+11,lop))
               r2 = cmplx(dr(k+ 8,lop),di(k+ 8,lop))
     *            - cmplx(dr(k+ 9,lop),di(k+ 9,lop))
               r3 = cmplx(dr(k+10,lop),di(k+10,lop))
     *            - cmplx(dr(k+11,lop),di(k+11,lop))
               r3 = cmplx(-imag(r3),real(r3))
               d2 = r0 + r1
               d6 = r2 + r3
               da = r0 - r1
               de = r2 - r3
               d6 = d6 * coef1
               t = da * real(coef2)
               da = cmplx(real(t)-imag(t),real(t)+imag(t))
               de = de * coef3
c Fourth section of 4
               r0 = cmplx(dr(k+12,lop),di(k+12,lop))
     *            + cmplx(dr(k+13,lop),di(k+13,lop))
               r1 = cmplx(dr(k+14,lop),di(k+14,lop))
     *            + cmplx(dr(k+15,lop),di(k+15,lop))
               r2 = cmplx(dr(k+12,lop),di(k+12,lop))
     *            - cmplx(dr(k+13,lop),di(k+13,lop))
               r3 = cmplx(dr(k+14,lop),di(k+14,lop))
     *            - cmplx(dr(k+15,lop),di(k+15,lop))
               r3 = cmplx(-imag(r3),real(r3))
               d3 = r0 + r1
               d7 = r2 + r3
               db = r0 - r1
               df = r2 - r3
               d7 = d7 * coef3
               t = db * real(coef2)
               db = cmplx(-real(t)-imag(t),real(t)-imag(t))
               df = - df * coef1
c Second radix-4
c First section of 4
               r0 = d0 + d1
               r1 = d2 + d3
               r2 = d0 - d1
               r3 = d2 - d3
               r3 = cmplx(-imag(r3),real(r3))
               dr(i          ,lip) = real(r0 + r1)
               dr(i+ 4*lopfac,lip) = real(r2 + r3)
               dr(i+ 8*lopfac,lip) = real(r0 - r1)
               dr(i+12*lopfac,lip) = real(r2 - r3)
               di(i          ,lip) = imag(r0 + r1)
               di(i+ 4*lopfac,lip) = imag(r2 + r3)
               di(i+ 8*lopfac,lip) = imag(r0 - r1)
               di(i+12*lopfac,lip) = imag(r2 - r3)
c Second section of 4
               r0 = d4 + d5
               r1 = d6 + d7
               r2 = d4 - d5
               r3 = d6 - d7
               r3 = cmplx(-imag(r3),real(r3))
               dr(i+   lopfac,lip) = real(r0 + r1)
               dr(i+ 5*lopfac,lip) = real(r2 + r3)
               dr(i+ 9*lopfac,lip) = real(r0 - r1)
               dr(i+13*lopfac,lip) = real(r2 - r3)
               di(i+   lopfac,lip) = imag(r0 + r1)
               di(i+ 5*lopfac,lip) = imag(r2 + r3)
               di(i+ 9*lopfac,lip) = imag(r0 - r1)
               di(i+13*lopfac,lip) = imag(r2 - r3)
c Third section of 4
               r0 = d8 + d9
               r1 = da + db
               r2 = d8 - d9
               r3 = da - db
               r3 = cmplx(-imag(r3),real(r3))
               dr(i+ 2*lopfac,lip) = real(r0 + r1)
               dr(i+ 6*lopfac,lip) = real(r2 + r3)
               dr(i+10*lopfac,lip) = real(r0 - r1)
               dr(i+14*lopfac,lip) = real(r2 - r3)
               di(i+ 2*lopfac,lip) = imag(r0 + r1)
               di(i+ 6*lopfac,lip) = imag(r2 + r3)
               di(i+10*lopfac,lip) = imag(r0 - r1)
               di(i+14*lopfac,lip) = imag(r2 - r3)
c Fourth section of 4
               r0 = dc + dd
               r1 = de + df
               r2 = dc - dd
               r3 = de - df
               r3 = cmplx(-imag(r3),real(r3))
               dr(i+ 3*lopfac,lip) = real(r0 + r1)
               dr(i+ 7*lopfac,lip) = real(r2 + r3)
               dr(i+11*lopfac,lip) = real(r0 - r1)
               dr(i+15*lopfac,lip) = real(r2 - r3)
               di(i+ 3*lopfac,lip) = imag(r0 + r1)
               di(i+ 7*lopfac,lip) = imag(r2 + r3)
               di(i+11*lopfac,lip) = imag(r0 - r1)
               di(i+15*lopfac,lip) = imag(r2 - r3)
            enddo
            icol = icol + 4
            f = 168*lopfac
         else
            stop 'Radix not in list.'
         endif
         times = seconds(times)
         if ( instr .ne. 0 )
     *      write(*,'(a,i5,f10.6,f10.3)')'Butterfly 1, factor',
     *        ifac(1),times,1.e-6*f/times
         fft = fft + f
c
c Loop over array doing FFT for rest of stages
c
         if2 = lentot/ifac(1)
         do ibfly = 2, nfac
            times = seconds(0.0)
            ls = lip
            lip = lop
            lop = ls
            ipfac = ifac(ibfly)
            lopfac = lentot/ipfac
c
c Now compute this butterfly
c
	    if2 = if2/ipfac
            if ( ipfac .eq. 2 ) then
c
c Radix 2
c
               if ( if2 .lt. minvec ) then
c dir: ignore recrdeps(dr,di)
                  do i = 0, lopfac - 1
                     dc = cmplx(dr(2*i+1,lop),di(2*i+1,lop))
                     temp = coeff2(i,icol)*dc
	             dr(i       ,lip) = dr(2*i,lop)+real(temp)
	             dr(i+lopfac,lip) = dr(2*i,lop)-real(temp)
	             di(i       ,lip) = di(2*i,lop)+imag(temp)
	             di(i+lopfac,lip) = di(2*i,lop)-imag(temp)
                  enddo
               else
                  do k = 0, lopfac - 1, if2
c dir: ignore recrdeps(dr,di)
                     do j = 0, if2 - 1
                        i = j + k
                        dc = cmplx(dr(2*i+1,lop),di(2*i+1,lop))
                        temp = coeff2(k,icol)*dc
	                dr(i       ,lip) = dr(2*i,lop)+real(temp)
	                dr(i+lopfac,lip) = dr(2*i,lop)-real(temp)
	                di(i       ,lip) = di(2*i,lop)+imag(temp)
	                di(i+lopfac,lip) = di(2*i,lop)-imag(temp)
                     enddo
                  enddo
               endif
               icol = icol + 1
               f = 10*lopfac
            else if ( ipfac .eq. 4 ) then
c
c Radix 4
c
               icol4 = (icol+1)/2
               if ( if2 .lt. minvec ) then
c dir: ignore recrdeps(dr,di)
                  do i = 0, lopfac - 1
                     k = 4*i
                     t0 = cmplx(dr(k  ,lop),di(k  ,lop))
                     t1 = cmplx(dr(k+1,lop),di(k+1,lop))
     *                         * coeff4(i,2,icol4)
                     t2 = cmplx(dr(k+2,lop),di(k+2,lop))
     *                         * coeff4(i,1,icol4)
                     t3 = cmplx(dr(k+3,lop),di(k+3,lop))
     *                         * coeff4(i,3,icol4)
                     r0 = t0 + t1
                     r1 = t2 + t3
                     r2 = t0 - t1
                     r3 = t2 - t3
                     r3 = cmplx(-imag(r3),real(r3))
                     dr(i         ,lip) = real(r0+r1)
                     di(i         ,lip) = imag(r0+r1)
                     dr(i+  lopfac,lip) = real(r2+r3)
                     di(i+  lopfac,lip) = imag(r2+r3)
                     dr(i+2*lopfac,lip) = real(r0-r1)
                     di(i+2*lopfac,lip) = imag(r0-r1)
                     dr(i+3*lopfac,lip) = real(r2-r3)
                     di(i+3*lopfac,lip) = imag(r2-r3)
                  enddo
               else
                  do m = 0, lopfac - 1, if2
c dir: ignore recrdeps(dr,di)
                     do j = 0, if2 - 1
                        i = j + m
                        k = 4*i
			t0 = cmplx(dr(k  ,lop),di(k  ,lop))
			t1 = cmplx(dr(k+1,lop),di(k+1,lop))
     *                          * coeff4(m,2,icol4)
			t2 = cmplx(dr(k+2,lop),di(k+2,lop))
     *                          * coeff4(m,1,icol4)
			t3 = cmplx(dr(k+3,lop),di(k+3,lop))
     *                          * coeff4(m,3,icol4)
			r0 = t0 + t1
			r1 = t2 + t3
			r2 = t0 - t1
			r3 = t2 - t3
			r3 = cmplx(-imag(r3),real(r3))
			dr(i         ,lip) = real(r0+r1)
			di(i         ,lip) = imag(r0+r1)
			dr(i+  lopfac,lip) = real(r2+r3)
			di(i+  lopfac,lip) = imag(r2+r3)
			dr(i+2*lopfac,lip) = real(r0-r1)
			di(i+2*lopfac,lip) = imag(r0-r1)
			dr(i+3*lopfac,lip) = real(r2-r3)
			di(i+3*lopfac,lip) = imag(r2-r3)
                     enddo
                  enddo
               endif
               icol = icol + 2
               f = 34*lopfac
            else if ( ifac(1) .eq. 16 ) then
c
c Radix 16
c
               icol16 = (icol+3)/4
               if ( if2 .lt. minvec ) then
c dir: ignore recrdeps(dr,di)
                  do i = 0, lopfac - 1
                     k = 16*i
c First section of 4
                     t1r = cmr(dr(k+ 1,lop),di(k+ 1,lop),
     *                        coef16(i, 8,icol16))
                     t1i = cmi(dr(k+ 1,lop),di(k+ 1,lop)
     *                        ,coef16(i, 8,icol16))
                     r0 = cmplx(dr(k,lop),di(k,lop)) + cmplx(t1r,t1i)
                     r2 = cmplx(dr(k,lop),di(k,lop)) - cmplx(t1r,t1i)
                     t2r = cmr(dr(k+ 2,lop),di(k+ 2,lop)
     *                        ,coef16(i, 4,icol16))
                     t2i = cmi(dr(k+ 2,lop),di(k+ 2,lop)
     *                        ,coef16(i, 4,icol16))
                     t3r = cmr(dr(k+ 3,lop),di(k+ 3,lop)
     *                        ,coef16(i,12,icol16))
                     t3i = cmi(dr(k+ 3,lop),di(k+ 3,lop)
     *                        ,coef16(i,12,icol16))
                     r1 = cmplx(t2r,t2i) + cmplx(t3r,t3i)
                     r3 = cmplx(t2r,t2i) - cmplx(t3r,t3i)
                     r3 = cmplx(-imag(r3),real(r3))
                     d0 = r0 + r1
                     d4 = r2 + r3
                     d8 = r0 - r1
                     dc = r2 - r3
c Second section of 4
                     t0r = cmr(dr(k+ 4,lop),di(k+ 4,lop)
     *                        ,coef16(i, 2,icol16))
                     t0i = cmi(dr(k+ 4,lop),di(k+ 4,lop)
     *                        ,coef16(i, 2,icol16))
                     t1r = cmr(dr(k+ 5,lop),di(k+ 5,lop)
     *                        ,coef16(i,10,icol16))
                     t1i = cmi(dr(k+ 5,lop),di(k+ 5,lop)
     *                        ,coef16(i,10,icol16))
                     r0 = cmplx(t0r,t0i) + cmplx(t1r,t1i)
                     r2 = cmplx(t0r,t0i) - cmplx(t1r,t1i)
                     t2r = cmr(dr(k+ 6,lop),di(k+ 6,lop)
     *                        ,coef16(i, 6,icol16))
                     t2i = cmi(dr(k+ 6,lop),di(k+ 6,lop)
     *                        ,coef16(i, 6,icol16))
                     t3r = cmr(dr(k+ 7,lop),di(k+ 7,lop)
     *                        ,coef16(i,14,icol16))
                     t3i = cmi(dr(k+ 7,lop),di(k+ 7,lop)
     *                        ,coef16(i,14,icol16))
                     r1 = cmplx(t2r,t2i) + cmplx(t3r,t3i)
                     r3 = cmplx(t2r,t2i) - cmplx(t3r,t3i)
                     r3 = cmplx(-imag(r3),real(r3))
                     d1 = r0 + r1
                     d5 = r2 + r3
                     d9 = r0 - r1
                     dd = r2 - r3
                     t = d5 * real(coef2)
                     d5 = cmplx(real(t)-imag(t),real(t)+imag(t))
                     d9 = cmplx(-imag(d9),real(d9))
                     t = dd * real(coef2)
                     dd = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Third section of 4
                     t0r = cmr(dr(k+ 8,lop),di(k+ 8,lop)
     *                        ,coef16(i, 1,icol16))
                     t0i = cmi(dr(k+ 8,lop),di(k+ 8,lop)
     *                        ,coef16(i, 1,icol16))
                     t1r = cmr(dr(k+ 9,lop),di(k+ 9,lop)
     *                        ,coef16(i, 9,icol16))
                     t1i = cmi(dr(k+ 9,lop),di(k+ 9,lop)
     *                        ,coef16(i, 9,icol16))
                     r0 = cmplx(t0r,t0i) + cmplx(t1r,t1i)
                     r2 = cmplx(t0r,t0i) - cmplx(t1r,t1i)
                     t2r = cmr(dr(k+10,lop),di(k+10,lop)
     *                        ,coef16(i, 5,icol16))
                     t2i = cmi(dr(k+10,lop),di(k+10,lop)
     *                        ,coef16(i, 5,icol16))
                     t3r = cmr(dr(k+11,lop),di(k+11,lop)
     *                        ,coef16(i,13,icol16))
                     t3i = cmi(dr(k+11,lop),di(k+11,lop)
     *                        ,coef16(i,13,icol16))
                     r1 = cmplx(t2r,t2i) + cmplx(t3r,t3i)
                     r3 = cmplx(t2r,t2i) - cmplx(t3r,t3i)
                     r3 = cmplx(-imag(r3),real(r3))
                     d2 = r0 + r1
                     d6 = r2 + r3
                     da = r0 - r1
                     de = r2 - r3
                     d6 = d6 * coef1
                     t = da * real(coef2)
                     da = cmplx(real(t)-imag(t),real(t)+imag(t))
                     de = de * coef3
c Fourth section of 4
                     t0r = cmr(dr(k+12,lop),di(k+12,lop)
     *                        ,coef16(i, 3,icol16))
                     t0i = cmi(dr(k+12,lop),di(k+12,lop)
     *                        ,coef16(i, 3,icol16))
                     t1r = cmr(dr(k+13,lop),di(k+13,lop)
     *                        ,coef16(i,11,icol16))
                     t1i = cmi(dr(k+13,lop),di(k+13,lop)
     *                        ,coef16(i,11,icol16))
                     r0 = cmplx(t0r,t0i) + cmplx(t1r,t1i)
                     r2 = cmplx(t0r,t0i) - cmplx(t1r,t1i)
                     t2r = cmr(dr(k+14,lop),di(k+14,lop)
     *                        ,coef16(i, 7,icol16))
                     t2i = cmi(dr(k+14,lop),di(k+14,lop)
     *                        ,coef16(i, 7,icol16))
                     t3r = cmr(dr(k+15,lop),di(k+15,lop)
     *                        ,coef16(i,15,icol16))
                     t3i = cmi(dr(k+15,lop),di(k+15,lop)
     *                        ,coef16(i,15,icol16))
                     r1 = cmplx(t2r,t2i) + cmplx(t3r,t3i)
                     r3 = cmplx(t2r,t2i) - cmplx(t3r,t3i)
                     r3 = cmplx(-imag(r3),real(r3))
                     d3 = r0 + r1
                     d7 = r2 + r3
                     db = r0 - r1
                     df = r2 - r3
                     d7 = d7 * coef3
                     t = db * real(coef2)
                     db = cmplx(-real(t)-imag(t),real(t)-imag(t))
                     df = - df * coef1
c Second radix-4
c First section of 4
                     r0 = d0 + d1
                     r1 = d2 + d3
                     r2 = d0 - d1
                     r3 = d2 - d3
                     r3 = cmplx(-imag(r3),real(r3))
                     dr(i          ,lip) = real(r0 + r1)
                     dr(i+ 4*lopfac,lip) = real(r2 + r3)
                     dr(i+ 8*lopfac,lip) = real(r0 - r1)
                     dr(i+12*lopfac,lip) = real(r2 - r3)
                     di(i          ,lip) = imag(r0 + r1)
                     di(i+ 4*lopfac,lip) = imag(r2 + r3)
                     di(i+ 8*lopfac,lip) = imag(r0 - r1)
                     di(i+12*lopfac,lip) = imag(r2 - r3)
c Second section of 4
                     r0 = d4 + d5
                     r1 = d6 + d7
                     r2 = d4 - d5
                     r3 = d6 - d7
                     r3 = cmplx(-imag(r3),real(r3))
                     dr(i+   lopfac,lip) = real(r0 + r1)
                     dr(i+ 5*lopfac,lip) = real(r2 + r3)
                     dr(i+ 9*lopfac,lip) = real(r0 - r1)
                     dr(i+13*lopfac,lip) = real(r2 - r3)
                     di(i+   lopfac,lip) = imag(r0 + r1)
                     di(i+ 5*lopfac,lip) = imag(r2 + r3)
                     di(i+ 9*lopfac,lip) = imag(r0 - r1)
                     di(i+13*lopfac,lip) = imag(r2 - r3)
c Third section of 4
                     r0 = d8 + d9
                     r1 = da + db
                     r2 = d8 - d9
                     r3 = da - db
                     r3 = cmplx(-imag(r3),real(r3))
                     dr(i+ 2*lopfac,lip) = real(r0 + r1)
                     dr(i+ 6*lopfac,lip) = real(r2 + r3)
                     dr(i+10*lopfac,lip) = real(r0 - r1)
                     dr(i+14*lopfac,lip) = real(r2 - r3)
                     di(i+ 2*lopfac,lip) = imag(r0 + r1)
                     di(i+ 6*lopfac,lip) = imag(r2 + r3)
                     di(i+10*lopfac,lip) = imag(r0 - r1)
                     di(i+14*lopfac,lip) = imag(r2 - r3)
c Fourth section of 4
                     r0 = dc + dd
                     r1 = de + df
                     r2 = dc - dd
                     r3 = de - df
                     r3 = cmplx(-imag(r3),real(r3))
                     dr(i+ 3*lopfac,lip) = real(r0 + r1)
                     dr(i+ 7*lopfac,lip) = real(r2 + r3)
                     dr(i+11*lopfac,lip) = real(r0 - r1)
                     dr(i+15*lopfac,lip) = real(r2 - r3)
                     di(i+ 3*lopfac,lip) = imag(r0 + r1)
                     di(i+ 7*lopfac,lip) = imag(r2 + r3)
                     di(i+11*lopfac,lip) = imag(r0 - r1)
                     di(i+15*lopfac,lip) = imag(r2 - r3)
                  enddo
               else
                  do m = 0, lopfac - 1, if2
c dir: ignore recrdeps(dr,di)
                     do j = 0, if2 - 1
                        i = j + m
                        k = 16*i
c First section of 4
                        t0=cmplx(dr(k   ,lop),di(k   ,lop))
                        t1=cmplx(dr(k+ 1,lop),di(k+ 1,lop))
     *                         * coef16(m, 8,icol16)
                        r0 = t0 + t1
                        r2 = t0 - t1
                        t2=cmplx(dr(k+ 2,lop),di(k+ 2,lop))
     *                         * coef16(m, 4,icol16)
                        t3=cmplx(dr(k+ 3,lop),di(k+ 3,lop))
     *                         * coef16(m,12,icol16)
                        r1 = t2 + t3
                        r3 = t2 - t3
                        r3 = cmplx(-imag(r3),real(r3))
                        d0 = r0 + r1
                        d4 = r2 + r3
                        d8 = r0 - r1
                        dc = r2 - r3
c Second section of 4
                        t0=cmplx(dr(k+ 4,lop),di(k+ 4,lop))
     *                         * coef16(m, 2,icol16)
                        t1=cmplx(dr(k+ 5,lop),di(k+ 5,lop))
     *                         * coef16(m,10,icol16)
                        r0 = t0 + t1
                        r2 = t0 - t1
                        t2=cmplx(dr(k+ 6,lop),di(k+ 6,lop))
     *                         * coef16(m, 6,icol16)
                        t3=cmplx(dr(k+ 7,lop),di(k+ 7,lop))
     *                         * coef16(m,14,icol16)
                        r1 = t2 + t3
                        r3 = t2 - t3
                        r3 = cmplx(-imag(r3),real(r3))
                        d1 = r0 + r1
                        d5 = r2 + r3
                        d9 = r0 - r1
                        dd = r2 - r3
                        t = d5 * real(coef2)
                        d5 = cmplx(real(t)-imag(t),real(t)+imag(t))
                        d9 = cmplx(-imag(d9),real(d9))
                        t = dd * real(coef2)
                        dd = cmplx(-real(t)-imag(t),real(t)-imag(t))
c Third section of 4
                        t0=cmplx(dr(k+ 8,lop),di(k+ 8,lop))
     *                         * coef16(m, 1,icol16)
                        t1=cmplx(dr(k+ 9,lop),di(k+ 9,lop))
     *                         * coef16(m, 9,icol16)
                        r0 = t0 + t1
                        r2 = t0 - t1
                        t2=cmplx(dr(k+10,lop),di(k+10,lop))
     *                         * coef16(m, 5,icol16)
                        t3=cmplx(dr(k+11,lop),di(k+11,lop))
     *                         * coef16(m,13,icol16)
                        r1 = t2 + t3
                        r3 = t2 - t3
                        r3 = cmplx(-imag(r3),real(r3))
                        d2 = r0 + r1
                        d6 = r2 + r3
                        da = r0 - r1
                        de = r2 - r3
                        d6 = d6 * coef1
                        t = da * real(coef2)
                        da = cmplx(real(t)-imag(t),real(t)+imag(t))
                        de = de * coef3
c Fourth section of 4
                        t0=cmplx(dr(k+12,lop),di(k+12,lop))
     *                         * coef16(m, 3,icol16)
                        t1=cmplx(dr(k+13,lop),di(k+13,lop))
     *                         * coef16(m,11,icol16)
                        r0 = t0 + t1
                        r2 = t0 - t1
                        t2=cmplx(dr(k+14,lop),di(k+14,lop))
     *                         * coef16(m, 7,icol16)
                        t3=cmplx(dr(k+15,lop),di(k+15,lop))
     *                         * coef16(m,15,icol16)
                        r1 = t2 + t3
                        r3 = t2 - t3
                        r3 = cmplx(-imag(r3),real(r3))
                        d3 = r0 + r1
                        d7 = r2 + r3
                        db = r0 - r1
                        df = r2 - r3
                        d7 = d7 * coef3
                        t = db * real(coef2)
                        db = cmplx(-real(t)-imag(t),real(t)-imag(t))
                        df = - df * coef1
c Second radix-4
c First section of 4
                        r0 = d0 + d1
                        r1 = d2 + d3
                        r2 = d0 - d1
                        r3 = d2 - d3
                        r3 = cmplx(-imag(r3),real(r3))
                        dr(i          ,lip) = real(r0 + r1)
                        dr(i+ 4*lopfac,lip) = real(r2 + r3)
                        dr(i+ 8*lopfac,lip) = real(r0 - r1)
                        dr(i+12*lopfac,lip) = real(r2 - r3)
                        di(i          ,lip) = imag(r0 + r1)
                        di(i+ 4*lopfac,lip) = imag(r2 + r3)
                        di(i+ 8*lopfac,lip) = imag(r0 - r1)
                        di(i+12*lopfac,lip) = imag(r2 - r3)
c Second section of 4
                        r0 = d4 + d5
                        r1 = d6 + d7
                        r2 = d4 - d5
                        r3 = d6 - d7
                        r3 = cmplx(-imag(r3),real(r3))
                        dr(i+   lopfac,lip) = real(r0 + r1)
                        dr(i+ 5*lopfac,lip) = real(r2 + r3)
                        dr(i+ 9*lopfac,lip) = real(r0 - r1)
                        dr(i+13*lopfac,lip) = real(r2 - r3)
                        di(i+   lopfac,lip) = imag(r0 + r1)
                        di(i+ 5*lopfac,lip) = imag(r2 + r3)
                        di(i+ 9*lopfac,lip) = imag(r0 - r1)
                        di(i+13*lopfac,lip) = imag(r2 - r3)
c Third section of 4
                        r0 = d8 + d9
                        r1 = da + db
                        r2 = d8 - d9
                        r3 = da - db
                        r3 = cmplx(-imag(r3),real(r3))
                        dr(i+ 2*lopfac,lip) = real(r0 + r1)
                        dr(i+ 6*lopfac,lip) = real(r2 + r3)
                        dr(i+10*lopfac,lip) = real(r0 - r1)
                        dr(i+14*lopfac,lip) = real(r2 - r3)
                        di(i+ 2*lopfac,lip) = imag(r0 + r1)
                        di(i+ 6*lopfac,lip) = imag(r2 + r3)
                        di(i+10*lopfac,lip) = imag(r0 - r1)
                        di(i+14*lopfac,lip) = imag(r2 - r3)
c Fourth section of 4
                        r0 = dc + dd
                        r1 = de + df
                        r2 = dc - dd
                        r3 = de - df
                        r3 = cmplx(-imag(r3),real(r3))
                        dr(i+ 3*lopfac,lip) = real(r0 + r1)
                        dr(i+ 7*lopfac,lip) = real(r2 + r3)
                        dr(i+11*lopfac,lip) = real(r0 - r1)
                        dr(i+15*lopfac,lip) = real(r2 - r3)
                        di(i+ 3*lopfac,lip) = imag(r0 + r1)
                        di(i+ 7*lopfac,lip) = imag(r2 + r3)
                        di(i+11*lopfac,lip) = imag(r0 - r1)
                        di(i+15*lopfac,lip) = imag(r2 - r3)
                     enddo
                  enddo
               endif
               icol = icol + 4
               f = 258*lopfac
            else
               stop 'Radix not in list.'
            endif
            times = seconds(times)
            if ( instr .ne. 0 )
     *         write(*,'(a,i5,f10.6,f10.3)')'Butterfly n, factor',
     *           ipfac,times,1.e-6*f/times
            fft = fft + f
         enddo
      enddo
c
c Point to start of result
c
      istart = (lip-1) * ldd
c 
c Done
c
      end
