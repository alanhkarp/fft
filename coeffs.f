@process novector
c Compute coefficients for FFT
c Simplest form but uses lots of function calls
c
      subroutine coeffs ( n, coeff )
      complex coeff(0:*)
c
      angle = 8.0*atan(1.0)/n      ! 2*pi/n
      coeff(0) = cmplx(1.0,0.0)
      do i = 1, n - 1
         coeff(i) = cmplx(cos(i*angle),sin(i*angle))
      enddo
      end
