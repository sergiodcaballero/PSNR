

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION064.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION057.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION063.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion MS
!!! </summary>
Formulario_MS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::MS:Record   LIKE(MS:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion MS'),AT(,,353,109),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Formulario_MS'),SYSTEM
                       PROMPT('IDTIPO:'),AT(3,1),USE(?MS:IDTIPO:Prompt),TRN
                       ENTRY(@n-14),AT(54,0,64,10),USE(MS:IDTIPO),RIGHT(1)
                       BUTTON('...'),AT(120,-1,12,12),USE(?CallLookup)
                       PROMPT('ORIGEN:'),AT(3,61),USE(?MS:ORIGEN:Prompt),TRN
                       ENTRY(@s100),AT(54,61,203,10),USE(MS:ORIGEN)
                       PROMPT('NUMERO:'),AT(3,15),USE(?MS:NUMERO:Prompt),TRN
                       ENTRY(@s50),AT(54,14,65,10),USE(MS:NUMERO)
                       BUTTON('...'),AT(122,13,12,12),USE(?CallLookup:2)
                       PROMPT('CONTENIDO:'),AT(3,38),USE(?MS:CONTENIDO:Prompt),TRN
                       TEXT,AT(54,28,289,30),USE(MS:CONTENIDO)
                       BUTTON('&Aceptar'),AT(237,89,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(290,89,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  CASE SELF.Request
  OF ChangeRecord OROF DeleteRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & MS:MS & ')' ! Append status message to window title text
  OF InsertRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (New)'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Formulario_MS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?MS:IDTIPO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(MS:Record,History::MS:Record)
  SELF.AddHistoryField(?MS:IDTIPO,9)
  SELF.AddHistoryField(?MS:ORIGEN,4)
  SELF.AddHistoryField(?MS:NUMERO,3)
  SELF.AddHistoryField(?MS:CONTENIDO,5)
  SELF.AddUpdateFile(Access:MS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  Relate:MEDPTO.Open                                       ! File MEDPTO used by this procedure, so make sure it's RelationManager is open
  Relate:MEESTADO.Open                                     ! File MEESTADO used by this procedure, so make sure it's RelationManager is open
  Relate:METIPO.Open                                       ! File METIPO used by this procedure, so make sure it's RelationManager is open
  Relate:MS.Open                                           ! File MS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:MS
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
    ?MS:IDTIPO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?MS:ORIGEN{PROP:ReadOnly} = True
    ?MS:NUMERO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_MS',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:ME.Close
    Relate:MEDPTO.Close
    Relate:MEESTADO.Close
    Relate:METIPO.Close
    Relate:MS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_MS',QuickWindow)             ! Save window data to non-volatile store
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
      SelectMETIPO
      SelectME
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
      if self.request = insertrecord then
          MS:IDUSUARIO    =  GLO:IDUSUARIO
          MS:HORA        =   clock()
          MS:IDESTADO    =   1
          MS:ACTIVO      =   1
          MS:FECHA       =   TODAY()
          MS:IDDPTO      =    1
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?MS:IDTIPO
      MET:IDTIPO = MS:IDTIPO
      IF Access:METIPO.TryFetch(MET:PK_METIPO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          MS:IDTIPO = MET:IDTIPO
        ELSE
          SELECT(?MS:IDTIPO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:MS.TryValidateField(9)                     ! Attempt to validate MS:IDTIPO in MS
        SELECT(?MS:IDTIPO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?MS:IDTIPO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?MS:IDTIPO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      MET:IDTIPO = MS:IDTIPO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        MS:IDTIPO = MET:IDTIPO
      END
      ThisWindow.Reset(1)
    OF ?MS:NUMERO
      IF MS:NUMERO OR ?MS:NUMERO{PROP:Req}
        ME:ME = MS:NUMERO
        IF Access:ME.TryFetch(ME:PK_ME)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            MS:NUMERO = ME:ME
          ELSE
            SELECT(?MS:NUMERO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup:2
      ThisWindow.Update()
      ME:ME = MS:NUMERO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        MS:NUMERO = ME:ME
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

