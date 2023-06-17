c Test mixed radix reorder routine
c
      parameter ( n = 2**7 )
      dimension irev(0:n-1), ifac(50), iprimes(2)
      iprimes(2) = 2
      write(*,*)'Enter radix'
      read(*,*) iprimes(1)
      call factor ( n, ifac, nfac, 50, iprimes, 2 )
      write(*,'(16i5)')(ifac(i),i=1,nfac)
      call reorderm ( n, irev, ifac, nfac )
      write(*,'(8i10)')(irev(i),i=0,127)
      end
