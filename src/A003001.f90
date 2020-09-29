module A003001_mod
  ! Smallest number of multiplicative persistence n.
  ! http://oeis.org/A003001
  use sequence_mod
  implicit none
contains
  subroutine A003001(sequences, iseq)
    implicit none

    type(tSequences), intent(inout) :: sequences
    integer, optional, intent(in) :: iseq

    type(tSequence) :: seq
    integer(8) :: product
    integer :: iDigit, iStep
    integer, allocatable :: digits(:)

    if (present(iseq)) then
      seq = sequences%Sequences(iseq)
    else
      seq = sequences%get_last()
    end if

    iStep = 1
    do while (seq%nDigits(iStep) > 1)
      allocate(digits, SOURCE = get_digits(seq%values(iStep), seq%nDigits(iStep)))
      product = 1
      do iDigit = 1, seq%nDigits(iStep)
        product = product * digits(iDigit)
      end do
      iStep = iStep + 1
      call seq%add_value(product)
      deallocate(digits)
    end do

    if (.not. present(iseq)) &
      call sequences%add_sequence_if_valid(seq)
  end subroutine A003001
end module A003001_mod