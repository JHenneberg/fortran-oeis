module A046859_mod
  ! Simplified Ackermann function (main diagonal of Ackermann-Péter function).
  ! https://oeis.org/A046859
  implicit none
  private
  public :: calc_A046859, calc_sequence_A046859
contains
  subroutine calc_sequence_A046859()
    implicit none

    integer :: i, results(4)

    do i = 1, 4
      results(i) = calc_A046859(i, i)
    end do

    write(*, *) results
  end subroutine calc_sequence_A046859

  recursive function calc_A046859(x, y) result(res)
    implicit none

    integer, intent(in) :: x, y
    integer :: res

    if (x == 0) then
      res = y + 1
    else if (y == 0) then
      res = calc_A046859(x - 1, 1);
    else
      res = calc_A046859(x - 1, calc_A046859(x, y - 1))
    end if
  end function calc_A046859
end module A046859_mod