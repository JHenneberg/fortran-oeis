MODULE sequence_mod
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: tSequence, tSequences
  PUBLIC :: get_digits

  TYPE :: tSequence
    INTEGER(8) :: values(16) = 0
    INTEGER(8) :: nDigits(16) = 0
    INTEGER :: length = 1
  CONTAINS
    PROCEDURE, PUBLIC :: initalize => initalize_tSequence
    PROCEDURE, PUBLIC :: add_value => add_value_tSequence
    PROCEDURE, PUBLIC :: reset => reset_tSequence
  END TYPE

  TYPE :: tSequences
    CLASS(tSequence), ALLOCATABLE :: Sequences(:)
  CONTAINS
    PROCEDURE, PUBLIC :: initalize => initalize_tSequences
    PROCEDURE, PUBLIC :: add_sequence_if_valid => add_sequence_if_valid_tSequences
    PROCEDURE, PUBLIC :: get_last => get_last_tSequences
    PROCEDURE, PUBLIC :: print => print_tSequences
    !FINAL :: destroy_tSequences
  END TYPE

CONTAINS
  SUBROUTINE initalize_tSequence(this, value)
    IMPLICIT NONE

    CLASS(tSequence), INTENT(INOUT) :: this
    INTEGER(8), INTENT(IN) :: value

    this%values(this%length) = value
    this%nDigits(this%length) = get_nDigit(value)
    END SUBROUTINE initalize_tSequence


  SUBROUTINE add_value_tSequence(this, value)
    IMPLICIT NONE

    CLASS(tSequence), INTENT(INOUT) :: this
    INTEGER(8), INTENT(IN) :: value

    this%values(this%length + 1) = value
    this%length = this%length + 1
    this%nDigits(this%length) = get_nDigit(value)
  END SUBROUTINE add_value_tSequence


  SUBROUTINE reset_tSequence(this)
    IMPLICIT NONE

    CLASS(tSequence), INTENT(INOUT) :: this

    this%values = 0
    this%nDigits = 0
    this%length = 1
  END SUBROUTINE reset_tSequence


  SUBROUTINE initalize_tSequences(this, value)
    IMPLICIT NONE

    CLASS(tSequences), INTENT(INOUT) :: this
    INTEGER(8), INTENT(IN) :: value

    TYPE(tSequence) :: seq

    IF (ALLOCATED(this%Sequences)) THEN
      CALL this%Sequences(SIZE(this%Sequences))%reset()
      CALL this%Sequences(SIZE(this%Sequences))%initalize(value)
    ELSE
      ALLOCATE(this%Sequences(2))
      CALL this%Sequences(1)%initalize(value)
      CALL this%Sequences(2)%initalize(value)
    END IF
  END SUBROUTINE


  SUBROUTINE add_sequence_if_valid_tSequences(this, sequence)
    !! add a sequence if the sequence is "better" (has more steps and value is lower)
    IMPLICIT NONE

    CLASS(tSequences), INTENT(INOUT) :: this
    TYPE(tSequence), INTENT(IN) :: sequence

    TYPE(tSequences) :: tmp_sequences
    INTEGER :: nSequence

    IF (ALLOCATED(this%Sequences)) THEN
      IF (this%Sequences(SIZE(this%Sequences) - 1)%length < sequence%length) THEN
        nSequence = SIZE(this%Sequences)
        ALLOCATE(tmp_sequences%Sequences, SOURCE = this%Sequences)
        DEALLOCATE(this%Sequences)

        ALLOCATE(this%Sequences(nSequence + 1)) ! allocate one more sequence, for further tests
        this%Sequences(1:nSequence) = tmp_sequences%Sequences ! save all old sequences
        this%Sequences(nSequence) = sequence ! add new sequence on last position
        CALL this%Sequences(nSequence + 1)%reset() !

        DEALLOCATE(tmp_sequences%Sequences)
      ELSE
        CALL this%Sequences(SIZE(this%Sequences))%reset()
      END IF
    ELSE
      ALLOCATE(this%Sequences(1))
      this%Sequences(1) = sequence
    END IF
  END SUBROUTINE add_sequence_if_valid_tSequences


  FUNCTION get_last_tSequences(this) RESULT(sequence)
    IMPLICIT NONE

    CLASS(tSequences), INTENT(INOUT) :: this
    TYPE(tSequence) :: sequence

    sequence = this%Sequences(SIZE(this%Sequences))
  END FUNCTION


  SUBROUTINE print_tSequences(this)
    IMPLICIT NONE

    CLASS(tSequences), INTENT(IN) :: this
    INTEGER :: i

    DO i = 1, SIZE(this%Sequences) - 1
      WRITE(*, '(I4, 12I12)') this%Sequences(i)%length, this%Sequences(i)%values(1:12)
    END DO
  END SUBROUTINE


  FUNCTION get_digits(value, nDigit) RESULT(digits)
    IMPLICIT NONE

    INTEGER(8), INTENT(IN) :: value
    INTEGER(8), INTENT(IN) :: nDigit
    INTEGER(8) :: rem
    INTEGER :: digits(nDigit)
    INTEGER :: iDigit

    rem = value
    DO iDigit = 1, nDigit
      digits(iDigit) = rem - (rem / 10) * 10
      rem = rem / 10
    END DO
  END FUNCTION get_digits


  FUNCTION get_nDigit(value) RESULT(nDigit)
    IMPLICIT NONE

    INTEGER(8), INTENT(IN) :: value
    INTEGER :: nDigit

    nDigit = FLOOR(LOG10(REAL(value)) + 1)
  END function
END MODULE sequence_mod