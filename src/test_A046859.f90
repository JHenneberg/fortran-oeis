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


    call test_case_create('calc_A046859', SUITE)



    if (present(passed)) &
      passed = all(test_case_get_assert_results('calc_A046859', SUITE))
  end subroutine test_calc_A046859
end module test_A046859_mod