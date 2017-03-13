

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION139.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION115.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION140.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion NOMENCLADORXOS
!!! </summary>
Formulario_NOMENCLADORXOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::NOM2:Record LIKE(NOM2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion NOMENCLADORXOS'),AT(,,334,70),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Formulario_NOMENCLADORXOS'),SYSTEM
                       PROMPT('IDOS:'),AT(2,1),USE(?NOM2:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(66,1,31,10),USE(NOM2:IDOS),DISABLE
                       PROMPT('IDNOMENCLADOR:'),AT(2,15),USE(?NOM2:IDNOMENCLADOR:Prompt),TRN
                       ENTRY(@n-14),AT(66,15,32,10),USE(NOM2:IDNOMENCLADOR)
                       BUTTON('...'),AT(101,14,12,12),USE(?CallLookup)
                       ENTRY(@P##.##.##P),AT(115,15,40,10),USE(NOM:CODIGO),TRN
                       PROMPT('VALOR ACTUAL:'),AT(2,29),USE(?NOM2:VALOR:Prompt),TRN
                       ENTRY(@n-7.2),AT(66,29,40,10),USE(NOM2:VALOR)
                       PROMPT('VALOR ANTERIOR:'),AT(114,29),USE(?NOM2:VALOR_ANTERIOR:Prompt)
                       ENTRY(@n-7.2),AT(182,29,40,10),USE(NOM2:VALOR_ANTERIOR)
                       LINE,AT(2,47,332,0),USE(?Line1),COLOR(COLOR:Black)
                       ENTRY(@s100),AT(159,15,169,10),USE(NOM:DESCRIPCION),TRN
                       BUTTON('&Aceptar'),AT(110,53,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(163,53,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Formulario_NOMENCLADORXOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?NOM2:IDOS:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(NOM2:Record,History::NOM2:Record)
  SELF.AddHistoryField(?NOM2:IDOS,1)
  SELF.AddHistoryField(?NOM2:IDNOMENCLADOR,2)
  SELF.AddHistoryField(?NOM2:VALOR,3)
  SELF.AddHistoryField(?NOM2:VALOR_ANTERIOR,4)
  SELF.AddUpdateFile(Access:NOMENCLADORXOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  Relate:NOMENCLADORXOS.Open                               ! File NOMENCLADORXOS used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:NOMENCLADORXOS
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
    ?NOM2:IDOS{PROP:ReadOnly} = True
    ?NOM2:IDNOMENCLADOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?NOM:CODIGO{PROP:ReadOnly} = True
    ?NOM2:VALOR{PROP:ReadOnly} = True
    ?NOM2:VALOR_ANTERIOR{PROP:ReadOnly} = True
    ?NOM:DESCRIPCION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_NOMENCLADORXOS',QuickWindow)    ! Restore window settings from non-volatile store
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
    Relate:NOMENCLADORXOS.Close
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_NOMENCLADORXOS',QuickWindow) ! Save window data to non-volatile store
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
      SelectOBRA_SOCIAL
      SelectNOMENCLADOR
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
    OF ?NOM2:IDOS
      OBR:IDOS = NOM2:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          NOM2:IDOS = OBR:IDOS
        ELSE
          SELECT(?NOM2:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:NOMENCLADORXOS.TryValidateField(1)         ! Attempt to validate NOM2:IDOS in NOMENCLADORXOS
        SELECT(?NOM2:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?NOM2:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?NOM2:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?NOM2:IDNOMENCLADOR
      NOM:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
      IF Access:NOMENCLADOR.TryFetch(NOM:PK_NOMENCLADOR)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          NOM2:IDNOMENCLADOR = NOM:IDNOMENCLADOR
        ELSE
          SELECT(?NOM2:IDNOMENCLADOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:NOMENCLADORXOS.TryValidateField(2)         ! Attempt to validate NOM2:IDNOMENCLADOR in NOMENCLADORXOS
        SELECT(?NOM2:IDNOMENCLADOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?NOM2:IDNOMENCLADOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?NOM2:IDNOMENCLADOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      NOM:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        NOM2:IDNOMENCLADOR = NOM:IDNOMENCLADOR
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

