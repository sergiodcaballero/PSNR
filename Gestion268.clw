

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION268.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION125.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION267.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION269.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGO_CONVENIO
!!! </summary>
UpdatePAGO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::PAGCON:Record LIKE(PAGCON:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PAGO CONVENIO'),AT(,,273,184),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdatePAGO_CONVENIO'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(3,5),USE(?PAGCON:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(57,5,64,10),USE(PAGCON:IDSOCIO),RIGHT(1)
                       BUTTON('...'),AT(124,4,12,12),USE(?CallLookup)
                       STRING(@s30),AT(140,5),USE(SOC:NOMBRE)
                       ENTRY(@n-14),AT(59,26,20,10),USE(PAGCON:IDSUCURSAL),RIGHT(1)
                       PROMPT('NRO. RECIBO:'),AT(3,26),USE(?PAGCON:IDRECIBO:Prompt)
                       ENTRY(@n-14),AT(83,25,64,10),USE(PAGCON:IDRECIBO),RIGHT(1)
                       LINE,AT(0,42,271,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('Elegir Cuota'),AT(98,46,77,22),USE(?Button4),LEFT,ICON('select.ico'),FLAT
                       LINE,AT(1,74,272,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('Nro. Solicitud: '),AT(82,82),USE(?Prompt4)
                       STRING(@n-14),AT(140,82),USE(GLO:IDSOLICITUD)
                       PROMPT('Monto Cuota a Pagar:'),AT(35,101),USE(?Prompt3),FONT(,14)
                       STRING(@n$-10.2),AT(165,101),USE(GLO:MONTO),FONT(,14,COLOR:Red,FONT:bold+FONT:underline)
                       PROMPT('FORMA DE PAGO:'),AT(15,129),USE(?PAGCON:IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(78,129,64,10),USE(PAGCON:IDSUBCUENTA),REQ
                       BUTTON('...'),AT(144,128,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(163,129),USE(SUB:DESCRIPCION)
                       LINE,AT(0,155,273,0),USE(?Line3),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(76,161,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(130,161,55,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('UpdatePAGO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAGCON:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAGCON:Record,History::PAGCON:Record)
  SELF.AddHistoryField(?PAGCON:IDSOCIO,2)
  SELF.AddHistoryField(?PAGCON:IDSUCURSAL,13)
  SELF.AddHistoryField(?PAGCON:IDRECIBO,14)
  SELF.AddHistoryField(?PAGCON:IDSUBCUENTA,16)
  SELF.AddUpdateFile(Access:PAGO_CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PAGO_CONVENIO.Open                                ! File PAGO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGO_CONVENIO
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
    ?PAGCON:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PAGCON:IDSUCURSAL{PROP:ReadOnly} = True
    ?PAGCON:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button4)
    ?PAGCON:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePAGO_CONVENIO',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PAGO_CONVENIO.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePAGO_CONVENIO',QuickWindow)       ! Save window data to non-volatile store
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
      SelectSUBCUENTAS
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
      GLO:IDSOCIO     = PAGCON:IDSOCIO
      GLO:IDSOLICITUD = PAGCON:IDSOLICITUD
      SelectCoutaConvenio()
    OF ?OK
      PAGCON:IDSOLICITUD = GLO:IDSOLICITUD
      PAGCON:MONTO_CUOTA = GLO:MONTO
      PAGCON:NRO_CUOTA   = GLO:NRO_CUOTA
      PAGCON:FECHA       =  TODAY()
      PAGCON:HORA        =  CLOCK()
      PAGCON:IDUSUARIO   =  GLO:IDUSUARIO
      PAGCON:MES    =  MONTH(TODAY())
      PAGCON:ANO    =  YEAR(TODAY())
      PAGCON:PERIODO =   FORMAT(PAGCON:ANO,@N04)&FORMAT(PAGCON:MES,@N02)
      PAGCON:OBSERVACION = GLO:FECHA_LARGO 
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAGCON:IDSOCIO
      SOC:IDSOCIO = PAGCON:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAGCON:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAGCON:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGO_CONVENIO.TryValidateField(2)          ! Attempt to validate PAGCON:IDSOCIO in PAGO_CONVENIO
        SELECT(?PAGCON:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAGCON:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAGCON:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAGCON:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAGCON:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?PAGCON:IDSUBCUENTA
      IF PAGCON:IDSUBCUENTA OR ?PAGCON:IDSUBCUENTA{PROP:Req}
        SUB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
        IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            PAGCON:IDSUBCUENTA = SUB:IDSUBCUENTA
          ELSE
            SELECT(?PAGCON:IDSUBCUENTA)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAGCON:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      !!! CANCELA LA CUOTA EN CONVENIO Y DETALLE DE CONVENIO
      CON5:IDSOLICITUD  = GLO:IDSOLICITUD
      CON5:NRO_CUOTA    = GLO:NRO_CUOTA
      GET (CONVENIO_DETALLE,CON5:IDX_CONVENIO_DETALLE_SOL_NCUOTA)
      IF ERRORCODE() = 35 THEN
          MESSAGE('NO ENCONTRO DETALLE CONVENIO')
      ELSE
          CON5:CANCELADO = 'SI'
          GLO:CARGA_sTRING = CON5:OBSERVACION
          PUT(CONVENIO_DETALLE)
          IF CON5:DEUDA_INICIAL <= 0.1 THEN
                  CON4:IDSOLICITUD =  CON5:IDSOLICITUD
                  GET (CONVENIO,CON4:PK_CONVENIO)
                  IF ERRORCODE() = 35 THEN
                      MESSAGE('NO ENCONTRO EL CONVENIO')
                  ELSE
                     CON4:CANCELADO = 'SI'
                     CON4:FECHA_CANCELADO = TODAY()
                     PUT(CONVENIO)
                  END
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
      SUB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
       !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO + GLO:MONTO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
      !!!!
  
      !! BUSCO EL ID PROVEEDOR
      SOC:IDSOCIO = PAG:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      IDPROVEEDOR# = SOC:IDPROVEEDOR
      !! CARGO INGRESO
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      ING:IDUSUARIO        =   PAGCON:IDUSUARIO
      ING:IDSUBCUENTA      =   PAGCON:IDSUBCUENTA
      ING:OBSERVACION      =   'PAGO CONVENIO '&CLIP(GLO:CARGA_sTRING)&' SOCIO '&PAGCON:IDSOCIO
      ING:MONTO            =   PAGCON:MONTO_CUOTA
      ING:FECHA            =   PAGCON:FECHA
      ING:HORA             =   PAGCON:HORA
      ING:MES              =   PAGCON:MES
      ING:ANO              =   PAGCON:ANO
      ING:PERIODO          =   PAGCON:PERIODO
      ING:IDPROVEEDOR      =   IDPROVEEDOR#
      ING:SUCURSAL         =   PAGCON:IDSUCURSAL
      ING:IDRECIBO         =   PAGCON:IDRECIBO
      !!! CARGA
      RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
      NEXT(RANKING)
      ING:IDINGRESO = RAN:C1
      !MESSAGE(ING:IDINGRESO)
      ACCESS:INGRESOS.INSERT()
  
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:DEBE =  GLO:MONTO
          CAJ:HABER = 0
          CAJ:OBSERVACION = 'PAGO CONVENIO '&CLIP(GLO:CARGA_sTRING)&' SOCIO '&PAGCON:IDSOCIO
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          CAJ:SUCURSAL  =  ING:SUCURSAL
          CAJ:RECIBO    =  ING:IDRECIBO
          CAJ:TIPO      =  'INGRESO'
          CAJ:IDTRANSACCION  = ING:IDINGRESO
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
          LIB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
          LIB:DEBE = GLO:MONTO
          LIB:HABER = 0
          LIB:OBSERVACION = 'PAGO CONVENIO '&CLIP(GLO:CARGA_sTRING)& ' SOCIO '&PAGCON:IDSOCIO
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          LIB:SUCURSAL   =   ING:SUCURSAL
          LIB:RECIBO      =  ING:IDRECIBO
          LIB:IDPROVEEDOR =  ING:IDPROVEEDOR
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
      !BUSCA EL NRO DE
      CLEAR (PAGCON:RECORD,1)                                               
      SET (PAGCON:PK_PAGO_CONVENIO,PAGCON:PK_PAGO_CONVENIO)
      PREVIOUS(PAGO_CONVENIO)
      IF ERRORCODE()
            MESSAGE('ENCONTRO EL REGISTRO DE PAGO')
      ELSE
          GLO:PAGO = PAGCON:IDPAGO 
          
      END
      CLEAR(PAGO_CONVENIO)
  
  
  
      IMPRIMIR_PAGO_CONVENIO
      GLO:IDSOLICITUD = 0
      GLO:MONTO     = 0
      GLO:NRO_CUOTA = 0
      GLO:FECHA_LARGO = ''
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

