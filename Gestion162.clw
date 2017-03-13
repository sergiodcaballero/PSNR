

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module

                     MAP
                       INCLUDE('GESTION162.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! CARGA EMAIL SOCIO
!!! </summary>
CARGA_EMAIL          PROCEDURE                             ! Declare Procedure

  CODE
    !!! BUSCA EL CORREO ELECTRONICO PARA ENVIAR POR EMAIL
    SOC:IDSOCIO = GLO:IDSOCIO 
    GET (SOCIOS,SOC:PK_SOCIOS)
    IF ERRORCODE()= 35 THEN
        MESSAGE('NO SE ENCONTRO EL SOCIO')
    ELSE
        GLO:EMAIL = SOC:EMAIL
    END
