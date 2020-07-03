module var_global
  implicit none
  
  integer, parameter :: rkd = 8 !< real(rkd) for double precision
  integer, parameter :: rk4 = 4 !< real(rk4) for single precision
  
  integer (kind = rk4) :: nn0   !< Number of nodes along x direction
  integer (kind = rk4) :: nn1   !< Number of nodes along y direction
  
  Real (kind = rk4)  :: tau        !< Relaxation time
  Real (kind = rk4)  :: rho0       !< Initial fluid density
  Real (kind = rk4)  :: u00        !< Initial fluid velocity component in x direction
  Real (kind = rk4)  :: u01        !< Initial fluid velocity component in y direction
  
end module var_global