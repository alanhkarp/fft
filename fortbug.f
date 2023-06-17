@process novector
c Test for possible Fortran bug
c
      dimension d(100)
      iseed = 7
      do i = 1, 5
         d(i) = ran2(iseed) - 0.5
      write(*,'(a,2i10,2f10.3)')'i, is, d',i,iseed,d(i)
      enddo
      end
@process novector
      FUNCTION RAN2(IDUM)
c     save
      PARAMETER (M=714025,IA=1366,IC=150889,RM=1.4005112E-6)
      DIMENSION IR(97)
      DATA IFF /0/
      data iy/0/     ! Avoid compiler message about used before defined
      IF(IDUM.LT.0.OR.IFF.EQ.0)THEN
        IFF=1
        IDUM=MOD(IC-IDUM,M)
        DO 11 J=1,97
          IDUM=MOD(IA*IDUM+IC,M)
          IR(J)=IDUM
11      CONTINUE
        IDUM=MOD(IA*IDUM+IC,M)
        IY=IDUM
      ENDIF
      J=1+(97*IY)/M
c     IF(J.GT.97.OR.J.LT.1)stop 'J out of range'
      IF(J.GT.97.OR.J.LT.1)then
      write(*,'(a,3i10)')'j, iy, m',j,iy,m
      stop 'J out of range'
      endif
      IY=IR(J)
      RAN2=IY*RM
      IDUM=MOD(IA*IDUM+IC,M)
      IR(J)=IDUM
      RETURN
      END
