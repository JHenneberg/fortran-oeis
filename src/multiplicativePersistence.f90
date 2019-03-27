MODULE multiplicative_persistence_mod
  ! Smallest number of multiplicative persistence n.
  ! http://oeis.org/A003001
  USE sequence_mod
  IMPLICIT NONE
CONTAINS
  SUBROUTINE calc_multiplicative_persistence(sequence)
    IMPLICIT NONE

    CLASS(tSequence), INTENT(INOUT) :: sequence
    INTEGER(8) :: product
    INTEGER :: iDigit, iStep
    INTEGER, ALLOCATABLE :: digits(:)

    iStep = 1
    DO WHILE (sequence%nDigits(iStep) > 1)
      ALLOCATE(digits, SOURCE = get_digits(sequence%values(iStep), sequence%nDigits(iStep)))
      product = 1
      DO iDigit = 1, sequence%nDigits(iStep)
        product = product * digits(iDigit)
      END DO
      iStep = iStep + 1
      CALL sequence%add_value(product)
      DEALLOCATE(digits)
    END DO
  END SUBROUTINE
END MODULE