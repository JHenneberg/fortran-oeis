MODULE test_multiplicative_persistence_mod
  USE multiplicative_persistence_mod
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: test_multiplicativePersistence
CONTAINS
  FUNCTION test_multiplicativePersistence() RESULT(passed)
    IMPLICIT NONE

    LOGICAL :: passed

    TYPE(tSequences) :: seqs

    INTEGER(8) :: Sequence05_proof(06)
    INTEGER(8) :: Sequence06_proof(07)
    INTEGER(8) :: Sequence07_proof(08)
    INTEGER(8) :: Sequence08_proof(09)
    INTEGER(8) :: Sequence09_proof(10)
    INTEGER(8) :: Sequence10_proof(11)
    INTEGER(8) :: Sequence11_proof(12)

    passed = .TRUE.

    ! http://oeis.org/A121105
    Sequence05_proof = [INT(679, 8), INT(378, 8), INT(168, 8), INT(48, 8), INT(32, 8), INT(6, 8)]

    ! http://oeis.org/A121106
    Sequence06_proof = [INT(6788, 8), INT(2688, 8), INT(768, 8), INT(336, 8), INT(54, 8), INT(20, 8), INT(0, 8)]

    ! http://oeis.org/A121107
    Sequence07_proof = [INT(68889, 8), INT(27648, 8), INT(2688, 8), INT(768, 8), INT(336, 8), INT(54, 8), INT(20, 8), INT(0, 8)]

    ! http://oeis.org/A121108
    Sequence08_proof = [INT(2677889, 8), INT(338688, 8), INT(27648, 8), INT(2688, 8), INT(768, 8), INT(336, 8), INT(54, 8), INT(20, 8), INT(0, 8)]

    ! http://oeis.org/A121109
    Sequence09_proof = [INT(26888999, 8), INT(4478976, 8), INT(338688, 8), INT(27648, 8), INT(2688, 8), INT(768, 8), INT(336, 8), INT(54, 8), INT(20, 8), INT(0, 8)]

    ! http://oeis.org/A121110
    Sequence10_proof = [INT(3778888999, 8), INT(438939648, 8), INT(4478976, 8), INT(338688, 8), INT(27648, 8), INT(2688, 8), INT(768, 8), INT(336, 8), INT(54, 8), INT(20, 8), INT(0, 8)]

    ! http://oeis.org/A121111
    Sequence11_proof = [INT(277777788888899, 8), INT(4996238671872, 8), INT(438939648, 8), INT(4478976, 8), INT(338688, 8), INT(27648, 8), INT(2688, 8), INT(768, 8), INT(336, 8), INT(54, 8), INT(20, 8), INT(0, 8)]

    CALL seqs%initalize(INT(0, 8))
    CALL calc_multiplicative_persistence(seqs)

    CALL seqs%initalize(INT(10, 8))
    CALL calc_multiplicative_persistence(seqs)

    CALL seqs%initalize(INT(25, 8))
    CALL calc_multiplicative_persistence(seqs)

    CALL seqs%initalize(INT(39, 8))
    CALL calc_multiplicative_persistence(seqs)

    CALL seqs%initalize(INT(77, 8))
    CALL calc_multiplicative_persistence(seqs)

    CALL seqs%initalize(INT(679, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(06)%values(1:06) == Sequence05_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF

    CALL seqs%initalize(INT(6788, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(07)%values(1:07) == Sequence06_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF

    CALL seqs%initalize(INT(68889, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(08)%values(1:08) == Sequence07_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF

    CALL seqs%initalize(INT(2677889, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(09)%values(1:09) == Sequence08_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF

    CALL seqs%initalize(INT(26888999, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(10)%values(1:10) == Sequence09_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF

    CALL seqs%initalize(INT(3778888999, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(11)%values(1:11) == Sequence10_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF

    CALL seqs%initalize(INT(277777788888899, 8))
    CALL calc_multiplicative_persistence(seqs)
    IF (.NOT. ALL(seqs%Sequences(12)%values(1:12) == Sequence11_proof)) THEN
      passed = .FALSE.
      RETURN
    END IF
  END FUNCTION test_multiplicativePersistence
END MODULE test_multiplicative_persistence_mod