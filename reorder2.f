c Build some auxiliary bit reversal arrays
c
      subroutine reorder2 ( lentot, maxlen, ndim, lens, irev, irex )
      dimension irev(0:*), irex(0:*), lens(ndim)
c
c Build composite bit reversal array
c
      irp = 1
      do i = 0, lentot - 1
         irex(i) = 0
      enddo
      do id = 1, ndim
         ia = maxlen/lens(id)
         mask1 = maxlen - 1
         mask2 = not(lens(id)-1)
         k = 0
         do i = 0, lentot/irp - 1
            iseg = iand(i,mask2)
            ir = irev(iand(ia*i,mask1))
            do j = 0, irp - 1
               irex(k) = irex(k) + ir*irp
               k = k + 1
            enddo
         enddo
         irp = irp * lens(id)
      enddo
c
      end
