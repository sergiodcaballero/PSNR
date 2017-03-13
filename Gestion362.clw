

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION362.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION216.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION346.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION361.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION363.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
UpdateEGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
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
History::GAS:Record  LIKE(GAS:RECORD),THREAD
QuickWindow          WINDOW('HABILITAR INGRESO'),AT(,,353,179),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       COMBO(@s20),AT(68,6,217,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('23L(2)|M~IDC~@n-5@200L(2)' & |
  '|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s8@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('HABILITAR EGRESO'),AT(104,23,101,20),USE(?Button3),LEFT,ICON(ICON:Tick),FLAT
                       BUTTON('...'),AT(129,53,12,12),USE(?CallLookup),DISABLE
                       STRING(@s50),AT(146,54,179,10),USE(SUB:DESCRIPCION)
                       ENTRY(@n$-13.2),AT(64,69,60,10),USE(GAS:MONTO),DISABLE,REQ
                       ENTRY(@n-14),AT(64,83,60,10),USE(GAS:IDPROVEEDOR)
                       BUTTON('...'),AT(129,81,12,12),USE(?CallLookup:2)
                       ENTRY(@P####-P),AT(64,97,22,10),USE(GAS:SUCURSAL)
                       ENTRY(@n-14),AT(90,97,60,10),USE(GAS:IDRECIBO),RIGHT(1)
                       ENTRY(@n-14),AT(236,97,32,10),USE(GAS:IDTIPO_COMPROBANTE),RIGHT(1)
                       ENTRY(@d17),AT(64,110,60,10),USE(GAS:FECHA),REQ
                       COMBO(@s2),AT(236,110,29,10),USE(GAS:LETRA),DROP(10),FROM('X|A|B|C|T'),REQ
                       ENTRY(@s50),AT(64,125,257,10),USE(GAS:OBSERVACION),DISABLE
                       BUTTON('&Aceptar'),AT(247,145,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(299,145,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('ELEGIR CUENTA:'),AT(3,6),USE(?Prompt4)
                       LINE,AT(1,48,350,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('OBSERVACION:'),AT(6,125),USE(?ING:OBSERVACION:Prompt),TRN
                       PROMPT('ID RECIBO:'),AT(6,97),USE(?GAS:SUCURSAL:Prompt)
                       PROMPT('TIPO COMPROBANTE:'),AT(157,97),USE(?GAS:IDTIPO_COMPROBANTE:Prompt)
                       BUTTON('...'),AT(271,96,12,12),USE(?CallLookup:3)
                       STRING(@s15),AT(287,97),USE(TIPCOM:DESCRIPCION)
                       PROMPT('LETRA:'),AT(209,110),USE(?GAS:LETRA:Prompt)
                       PROMPT('FECHA COMP:'),AT(6,110),USE(?GAS:FECHA:Prompt)
                       LINE,AT(3,141,349,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(6,68),USE(?ING:MONTO:Prompt),TRN
                       PROMPT('IDPROVEEDOR:'),AT(6,83),USE(?GAS:IDPROVEEDOR:Prompt)
                       STRING(@s50),AT(145,82,180,10),USE(PRO2:DESCRIPCION)
                       PROMPT('IDSUBCUENTA:'),AT(6,55),USE(?IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(64,55,60,10),USE(GAS:IDSUBCUENTA),DISABLE
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
  GlobalErrors.SetProcedureName('UpdateEGRESOS')
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
  SELF.AddHistoryFile(GAS:Record,History::GAS:Record)
  SELF.AddHistoryField(?GAS:MONTO,5)
  SELF.AddHistoryField(?GAS:IDPROVEEDOR,11)
  SELF.AddHistoryField(?GAS:SUCURSAL,12)
  SELF.AddHistoryField(?GAS:IDRECIBO,13)
  SELF.AddHistoryField(?GAS:IDTIPO_COMPROBANTE,14)
  SELF.AddHistoryField(?GAS:FECHA,6)
  SELF.AddHistoryField(?GAS:LETRA,15)
  SELF.AddHistoryField(?GAS:OBSERVACION,4)
  SELF.AddHistoryField(?GAS:IDSUBCUENTA,3)
  SELF.AddUpdateFile(Access:GASTOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_COMPROBANTE.Open                             ! File TIPO_COMPROBANTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GASTOS
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
    DISABLE(?CallLookup)
    ?GAS:MONTO{PROP:ReadOnly} = True
    ?GAS:IDPROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?GAS:SUCURSAL{PROP:ReadOnly} = True
    ?GAS:IDRECIBO{PROP:ReadOnly} = True
    ?GAS:IDTIPO_COMPROBANTE{PROP:ReadOnly} = True
    ?GAS:FECHA{PROP:ReadOnly} = True
    DISABLE(?GAS:LETRA)
    ?GAS:OBSERVACION{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?GAS:IDSUBCUENTA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEGRESOS',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  FDCB8.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CUE:PK_CUENTAS)
  FDCB8.SetFilter('CUE:TIPO = ''EGRESO''')
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
    Relate:GASTOS.Close
    Relate:LIBDIARIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
    Relate:TIPO_COMPROBANTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEGRESOS',QuickWindow)             ! Save window data to non-volatile store
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
      SelectPROVEEDORES
      SelectTIPO_COMPROBANTE
      SelectSUBCUENTAS_INGRESOS
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
      IF CUE:TIPO = 'EGRESO' THEN
          GLO:CUENTA = CUE:IDCUENTA
          ENABLE(?GAS:IDSUBCUENTA)
          ENABLE(?GAS:MONTO)
          ENABLE(?GAS:OBSERVACION)
          ENABLE (?CallLookup)
          ENABLE(?OK)
          DISABLE(?Button3)
          DISABLE(?CUE:IDCUENTA)
      END
    OF ?OK
      If  Self.Request=insertRecord THEN
          GAS:IDUSUARIO =  GLO:IDUSUARIO
          !GAS:FECHA       =  TODAY()
          GAS:HORA        =  CLOCK()
          GAS:MES       =  MONTH(TODAY())
          GAS:ANO       =  YEAR(TODAY())
          GAS:PERIODO  =  ING:ANO&(FORMAT(ING:MES,@N02))
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_GASTOS_ID'
          NEXT(RANKING)
          GAS:IDGASTOS = RAN:C1
          GLO:PAGO = GAS:IDGASTOS
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        GAS:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?GAS:IDPROVEEDOR
      IF GAS:IDPROVEEDOR OR ?GAS:IDPROVEEDOR{PROP:Req}
        PRO2:IDPROVEEDOR = GAS:IDPROVEEDOR
        IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GAS:IDPROVEEDOR = PRO2:IDPROVEEDOR
          ELSE
            SELECT(?GAS:IDPROVEEDOR)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = GAS:IDPROVEEDOR
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GAS:IDPROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    OF ?GAS:IDTIPO_COMPROBANTE
      TIPCOM:IDTIPO_COMPROBANTE = GAS:IDTIPO_COMPROBANTE
      IF Access:TIPO_COMPROBANTE.TryFetch(TIPCOM:PK_TIPO_COMPROBANTE)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          GAS:IDTIPO_COMPROBANTE = TIPCOM:IDTIPO_COMPROBANTE
        ELSE
          SELECT(?GAS:IDTIPO_COMPROBANTE)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:GASTOS.TryValidateField(14)                ! Attempt to validate GAS:IDTIPO_COMPROBANTE in GASTOS
        SELECT(?GAS:IDTIPO_COMPROBANTE)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?GAS:IDTIPO_COMPROBANTE
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?GAS:IDTIPO_COMPROBANTE{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      TIPCOM:IDTIPO_COMPROBANTE = GAS:IDTIPO_COMPROBANTE
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        GAS:IDTIPO_COMPROBANTE = TIPCOM:IDTIPO_COMPROBANTE
      END
      ThisWindow.Reset(1)
    OF ?GAS:IDSUBCUENTA
      SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          GAS:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?GAS:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:GASTOS.TryValidateField(3)                 ! Attempt to validate GAS:IDSUBCUENTA in GASTOS
        SELECT(?GAS:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?GAS:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?GAS:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
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
      
      SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO 
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO - GAS:MONTO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
      !!!!
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = GAS:IDSUBCUENTA
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:HABER =  GAS:MONTO
          CAJ:DEBE = 0
          CAJ:OBSERVACION = GAS:OBSERVACION
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          CAJ:SUCURSAL  =   GAS:SUCURSAL
          CAJ:RECIBO    =   GAS:IDRECIBO
          CAJ:TIPO      =   'EGRESO'
          CAJ:IDTRANSACCION  = GLO:PAGO
          ! BUSCO EN FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          CAJ:MONTO = FON:MONTO 
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
          NEXT(RANKING)
          CAJ:IDCAJA = RAN:C1
          ACCESS:CAJA.INSERT()
          RAN:C1 = 0
      END
      CUE:IDCUENTA = SUB:IDCUENTA
      ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
      IF CUE:TIPO = 'EGRESO' THEN
          LIB:IDSUBCUENTA = GAS:IDSUBCUENTA
          LIB:HABER = GAS:MONTO
          LIB:DEBE = 0
          LIB:OBSERVACION = GAS:OBSERVACION
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          LIB:FONDO  =  FON:MONTO
          LIB:SUCURSAL       =  GAS:SUCURSAL
          LIB:RECIBO         =  GAS:IDRECIBO
          LIB:IDPROVEEDOR    =  GAS:IDPROVEEDOR
          LIB:TIPO =  'EGRESO'
          LIB:IDTRANSACCION  = GLO:PAGO
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
          NEXT(RANKING)
          LIB:IDLIBDIARIO = RAN:C1
          !!!!!!!!!!!
          ACCESS:LIBDIARIO.INSERT()
          RAN:C1 = 0
      END
  
      IMPRIMIR_COMPROBANTE_EGRESO
  END
  GLO:PAGO = 0
  
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

