@process directive(' dir:') 
c Bit reverse the index vector of length n
      subroutine reorder ( n, list )
      dimension list(0:n-1)
c
c Bit reversal defined recursively
c     J(n+1) = (2*J(n)),(2*J(n)+1)
c
      list(0) = 0
      len = 1
      do while ( len .lt. n )
c dir: ignore recrdeps(list)
         do i = 0, len-1
            list(i) = 2*list(i)
            list(i+len) = list(i) + 1
         enddo
         len = 2 * len
      enddo
c
      end
