

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION345.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION216.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION344.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION346.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
UpdateINGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
loc:monto            STRING(20)                            ! 
FDCB8::View:FileDropCombo VIEW(CUENTAS)
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
History::ING:Record  LIKE(ING:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion INGRESOS'),AT(,,351,173),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       COMBO(@s20),AT(64,6,217,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('23L(2)|M~IDC~@n-5@200L(2)' & |
  '|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s8@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('HABILITAR INGRESO'),AT(104,23,101,20),USE(?Button3),LEFT,ICON(ICON:Tick),FLAT
                       ENTRY(@N-14B),AT(63,54,64,10),USE(ING:IDSUBCUENTA),DISABLE
                       BUTTON('...'),AT(129,53,12,12),USE(?CallLookup),DISABLE
                       ENTRY(@N$-13.2),AT(63,69,65,10),USE(ING:MONTO),INS,DISABLE
                       ENTRY(@P####P),AT(63,84,28,10),USE(ING:SUCURSAL)
                       ENTRY(@n-14),AT(95,84,64,10),USE(ING:IDRECIBO)
                       PROMPT('Nº RECIBO:'),AT(5,84),USE(?Prompt6)
                       ENTRY(@n-14),AT(63,99,64,10),USE(ING:IDPROVEEDOR)
                       BUTTON('...'),AT(128,98,12,12),USE(?CallLookup:2)
                       BUTTON('&Aceptar'),AT(249,156,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(301,156,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       STRING(@s50),AT(146,54,177,10),USE(SUB:DESCRIPCION)
                       STRING(@s50),AT(143,99,179,10),USE(PRO2:DESCRIPCION)
                       PROMPT('IDPROVEEDOR:'),AT(3,99),USE(?ING:IDPROVEEDOR:Prompt)
                       PROMPT('ELEGIR CUENTA:'),AT(3,6),USE(?Prompt4)
                       LINE,AT(1,48,350,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('IDSUBCUENTA:'),AT(3,54),USE(?ING:IDSUBCUENTA:Prompt),TRN
                       PROMPT('OBSERVACION:'),AT(3,114),USE(?ING:OBSERVACION:Prompt),TRN
                       LINE,AT(0,152,351,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(3,69),USE(?ING:MONTO:Prompt),TRN
                       TEXT,AT(64,119,259,28),USE(ING:OBSERVACION)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateINGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUE:IDCUENTA
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ING:Record,History::ING:Record)
  SELF.AddHistoryField(?ING:IDSUBCUENTA,3)
  SELF.AddHistoryField(?ING:MONTO,5)
  SELF.AddHistoryField(?ING:SUCURSAL,12)
  SELF.AddHistoryField(?ING:IDRECIBO,13)
  SELF.AddHistoryField(?ING:IDPROVEEDOR,11)
  SELF.AddHistoryField(?ING:OBSERVACION,4)
  SELF.AddUpdateFile(Access:INGRESOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INGRESOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?CUE:IDCUENTA)
    DISABLE(?Button3)
    ?ING:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?ING:MONTO{PROP:ReadOnly} = True
    ?ING:SUCURSAL{PROP:ReadOnly} = True
    ?ING:IDRECIBO{PROP:ReadOnly} = True
    ?ING:IDPROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateINGRESOS',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  FDCB8.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CUE:PK_CUENTAS)
  FDCB8.SetFilter('CUE:TIPO = ''INGRESO''')
  FDCB8.AddField(CUE:IDCUENTA,FDCB8.Q.CUE:IDCUENTA) !List box control field - type derived from field
  FDCB8.AddField(CUE:DESCRIPCION,FDCB8.Q.CUE:DESCRIPCION) !List box control field - type derived from field
  FDCB8.AddField(CUE:TIPO,FDCB8.Q.CUE:TIPO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:CUENTAS.Close
    Relate:FONDOS.Close
    Relate:INFORME.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateINGRESOS',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectSUBCUENTAS_INGRESOS
      SelectPROVEEDORES
    END
    ReturnValue = GlobalResponse
  END
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
    OF ?Button3
      IF CUE:TIPO = 'INGRESO' THEN
          GLO:CUENTA = CUE:IDCUENTA
          ENABLE(?ING:IDSUBCUENTA)
          ENABLE(?ING:MONTO)
          ENABLE(?ING:OBSERVACION)
          ENABLE (?CallLookup)
          ENABLE(?OK)
          DISABLE(?Button3)
          DISABLE(?CUE:IDCUENTA)
      END
    OF ?OK
      If  Self.Request=insertRecord THEN
          ING:IDUSUARIO   =  GLO:IDUSUARIO
          ING:FECHA       =  TODAY()
          ING:HORA        =  CLOCK()
          ING:MES       =  MONTH(TODAY())
          ING:ANO       =  YEAR(TODAY())
          ING:PERIODO   =  ING:ANO&(FORMAT(ING:MES,@N02))
          loc:monto = ING:MONTO
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ING:IDSUBCUENTA
      SUB:IDSUBCUENTA = ING:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          ING:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?ING:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:INGRESOS.TryValidateField(3)               ! Attempt to validate ING:IDSUBCUENTA in INGRESOS
        SELECT(?ING:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?ING:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?ING:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SUB:IDSUBCUENTA = ING:IDSUBCUENTA
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        ING:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?ING:IDPROVEEDOR
      IF ING:IDPROVEEDOR OR ?ING:IDPROVEEDOR{PROP:Req}
        PRO2:IDPROVEEDOR = ING:IDPROVEEDOR
        IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            ING:IDPROVEEDOR = PRO2:IDPROVEEDOR
          ELSE
            SELECT(?ING:IDPROVEEDOR)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = ING:IDPROVEEDOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        ING:IDPROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      If  Self.Request=insertRecord THEN
              !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          GLO:PAGO = ING:IDINGRESO
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
   !!! CARGO EN LA CAJA
      
      SUB:IDSUBCUENTA = ING:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      !!! AGREGA EN INFORMES
      IF SUB:INFORME = 'SI' THEN
          INF:FECHA        = TODAY()
          INF:HORA         = CLOCK()
          INF:MONTO =  loc:monto
          INF:INFORME      = 'Nº INGRESO :'&ING:IDINGRESO&', Monto: $'&INF:MONTO&' Obs.:'&ING:OBSERVACION
          INF:IDUSUARIO    = GLO:IDUSUARIO
          INF:SUCURSAL     =  ING:SUCURSAL
          INF:IDRECIBO     =  ING:IDRECIBO
          ACCESS:INFORME.INSERT()
      END
      !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO + ING:MONTO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
      !!!!
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:DEBE =  loc:monto
          CAJ:HABER = 0
          CAJ:OBSERVACION = ING:OBSERVACION
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          CAJ:MONTO = FON:MONTO
          CAJ:SUCURSAL  =   ING:SUCURSAL
          CAJ:RECIBO    =   ING:IDRECIBO
          CAJ:TIPO      =   'INGRESO'
          CAJ:IDTRANSACCION  = GLO:PAGO
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
          NEXT(RANKING)
          CAJ:IDCAJA = RAN:C1
          ACCESS:CAJA.INSERT()
          RAN:C1 = 0
      END
      CUE:IDCUENTA = SUB:IDCUENTA
      ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
      IF CUE:TIPO = 'INGRESO' THEN
          LIB:IDSUBCUENTA = ING:IDSUBCUENTA
          LIB:DEBE = loc:monto
          LIB:HABER = 0
          LIB:OBSERVACION = ING:OBSERVACION
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          LIB:FONDO = FON:MONTO
          LIB:SUCURSAL       =  ING:SUCURSAL
          LIB:RECIBO         =  ING:IDRECIBO
          LIB:IDPROVEEDOR    =  ING:IDPROVEEDOR
          LIB:TIPO           =  'INGRESO'
          LIB:IDTRANSACCION = GLO:PAGO
  
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
          NEXT(RANKING)
          LIB:IDLIBDIARIO = RAN:C1
          !!!!!!!!!!!
          ACCESS:LIBDIARIO.INSERT()
          RAN:C1 = 0
      END
      IMPRIMIR_COMPROBANTE_INGRESO
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

