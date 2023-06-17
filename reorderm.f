@process directive(' dir:') vector
c Reorder a mixed radix array for FFT
      subroutine reorderm ( n, list, ifac, nfac )
      dimension list(0:n-1), ifac(nfac)
c
c Bit reversal defined as a matrix transpose, e.g.
c     A(k,j,i) is bit reversal of input A(i,j,k)
c where each dimension is of length equal to one of the prime factors
c
c Reorder index vector for mixed radix
c
      list(0) = 0
      irp = 1
      do ip = 1, nfac
         do j = 1, irp-1
            list(j) = ifac(ip)*list(j)
         enddo
         do k = 1, ifac(ip) - 1
c dir: ignore recrdeps(list)
            do j = 0, irp-1
               list(j+k*irp) = list(j) + k
            enddo
         enddo
         irp = irp*ifac(ip)
      enddo
c
      end
