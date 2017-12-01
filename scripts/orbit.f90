PROGRAM OrbitalMotion
    ! Glogal parameters
    IMPLICIT NONE
    REAL(8), PARAMETER :: PI = 3.14159265358979d0
    REAL(8), PARAMETER :: G = 4.0d0 * (PI ** 2.0d0)
    REAL(8), PARAMETER :: time_step = 0.0027397260273972603d0 ! One day
    INTEGER, PARAMETER :: steps = 2 * 365      ! 2 years
    INTEGER :: step = 0

    ! File
    INTEGER, PARAMETER :: OutFileUnit = 30
    CHARACTER(len=*), PARAMETER :: OutFileName = 'output.txt'
    CHARACTER(len=*), PARAMETER :: OutFileMode = 'write'
    CHARACTER(len=*), PARAMETER :: OutFileFormat = '(6F12.6)'

    ! Earth initial conditions
    REAL(8) :: earthR
    REAL(8) :: earthRx
    REAL(8) :: earthRy
    REAL(8) :: earthVx
    REAL(8) :: earthVy
    REAL(8) :: earthAx
    REAL(8) :: earthAy

    OPEN(unit=OutFileUnit,file=OutFileName,action=OutFileMode)

    earthRx = -1
    earthRy = 0
    earthR = ((earthRx ** 2) + (earthRy ** 2)) ** 0.5
    earthVx = 0
    earthVy = 6.2783201069518713  ! [UA/año] 29.783 km/sec
    earthAx = -1 * G * earthRx / (earthR ** 3)
    earthAy = -1 * G * earthRy / (earthR ** 3)


    ! Earth initial conditions
    DO step = 0, steps, 1
        WRITE(unit=OutFileUnit,fmt=OutFileFormat) earthRx, earthRy, earthVx, earthVy, earthAx, earthAy

        earthRx = earthRx + earthVx * time_step + 0.5 * earthAx * (time_step ** 2)
        earthRy = earthRy + earthVy * time_step + 0.5 * earthAy * (time_step ** 2)

        earthR = ((earthRx ** 2) + (earthRy ** 2)) ** 0.5

        earthVx = earthVx + 0.5 * earthAx * time_step
        earthVy = earthVy + 0.5 * earthAy * time_step

        earthAx = -1 * G * earthRx / (earthR ** 3)
        earthAy = -1 * G * earthRy / (earthR ** 3)

        earthVx = earthVx + 0.5 * earthAx * time_step
        earthVy = earthVy + 0.5 * earthAy * time_step
    END DO

    CLOSE(OutFileUnit)

END PROGRAM OrbitalMotion
