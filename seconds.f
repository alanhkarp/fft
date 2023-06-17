c Return the CPU time difference in seconds
c
      function seconds ( told )
      double precision t, told
c
      call cputime ( t, irc )
c     call clockx ( t )
      seconds = max(1.d-6*t-told,1.d-20)
c
      end
