program fortran_oeis
  use test_A003001_mod
  use A003001_mod
  implicit none

  type(tSequences) :: seq_A003001
  integer(8) :: i

  if (.not. test_A003001()) &
    write(*,*) 'Unit Test failed'

  do i = 0, 1D7
    call seq_A003001%initalize(i)
    call A003001(seq_A003001)
  end do

  call seq_A003001%print()
end program fortran_oeis