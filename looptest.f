@process directive(' dir:')
      subroutine loop ( dr, di, lentot, lensidim, ic, irev )
      dimension dr(0:*), di(0:*), irev(0:*)
c
      lopfac = lentot/2
      lip = lentot
      lop = 0
c------------------- Problem 1 ----------------------------------------
c Loop on k does note vectorize
c dir: ignore recrdeps(dr,di)
      do k = 0, lensidim - 1
         ir = irev(ic*k)
         do j = 0, lentot - 1, lensidim
            jl = j + lop
            i = j + k
            dr(i+lip) = dr(ic*k+jl)
            di(i+lip) = di(ic*k+jl)
         enddo
      enddo
c Loop on k does vectorize
      do j = 0, lentot - 1, lensidim
c dir: ignore recrdeps(dr,di)
         do k = 0, lensidim - 1
            ir = irev(ic*k)
            jl = j + lop
            i = j + k
            dr(i+lip) = dr(ir+jl)
            di(i+lip) = di(ir+jl)
         enddo
      enddo
c------------------- Problem 2 ----------------------------------------
c Generates unnecessary loads
c dir: ignore recrdeps(dr,di)
      do i = 0, lopfac - 1
         dr(i+lip       ) = dr(2*i+lop) + dr(2*i+lop+1)
         di(i+lip       ) = di(2*i+lop) + di(2*i+lop+1)
         dr(i+lip+lopfac) = dr(2*i+lop) - dr(2*i+lop+1)
         di(i+lip+lopfac) = di(2*i+lop) - di(2*i+lop+1)
      enddo
c
      end
