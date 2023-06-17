@process novector
c Find the factors of n contained in the list iprimes
c NB. The list need not contain primes; any factors can be used
c
      subroutine factor ( n, ifac, nfac, nfacmax, iprimes, nprimes )
      dimension iprimes(nprimes), ifac(nfac)
c
c Find the prime factors
c
      nfac = 0
      ipr = 0
      nred = n
      do while ( nred .gt. 1 .and. ipr .lt. nprimes )
         ipr = ipr + 1
         ip = iprimes(ipr)
         do while ( mod(nred,ip) .eq. 0 )
            nfac = nfac + 1
            if ( nfac .gt. nfacmax ) stop 'N has too many factors.'
            ifac(nfac) = ip 
            nred = nred / ip
         enddo
      enddo
      if ( nred .ne. 1 ) stop 'N has an invalid prime factor.'
c
      end
