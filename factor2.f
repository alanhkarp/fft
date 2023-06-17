@process novector
c Find the factors of 2**n
      subroutine factor2 ( n, ifac, nfac, nfacmax )
      parameter ( nprimes = 2 )
      dimension iprimes(nprimes), ifac(nfac)
      data iprimes/10, 1/
c
c Find the prime factors
c
      nfac = 0
      nred = n
      do ipr = 1, nprimes
         do while ( nred .gt. iprimes(ipr) )
            nfac = nfac + 1
            if ( nfac .gt. nfacmax ) stop 'N has too many factors.'
            ifac(nfac) = 2**iprimes(ipr)
            nred = nred - iprimes(ipr)
         enddo
      enddo
c
      end
