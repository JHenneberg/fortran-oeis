module test_A003001_mod
  use A003001_mod
  implicit none
  private
  public :: test_A003001
contains
  function test_A003001() result(passed)
    implicit none

    logical :: passed

    type(tSequences) :: seqs

    integer(8) :: Sequence05_proof(06)
    integer(8) :: Sequence06_proof(07)
    integer(8) :: Sequence07_proof(08)
    integer(8) :: Sequence08_proof(09)
    integer(8) :: Sequence09_proof(10)
    integer(8) :: Sequence10_proof(11)
    integer(8) :: Sequence11_proof(12)

    passed = .true.

    ! http://oeis.org/A121105
    Sequence05_proof = [int(679, 8), int(378, 8), int(168, 8), int(48, 8), int(32, 8), int(6, 8)]

    ! http://oeis.org/A121106
    Sequence06_proof = [int(6788, 8), int(2688, 8), int(768, 8), int(336, 8), int(54, 8), int(20, 8), int(0, 8)]

    ! http://oeis.org/A121107
    Sequence07_proof = [int(68889, 8), int(27648, 8), int(2688, 8), int(768, 8), int(336, 8), int(54, 8), int(20, 8), int(0, 8)]

    ! http://oeis.org/A121108
    Sequence08_proof = [int(2677889, 8), int(338688, 8), int(27648, 8), int(2688, 8), int(768, 8), int(336, 8), int(54, 8), int(20, 8), int(0, 8)]

    ! http://oeis.org/A121109
    Sequence09_proof = [int(26888999, 8), int(4478976, 8), int(338688, 8), int(27648, 8), int(2688, 8), int(768, 8), int(336, 8), int(54, 8), int(20, 8), int(0, 8)]

    ! http://oeis.org/A121110
    Sequence10_proof = [int(3778888999, 8), int(438939648, 8), int(4478976, 8), int(338688, 8), int(27648, 8), int(2688, 8), int(768, 8), int(336, 8), int(54, 8), int(20, 8), int(0, 8)]

    ! http://oeis.org/A121111
    Sequence11_proof = [int(277777788888899, 8), int(4996238671872, 8), int(438939648, 8), int(4478976, 8), int(338688, 8), int(27648, 8), int(2688, 8), int(768, 8), int(336, 8), int(54, 8), int(20, 8), int(0, 8)]

    call seqs%initalize(int(0, 8))
    call A003001(seqs)

    call seqs%initalize(int(10, 8))
    call A003001(seqs)

    call seqs%initalize(int(25, 8))
    call A003001(seqs)

    call seqs%initalize(int(39, 8))
    call A003001(seqs)

    call seqs%initalize(int(77, 8))
    call A003001(seqs)

    call seqs%initalize(int(679, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(06)%values(1:06) == Sequence05_proof)) then
      passed = .false.
      return
    end if

    call seqs%initalize(int(6788, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(07)%values(1:07) == Sequence06_proof)) then
      passed = .false.
      return
    end if

    call seqs%initalize(int(68889, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(08)%values(1:08) == Sequence07_proof)) then
      passed = .false.
      return
    end if

    call seqs%initalize(int(2677889, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(09)%values(1:09) == Sequence08_proof)) then
      passed = .false.
      return
    end if

    call seqs%initalize(int(26888999, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(10)%values(1:10) == Sequence09_proof)) then
      passed = .false.
      return
    end if

    call seqs%initalize(int(3778888999, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(11)%values(1:11) == Sequence10_proof)) then
      passed = .false.
      return
    end if

    call seqs%initalize(int(277777788888899, 8))
    call A003001(seqs)
    if (.not. all(seqs%Sequences(12)%values(1:12) == Sequence11_proof)) then
      passed = .false.
      return
    end if
  end function test_A003001
end module test_A003001_mod