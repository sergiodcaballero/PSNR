

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION300.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion RENUNCIA
!!! </summary>
UpdateRENUNCIA PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
CONSERVA_DEUDA       STRING('''O''e {16}')                 ! 
History::REN:Record  LIKE(REN:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion RENUNCIA'),AT(,,248,132),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateRENUNCIA'),SYSTEM
                       BUTTON('...'),AT(103,7,12,12),USE(?CallLookup)
                       STRING(@s30),AT(118,8),USE(SOC:NOMBRE)
                       PROMPT('IDSOCIO:'),AT(3,8),USE(?REN:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(37,8,64,10),USE(REN:IDSOCIO)
                       PROMPT('LIBRO:'),AT(3,22),USE(?REN:LIBRO:Prompt),TRN
                       ENTRY(@s50),AT(37,22,65,10),USE(REN:LIBRO)
                       PROMPT('FOLIO:'),AT(3,36),USE(?REN:FOLIO:Prompt),TRN
                       ENTRY(@n-14),AT(37,36,64,10),USE(REN:FOLIO)
                       PROMPT('ACTA:'),AT(3,50),USE(?REN:ACTA:Prompt),TRN
                       ENTRY(@s50),AT(37,50,204,10),USE(REN:ACTA)
                       PROMPT('FECHA BAJA:'),AT(2,65),USE(?REN:FECHA:Prompt)
                       ENTRY(@d17),AT(53,64,64,10),USE(REN:FECHA),REQ
                       OPTION('CONSERVA DEUDA'),AT(2,78,81,26),USE(CONSERVA_DEUDA),BOXED
                         RADIO('NO'),AT(11,89),USE(?CONSERVA_DEUDA:Radio1)
                         RADIO('SI'),AT(38,89),USE(?CONSERVA_DEUDA:Radio2)
                       END
                       BUTTON('&Aceptar'),AT(144,116,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(197,116,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('UpdateRENUNCIA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CallLookup
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(REN:Record,History::REN:Record)
  SELF.AddHistoryField(?REN:IDSOCIO,2)
  SELF.AddHistoryField(?REN:LIBRO,4)
  SELF.AddHistoryField(?REN:FOLIO,5)
  SELF.AddHistoryField(?REN:ACTA,6)
  SELF.AddHistoryField(?REN:FECHA,7)
  SELF.AddUpdateFile(Access:RENUNCIA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RENUNCIA.Open                                     ! File RENUNCIA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:RENUNCIA
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
    DISABLE(?CallLookup)
    ?REN:IDSOCIO{PROP:ReadOnly} = True
    ?REN:LIBRO{PROP:ReadOnly} = True
    ?REN:FOLIO{PROP:ReadOnly} = True
    ?REN:ACTA{PROP:ReadOnly} = True
    ?REN:FECHA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRENUNCIA',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:FACTURA.Close
    Relate:RENUNCIA.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRENUNCIA',QuickWindow)            ! Save window data to non-volatile store
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
    SelectSOCIOS
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
    OF ?OK
      IF InsertRecord THEN
          !REN:FECHA = TODAY()
          REN:HORA = CLOCK()
          REN:IDUSUARIO = GLO:IDUSUARIO
          if REN:FECHA  <> 0 then
              
              SOC:IDSOCIO = REN:IDSOCIO
              ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
              SOC:BAJA        = 'SI'
              SOC:FECHA_BAJA  =  REN:FECHA 
              SOC:OBSERVACION =   REN:ACTA
              IF CONSERVA_DEUDA = 'NO' THEN
                  SOC:CANTIDAD = 0
              
                  !!! ANULA CUOTAS ADEUDADAS
                  FAC:IDSOCIO = REN:IDSOCIO
                  SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
                  LOOP
                      IF ACCESS:FACTURA.NEXT() THEN BREAK.
                      IF FAC:IDSOCIO <> REN:IDSOCIO  THEN BREAK.
                      IF FAC:ESTADO = '' THEN
                          FAC:ESTADO = 'ANULADO BAJA'
                          ACCESS:FACTURA.UPDATE()
                      END
                  END
              END
              ACCESS:SOCIOS.UPDATE()
          END
      END
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = REN:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        REN:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?REN:IDSOCIO
      SOC:IDSOCIO = REN:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          REN:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?REN:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:RENUNCIA.TryValidateField(2)               ! Attempt to validate REN:IDSOCIO in RENUNCIA
        SELECT(?REN:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?REN:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?REN:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
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

