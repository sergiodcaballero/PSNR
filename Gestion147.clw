

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION147.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion NOMENCLADOR
!!! </summary>
Formulario_NOMENCLADOR PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::NOM:Record  LIKE(NOM:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion NOMENCLADOR'),AT(,,358,55),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Formulario_NOMENCLADOR'),SYSTEM
                       PROMPT('CODIGO:'),AT(1,3),USE(?NOM:CODIGO:Prompt),TRN
                       ENTRY(@n-14),AT(61,3,64,10),USE(NOM:CODIGO)
                       BUTTON('&Aceptar'),AT(246,37,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(299,37,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('DESCRIPCION:'),AT(1,15),USE(?NOM:DESCRIPCION:Prompt),TRN
                       ENTRY(@s100),AT(61,15,282,10),USE(NOM:DESCRIPCION)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
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
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Formulario_NOMENCLADOR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?NOM:CODIGO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(NOM:Record,History::NOM:Record)
  SELF.AddHistoryField(?NOM:CODIGO,2)
  SELF.AddHistoryField(?NOM:DESCRIPCION,3)
  SELF.AddUpdateFile(Access:NOMENCLADOR)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:NOMENCLADOR
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
    ?NOM:CODIGO{PROP:ReadOnly} = True
    ?NOM:DESCRIPCION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_NOMENCLADOR',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:NOMENCLADOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_NOMENCLADOR',QuickWindow)    ! Save window data to non-volatile store
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

