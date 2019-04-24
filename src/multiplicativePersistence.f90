MODULE multiplicative_persistence_mod
  ! Smallest number of multiplicative persistence n.
  ! http://oeis.org/A003001
  USE sequence_mod
  IMPLICIT NONE
CONTAINS
  SUBROUTINE calc_multiplicative_persistence(sequences, iseq)
    IMPLICIT NONE

    TYPE(tSequences), INTENT(INOUT) :: sequences
    INTEGER, OPTIONAL, INTENT(IN) :: iseq

    TYPE(tSequence) :: seq
    INTEGER(8) :: product
    INTEGER :: iDigit, iStep
    INTEGER, ALLOCATABLE :: digits(:)

    IF (PRESENT(iseq)) THEN
      seq = sequences%Sequences(iseq)
    ELSE
      seq = sequences%get_last()
    END IF

    iStep = 1
    DO WHILE (seq%nDigits(iStep) > 1)
      ALLOCATE(digits, SOURCE = get_digits(seq%values(iStep), seq%nDigits(iStep)))
      product = 1
      DO iDigit = 1, seq%nDigits(iStep)
        product = product * digits(iDigit)
      END DO
      iStep = iStep + 1
      CALL seq%add_value(product)
      DEALLOCATE(digits)
    END DO

    IF (.NOT. PRESENT(iseq)) &
      CALL sequences%add_sequence_if_valid(seq)
  END SUBROUTINE
END MODULE