

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module

                     MAP
                       INCLUDE('GESTION277.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! CARGA AUDITORIA
!!! </summary>
CARGA_AUDITORIA      PROCEDURE                             ! Declare Procedure

  CODE
    OPEN(AUDITORIA)
    AUD:ACCION  = REPORTE_LARGO
    AUD:IDSOCIO = GLO:IDSOCIO
    AUD:FECHA   = TODAY()
    AUD:HORA    = CLOCK()
    AUD:IDUSUARIO = GLO:IDUSUARIO
    ADD(AUDITORIA)
    !IF ERRORCODE() THEN MESSAGE(ERROR()).
    CLOSE(AUDITORIA)
