

   MEMBER('Generar_Cuotas.clw')                            ! This is a MEMBER module

                     MAP
                       INCLUDE('GENERAR_CUOTAS003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Procedure not yet defined
!!! </summary>
deuda PROCEDURE !Procedure not yet defined
  CODE
  GlobalErrors.ThrowMessage(Msg:ProcedureToDo,'deuda')     ! This procedure acts as a place holder for a procedure yet to be defined
  SETKEYCODE(0)
  GlobalResponse = RequestCancelled                        ! Request cancelled is the implied action
