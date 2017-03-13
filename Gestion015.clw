

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION015.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION014.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION016.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the NOMENCLADORXOS File
!!! </summary>
NomencladorXOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(NOMENCLADORXOS)
                       PROJECT(NOM2:VALOR)
                       PROJECT(NOM2:VALOR_ANTERIOR)
                       PROJECT(NOM2:IDOS)
                       PROJECT(NOM2:IDNOMENCLADOR)
                       JOIN(NOM:PK_NOMENCLADOR,NOM2:IDNOMENCLADOR)
                         PROJECT(NOM:CODIGO)
                         PROJECT(NOM:DESCRIPCION)
                         PROJECT(NOM:IDNOMENCLADOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
NOM:CODIGO             LIKE(NOM:CODIGO)               !List box control field - type derived from field
NOM:DESCRIPCION        LIKE(NOM:DESCRIPCION)          !List box control field - type derived from field
NOM2:VALOR             LIKE(NOM2:VALOR)               !List box control field - type derived from field
NOM2:VALOR_ANTERIOR    LIKE(NOM2:VALOR_ANTERIOR)      !List box control field - type derived from field
NOM2:IDOS              LIKE(NOM2:IDOS)                !List box control field - type derived from field
NOM2:IDNOMENCLADOR     LIKE(NOM2:IDNOMENCLADOR)       !Primary key field - type derived from field
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW(' NOMENCLADOR X OBRA SOCIAL'),AT(,,322,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('NomencladorXOS'),SYSTEM
                       LIST,AT(8,30,309,124),USE(?Browse:1),HVSCROLL,FORMAT('40L(2)|M~CODIGO~C(0)@P##.##.##P@1' & |
  '69L(2)|M~DESCRIPCION~C(0)@s100@36L(1)|M~VALOR~C(0)@n$-7.2@60L(1)|M~VALOR ANTERIOR~C(' & |
  '0)@n$-7.2@64R(2)|M~IDOS~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de ' & |
  'NOMENCLADORXOS')
                       BUTTON('&Ver'),AT(107,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(160,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(213,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(266,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,317,172),USE(?CurrentTab)
                         TAB('NOMENCLADOR'),USE(?Tab:2)
                         END
                       END
                       STRING(@s30),AT(74,2,163,13),USE(OBR:NOMPRE_CORTO),FONT(,12,,FONT:bold)
                       BUTTON('&Salir'),AT(267,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('NomencladorXOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM2:VALOR_ANTERIOR',NOM2:VALOR_ANTERIOR)          ! Added by: BrowseBox(ABC)
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  Relate:NOMENCLADORXOS.Open                               ! File NOMENCLADORXOS used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NOMENCLADORXOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,NOM2:FK_NOMENCLADORXOS_OS)            ! Add the sort order for NOM2:FK_NOMENCLADORXOS_OS for sort order 1
  BRW1.AddRange(NOM2:IDOS,Relate:NOMENCLADORXOS,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,NOM2:PK_NOMENCLADORXOS)               ! Add the sort order for NOM2:PK_NOMENCLADORXOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,NOM2:IDOS,,BRW1)               ! Initialize the browse locator using  using key: NOM2:PK_NOMENCLADORXOS , NOM2:IDOS
  BRW1.AddSortOrder(,NOM2:FK_NOMENCLADORXOS_OS)            ! Add the sort order for NOM2:FK_NOMENCLADORXOS_OS for sort order 3
  BRW1.AddRange(NOM2:IDOS,Relate:NOMENCLADORXOS,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 3
  BRW1.AddField(NOM:CODIGO,BRW1.Q.NOM:CODIGO)              ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(NOM:DESCRIPCION,BRW1.Q.NOM:DESCRIPCION)    ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:VALOR,BRW1.Q.NOM2:VALOR)              ! Field NOM2:VALOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:VALOR_ANTERIOR,BRW1.Q.NOM2:VALOR_ANTERIOR) ! Field NOM2:VALOR_ANTERIOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:IDOS,BRW1.Q.NOM2:IDOS)                ! Field NOM2:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:IDNOMENCLADOR,BRW1.Q.NOM2:IDNOMENCLADOR) ! Field NOM2:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM:IDNOMENCLADOR,BRW1.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('NomencladorXOS',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_NOMENCLADORXOS
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
    INIMgr.Update('NomencladorXOS',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Formulario_NOMENCLADORXOS
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SOCIOSXOS
!!! </summary>
UpdateSOCIOSXOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SOC3:Record LIKE(SOC3:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SOCIOSXOS'),AT(,,268,107),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateSOCIOSXOS'),SYSTEM
                       BUTTON('&Aceptar'),AT(162,89,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(215,89,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDSOCIOS:'),AT(7,20),USE(?SOC3:IDSOCIOS:Prompt),TRN
                       ENTRY(@n-7),AT(61,20,33,10),USE(SOC3:IDSOCIOS)
                       BUTTON('...'),AT(99,19,12,12),USE(?CallLookup)
                       STRING(@s30),AT(117,20),USE(SOC:NOMBRE)
                       PROMPT('IDOS:'),AT(7,4),USE(?SOC3:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(30,4,24,10),USE(SOC3:IDOS),DISABLE
                       STRING(@s30),AT(57,4),USE(OBR:NOMPRE_CORTO)
                       PROMPT('NUMERO:'),AT(6,34),USE(?SOC3:NUMERO:Prompt),TRN
                       ENTRY(@s30),AT(60,34,124,10),USE(SOC3:NUMERO)
                       PROMPT('FECHA ALTA:'),AT(6,49),USE(?SOC3:FECHA_ALTA:Prompt),TRN
                       ENTRY(@d17),AT(60,49,104,10),USE(SOC3:FECHA_ALTA)
                       PROMPT('OBSERVACION:'),AT(6,63),USE(?SOC3:OBSERVACION:Prompt),TRN
                       ENTRY(@s50),AT(60,63,204,10),USE(SOC3:OBSERVACION)
                       LINE,AT(0,82,268,0),USE(?Line1),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('UpdateSOCIOSXOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SOC3:Record,History::SOC3:Record)
  SELF.AddHistoryField(?SOC3:IDSOCIOS,1)
  SELF.AddHistoryField(?SOC3:IDOS,2)
  SELF.AddHistoryField(?SOC3:NUMERO,3)
  SELF.AddHistoryField(?SOC3:FECHA_ALTA,4)
  SELF.AddHistoryField(?SOC3:OBSERVACION,5)
  SELF.AddUpdateFile(Access:SOCIOSXOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SOCIOSXOS
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
    ?SOC3:IDSOCIOS{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC3:IDOS{PROP:ReadOnly} = True
    ?SOC3:NUMERO{PROP:ReadOnly} = True
    ?SOC3:FECHA_ALTA{PROP:ReadOnly} = True
    ?SOC3:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSOCIOSXOS',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:OBRA_SOCIAL.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSOCIOSXOS',QuickWindow)           ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?SOC3:IDSOCIOS
      SOC:IDSOCIO = SOC3:IDSOCIOS
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SOC3:IDSOCIOS = SOC:IDSOCIO
        ELSE
          SELECT(?SOC3:IDSOCIOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOSXOS.TryValidateField(1)              ! Attempt to validate SOC3:IDSOCIOS in SOCIOSXOS
        SELECT(?SOC3:IDSOCIOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC3:IDSOCIOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC3:IDSOCIOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = SOC3:IDSOCIOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SOC3:IDSOCIOS = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SOC3:IDOS
      OBR:IDOS = SOC3:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SOC3:IDOS = OBR:IDOS
        ELSE
          SELECT(?SOC3:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOSXOS.TryValidateField(2)              ! Attempt to validate SOC3:IDOS in SOCIOSXOS
        SELECT(?SOC3:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC3:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC3:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOSXOS file by SOC3:FK_SOCIOSXOS_OS
!!! </summary>
BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOSXOS)
                       PROJECT(SOC3:IDSOCIOS)
                       PROJECT(SOC3:IDOS)
                       PROJECT(SOC3:NUMERO)
                       PROJECT(SOC3:FECHA_ALTA)
                       PROJECT(SOC3:OBSERVACION)
                       JOIN(SOC:PK_SOCIOS,SOC3:IDSOCIOS)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC3:IDSOCIOS          LIKE(SOC3:IDSOCIOS)            !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC3:IDOS              LIKE(SOC3:IDOS)                !List box control field - type derived from field
SOC3:NUMERO            LIKE(SOC3:NUMERO)              !List box control field - type derived from field
SOC3:FECHA_ALTA        LIKE(SOC3:FECHA_ALTA)          !List box control field - type derived from field
SOC3:OBSERVACION       LIKE(SOC3:OBSERVACION)         !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Carga de Colegiados a la Obra Social'),AT(,,477,306),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS'),SYSTEM
                       LIST,AT(8,51,449,194),USE(?Browse:1),HVSCROLL,FORMAT('[44L(2)|M~IDSOCIOS~C(0)@n-5@52L(2' & |
  ')|M~MATRICULA~C(0)@n-5@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIADO~64L(2)|M~IDOS~C(0)@n-' & |
  '5@80L(2)|M~NUMERO~@s30@80R(2)|M~FECHA ALTA~C(0)@d17@80L(2)|M~OBSERVACION~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de SOCIOSXOS')
                       BUTTON('&Ver'),AT(257,253,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(311,253,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(363,253,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(417,253,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('Imprimir Mandato '),AT(5,284,90,14),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,4,468,270),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           STRING(@s30),AT(125,26),USE(OBR:NOMPRE_CORTO),FONT(,14,,FONT:bold)
                         END
                       END
                       BUTTON('&Salir'),AT(427,292,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC3:FECHA_ALTA',SOC3:FECHA_ALTA)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOSXOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC3:FK_SOCIOSXOS_OS)                 ! Add the sort order for SOC3:FK_SOCIOSXOS_OS for sort order 1
  BRW1.AddRange(SOC3:IDOS,Relate:SOCIOSXOS,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 1
  BRW1.AddField(SOC3:IDSOCIOS,BRW1.Q.SOC3:IDSOCIOS)        ! Field SOC3:IDSOCIOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:IDOS,BRW1.Q.SOC3:IDOS)                ! Field SOC3:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:NUMERO,BRW1.Q.SOC3:NUMERO)            ! Field SOC3:NUMERO is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:FECHA_ALTA,BRW1.Q.SOC3:FECHA_ALTA)    ! Field SOC3:FECHA_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:OBSERVACION,BRW1.Q.SOC3:OBSERVACION)  ! Field SOC3:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSOCIOSXOS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateSOCIOSXOS
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
    OF ?Button6
      Glo:IDOS      =  SOC3:IDOS
      GLO:IDSOCIO   =  SOC3:IDSOCIOS
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button6
      ThisWindow.Update()
      START(IMPRIMIR_MANDATO, 25000)
      ThisWindow.Reset
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_MANDATO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:FECHA_VAL        LONG                                  ! 
Process:View         VIEW(SOCIOSXOS)
                       PROJECT(SOC3:IDSOCIOS)
                       PROJECT(SOC3:IDOS)
                       JOIN(SOC:PK_SOCIOS,SOC3:IDSOCIOS)
                         PROJECT(SOC:DIRECCION)
                         PROJECT(SOC:DIRECCION_LABORAL)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:N_DOCUMENTO)
                       END
                       JOIN(OBR:PK_OBRA_SOCIAL,SOC3:IDOS)
                         PROJECT(OBR:NOMBRE)
                         PROJECT(OBR:NOMPRE_CORTO)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(479,2354,7510,7302),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',12,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(490,1000,7469,1354),USE(?Header)
                         IMAGE('Logo.jpg'),AT(10,10,1333,1021),USE(?Image1)
                         STRING(@s40),AT(1656,646),USE(GLO:LEY),FONT(,8)
                         STRING('Ley:'),AT(1406,646),USE(?String26),FONT(,8),TRN
                         STRING(@s20),AT(2427,854),USE(GLO:PER_JUR),FONT(,8)
                         STRING('Personería Jurídica:'),AT(1396,854),USE(?String29),FONT(,8),TRN
                         STRING(@s255),AT(10,1094,7469,229),USE(GLO:DIRECCION),FONT(,9),CENTER,TRN
                         BOX,AT(10,1271,7469,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(0,0,7500,5833),USE(?Detail)
                         STRING('MANDATO ESPECIAL CONVENIO COLEGIO - '),AT(21,10),USE(?String31),TRN
                         STRING(@s30),AT(3563,10),USE(OBR:NOMPRE_CORTO)
                         STRING('En la ciudad de Viedma  Provincia de Río Negro, compadece  ante la Sede del Colegio '), |
  AT(21,313),USE(?String17),TRN
                         STRING(':'),AT(4063,406),USE(?String27),TRN
                         STRING('de Psicólogos del Valle Inferior de Rió Negro, en adelante EL COLEGIO,  el/la L' & |
  'icenciado/a:'),AT(21,615),USE(?String18),TRN
                         STRING(@s30),AT(21,917),USE(SOC:NOMBRE)
                         STRING('M.P.:'),AT(3010,917),USE(?String19),TRN
                         STRING(@n-5),AT(3448,917),USE(SOC:MATRICULA)
                         STRING(@s100),AT(2125,1219,5229,229),USE(SOC:DIRECCION)
                         STRING('con domicilio del consultorio en'),AT(21,1521),USE(?String28),TRN
                         STRING('con domicilio particular en: '),AT(21,1219),USE(?String25),TRN
                         STRING(@s50),AT(2365,1521,4875,229),USE(SOC:DIRECCION_LABORAL)
                         STRING('MANIFIESTA: que viene a conferir MANDATO ESPECIAL a favor de este COLEGIO para ' & |
  'que através'),AT(21,1823),USE(?String23),TRN
                         STRING('de su Comisión Directiva, en pleno ejercicio de la facultad atribuida para que ' & |
  'suscriba este convenio'),AT(21,2125),USE(?String30),TRN
                         STRING('con la Obra Social'),AT(21,2427),USE(?String32),TRN
                         STRING(@s100),AT(1427,2427,6042,229),USE(OBR:NOMBRE)
                         STRING('Autorizo a las autoridades del Colegio a proceder a la renteción de la matricula mensual'), |
  AT(21,2729),USE(?String33),FONT(,,,FONT:bold+FONT:underline),TRN
                         STRING('correspondiente al  mes de las facturaciones que el suscripto produzca de las p' & |
  'restaciones'),AT(21,3042),USE(?String34),FONT(,,,FONT:bold+FONT:underline),TRN
                         STRING('que efectuo en forma mensual, norma y habitual  a los afiliados de las Obras So' & |
  'ciales con '),AT(21,3354),USE(?String35),FONT(,,,FONT:bold+FONT:underline),TRN
                         STRING('contrato vigente con dicho colegio y para atender a los gastos operativos de la' & |
  ' institución.'),AT(21,3667),USE(?String36),FONT(,,,FONT:bold+FONT:underline),TRN
                         STRING('Así mismo me comprometo a no cobrar plus al afiliado y a entregar en el COLEGIO' & |
  ' las órdenes para la '),AT(21,3979),USE(?String37),TRN
                         STRING('facturación hasta el tercer día habil de cada mes correspondiente al mes inmedi' & |
  'ato posterior.'),AT(31,4344),USE(?String38),TRN
                         STRING('Firma y Aclaración: .{58}'),AT(125,4854),USE(?String40),TRN
                         STRING('Viedma, '),AT(73,5510),USE(?String39),TRN
                         STRING('D.N.I.:'),AT(4156,917),USE(?String22),TRN
                         STRING(@N-14.),AT(4677,917),USE(SOC:N_DOCUMENTO)
                         STRING(@s50),AT(833,5521),USE(GLO:FECHA_LARGO)
                       END
                       FOOTER,AT(500,9656,7469,1052),USE(?Footer)
                       END
                       FORM,AT(490,1010,7490,9688),USE(?Form)
                       END
                     END
LocE::Direccion            STRING(5000)
LocE::DireccionCC          STRING(5000)
LocE::DireccionCCO         STRING(5000)
LocE::Subject              STRING(255)
LocE::Body                 STRING(2048)
LocE::FileName             STRING(5000)
LocE::Retorno              LONG
LocE::Flags                SHORT
LocE::Dialogo              BYTE
QAtach                   QUEUE
Attach                     CSTRING(5000)
                         END
Loc::Attach                 string(5000)
Loc::Cadena                 String(1)
Loc::Archivo                string(500)

LocE::GolDesde          SHORT
LocE::GolHasta          SHORT
LocE::Cancelar          BYTE
LocE::Atach             STRING(10000)
LocE::FileSend          STRING(5000)
LocE::Titulo            STRING(500)
LocE::NombreFile        STRING(500)
LocE::Qpar      QUEUE,PRE(QP)
Par                     CSTRING(1000)
                END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Open                   PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

?Menu_eMail     EQUATE(-1026)
?EnviarxMailWMF     EQUATE(-1027)
?EnviarxMailWord    EQUATE(-1028)
?EnviaraWord        EQUATE(-1029)
Gol_wo WINDOW,AT(,,236,43),FONT('Tahoma',8,,FONT:regular),CENTER,GRAY
       IMAGE('Mail.ico'),AT(8,7),USE(?Imgout),CENTERED
       PROGRESS,USE(?ProgOutlook),AT(38,9,164,9),RANGE(0,100)
       GROUP,AT(38,21,164,9),USE(?Group1),BOXED,BEVEL(-1)
         STRING('Generando Archivos de Mail'),AT(76,21),USE(?StrOut),TRN
       END
     END
WGolPrompt WINDOW,AT(,,160,80),FONT('Tahoma',8,,FONT:bold),CENTER,GRAY
       GROUP,AT(2,2,156,76),USE(?Group_gol),BOXED,BEVEL(-1)
         IMAGE('mail.ico'),AT(5,5,30,17),USE(?Image_gol),CENTERED
         GROUP,AT(36,8,88,36),USE(?Group2),BOXED,BEVEL(1,1)
           PROMPT('Pagina Desde:'),AT(43,14),USE(?Prompt_gol)
           SPIN(@n02),AT(92,14,25,10),USE(LocE::GolDesde),RANGE(1,100),STEP(1)
           PROMPT('Pagina Hasta:'),AT(43,28),USE(?Prompt_Gol2)
           SPIN(@n02),AT(92,28,25,10),USE(LocE::GolHasta),RANGE(1,100),STEP(1)
         END
         BUTTON('Enviar'),AT(27,59,50,14),USE(?Enviar),LEFT,ICON('wizok.ico')
         BUTTON('Cancelar'),AT(83,59,50,14),USE(?Cancelar),LEFT,ICON('wizcncl.ico')
       END
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
!!! Inicio Ec. Templates
SendMailPrompt     ROUTINE
  OPEN(WGolPrompt)
  ALERT(EnterKey)
      POST(Event:OpenWindow)
      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF EVENT:AlertKey
           CASE KEYCODE()
             OF EnterKey
                MiControl# = FOCUS()
                CASE MiControl#{Prop:Type}
                  OF CREATE:Button
                     POST(EVENT:ACCEPTED,MiControl#)
                  ELSE
                     IF FOCUS()<> ?Enviar
                        PRESSKEY(TabKey)
                        CYCLE
                     ELSE
                        POST(Event:Accepted,?Enviar)
                     END!IF
                END!CASE
           END!CASE
        END!CASE EVENT
        CASE FIELD()
        OF ?Enviar
          CASE Event()
          OF Event:Accepted
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          ! Se presiono el ENTER estando posicionado el OK
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        OF ?Cancelar
          CASE Event()
          OF Event:Accepted
            LocE::Cancelar = True
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        END
      END !END ACCEPT
  CLOSE(WGolPrompt)
!************ Fin de ROUTINE Ec_Mail*********************

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_MANDATO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_MANDATO',ProgressWindow)          ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOSXOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC3:IDSOCIOS)
  ThisReport.AddSortOrder(SOC3:FK_SOCIOSXOS_SOCIOS)
  ThisReport.AddRange(SOC3:IDSOCIOS,GLO:IDSOCIO)
  ThisReport.SetFilter('SOC3:IDOS = Glo:IDOS')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOSXOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  LOC:FECHA_VAL = TODAY() + 30
  
    
  
  
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_MANDATO',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagName,'OBR:NOMPRE_CORTO')
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?OBR:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?OBR:NOMBRE,RepGen:XML,TargetAttr:TagName,'OBR:NOMBRE')
  SELF.Attribute.Set(?OBR:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  CREATE(?Menu_eMail,CREATE:Menu)
  ?Menu_eMail{PROP:text} = 'Enviar x eMail'
  ?Menu_eMail{PROP:use} = LASTFIELD()+301
  UNHIDE(?Menu_eMail)
  
  if 'Enviar Imagenes [WMF]' <> '' !!! Activa Envio de Imagen
    CREATE(?EnviarxMailWmf,CREATE:Item,?Menu_eMail)
    ?EnviarxMailwmf{PROP:use} = LASTFIELD()+302
    ?EnviarxMailwmf{PROP:text} = 'Enviar Imagenes [WMF]'
  UNHIDE(?EnviarxMailwmf)
  end
  
  if 'Enviar Reporte en Word' <> '' !!! Activa Envio de Imagen a Word
    CREATE(?EnviarxMailWord,CREATE:Item,?Menu_eMail)
    ?EnviarxMailWord{PROP:use} = LASTFIELD()+303
    ?EnviarxMailWord{PROP:text} = 'Enviar Reporte en Word'
    UNHIDE(?EnviarxMailWord)
  end
  
  if 'Enviar Reporte a Word' <> '' !!! Activa Envio de Imagen a Word
  CREATE(?EnviaraWord,CREATE:Item,?Menu_eMail)
  ?EnviaraWord{PROP:use} = LASTFIELD()+304
  ?EnviaraWord{PROP:text} = 'Enviar Reporte a Word'
  UNHIDE(?EnviaraWord)
  end


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  LocE::GolDesde =1
  LocE::GolHasta =RECORDS(SELF.ImageQueue)
  LocE::Cancelar = False
  case event()
    of EVENT:Accepted
    Case field()
     of ?EnviarxMailWmf
           Do SendMailPrompt
      IF NOT LocE::Cancelar
           FREE(QAtach)
           OPEN(Gol_wo)
           DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
           LocE::Flags     = False
           LocE::Subject   = 'CERTIFICADO DE MATRICULA'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = SOC:EMAIL
           LocE::Dialogo  = 1
           SAVEPath"   = PATH()
           IF LocE::Dialogo THEN LocE::Flags  =MAPI_DIALOG.
            E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
           SETPATH(SAVEPath")
           POST(Event:CloseWindow)
       END !! NOT LocE::Cancelar
     Of ?EnviaraWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = false
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  =         0
          ADD(LocE::Qpar)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          SETPATH(SAVEPath")
          CLOSE(Gol_wo)
          POST(Event:CloseWindow)
       END
     of ?EnviarxMailWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::Nombrefile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::Nombrefile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::nombrefile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::nombrefile)
                 end
              END
           end
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE MATRICULA'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = SOC:EMAIL
             LocE::Dialogo  = 1
             SAVEPath"   = PATH()
             IF LocE::Dialogo THEN LocE::Flags  +=MAPI_DIALOG.
             E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
             SETPATH(SAVEPath")
             CLOSE(Gol_wo)
             POST(Event:CloseWindow)
          END
       END
    END !! CASE Field
  end!Case Event
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion OS_PLANES
!!! </summary>
UpdateOS_PLANES PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::OS_:Record  LIKE(OS_:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion Planes de la Obra Social'),AT(,,192,73),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateOS_PLANES'),SYSTEM
                       BUTTON('&Aceptar'),AT(89,56,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(142,56,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDOS:'),AT(2,2),USE(?OS_:IDOS:Prompt),TRN
                       ENTRY(@n-7),AT(55,2,26,10),USE(OS_:IDOS),DISABLE
                       PROMPT('IDPLAN OS:'),AT(2,17),USE(?OS_:IDPLAN_OS:Prompt),TRN
                       ENTRY(@s30),AT(55,17,124,10),USE(OS_:IDPLAN_OS),UPR,REQ
                       PROMPT('PORCENTAJE:'),AT(2,31),USE(?OS_:PORCENTAJE:Prompt),TRN
                       ENTRY(@n-7.2),AT(55,31,40,10),USE(OS_:PORCENTAJE)
                       LINE,AT(1,50,191,0),USE(?Line1),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('UpdateOS_PLANES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(OS_:Record,History::OS_:Record)
  SELF.AddHistoryField(?OS_:IDOS,1)
  SELF.AddHistoryField(?OS_:IDPLAN_OS,2)
  SELF.AddHistoryField(?OS_:PORCENTAJE,3)
  SELF.AddUpdateFile(Access:OS_PLANES)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:OS_PLANES.Open                                    ! File OS_PLANES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:OS_PLANES
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
    ?OS_:IDOS{PROP:ReadOnly} = True
    ?OS_:IDPLAN_OS{PROP:ReadOnly} = True
    ?OS_:PORCENTAJE{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOS_PLANES',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:OBRA_SOCIAL.Close
    Relate:OS_PLANES.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOS_PLANES',QuickWindow)           ! Save window data to non-volatile store
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
    SelectOBRA_SOCIAL
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?OS_:IDOS
      OBR:IDOS = OS_:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          OS_:IDOS = OBR:IDOS
        ELSE
          SELECT(?OS_:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:OS_PLANES.TryValidateField(1)              ! Attempt to validate OS_:IDOS in OS_PLANES
        SELECT(?OS_:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?OS_:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?OS_:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the OS_PLANES file by OS_:FK_OS_PLANES_OS
!!! </summary>
BrowseOS_PLANESByOS_:FK_OS_PLANES_OS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(OS_PLANES)
                       PROJECT(OS_:IDPLAN_OS)
                       PROJECT(OS_:PORCENTAJE)
                       PROJECT(OS_:IDOS)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
OS_:IDPLAN_OS          LIKE(OS_:IDPLAN_OS)            !List box control field - type derived from field
OS_:PORCENTAJE         LIKE(OS_:PORCENTAJE)           !List box control field - type derived from field
OS_:IDOS               LIKE(OS_:IDOS)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Planes por Obra Social'),AT(,,247,193),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseOS_PLANESByOS_:FK_OS_PLANES_OS'),SYSTEM
                       LIST,AT(8,45,231,109),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~PLAN~@s30@44D(12)|M~%~C(' & |
  '0)@n-7.2@64L(2)|M~IDOS~C(0)@n-7@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de OS_PLANES')
                       BUTTON('&Ver'),AT(8,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(61,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(114,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(167,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(3,19,244,154),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                       STRING(@s30),AT(9,2,227,17),USE(OBR:NOMPRE_CORTO),FONT(,14,,FONT:bold)
                       BUTTON('&Salir'),AT(171,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseOS_PLANESByOS_:FK_OS_PLANES_OS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OS_:IDPLAN_OS',OS_:IDPLAN_OS)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:OS_PLANES.Open                                    ! File OS_PLANES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:OS_PLANES,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,OS_:FK_OS_PLANES_OS)                  ! Add the sort order for OS_:FK_OS_PLANES_OS for sort order 1
  BRW1.AddRange(OS_:IDOS,Relate:OS_PLANES,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 1
  BRW1.AddField(OS_:IDPLAN_OS,BRW1.Q.OS_:IDPLAN_OS)        ! Field OS_:IDPLAN_OS is a hot field or requires assignment from browse
  BRW1.AddField(OS_:PORCENTAJE,BRW1.Q.OS_:PORCENTAJE)      ! Field OS_:PORCENTAJE is a hot field or requires assignment from browse
  BRW1.AddField(OS_:IDOS,BRW1.Q.OS_:IDOS)                  ! Field OS_:IDOS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOS_PLANESByOS_:FK_OS_PLANES_OS',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateOS_PLANES
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
    Relate:OS_PLANES.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseOS_PLANESByOS_:FK_OS_PLANES_OS',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateOS_PLANES
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

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
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the NOMENCLADOR File
!!! </summary>
Nomenclador PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(NOMENCLADOR)
                       PROJECT(NOM:CODIGO)
                       PROJECT(NOM:DESCRIPCION)
                       PROJECT(NOM:IDNOMENCLADOR)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
NOM:CODIGO             LIKE(NOM:CODIGO)               !List box control field - type derived from field
NOM:DESCRIPCION        LIKE(NOM:DESCRIPCION)          !List box control field - type derived from field
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the NOMENCLADOR File'),AT(,,360,208),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Nomenclador'),SYSTEM
                       LIST,AT(8,37,337,124),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|M~CODIGO~C(0)@P##.##.##P@2' & |
  '01L(2)|M~DESCRIPCION~@s100@64L(2)|M~IDNOMENCLADOR~C(0)@n7@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de NOMENCLADOR')
                       BUTTON('&Ver'),AT(8,168,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(61,168,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(114,168,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(167,168,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,354,182),USE(?CurrentTab)
                         TAB('CODIGO'),USE(?Tab:1)
                           PROMPT('CODIGO:'),AT(8,21),USE(?NOM:CODIGO:Prompt)
                           ENTRY(@P##.##.##P),AT(58,20,35,10),USE(NOM:CODIGO)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:2)
                           PROMPT('DESCRIPCION:'),AT(7,22),USE(?NOM:DESCRIPCION:Prompt)
                           ENTRY(@s100),AT(57,21,154,10),USE(NOM:DESCRIPCION)
                         END
                       END
                       BUTTON('&Salir'),AT(171,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Nomenclador')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NOMENCLADOR,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,NOM:IDX_NOMENCLADOR_DESCRIPCION)      ! Add the sort order for NOM:IDX_NOMENCLADOR_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,NOM:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: NOM:IDX_NOMENCLADOR_DESCRIPCION , NOM:DESCRIPCION
  BRW1.AddSortOrder(,NOM:IDX_NOMENCLADOR_CODIGO)           ! Add the sort order for NOM:IDX_NOMENCLADOR_CODIGO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?NOM:CODIGO,NOM:CODIGO,,BRW1)   ! Initialize the browse locator using ?NOM:CODIGO using key: NOM:IDX_NOMENCLADOR_CODIGO , NOM:CODIGO
  BRW1.AddField(NOM:CODIGO,BRW1.Q.NOM:CODIGO)              ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(NOM:DESCRIPCION,BRW1.Q.NOM:DESCRIPCION)    ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(NOM:IDNOMENCLADOR,BRW1.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Nomenclador',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_NOMENCLADOR
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
    INIMgr.Update('Nomenclador',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Formulario_NOMENCLADOR
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
RECIBO_LIQUIDACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(LIQUIDACION)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:CANTIDAD)
                       PROJECT(LIQ:FECHA_CARGA)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:IDUSUARIO)
                       PROJECT(LIQ:IDOS)
                       PROJECT(LIQ:IDSOCIO)
                       JOIN(LIQC:FK_LIQUIDACION_CODIGO_LIQ,LIQ:IDLIQUIDACION)
                         PROJECT(LIQC:CANTIDAD)
                         PROJECT(LIQC:TOTAL)
                         PROJECT(LIQC:VALOR)
                         PROJECT(LIQC:IDOS)
                         PROJECT(LIQC:IDNOMENCLADOR)
                         JOIN(NOM2:PK_NOMENCLADORXOS,LIQC:IDOS,LIQC:IDNOMENCLADOR)
                           PROJECT(NOM2:IDNOMENCLADOR)
                           JOIN(NOM:PK_NOMENCLADOR,NOM2:IDNOMENCLADOR)
                             PROJECT(NOM:CODIGO)
                             PROJECT(NOM:DESCRIPCION)
                           END
                         END
                       END
                       JOIN(USU:PK_USUARIO,LIQ:IDUSUARIO)
                         PROJECT(USU:DESCRIPCION)
                       END
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                       END
                       JOIN(SOC:PK_SOCIOS,LIQ:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(979,3781,6917,3677),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(990,1010,6927,2781),USE(?unnamed)
                         STRING('Presentación  Nº'),AT(4292,42),USE(?String1),FONT(,12,,FONT:bold),TRN
                         IMAGE('Logo.jpg'),AT(10,-10,1635,958),USE(?Image1)
                         STRING(@n-7),AT(5667,52),USE(LIQ:IDLIQUIDACION),LEFT
                         STRING('Fecha:'),AT(5135,292),USE(?String15),TRN
                         STRING(@d17),AT(5583,292),USE(LIQ:FECHA_CARGA)
                         STRING('El Colegio de Psicólogos del Valle inferior de Río Negro .  recibe del Socio Ma' & |
  'tricula Nº :'),AT(21,1365,4979,188),USE(?String3),TRN
                         STRING(@s7),AT(5010,1365),USE(SOC:MATRICULA)
                         STRING('Comprobante de Entrega de Liquidación a Obra Sociales'),AT(1260,1010),USE(?String23), |
  FONT(,12,,FONT:bold+FONT:underline),TRN
                         STRING(@s30),AT(2313,1583),USE(SOC:NOMBRE)
                         LINE,AT(10,1333,6896,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('la presentación de la facturación de la obra social '),AT(31,1813),USE(?String8),TRN
                         STRING(@s30),AT(3042,1813),USE(OBR:NOMPRE_CORTO)
                         STRING(@n$-12.2),AT(4156,2115),USE(LIQ:MONTO)
                         STRING('cuyo monto facturado es de: '),AT(2438,2115),USE(?String16),TRN
                         STRING(@P-####P),AT(2010,2115),USE(LIQ:ANO)
                         STRING('Cantidad de Códigos:'),AT(4990,2115),USE(?String20),TRN
                         STRING(@n-3),AT(1750,2115),USE(LIQ:MES)
                         STRING('correspondiente al periodo:'),AT(10,2115),USE(?String10),TRN
                         STRING(@n-4),AT(6229,2115),USE(LIQ:CANTIDAD),RIGHT(1)
                         LINE,AT(10,2375,6906,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Detalle de Presentación'),AT(31,2396),USE(?String24),TRN
                         BOX,AT(10,2552,6906,219),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Código'),AT(63,2573),USE(?String29),TRN
                         STRING('Cant'),AT(5052,2573),USE(?String32),TRN
                         STRING('Descripción'),AT(1875,2573),USE(?String30),TRN
                         STRING('Total '),AT(6083,2573),USE(?String33),TRN
                         STRING('Monto '),AT(4052,2573),USE(?String31),TRN
                       END
detail                 DETAIL,AT(0,0,,292),USE(?unnamed:4)
                         STRING(@s100),AT(677,10,2771,188),USE(NOM:DESCRIPCION)
                         STRING(@p##.##.##p),AT(31,10),USE(NOM:CODIGO)
                         STRING(@n$-7.2),AT(4281,10),USE(LIQC:VALOR)
                         STRING(@n-3),AT(5375,10),USE(LIQC:CANTIDAD),RIGHT(1)
                         STRING(@n$-10.2),AT(6240,10),USE(LIQC:TOTAL)
                         LINE,AT(10,208,6865,0),USE(?Line2),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(948,7469,6927,1448),USE(?unnamed:2)
                         STRING('La carga fue realizada por:'),AT(10,0),USE(?String22),TRN
                         STRING(@s20),AT(1656,21),USE(USU:DESCRIPCION)
                         LINE,AT(42,448,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(52,531),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2156,531),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5656,531),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(979,1000,6948,7927),USE(?unnamed:3)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('RECIBO_LIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('RECIBO_LIQUIDACION',ProgressWindow)        ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:IDLIQUIDACION)
  ThisReport.AddSortOrder(LIQ:PK_LIQUIDACION)
  ThisReport.AddRange(LIQ:IDLIQUIDACION,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:LIQUIDACION.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('RECIBO_LIQUIDACION',ProgressWindow)     ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:IDLIQUIDACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:IDLIQUIDACION,RepGen:XML,TargetAttr:TagName,'LIQ:IDLIQUIDACION')
  SELF.Attribute.Set(?LIQ:IDLIQUIDACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:FECHA_CARGA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:FECHA_CARGA,RepGen:XML,TargetAttr:TagName,'LIQ:FECHA_CARGA')
  SELF.Attribute.Set(?LIQ:FECHA_CARGA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagName,'OBR:NOMPRE_CORTO')
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagName,'LIQ:MONTO')
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagName,'LIQ:ANO')
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagName,'LIQ:MES')
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:CANTIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:CANTIDAD,RepGen:XML,TargetAttr:TagName,'LIQ:CANTIDAD')
  SELF.Attribute.Set(?LIQ:CANTIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?NOM:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?NOM:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'NOM:DESCRIPCION')
  SELF.Attribute.Set(?NOM:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?NOM:CODIGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?NOM:CODIGO,RepGen:XML,TargetAttr:TagName,'NOM:CODIGO')
  SELF.Attribute.Set(?NOM:CODIGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQC:VALOR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQC:VALOR,RepGen:XML,TargetAttr:TagName,'LIQC:VALOR')
  SELF.Attribute.Set(?LIQC:VALOR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQC:CANTIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQC:CANTIDAD,RepGen:XML,TargetAttr:TagName,'LIQC:CANTIDAD')
  SELF.Attribute.Set(?LIQC:CANTIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQC:TOTAL,RepGen:XML,TargetAttr:TagName,'LIQC:TOTAL')
  SELF.Attribute.Set(?LIQC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'USU:DESCRIPCION')
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO','IMPRIMIR_PAGO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion LIQUIDACION
!!! </summary>
UpdateLIQUIDACION PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW11::View:Browse   VIEW(LIQUIDACION_CODIGO)
                       PROJECT(LIQC:VALOR)
                       PROJECT(LIQC:CANTIDAD)
                       PROJECT(LIQC:TOTAL)
                       PROJECT(LIQC:IDLIQUIDACION)
                       PROJECT(LIQC:IDNOMENCLADOR)
                       PROJECT(LIQC:IDOS)
                       JOIN(NOM2:PK_NOMENCLADORXOS,LIQC:IDOS,LIQC:IDNOMENCLADOR)
                         PROJECT(NOM2:IDOS)
                         PROJECT(NOM2:IDNOMENCLADOR)
                         JOIN(NOM:PK_NOMENCLADOR,NOM2:IDNOMENCLADOR)
                           PROJECT(NOM:CODIGO)
                           PROJECT(NOM:DESCRIPCION)
                           PROJECT(NOM:IDNOMENCLADOR)
                         END
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
NOM:CODIGO             LIKE(NOM:CODIGO)               !List box control field - type derived from field
NOM:DESCRIPCION        LIKE(NOM:DESCRIPCION)          !List box control field - type derived from field
LIQC:VALOR             LIKE(LIQC:VALOR)               !List box control field - type derived from field
LIQC:CANTIDAD          LIKE(LIQC:CANTIDAD)            !List box control field - type derived from field
LIQC:TOTAL             LIKE(LIQC:TOTAL)               !List box control field - type derived from field
LIQC:IDLIQUIDACION     LIKE(LIQC:IDLIQUIDACION)       !List box control field - type derived from field
LIQC:IDNOMENCLADOR     LIKE(LIQC:IDNOMENCLADOR)       !List box control field - type derived from field
LIQC:IDOS              LIKE(LIQC:IDOS)                !List box control field - type derived from field
NOM2:IDOS              LIKE(NOM2:IDOS)                !Related join file key field - type derived from field
NOM2:IDNOMENCLADOR     LIKE(NOM2:IDNOMENCLADOR)       !Related join file key field - type derived from field
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::LIQ:Record  LIKE(LIQ:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion LIQUIDACION'),AT(,,274,226),FONT('Arial',8,,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateLIQUIDACION'),SYSTEM
                       PROMPT('ID LIQUIDACION:'),AT(1,2),USE(?Prompt8)
                       STRING(@n-7),AT(52,2),USE(LIQ:IDLIQUIDACION)
                       PROMPT('IDSOCIO:'),AT(0,15),USE(?LIQ:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(41,15,64,10),USE(LIQ:IDSOCIO)
                       BUTTON('...'),AT(109,14,12,12),USE(?CallLookup)
                       STRING(@s30),AT(125,15),USE(SOC:NOMBRE)
                       PROMPT('IDOS:'),AT(0,29),USE(?LIQ:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(41,29,64,10),USE(LIQ:IDOS)
                       BUTTON('...'),AT(109,29,12,12),USE(?CallLookup:2)
                       STRING(@s30),AT(124,30),USE(OBR:NOMPRE_CORTO)
                       PROMPT('MES:'),AT(0,47),USE(?LIQ:MES:Prompt)
                       SPIN(@n-14),AT(26,47,23,10),USE(LIQ:MES),RANGE(1,12)
                       PROMPT('ANO:'),AT(57,47),USE(?LIQ:ANO:Prompt)
                       SPIN(@n-14),AT(87,47,46,10),USE(LIQ:ANO),RANGE(2009,2999)
                       GROUP('Codigos a Liquidar'),AT(1,61,269,77),USE(?Group1),BOXED
                         LIST,AT(7,69,259,49),USE(?List),FORMAT('56D|M~CODIGO~L(2)@n-14@123L|M~DESCRIPCION~L(2)@' & |
  's100@45L(1)|M~VALOR~L(2)@n$-10.2@26L(1)|M~CANT~L(2)@n-3@40L(1)|M~TOTAL~L(2)@n$-10.2@' & |
  '56L|M~IDLIQUIDACION~L(2)@n-7@56L|M~IDNOMENCLADOR~L(2)@n-7@56L|M~IDOS~L(2)@n-7@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records')
                         BUTTON('&Agregar'),AT(9,121,54,15),USE(?Insert),LEFT,ICON('a.ico'),FLAT
                         BUTTON('&Modificar'),AT(66,121,54,15),USE(?Change),LEFT,ICON('c.ico'),FLAT
                         BUTTON('&Borrar'),AT(123,121,54,15),USE(?Delete),LEFT,ICON('b.ico'),FLAT
                       END
                       PROMPT('CANTIDAD:'),AT(5,142),USE(?LIQ:CANTIDAD:Prompt)
                       ENTRY(@n-14),AT(46,141,41,10),USE(LIQ:CANTIDAD),RIGHT(1),REQ
                       OPTION('TIPO PERIODO'),AT(3,153,205,26),USE(LIQ:TIPO_PERIODO,,?LIQ:TIPO_PERIODO:2),BOXED
                         RADIO('MENSUAL'),AT(9,163),USE(?LIQ:TIPO_PERIODO:Radio1)
                         RADIO(' 1º QUINCENA'),AT(61,163),USE(?LIQ:TIPO_PERIODO:Radio2)
                         RADIO(' 2º QUINCENA'),AT(131,163),USE(?LIQ:TIPO_PERIODO:Radio3)
                       END
                       PROMPT('MONTO:'),AT(95,142),USE(?LIQ:MONTO:Prompt),TRN
                       ENTRY(@n$-12.2),AT(132,142,56,10),USE(LIQ:MONTO)
                       PROMPT('FECHA PRESENTACION:'),AT(3,185),USE(?LIQ:FECHA_PRESENTACION:Prompt),TRN
                       ENTRY(@d17),AT(89,186,77,10),USE(LIQ:FECHA_PRESENTACION)
                       BUTTON('...'),AT(170,184,12,12),USE(?Calendar)
                       LINE,AT(3,205,271,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(171,209,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(223,209,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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

Calendar10           CalendarClass
BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW11::Sort0:Locator StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('UpdateLIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt8
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(LIQ:Record,History::LIQ:Record)
  SELF.AddHistoryField(?LIQ:IDLIQUIDACION,1)
  SELF.AddHistoryField(?LIQ:IDSOCIO,2)
  SELF.AddHistoryField(?LIQ:IDOS,3)
  SELF.AddHistoryField(?LIQ:MES,4)
  SELF.AddHistoryField(?LIQ:ANO,5)
  SELF.AddHistoryField(?LIQ:CANTIDAD,17)
  SELF.AddHistoryField(?LIQ:TIPO_PERIODO:2,7)
  SELF.AddHistoryField(?LIQ:MONTO,8)
  SELF.AddHistoryField(?LIQ:FECHA_PRESENTACION,10)
  SELF.AddUpdateFile(Access:LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FORMA_PAGO.Open                                   ! File FORMA_PAGO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LIQUIDACION
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
  BRW11.Init(?List,Queue:Browse.ViewPosition,BRW11::View:Browse,Queue:Browse,Relate:LIQUIDACION_CODIGO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?LIQ:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?LIQ:IDOS{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?LIQ:MES{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    ?LIQ:CANTIDAD{PROP:ReadOnly} = True
    ?LIQ:MONTO{PROP:ReadOnly} = True
    ?LIQ:FECHA_PRESENTACION{PROP:ReadOnly} = True
    DISABLE(?Calendar)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW11.Q &= Queue:Browse
  BRW11.RetainRow = 0
  BRW11.AddSortOrder(,LIQC:PK_LIQUIDACION_CODIGO)          ! Add the sort order for LIQC:PK_LIQUIDACION_CODIGO for sort order 1
  BRW11.AddRange(LIQC:IDLIQUIDACION,Relate:LIQUIDACION_CODIGO,Relate:LIQUIDACION) ! Add file relationship range limit for sort order 1
  BRW11.AddLocator(BRW11::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW11::Sort0:Locator.Init(,LIQC:IDNOMENCLADOR,,BRW11)    ! Initialize the browse locator using  using key: LIQC:PK_LIQUIDACION_CODIGO , LIQC:IDNOMENCLADOR
  BRW11.AppendOrder('LIQC:IDOS, LIQC:IDNOMENCLADOR')       ! Append an additional sort order
  BRW11.AddField(NOM:CODIGO,BRW11.Q.NOM:CODIGO)            ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW11.AddField(NOM:DESCRIPCION,BRW11.Q.NOM:DESCRIPCION)  ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:VALOR,BRW11.Q.LIQC:VALOR)            ! Field LIQC:VALOR is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:CANTIDAD,BRW11.Q.LIQC:CANTIDAD)      ! Field LIQC:CANTIDAD is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:TOTAL,BRW11.Q.LIQC:TOTAL)            ! Field LIQC:TOTAL is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:IDLIQUIDACION,BRW11.Q.LIQC:IDLIQUIDACION) ! Field LIQC:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:IDNOMENCLADOR,BRW11.Q.LIQC:IDNOMENCLADOR) ! Field LIQC:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:IDOS,BRW11.Q.LIQC:IDOS)              ! Field LIQC:IDOS is a hot field or requires assignment from browse
  BRW11.AddField(NOM2:IDOS,BRW11.Q.NOM2:IDOS)              ! Field NOM2:IDOS is a hot field or requires assignment from browse
  BRW11.AddField(NOM2:IDNOMENCLADOR,BRW11.Q.NOM2:IDNOMENCLADOR) ! Field NOM2:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW11.AddField(NOM:IDNOMENCLADOR,BRW11.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateLIQUIDACION',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  BRW11.AskProcedure = 3                                   ! Will call: ABM_LIQUIDACION_CODIGO((LIQ:IDOS))
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FORMA_PAGO.Close
    Relate:LIQUIDACION.Close
    Relate:OBRA_SOCIAL.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateLIQUIDACION',QuickWindow)         ! Save window data to non-volatile store
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
      SelectOBRA_SOCIAL
      ABM_LIQUIDACION_CODIGO((LIQ:IDOS))
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
      SOC3:IDSOCIOS  =   LIQ:IDSOCIO
      SOC3:IDOS      =   LIQ:IDOS
      GET(SOCIOSXOS,SOC3:PK_SOCIOSXOS)
      IF ERRORCODE() = 35 THEN
          MESSAGE('EL COLEGIADO NO ESTA INSCRIPTO COMO PRESTADOR DE LA OBRA SOCIAL CARGADA')
          SELECT(?LIQ:IDOS)
          CYCLE
      END
      IF SELF.REQUEST = INSERTRECORD THEN
          LIQ:FECHA_CARGA = TODAY()
          LIQ:IDFORMA_PAGO = 2
          LIQ:PERIODO   =  LIQ:ANO&(FORMAT(LIQ:MES,@N02))
          LIQ:PRESENTADO  =  'NO'
          LIQ:COBRADO     =  'NO'
          LIQ:PAGADO      =  'NO'
          LIQ:IDUSUARIO = GLO:IDUSUARIO
          LIQ:MONTO_PAGADO  = 0
          LIQ:DEBITO        = 0
          LIQ:COMISION      =  0
          LIQ:DEBITO_COMISION =  0
          LIQ:DEBITO_PAGO_CUOTAS = 0
          LIQ:MONTO_TOTAL  = 0
      END
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
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = LIQ:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        LIQ:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
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
    OF ?CallLookup:2
      ThisWindow.Update()
      OBR:IDOS = LIQ:IDOS
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        LIQ:IDOS = OBR:IDOS
      END
      ThisWindow.Reset(1)
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
    OF ?Calendar
      ThisWindow.Update()
      Calendar10.SelectOnClose = True
      Calendar10.Ask('Select a Date',LIQ:FECHA_PRESENTACION)
      IF Calendar10.Response = RequestCompleted THEN
      LIQ:FECHA_PRESENTACION=Calendar10.SelectedDate
      DISPLAY(?LIQ:FECHA_PRESENTACION)
      END
      ThisWindow.Reset(True)
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
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
      !! Imprimir Entrega
      clear(LIQ:record,1)
      SET(LIQ:PK_LIQUIDACION,LIQ:PK_LIQUIDACION)
      PREVIOUS(LIQUIDACION)
      IF ERRORCODE() THEN
          MESSAGE('NO ENCONTRO ID LIQUIDACION')
      ELSE
          GLO:IDSOLICITUD = LIQ:IDLIQUIDACION 
      END
      clear(LIQ:record)
      RECIBO_LIQUIDACION
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


BRW11.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW11.ResetFromView PROCEDURE

LIQ:CANTIDAD:Sum     REAL                                  ! Sum variable for browse totals
LIQ:MONTO:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:LIQUIDACION_CODIGO.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LIQ:CANTIDAD:Sum += LIQC:CANTIDAD
    LIQ:MONTO:Sum += LIQC:TOTAL
  END
  SELF.View{PROP:IPRequestCount} = 0
  LIQ:CANTIDAD = LIQ:CANTIDAD:Sum
  LIQ:MONTO = LIQ:MONTO:Sum
  PARENT.ResetFromView
  Relate:LIQUIDACION_CODIGO.SetQuickScan(0)
  SETCURSOR()

