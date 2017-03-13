

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION339.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION336.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION338.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONSULTORIO_EQUIPO
!!! </summary>
UpdateCONSULTORIO_EQUIPO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON:Record  LIKE(CON:RECORD),THREAD
QuickWindow          WINDOW('IDCONSULTORIO:'),AT(,,358,74),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateCONSULTORIO_EQUIPO'),SYSTEM
                       BUTTON('&Aceptar'),AT(233,50,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(289,50,57,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('ID CONSULTORIO:'),AT(15,4),USE(?CON:IDCONSULTORIO:Prompt),TRN
                       ENTRY(@n-14),AT(63,4,64,10),USE(CON:IDCONSULTORIO),DISABLE
                       PROMPT('IDTIPOCONSUL:'),AT(8,17),USE(?CON:IDTIPOEQUIPO:Prompt),TRN
                       ENTRY(@n-14),AT(63,17,64,10),USE(CON:IDTIPOEQUIPO)
                       BUTTON('...'),AT(129,16,12,12),USE(?CallLookup)
                       STRING(@s50),AT(145,17),USE(TIP5:DESCRIPCION)
                       PROMPT('OBSERVACION:'),AT(8,30),USE(?CON:OBSERVACION:Prompt),TRN
                       ENTRY(@s100),AT(63,30,282,10),USE(CON:OBSERVACION)
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
  GlobalErrors.SetProcedureName('UpdateCONSULTORIO_EQUIPO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON:Record,History::CON:Record)
  SELF.AddHistoryField(?CON:IDCONSULTORIO,1)
  SELF.AddHistoryField(?CON:IDTIPOEQUIPO,2)
  SELF.AddHistoryField(?CON:OBSERVACION,3)
  SELF.AddUpdateFile(Access:CONSULTORIO_EQUIPO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTORIO_EQUIPO.Open                           ! File CONSULTORIO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_EQUIPO.Open                                  ! File TIPO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONSULTORIO_EQUIPO
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
    ?CON:IDCONSULTORIO{PROP:ReadOnly} = True
    ?CON:IDTIPOEQUIPO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CON:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCONSULTORIO_EQUIPO',QuickWindow)     ! Restore window settings from non-volatile store
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
    Relate:CONSULTORIO.Close
    Relate:CONSULTORIO_EQUIPO.Close
    Relate:TIPO_EQUIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONSULTORIO_EQUIPO',QuickWindow)  ! Save window data to non-volatile store
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
      SelectCONSULTORIO
      SelectTIPO_EQUIPO
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
      CON:FECHA = TODAY()
      CON:HORA = CLOCK()
      CON:IDUSUARIO = GLO:IDUSUARIO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CON:IDCONSULTORIO
      CON2:IDCONSULTORIO = CON:IDCONSULTORIO
      IF Access:CONSULTORIO.TryFetch(CON2:PK_CONSULTORIO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON:IDCONSULTORIO = CON2:IDCONSULTORIO
        ELSE
          SELECT(?CON:IDCONSULTORIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO_EQUIPO.TryValidateField(1)     ! Attempt to validate CON:IDCONSULTORIO in CONSULTORIO_EQUIPO
        SELECT(?CON:IDCONSULTORIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON:IDCONSULTORIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON:IDCONSULTORIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CON:IDTIPOEQUIPO
      TIP5:IDTIPOEQUIPO = CON:IDTIPOEQUIPO
      IF Access:TIPO_EQUIPO.TryFetch(TIP5:PK_TIPO_EQUIPO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON:IDTIPOEQUIPO = TIP5:IDTIPOEQUIPO
        ELSE
          SELECT(?CON:IDTIPOEQUIPO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO_EQUIPO.TryValidateField(2)     ! Attempt to validate CON:IDTIPOEQUIPO in CONSULTORIO_EQUIPO
        SELECT(?CON:IDTIPOEQUIPO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON:IDTIPOEQUIPO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON:IDTIPOEQUIPO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      TIP5:IDTIPOEQUIPO = CON:IDTIPOEQUIPO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CON:IDTIPOEQUIPO = TIP5:IDTIPOEQUIPO
      END
      ThisWindow.Reset(1)
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

