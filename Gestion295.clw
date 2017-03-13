

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION295.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION296.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SERVICIOXSOCIO
!!! </summary>
UpdateSERVICIOXSOCIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SER2:Record LIKE(SER2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SERVICIOXSOCIO'),AT(,,373,51),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateSERVICIOXSOCIO'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(7,7),USE(?SER2:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(60,7,64,10),USE(SER2:IDSOCIO)
                       BUTTON('...'),AT(127,6,12,12),USE(?CallLookup)
                       STRING(@s30),AT(143,7),USE(SOC:NOMBRE)
                       PROMPT('MATRICULA:'),AT(274,7),USE(?Prompt3)
                       STRING(@n-14),AT(322,7),USE(SOC:MATRICULA)
                       BUTTON('...'),AT(127,18,12,12),USE(?CallLookup:2)
                       PROMPT('IDSERVICIOS:'),AT(7,22),USE(?SER2:IDSERVICIOS:Prompt),TRN
                       ENTRY(@n-14),AT(60,21,64,10),USE(SER2:IDSERVICIOS)
                       STRING(@s50),AT(143,20),USE(SER:DESCRIPCION)
                       BUTTON('&Aceptar'),AT(270,33,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(323,33,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('UpdateSERVICIOXSOCIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SER2:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SER2:Record,History::SER2:Record)
  SELF.AddHistoryField(?SER2:IDSOCIO,1)
  SELF.AddHistoryField(?SER2:IDSERVICIOS,2)
  SELF.AddUpdateFile(Access:SERVICIOXSOCIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SERVICIOS.Open                                    ! File SERVICIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SERVICIOXSOCIO.Open                               ! File SERVICIOXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SERVICIOXSOCIO
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
    ?SER2:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    DISABLE(?CallLookup:2)
    ?SER2:IDSERVICIOS{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSERVICIOXSOCIO',QuickWindow)         ! Restore window settings from non-volatile store
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
    Relate:SERVICIOS.Close
    Relate:SERVICIOXSOCIO.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSERVICIOXSOCIO',QuickWindow)      ! Save window data to non-volatile store
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
      SelectSERVICIOS
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
    OF ?OK
      IF INSERTRECORD THEN
          SER2:FECHA = TODAY()
          SER2:HORA = CLOCK()
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SER2:IDSOCIO
      SOC:IDSOCIO = SER2:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SER2:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?SER2:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SERVICIOXSOCIO.TryValidateField(1)         ! Attempt to validate SER2:IDSOCIO in SERVICIOXSOCIO
        SELECT(?SER2:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SER2:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SER2:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = SER2:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SER2:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update()
      SER:IDSERVICIOS = SER2:IDSERVICIOS
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SER2:IDSERVICIOS = SER:IDSERVICIOS
      END
      ThisWindow.Reset(1)
    OF ?SER2:IDSERVICIOS
      SER:IDSERVICIOS = SER2:IDSERVICIOS
      IF Access:SERVICIOS.TryFetch(SER:PK_SERVICIOS)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SER2:IDSERVICIOS = SER:IDSERVICIOS
        ELSE
          SELECT(?SER2:IDSERVICIOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SERVICIOXSOCIO.TryValidateField(2)         ! Attempt to validate SER2:IDSERVICIOS in SERVICIOXSOCIO
        SELECT(?SER2:IDSERVICIOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SER2:IDSERVICIOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SER2:IDSERVICIOS{PROP:FontColor} = FieldColorQueue.OldColor
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

