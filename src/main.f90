PROGRAM MultiplicativePersistence
  USE test_multiplicative_persistence_mod
  USE multiplicative_persistence_mod
  IMPLICIT NONE

  IF (.NOT. test_multiplicativePersistence()) &
    WRITE(*,*) 'Unit Test failed'
END PROGRAM