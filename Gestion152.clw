

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION152.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION151.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion LIQUIDACION_CODIGO
!!! </summary>
ABM_LIQUIDACION_CODIGO PROCEDURE (OS)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:VALOR            STRING(20)                            ! 
History::LIQC:Record LIKE(LIQC:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion LIQUIDACION_CODIGO'),AT(,,268,98),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABM_LIQUIDACION_CODIGO'),SYSTEM
                       PROMPT('IDLIQUIDACION:'),AT(6,4),USE(?LIQC:IDLIQUIDACION:Prompt)
                       ENTRY(@n-14),AT(60,3,34,10),USE(LIQC:IDLIQUIDACION),RIGHT(1),DISABLE
                       PROMPT('IDNOMENCLADOR:'),AT(1,23),USE(?LIQC:IDNOMENCLADOR:Prompt),TRN
                       ENTRY(@n-14),AT(60,23,35,10),USE(LIQC:IDNOMENCLADOR),RIGHT(1)
                       BUTTON('...'),AT(99,22,12,12),USE(?CallLookup)
                       STRING(@n$-10.2),AT(59,39),USE(NOM2:VALOR)
                       STRING(@n$-10.2),AT(68,70),USE(NOM2:VALOR_ANTERIOR)
                       PROMPT('Valor Actual:'),AT(2,40),USE(?Prompt5)
                       STRING(@P##.##.##P),AT(117,23),USE(NOM:CODIGO)
                       STRING(@s100),AT(147,23),USE(NOM:DESCRIPCION)
                       CHECK('Valor Anterior'),AT(5,69),USE(LOC:VALOR),VALUE('ANTERIOR','ACTUAL')
                       PROMPT('CANTIDAD:'),AT(1,53),USE(?LIQC:CANTIDAD:Prompt)
                       ENTRY(@n-4),AT(58,52,34,10),USE(LIQC:CANTIDAD),RIGHT(1)
                       LINE,AT(1,65,267,0),USE(?Line3),COLOR(COLOR:Black)
                       LINE,AT(0,81,267,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('IDOS:'),AT(100,3),USE(?LIQC:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(121,3,37,10),USE(LIQC:IDOS),RIGHT(1),DISABLE
                       STRING(@N3),AT(163,3,21,10),USE(oS)
                       LINE,AT(1,18,268,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(55,84,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(108,84,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('ABM_LIQUIDACION_CODIGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LIQC:IDLIQUIDACION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(LIQC:Record,History::LIQC:Record)
  SELF.AddHistoryField(?LIQC:IDLIQUIDACION,1)
  SELF.AddHistoryField(?LIQC:IDNOMENCLADOR,2)
  SELF.AddHistoryField(?LIQC:CANTIDAD,5)
  SELF.AddHistoryField(?LIQC:IDOS,3)
  SELF.AddUpdateFile(Access:LIQUIDACION_CODIGO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:NOMENCLADORXOS.Open                               ! File NOMENCLADORXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LIQUIDACION_CODIGO
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
    ?LIQC:IDLIQUIDACION{PROP:ReadOnly} = True
    ?LIQC:IDNOMENCLADOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?LIQC:CANTIDAD{PROP:ReadOnly} = True
    ?LIQC:IDOS{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_LIQUIDACION_CODIGO',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  LIQC:IDOS = OS
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:NOMENCLADORXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_LIQUIDACION_CODIGO',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  NOM2:IDOS = LIQC:IDOS                                    ! Assign linking field value
  NOM2:IDNOMENCLADOR = LIQC:IDNOMENCLADOR                  ! Assign linking field value
  Access:NOMENCLADORXOS.Fetch(NOM2:PK_NOMENCLADORXOS)
  NOM:IDNOMENCLADOR = NOM2:IDNOMENCLADOR                   ! Assign linking field value
  Access:NOMENCLADOR.Fetch(NOM:PK_NOMENCLADOR)
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
    SelectNOMENCLADORXOS((LIQC:IDOS))
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
      LIQC:IDOS = OS
      IF LOC:VALOR = 'ANTERIOR' THEN
          LIQC:VALOR = NOM2:VALOR_ANTERIOR
      ELSE
          LIQC:VALOR = NOM2:VALOR
      END
      
      LIQC:TOTAL = LIQC:VALOR * LIQC:CANTIDAD
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LIQC:IDNOMENCLADOR
      NOM2:IDOS = LIQC:IDOS
      NOM2:IDNOMENCLADOR = LIQC:IDNOMENCLADOR
      IF Access:NOMENCLADORXOS.TryFetch(NOM2:PK_NOMENCLADORXOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          LIQC:IDOS = NOM2:IDOS
          LIQC:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
        ELSE
          SELECT(?LIQC:IDNOMENCLADOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION_CODIGO.TryValidateField(2)     ! Attempt to validate LIQC:IDNOMENCLADOR in LIQUIDACION_CODIGO
        SELECT(?LIQC:IDNOMENCLADOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQC:IDNOMENCLADOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQC:IDNOMENCLADOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      NOM2:IDOS = LIQC:IDOS
      NOM2:IDNOMENCLADOR = LIQC:IDNOMENCLADOR
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        LIQC:IDOS = NOM2:IDOS
        LIQC:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
      END
      ThisWindow.Reset(1)
    OF ?LIQC:IDOS
      IF Access:LIQUIDACION_CODIGO.TryValidateField(3)     ! Attempt to validate LIQC:IDOS in LIQUIDACION_CODIGO
        SELECT(?LIQC:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQC:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQC:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
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

