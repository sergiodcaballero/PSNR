

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION053.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION052.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SOCIOSXTRABAJO
!!! </summary>
UpdateSOCIOSXTRABAJO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SOC2:Record LIKE(SOC2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SOCIOSXTRABAJO'),AT(,,272,56),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateSOCIOSXTRABAJO'),SYSTEM
                       PROMPT('IDSOCIOS:'),AT(3,3),USE(?SOC2:IDSOCIOS:Prompt),TRN
                       ENTRY(@n-14),AT(57,3,64,10),USE(SOC2:IDSOCIOS)
                       BUTTON('...'),AT(122,2,12,12),USE(?CallLookup)
                       STRING(@s30),AT(137,3),USE(SOC:NOMBRE)
                       PROMPT('IDTRABAJO:'),AT(3,17),USE(?SOC2:IDTRABAJO:Prompt),TRN
                       ENTRY(@n-14),AT(57,17,64,10),USE(SOC2:IDTRABAJO)
                       BUTTON('...'),AT(122,15,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(138,16),USE(TRA:DESCRIPCION)
                       BUTTON('&Aceptar'),AT(85,40,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(139,40,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateSOCIOSXTRABAJO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SOC2:IDSOCIOS:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SOC2:Record,History::SOC2:Record)
  SELF.AddHistoryField(?SOC2:IDSOCIOS,1)
  SELF.AddHistoryField(?SOC2:IDTRABAJO,2)
  SELF.AddUpdateFile(Access:SOCIOSXTRABAJO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXTRABAJO.Open                               ! File SOCIOSXTRABAJO used by this procedure, so make sure it's RelationManager is open
  Relate:TRABAJO.Open                                      ! File TRABAJO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SOCIOSXTRABAJO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SOC2:IDSOCIOS{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC2:IDTRABAJO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSOCIOSXTRABAJO',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
    Relate:SOCIOSXTRABAJO.Close
    Relate:TRABAJO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSOCIOSXTRABAJO',QuickWindow)      ! Save window data to non-volatile store
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
      SelectTRABAJO
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SOC2:IDSOCIOS
      SOC:IDSOCIO = SOC2:IDSOCIOS
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SOC2:IDSOCIOS = SOC:IDSOCIO
        ELSE
          SELECT(?SOC2:IDSOCIOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOSXTRABAJO.TryValidateField(1)         ! Attempt to validate SOC2:IDSOCIOS in SOCIOSXTRABAJO
        SELECT(?SOC2:IDSOCIOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC2:IDSOCIOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC2:IDSOCIOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = SOC2:IDSOCIOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SOC2:IDSOCIOS = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SOC2:IDTRABAJO
      TRA:IDTRABAJO = SOC2:IDTRABAJO
      IF Access:TRABAJO.TryFetch(TRA:PK_TRABAJO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SOC2:IDTRABAJO = TRA:IDTRABAJO
        ELSE
          SELECT(?SOC2:IDTRABAJO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOSXTRABAJO.TryValidateField(2)         ! Attempt to validate SOC2:IDTRABAJO in SOCIOSXTRABAJO
        SELECT(?SOC2:IDTRABAJO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC2:IDTRABAJO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC2:IDTRABAJO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      TRA:IDTRABAJO = SOC2:IDTRABAJO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SOC2:IDTRABAJO = TRA:IDTRABAJO
      END
      ThisWindow.Reset(1)
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

