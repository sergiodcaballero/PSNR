

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION187.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION186.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION188.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
DEUDAS PROCEDURE 

Window               WINDOW('Estado de Deuda de Socios '),AT(,,222,109),FONT('Arial',8,,FONT:bold),GRAY,MDI
                       BUTTON('&Generar Listado de Padrón con Deudas TOTALES'),AT(17,5,188,28),USE(?OkButton),LEFT, |
  ICON(ICON:NextPage),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(78,53,67,17),USE(?CancelButton),LEFT,ICON('salir.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('DEUDAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('DEUDAS',Window)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('DEUDAS',Window)                         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?OkButton
      DISABLE(?OkButton)
      DISABLE(?CancelButton)
      SQL{PROP:SQL} = 'DELETE FROM RANKING'
      SQL{PROP:SQL} = 'SELECT SOCIOS.idsocio, SOCIOS.matricula, SOCIOS.nombre, COUNT(FACTURA.IDSOCIO), sum (FACTURA.TOTAL) FROM SOCIOS, FACTURA WHERE SOCIOS.idsocio = FACTURA.idsocio AND FACTURA.estado = ''''  AND SOCIOS.BAJA = ''NO'' AND SOCIOS.BAJA_TEMPORARIA = ''NO'' GROUP BY  SOCIOS.idsocio, SOCIOS.matricula, SOCIOS.nombre'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = SQL:VAR1
          RAN:C2 = SQL:VAR2
          RAN:C3 = SQL:VAR3
          RAN:C4 = SQL:VAR4
          RAN:C5 = SQL:VAR5
          ADD(RANKING)
          if errorcode() then message(error()).
      END
      
      
      
      
      DEUDA2()
       POST(EVENT:CloseWindow)
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

