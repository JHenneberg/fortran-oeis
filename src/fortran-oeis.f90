PROGRAM MultiplicativePersistence
  USE test_multiplicative_persistence_mod
  USE multiplicative_persistence_mod
  IMPLICIT NONE

  TYPE(tSequences) :: seq_multi_pers
  INTEGER(8) :: i

  IF (.NOT. test_multiplicativePersistence()) &
    WRITE(*,*) 'Unit Test failed'

  DO i = 0, 1D7
    CALL seq_multi_pers%initalize(i)
    CALL calc_multiplicative_persistence(seq_multi_pers)
  END DO

  CALL seq_multi_pers%print()
END PROGRAM