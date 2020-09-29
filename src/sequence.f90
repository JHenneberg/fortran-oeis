module sequence_mod
  implicit none
  private
  public :: tSequence, tSequences
  public :: get_digits

  type :: tSequence
    integer(8) :: values(16) = 0
    integer(8) :: nDigits(16) = 0
    integer :: length = 1
  contains
    PROCEDURE, public :: initalize => initalize_tSequence
    PROCEDURE, public :: add_value => add_value_tSequence
    PROCEDURE, public :: reset => reset_tSequence
  end type

  type :: tSequences
    class(tSequence), allocatable :: Sequences(:)
  contains
    PROCEDURE, public :: initalize => initalize_tSequences
    PROCEDURE, public :: add_sequence_if_valid => add_sequence_if_valid_tSequences
    PROCEDURE, public :: get_last => get_last_tSequences
    PROCEDURE, public :: print => print_tSequences
    !FINAL :: destroy_tSequences
  end type

contains
  subroutine initalize_tSequence(this, value)
    implicit none

    class(tSequence), intent(inout) :: this
    integer(8), intent(in) :: value

    this%values(this%length) = value
    this%nDigits(this%length) = get_nDigit(value)
  end subroutine initalize_tSequence


  subroutine add_value_tSequence(this, value)
    implicit none

    class(tSequence), intent(inout) :: this
    integer(8), intent(in) :: value

    this%values(this%length + 1) = value
    this%length = this%length + 1
    this%nDigits(this%length) = get_nDigit(value)
  end subroutine add_value_tSequence


  subroutine reset_tSequence(this)
    implicit none

    class(tSequence), intent(inout) :: this

    this%values = 0
    this%nDigits = 0
    this%length = 1
  end subroutine reset_tSequence


  subroutine initalize_tSequences(this, value)
    implicit none

    class(tSequences), intent(inout) :: this
    integer(8), intent(in) :: value

    type(tSequence) :: seq

    if (allocateD(this%Sequences)) then
      call this%Sequences(SIZE(this%Sequences))%reset()
      call this%Sequences(SIZE(this%Sequences))%initalize(value)
    else
      allocate(this%Sequences(2))
      call this%Sequences(1)%initalize(value)
      call this%Sequences(2)%initalize(value)
    end if
  end subroutine initalize_tSequences


  subroutine add_sequence_if_valid_tSequences(this, sequence)
    !! add a sequence if the sequence is "better" (has more steps and value is lower)
    implicit none

    class(tSequences), intent(inout) :: this
    type(tSequence), intent(in) :: sequence

    type(tSequences) :: tmp_sequences
    integer :: nSequence

    if (allocateD(this%Sequences)) then
      if (this%Sequences(SIZE(this%Sequences) - 1)%length < sequence%length) then
        nSequence = SIZE(this%Sequences)
        allocate(tmp_sequences%Sequences, SOURCE = this%Sequences)
        deallocate(this%Sequences)

        allocate(this%Sequences(nSequence + 1)) ! allocate one more sequence, for further tests
        this%Sequences(1:nSequence) = tmp_sequences%Sequences ! save all old sequences
        this%Sequences(nSequence) = sequence ! add new sequence on last position
        call this%Sequences(nSequence + 1)%reset() !

        deallocate(tmp_sequences%Sequences)
      else
        call this%Sequences(SIZE(this%Sequences))%reset()
      end if
    else
      allocate(this%Sequences(1))
      this%Sequences(1) = sequence
    end if
  end subroutine add_sequence_if_valid_tSequences


  function get_last_tSequences(this) result(sequence)
    implicit none

    class(tSequences), intent(inout) :: this
    type(tSequence) :: sequence

    sequence = this%Sequences(SIZE(this%Sequences))
  end function get_last_tSequences


  subroutine print_tSequences(this)
    implicit none

    class(tSequences), intent(in) :: this
    integer :: i

    do i = 1, SIZE(this%Sequences) - 1
      WRITE(*, '(I4, 12I12)') this%Sequences(i)%length, this%Sequences(i)%values(1:12)
    end do
  end subroutine print_tSequences


  function get_digits(value, nDigit) result(digits)
    implicit none

    integer(8), intent(in) :: value
    integer(8), intent(in) :: nDigit
    integer(8) :: rem
    integer :: digits(nDigit)
    integer :: iDigit

    rem = value
    do iDigit = 1, nDigit
      digits(iDigit) = rem - (rem / 10) * 10
      rem = rem / 10
    end do
  end function get_digits


  function get_nDigit(value) result(nDigit)
    implicit none

    integer(8), intent(in) :: value
    integer :: nDigit

    nDigit = FLOOR(LOG10(REAL(value)) + 1)
  end function get_nDigit
end module sequence_mod