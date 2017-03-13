

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION305.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION244.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION246.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION306.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGOS
!!! </summary>
UpdatePAGOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::PAG:Record  LIKE(PAG:RECORD),THREAD
QuickWindow          WINDOW('Cargar Pagos'),AT(,,270,138),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY,IMM, |
  MDI,HLP('UpdatePAGOS'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(1,3),USE(?PAG:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(35,3,43,10),USE(PAG:IDSOCIO)
                       BUTTON('...'),AT(81,2,12,12),USE(?CallLookup)
                       STRING(@s30),AT(96,3),USE(SOC:NOMBRE)
                       PROMPT('Matri.:'),AT(221,3),USE(?Prompt5)
                       STRING(@n-7),AT(243,3),USE(SOC:MATRICULA)
                       ENTRY(@n-14),AT(35,16,26,10),USE(PAG:SUCURSAL)
                       PROMPT('IDRECIBO:'),AT(1,17),USE(?PAG:IDRECIBO:Prompt),TRN
                       ENTRY(@n-14),AT(67,16,43,10),USE(PAG:IDRECIBO),REQ
                       CHECK('AFECTADA'),AT(118,17),USE(PAG:AFECTADA),VALUE('SI','NO')
                       BUTTON('Seleccionar Factura'),AT(93,34,92,14),USE(?Button4),LEFT,ICON('e.ico'),FLAT
                       LINE,AT(0,51,270,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Monto Factura: '),AT(159,56),USE(?Prompt4)
                       STRING(@n$-10.2),AT(210,56),USE(GLO:MONTO),FONT('Arial',10,COLOR:Red,,CHARSET:ANSI)
                       PROMPT('Forma Pago:'),AT(11,75),USE(?PAG:IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(54,74,43,10),USE(PAG:IDSUBCUENTA)
                       BUTTON('...'),AT(101,73,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(118,75),USE(SUB:DESCRIPCION)
                       LINE,AT(0,101,267,0),USE(?Line2),COLOR(COLOR:Black)
                       STRING(@n-14),AT(58,55),USE(GLO:IDSOLICITUD)
                       PROMPT('Nro. Factura:'),AT(13,56),USE(?Prompt6)
                       BUTTON('&Aceptar'),AT(76,115,53,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(142,115,62,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
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
  GlobalErrors.SetProcedureName('UpdatePAGOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAG:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAG:Record,History::PAG:Record)
  SELF.AddHistoryField(?PAG:IDSOCIO,2)
  SELF.AddHistoryField(?PAG:SUCURSAL,3)
  SELF.AddHistoryField(?PAG:IDRECIBO,12)
  SELF.AddHistoryField(?PAG:AFECTADA,16)
  SELF.AddHistoryField(?PAG:IDSUBCUENTA,15)
  SELF.AddUpdateFile(Access:PAGOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS
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
    ?PAG:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PAG:SUCURSAL{PROP:ReadOnly} = True
    ?PAG:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button4)
    ?PAG:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePAGOS',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
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
    Relate:FACTURA.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PAGOS.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePAGOS',QuickWindow)               ! Save window data to non-volatile store
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
      SelectSOCIOS
      SelectSUBCUENTAS_cuotas
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
    OF ?Button4
      GLO:IDSOCIO = PAG:IDSOCIO
      CARGAR_FACTURA_PAGO()
    OF ?OK
      FACTURA# = PAG:IDFACTURA
      PAG:IDFACTURA =  GLO:IDSOLICITUD
      PAG:MONTO     =  GLO:MONTO
      PAG:FECHA     =  today()
      PAG:HORA      =  clock()
      PAG:MES       =  MONTH(TODAY())
      PAG:ANO       =  YEAR(TODAY())
      PAG:PERIODO   =  PAG:ANO&(FORMAT(PAG:MES,@N02))
      PAG:IDUSUARIO =  GLO:IDUSUARIO
      PAG:MONTO_FACTURA  =  GLO:TOTAL
      PAG:INTERES_FACTURA = GLO:INTERES
      
      If  Self.Request=ChangeRecord Then
          FAC:IDFACTURA = FACTURA#
          GET (FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              HALT(0,'OCURRIO UN ERROR COMUNIQUESE CON EL ADMINISTRADOR DEL SISTEMA ')
          ELSE
              FAC:ESTADO = ''
              PUT(FACTURA)
              
          End
      END
      
      !! CONTROLO SI SE CARGO LA AFECTACION DEL PAGO
      IF PAG:AFECTADA = 'SI'  THEN
          ING:SUCURSAL = PAG:SUCURSAL
          ING:IDRECIBO = PAG:IDRECIBO
          GET(INGRESOS,ING:IDX_INGRESOS_UNIQUE)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO SE AFECTO EL RECIBO A NINGUN INGRESO','...No Corresponde la afectación',ICON:EXCLAMATION)
              SELECT(?PAG:SUCURSAL)
              CYCLE
          END
      else
          PAG:AFECTADA = 'NO' 
          !!! BUSCA SI EXISTE EL RECIBO
          ING:SUCURSAL = PAG:SUCURSAL
          ING:IDRECIBO = PAG:IDRECIBO
          GET(INGRESOS,ING:IDX_INGRESOS_UNIQUE)
          IF ERRORCODE() <> 35 THEN
              IF (ING:SUCURSAL = PAG:SUCURSAL) AND (ING:IDRECIBO = PAG:IDRECIBO) THEN
                  MESSAGE('EL NRO. DE RECIBO YA SE EMITIO','...No Corresponde la Recibo',ICON:EXCLAMATION)
                  SELECT(?PAG:SUCURSAL)
                  CYCLE
              END
          end
      END
      
      
      
      
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOS.TryValidateField(2)                  ! Attempt to validate PAG:IDSOCIO in PAGOS
        SELECT(?PAG:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAG:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?PAG:IDSUBCUENTA
      SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?PAG:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:PAGOS.TryValidateField(15)                 ! Attempt to validate PAG:IDSUBCUENTA in PAGOS
        SELECT(?PAG:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAG:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      GLO:DETALLE_RECIBO  = ''
      FAC:IDFACTURA = PAG:IDFACTURA
      GET (FACTURA,FAC:PK_FACTURA)
      IF ERRORCODE() = 35 THEN
          HALT(0,'OCURRIO UN ERROR COMUNIQUESE CON EL ADMINISTRADOR DEL SISTEMA ')
      ELSE
          FAC:ESTADO = 'PAGADO'
          PUT(FACTURA)
          SOC:IDSOCIO = FAC:IDSOCIO
          GET (SOCIOS,SOC:PK_SOCIOS)
          IF ERRORCODE() = 35 THEN
              MESSAGE ('NO ENCONTRO SOCIO')
          ELSE
              SOC:CANTIDAD = SOC:CANTIDAD - 1
              GLO:DETALLE_RECIBO =  'PAGO CUOTA MAT:'&SOC:MATRICULA&', CUOTA: '&FAC:MES&' AÑO: '&FAC:ANO
              PUT(SOCIOS)
          END
          
      End
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
      IF PAG:AFECTADA = 'NO' THEN !!! NO SE ASIENTA EN FINANZAS
  
          !!! CARGO EN LA CAJA
          SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO + GLO:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
  
          !! BUSCO EL ID PROVEEDOR
          SOC:IDSOCIO = PAG:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          IDPROVEEDOR# = SOC:IDPROVEEDOR
          !! CARGO INGRESO
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAG:IDUSUARIO
          ING:IDSUBCUENTA      =   PAG:IDSUBCUENTA
          ING:OBSERVACION      =   'PAGO CUOTA MAT:'&SOC:MATRICULA&', CUOTA: '&FAC:MES&' AÑO: '&FAC:ANO
          ING:MONTO            =   GLO:MONTO
          ING:FECHA            =   PAG:FECHA
          ING:HORA             =   PAG:HORA
          ING:MES              =   PAG:MES
          ING:ANO              =   PAG:ANO
          ING:PERIODO          =   PAG:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   PAG:SUCURSAL
          ING:IDRECIBO         =   PAG:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
  
          !!!!   CARGA EN CAJA SI SE DE CAJA
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = GLO:IDUSUARIO
              CAJ:DEBE =  GLO:MONTO
              CAJ:HABER = 0
              CAJ:OBSERVACION = 'PAGO CUOTA SOCIO '&PAG:IDSOCIO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =   ING:SUCURSAL
              CAJ:RECIBO    =   ING:IDRECIBO
              CAJ:TIPO      =   'INGRESO'
              CAJ:IDTRANSACCION = ING:IDINGRESO
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
          IF CUE:TIPO = 'INGRESO' THEN
              LIB:IDSUBCUENTA = PAG:IDSUBCUENTA
              LIB:DEBE = GLO:MONTO
              LIB:HABER = 0
              LIB:OBSERVACION = 'PAGO CUOTA SOCIO '&PAG:IDSOCIO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:SUCURSAL   =    ING:SUCURSAL
              LIB:RECIBO       =  ING:IDRECIBO
              LIB:IDPROVEEDOR  =  IDPROVEEDOR#
              LIB:TIPO         =  'INGRESO'
              LIB:IDTRANSACCION =  ING:IDINGRESO
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              LIB:FONDO = FON:MONTO 
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
              NEXT(RANKING)
              LIB:IDLIBDIARIO = RAN:C1
              !!!!!!!!!!!
              ACCESS:LIBDIARIO.INSERT()
          END
          !!! PARA CERRAR
          PAG:IDFACTURA = GLO:IDSOLICITUD
          GET(PAGOS,PAG:FK_PAGOS_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO PAGO')
          ELSE
              GLO:PAGO = PAG:IDPAGOS
              IMPRIMIR_PAGO
          END
  
  
          GLO:IDSOLICITUD = 0
          GLO:MONTO     = 0
       END
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

