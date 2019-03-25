MODULE sequence_mod
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: tSequence
  PUBLIC :: get_digits

  TYPE :: tSequence
    INTEGER(8) :: values(16) = 0
    INTEGER(8) :: nDigits(16) = 0
    INTEGER :: length = 1
  CONTAINS
    PROCEDURE, PUBLIC :: initalize => initalize_tSequence
    PROCEDURE, PUBLIC :: add_value => add_value_tSequence
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