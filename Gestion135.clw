

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION135.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION115.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion LIQUIDACION
!!! </summary>
LIQUIDACION_COBRO_FORM PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::LIQ:Record  LIKE(LIQ:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion LIQUIDACION'),AT(,,245,199),FONT('Arial',8,,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('LIQUIDACION_COBRO_FORM'),SYSTEM
                       PROMPT('IDLIQUIDACION:'),AT(5,7),USE(?LIQ:IDLIQUIDACION:Prompt),TRN
                       ENTRY(@n-7),AT(68,7,40,10),USE(LIQ:IDLIQUIDACION),LEFT,DISABLE,REQ
                       PROMPT('IDSOCIO:'),AT(5,21),USE(?LIQ:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(68,21,41,10),USE(LIQ:IDSOCIO),DISABLE
                       STRING(@s30),AT(117,20),USE(SOC:NOMBRE)
                       PROMPT('IDOS:'),AT(5,35),USE(?LIQ:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(68,35,42,10),USE(LIQ:IDOS),DISABLE
                       STRING(@s30),AT(116,36),USE(OBR:NOMPRE_CORTO)
                       PROMPT('MES:'),AT(5,49),USE(?LIQ:MES:Prompt),TRN
                       SPIN(@n-14),AT(68,49,41,10),USE(LIQ:MES),DISABLE,RANGE(1,12)
                       PROMPT('ANO:'),AT(119,53),USE(?LIQ:ANO:Prompt),TRN
                       SPIN(@n-14),AT(139,51,41,10),USE(LIQ:ANO),DISABLE,RANGE(2009,2999)
                       LINE,AT(0,66,249,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Monto Presentado a Cobro:'),AT(2,71),USE(?Prompt18)
                       STRING(@n$-12.2),AT(98,70),USE(LIQ:MONTO)
                       STRING(@n$-12.2),AT(86,136),USE(LIQ:MONTO_PAGADO,,?LIQ:MONTO_PAGADO:2)
                       PROMPT('Débito de la OS.:'),AT(2,86),USE(?LIQ:DEBITO:Prompt),TRN
                       ENTRY(@n$-10.2),AT(99,85,44,10),USE(LIQ:DEBITO),DECIMAL(14)
                       STRING(@n10.2),AT(205,148),USE(LIQ:COMISION,,?LIQ:COMISION:2)
                       STRING(@n$-10.2),AT(86,149),USE(LIQ:DEBITO_COMISION)
                       PROMPT('Débito por Comisión:'),AT(0,151),USE(?Prompt16)
                       PROMPT('% Comision'),AT(161,148),USE(?Prompt13)
                       PROMPT('Neto Total a Liquidado:'),AT(0,163),USE(?Prompt14),FONT(,12,,FONT:bold)
                       STRING(@n$-10.2),AT(111,162),USE(LIQ:MONTO_TOTAL),FONT(,12,,FONT:bold)
                       LINE,AT(0,178,240,0),USE(?Line4),COLOR(COLOR:Black)
                       BUTTON('Calcular Liquidación'),AT(60,108,117,24),USE(?Button3),LEFT,ICON('currency_dollar.ico'), |
  FLAT
                       LINE,AT(1,133,244,0),USE(?Line3),COLOR(COLOR:Black)
                       LINE,AT(0,104,245,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('Monto Pagado por la OS.'),AT(0,136),USE(?Prompt17)
                       BUTTON('&Aceptar'),AT(136,183,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(191,183,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & LIQ:IDLIQUIDACION & ')' ! Append status message to window title text
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_COBRO_FORM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LIQ:IDLIQUIDACION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(LIQ:Record,History::LIQ:Record)
  SELF.AddHistoryField(?LIQ:IDLIQUIDACION,1)
  SELF.AddHistoryField(?LIQ:IDSOCIO,2)
  SELF.AddHistoryField(?LIQ:IDOS,3)
  SELF.AddHistoryField(?LIQ:MES,4)
  SELF.AddHistoryField(?LIQ:ANO,5)
  SELF.AddHistoryField(?LIQ:MONTO,8)
  SELF.AddHistoryField(?LIQ:MONTO_PAGADO:2,13)
  SELF.AddHistoryField(?LIQ:DEBITO,15)
  SELF.AddHistoryField(?LIQ:COMISION:2,16)
  SELF.AddHistoryField(?LIQ:DEBITO_COMISION,18)
  SELF.AddHistoryField(?LIQ:MONTO_TOTAL,21)
  SELF.AddUpdateFile(Access:LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:FORMA_PAGO.Open                                   ! File FORMA_PAGO used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONXSOCIO.Open                            ! File LIQUIDACIONXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LIQUIDACION
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?LIQ:IDLIQUIDACION{PROP:ReadOnly} = True
    ?LIQ:IDSOCIO{PROP:ReadOnly} = True
    ?LIQ:IDOS{PROP:ReadOnly} = True
    ?LIQ:MONTO{PROP:ReadOnly} = True
    ?LIQ:DEBITO{PROP:ReadOnly} = True
    ?LIQ:MONTO_TOTAL{PROP:ReadOnly} = True
    DISABLE(?Button3)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_COBRO_FORM',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:CONF_EMP.Close
    Relate:CUENTAS.Close
    Relate:FACTURA.Close
    Relate:FONDOS.Close
    Relate:FORMA_PAGO.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONXSOCIO.Close
    Relate:OBRA_SOCIAL.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_COBRO_FORM',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  OBR:IDOS = LIQ:IDOS                                      ! Assign linking field value
  Access:OBRA_SOCIAL.Fetch(OBR:PK_OBRA_SOCIAL)
  SOC:IDSOCIO = LIQ:IDSOCIO                                ! Assign linking field value
  Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
  PARENT.Reset(Force)


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
      SelectOBRA_SOCIAL
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
      !!! BUSCO % DE LIQUIDACION EN TABLA
      COF:RAZON_SOCIAL = GLO:RAZON_SOCIAL
      ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
      LIQ:COMISION = COF:PORCENTAJE_LIQUIDACION
      COMISION$ = LIQ:COMISION / 100
      
      
      
      !!! CALCULO EL DEBITO POR LA CANTIDAD DE CUOTAS.- BUSCO EN FACUTRAS IMPAGAS LA CANTIDAD QUE SE CARGO Y LAS SUMO
      IF LIQ:CANTIDAD_CUOTAS_PAGADAS > 0 THEN
          I# = 0
          FAC:IDSOCIO = LIQ:IDSOCIO
          SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
          LOOP
              IF ACCESS:FACTURA.NEXT() THEN BREAK.
              IF FAC:IDSOCIO <> LIQ:IDSOCIO THEN BREAK.
              IF FAC:ESTADO = '' THEN
                  LIQ:DEBITO_PAGO_CUOTAS = LIQ:DEBITO_PAGO_CUOTAS + FAC:TOTAL
                  I# = I# +1
               END
               IF I# = LIQ:CANTIDAD_CUOTAS_PAGADAS THEN     
                  BREAK
               END
          END
      
          IF I# <> LIQ:CANTIDAD_CUOTAS_PAGADAS THEN
              MESSAGE('La cantidad de Cuotas a descontar es Mayor a la cantidad de Cuotas adeudadas | Se descuenta '&i#&' cuotas')
              LIQ:CANTIDAD_CUOTAS_PAGADAS = I# !! SI EL SOCIO NO POSEE LA CANTIDAD SE REEMPLAZA POR LA NUEVA
          end
      END
      
      !!!!!!
      
      LIQ:DEBITO_COMISION = LIQ:MONTO * COMISION$
      LIQ:MONTO_PAGADO =  LIQ:MONTO - (LIQ:DEBITO + LIQ:DEBITO_COMISION)
      LIQ:MONTO_TOTAL = LIQ:MONTO - (LIQ:DEBITO + LIQ:DEBITO_COMISION + LIQ:DEBITO_PAGO_CUOTAS) !! este ultimo no se ocupa en este caso. Se liquida en el total
      enable  (?OK)
      disable (?LIQ:DEBITO)
      disable (?Button3)
      THISWINDOW.RESET(1)
      
       
      
      
      
    OF ?OK
      LIQ:COBRADO = 'SI'
      LIQ:FECHA_COBRO = today()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LIQ:IDSOCIO
      SOC:IDSOCIO = LIQ:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          LIQ:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?LIQ:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(2)            ! Attempt to validate LIQ:IDSOCIO in LIQUIDACION
        SELECT(?LIQ:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:IDOS
      OBR:IDOS = LIQ:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          LIQ:IDOS = OBR:IDOS
        ELSE
          SELECT(?LIQ:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(3)            ! Attempt to validate LIQ:IDOS in LIQUIDACION
        SELECT(?LIQ:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:MES
      IF Access:LIQUIDACION.TryValidateField(4)            ! Attempt to validate LIQ:MES in LIQUIDACION
        SELECT(?LIQ:MES)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:MES
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:MES{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:ANO
      IF Access:LIQUIDACION.TryValidateField(5)            ! Attempt to validate LIQ:ANO in LIQUIDACION
        SELECT(?LIQ:ANO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:ANO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:ANO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
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
  If  Self.Request=CHANGERecord AND SELF.RESPONSE = RequestCompleted Then
      !! CARGO LA LIQUIDACION EN EL TOTAL POR SOCIO
      LXSOC:IDSOCIO    = LIQ:IDSOCIO
      LXSOC:PERIODO    = LIQ:PERIODO
      GET(LIQUIDACIONXSOCIO,LXSOC:PK_LIQUIDACIONXSOCIO)
      IF ERRORCODE() = 35 THEN
          LXSOC:IDSOCIO           =  LIQ:IDSOCIO
          LXSOC:MES               =  LIQ:MES
          LXSOC:ANO               =  LIQ:ANO
          LXSOC:PERIODO           =  LIQ:PERIODO
          LXSOC:MONTO             =  LIQ:MONTO
          LXSOC:MONTO_PAGADO      =  LIQ:MONTO_PAGADO
          LXSOC:DEBITO            =  LIQ:DEBITO
          LXSOC:COMISION          =  LIQ:COMISION
          LXSOC:CANTIDAD          =  LIQ:CANTIDAD
          LXSOC:DEBITO_COMISION   =  LIQ:DEBITO_COMISION
          LXSOC:MONTO_TOTAL       =  LIQ:MONTO_TOTAL
          ACCESS:LIQUIDACIONXSOCIO.INSERT()
       ELSE
          LXSOC:MONTO             =  LIQ:MONTO  + LXSOC:MONTO
          LXSOC:MONTO_PAGADO      =  LIQ:MONTO_PAGADO  + LXSOC:MONTO_PAGADO
          LXSOC:DEBITO            =  LIQ:DEBITO        + LXSOC:DEBITO
          LXSOC:CANTIDAD          =  LIQ:CANTIDAD      + LXSOC:CANTIDAD
          LXSOC:DEBITO_COMISION   =  LIQ:DEBITO_COMISION + LXSOC:DEBITO_COMISION
          LXSOC:MONTO_TOTAL       =  LIQ:MONTO_TOTAL     +  LXSOC:MONTO_TOTAL
          ACCESS:LIQUIDACIONXSOCIO.update()
  
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

