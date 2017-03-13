

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION352.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION351.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION353.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
IMPRIMIR_LIBRODIARIO PROCEDURE 

Window               WINDOW('LISTADO DE LIBRO DIARIO'),AT(,,256,90),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       BUTTON('&Imprimir X Detalle por SubCuenta'),AT(11,35,97,18),USE(?OkButton),LEFT,ICON(ICON:Print1), |
  DEFAULT,FLAT
                       BUTTON('Imprimir x Cuenta'),AT(148,35,97,18),USE(?Button3),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&SALIR'),AT(103,62,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
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
  GlobalErrors.SetProcedureName('IMPRIMIR_LIBRODIARIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
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
  INIMgr.Fetch('IMPRIMIR_LIBRODIARIO',Window)              ! Restore window settings from non-volatile store
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
    INIMgr.Update('IMPRIMIR_LIBRODIARIO',Window)           ! Save window data to non-volatile store
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
      !! LIMPIA RANKING
      RANKING {PROP:SQL} =  'DELETE FROM RANKING'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          RETURN LEVEL:BENIGN
      END
    OF ?Button3
      !! LIMPIA RANKING
      RANKING {PROP:SQL} =  'DELETE FROM RANKING'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          RETURN LEVEL:BENIGN
      END
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      
      SQL{PROP:SQL} = ' SELECT CUENTAS.TIPO, cuentas.descripcion, SUBCUENTAS.descripcion, LIBDIARIO.observacion, LIBDIARIO.DEBE, LIBDIARIO.haber, LIBDIARIO.FECHA, FONDOS.nombre_fondo, LIBDIARIO.FONDO, libdiario.sucursal, libdiario.recibo, proveedores.descripcion FROM CUENTAS , subcuentas,  LIBDIARIO, FONDOS, PROVEEDORES WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND  subcuentas.idfondo = FONDOS.idfondo AND SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND libdiario.idproveedor = proveedores.idproveedor AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  ORDER BY LIBDIARIO.IDLIBDIARIO, LIBDIARIO.FECHA '
      
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = RAN:C1 + 1
          RAN:C2 = SQL:VAR2  !!cUENTA
          RAN:C3 = SQL:VAR3  !! SUB CUENTA
          RAN:C4 = SQL:VAR4   !! OBSERVACION
          RAN:C5 = clip(SQL:VAR5)!! DEBE
          RAN:C6 = CLIP(SQL:VAR6) !! HABER
          RAN:C7 = SQL:VAR7  !! FECHA
          RAN:C8 = SQL:VAR1  !! TIPO CUENTA
          RAN:C9 = SQL:VAR8  !! FONDO
          RAN:C10 = CLIP(SQL:VAR10)&'-'&CLIP(SQL:VAR11) !!  SUCURSAL - RECIBO
          RAN:C11 = SQL:VAR12
          RAN:CANTIDAD = RAN:CANTIDAD + 1
          ADD(RANKING)
          if errorcode() then message(error()).
          
      END
      
      IMPRIMIR_LIBRO_DIARIO_SUBCUENTA()
    OF ?Button3
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      
      
      SQL{PROP:SQL} = 'SELECT  CUENTAS.descripcion, SUM(LIBDIARIO.DEBE), SUM(LIBDIARIO.haber) FROM CUENTAS , subcuentas,  LIBDIARIO WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND   SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  GROUP BY CUENTAS.descripcion'
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
          ADD(RANKING)
          
      END
      
      IMPRIMIR_LIBRO_DIARIO_CUENTA()
    END
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

