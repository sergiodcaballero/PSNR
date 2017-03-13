

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION355.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION354.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION356.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
reporte_cuentas PROCEDURE 

FDCB3::View:FileDropCombo VIEW(CUENTAS)
                       PROJECT(CUE:IDCUENTA)
                       PROJECT(CUE:DESCRIPCION)
                       PROJECT(CUE:TIPO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CUE:IDCUENTA
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Window               WINDOW('LISTADO POR CUENTA INGRESOS'),AT(,,256,126),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       PROMPT('CUENTA INGRESO:'),AT(8,37),USE(?Prompt3)
                       COMBO(@n-14),AT(76,37,165,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('56L(2)|M~IDCUENTA~@n-14' & |
  '@200L(2)|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s50@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('Imprimir x Cuenta Ingresos'),AT(13,62,97,18),USE(?Button4),LEFT,ICON(ICON:Print1), |
  FLAT
                       BUTTON('Generar x Cuenta Ingresos'),AT(152,62,97,18),USE(?Button3),LEFT,ICON(ICON:NextPage), |
  FLAT
                       BUTTON('&SALIR'),AT(103,91,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END


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
  GlobalErrors.SetProcedureName('reporte_cuentas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('reporte_cuentas',Window)                   ! Restore window settings from non-volatile store
  FDCB3.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(CUE:PK_CUENTAS)
  FDCB3.SetFilter('CUE:TIPO = ''INGRESO''')
  FDCB3.AddField(CUE:IDCUENTA,FDCB3.Q.CUE:IDCUENTA) !List box control field - type derived from field
  FDCB3.AddField(CUE:DESCRIPCION,FDCB3.Q.CUE:DESCRIPCION) !List box control field - type derived from field
  FDCB3.AddField(CUE:TIPO,FDCB3.Q.CUE:TIPO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUENTAS.Close
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('reporte_cuentas',Window)                ! Save window data to non-volatile store
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
    OF ?Button4
      GLO:PAGO = CUE:IDCUENTA
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
    OF ?Button4
      ThisWindow.Update()
      imprimir_ingreso()
      ThisWindow.Reset
    OF ?Button3
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      cuenta# = clip(CUE:IDCUENTA)
      !SQL{PROP:SQL} = 'SELECT  CUENTAS.descripcion, SUM(LIBDIARIO.DEBE), SUM(LIBDIARIO.haber) FROM CUENTAS , subcuentas,  LIBDIARIO WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND   SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  GROUP BY CUENTAS.descripcion' !!!! and cuentas.idcuenta = '''&CUE:IDCUENTA&'''
      SQL{PROP:SQL} = 'select ingresos.idingreso, ingresos.idrecibo, ingresos.sucursal, cuentas.descripcion , subcuentas.descripcion, ingresos.monto, ingresos.fecha, ingresos.observacion from ingresos,subcuentas,cuentas where ingresos.idsubcuenta = subcuentas.idsubcuenta and  subcuentas.idcuenta =  cuentas.idcuenta   and cuentas.idcuenta = '''&cuenta#&''' and ingresos.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&''' order by ingresos.idingreso'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = SQL:VAR1
          RAN:C8 = SQL:VAR2
          RAN:C2 = SQL:VAR3
          RAN:C3 = SQL:VAR4
          RAN:C4 = SQL:VAR5
          RAN:C5 = SQL:VAR6
          RAN:C6 = SQL:VAR7
          RAN:C7 = SQL:VAR8
          ADD(RANKING)
          !if errorcode() then message(error()).
          
      END
      
      IMPRIMIR_CUENTA_INGRESO()
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

