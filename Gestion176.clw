

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module

                     MAP
                       INCLUDE('GESTION176.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
CARGO_VARIABLE_PERIDOS PROCEDURE                           ! Declare Procedure

  CODE
    !!CARGO VARIABLE GLO:PERIODO
    GLO:PERIODO = FORMAT(GLO:ANO,@N04)&FORMAT(GLO:MES,@N02)
    GLO:PERIODO_HASTA = FORMAT(GLO:ANO_HASTA,@N04)&FORMAT(GLO:MES_HASTA,@N02)
    
