PROGRAM MultiplicativePersistence
  ! Smallest number of multiplicative persistence n.
  ! http://oeis.org/A003001
  USE multiplicative_persistence_mod
  IMPLICIT NONE

  TYPE(tSequence) :: Sequence00
  TYPE(tSequence) :: Sequence01
  TYPE(tSequence) :: Sequence02
  TYPE(tSequence) :: Sequence03
  TYPE(tSequence) :: Sequence04
  TYPE(tSequence) :: Sequence05
  TYPE(tSequence) :: Sequence06
  TYPE(tSequence) :: Sequence07
  TYPE(tSequence) :: Sequence08
  TYPE(tSequence) :: Sequence09
  TYPE(tSequence) :: Sequence10
  TYPE(tSequence) :: Sequence11

  CALL Sequence00%initalize(INT(0, 8))
  CALL calc_multiplicative_persistence(Sequence00)

  CALL Sequence01%initalize(INT(10, 8))
  CALL calc_multiplicative_persistence(Sequence01)

  CALL Sequence02%initalize(INT(25, 8))
  CALL calc_multiplicative_persistence(Sequence02)

  CALL Sequence03%initalize(INT(39, 8))
  CALL calc_multiplicative_persistence(Sequence03)

  CALL Sequence04%initalize(INT(77, 8))
  CALL calc_multiplicative_persistence(Sequence04)

  CALL Sequence05%initalize(INT(679, 8))
  CALL calc_multiplicative_persistence(Sequence05)

  CALL Sequence06%initalize(INT(6788, 8))
  CALL calc_multiplicative_persistence(Sequence06)

  CALL Sequence07%initalize(INT(68889, 8))
  CALL calc_multiplicative_persistence(Sequence07)

  CALL Sequence08%initalize(INT(2677889, 8))
  CALL calc_multiplicative_persistence(Sequence08)

  CALL Sequence09%initalize(INT(26888999, 8))
  CALL calc_multiplicative_persistence(Sequence09)

  CALL Sequence10%initalize(INT(3778888999, 8))
  CALL calc_multiplicative_persistence(Sequence10)

  CALL Sequence11%initalize(INT(277777788888899, 8))
  CALL calc_multiplicative_persistence(Sequence11)
END PROGRAM