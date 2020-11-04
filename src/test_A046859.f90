module test_A046859_mod
  use unit_test
  use A046859_mod
  implicit none
  private
  public :: test_A046859

  type(test_suite_type) :: SUITE
contains
  subroutine test_A046859()
    implicit none

    SUITE%name = 'A046859_mod'

    call test_calc_A046859()

    call test_suite_report(SUITE)
  end subroutine test_A046859


  subroutine test_calc_A046859(passed)
    implicit none

    logical(4), optional, intent(inout) :: passed

    integer :: pair00, pair11

    call test_case_create('calc_A046859', SUITE)

    pair00 = calc_A046859(0, 0)
    pair11 = calc_A046859(1, 1)

    call assert_equal(pair00, 1, FILE_NAME = __FILE__, LINE_NUMBER = __LINE__, SUITE = SUITE)
    call assert_equal(pair11, 3, FILE_NAME = __FILE__, LINE_NUMBER = __LINE__, SUITE = SUITE)

    if (present(passed)) &
      passed = all(test_case_get_assert_results('calc_A046859', SUITE))
  end subroutine test_calc_A046859
end module test_A046859_mod