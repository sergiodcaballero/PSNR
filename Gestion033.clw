

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION033.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION024.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION034.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CV
!!! </summary>
UpdateCV PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CV:Record   LIKE(CV:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CV'),AT(,,383,118),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('UpdateCV'),SYSTEM
                       PROMPT('DESCRIPCION:'),AT(3,5),USE(?CV:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(74,5,204,10),USE(CV:DESCRIPCION),REQ
                       PROMPT('IDSOCIO:'),AT(3,19),USE(?CV:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(74,19,64,10),USE(CV:IDSOCIO)
                       BUTTON('...'),AT(140,18,12,12),USE(?CallLookup)
                       STRING(@s30),AT(159,19),USE(SOC:NOMBRE)
                       PROMPT('MATRICULA:'),AT(288,19),USE(?Prompt7)
                       STRING(@n-14),AT(333,19),USE(SOC:MATRICULA)
                       PROMPT('IDINSTITUCION:'),AT(3,33),USE(?CV:IDINSTITUCION:Prompt),TRN
                       ENTRY(@n-14),AT(74,33,64,10),USE(CV:IDINSTITUCION)
                       BUTTON('...'),AT(141,32,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(159,33),USE(INS2:NOMBRE)
                       PROMPT('ID TIPO CURSO:'),AT(3,47),USE(?CV:ID_TIPO_CURSO:Prompt),TRN
                       ENTRY(@n-14),AT(74,47,64,10),USE(CV:ID_TIPO_CURSO)
                       BUTTON('...'),AT(140,46,12,12),USE(?CallLookup:3)
                       STRING(@s50),AT(159,47),USE(TIP2:DESCRIPCION)
                       PROMPT('ANO EGRESO:'),AT(3,61),USE(?CV:ANO_EGRESO:Prompt),TRN
                       ENTRY(@s4),AT(74,61,40,10),USE(CV:ANO_EGRESO),REQ
                       PROMPT('CANTIDAD HORAS:'),AT(3,75),USE(?CV:CANTIDAD_HORAS:Prompt),TRN
                       ENTRY(@s20),AT(74,75,84,10),USE(CV:CANTIDAD_HORAS),REQ
                       PROMPT('OBSERVACION:'),AT(3,89),USE(?CV:OBSERVACION:Prompt)
                       ENTRY(@s100),AT(72,89,311,10),USE(CV:OBSERVACION)
                       BUTTON('&Aceptar'),AT(271,103,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(331,103,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('UpdateCV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CV:DESCRIPCION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CV:Record,History::CV:Record)
  SELF.AddHistoryField(?CV:DESCRIPCION,2)
  SELF.AddHistoryField(?CV:IDSOCIO,3)
  SELF.AddHistoryField(?CV:IDINSTITUCION,4)
  SELF.AddHistoryField(?CV:ID_TIPO_CURSO,5)
  SELF.AddHistoryField(?CV:ANO_EGRESO,6)
  SELF.AddHistoryField(?CV:CANTIDAD_HORAS,7)
  SELF.AddHistoryField(?CV:OBSERVACION,8)
  SELF.AddUpdateFile(Access:CV)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CV.Open                                           ! File CV used by this procedure, so make sure it's RelationManager is open
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CV
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
    ?CV:DESCRIPCION{PROP:ReadOnly} = True
    ?CV:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CV:IDINSTITUCION{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?CV:ID_TIPO_CURSO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?CV:ANO_EGRESO{PROP:ReadOnly} = True
    ?CV:CANTIDAD_HORAS{PROP:ReadOnly} = True
    ?CV:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCV',QuickWindow)                     ! Restore window settings from non-volatile store
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
    Relate:CV.Close
    Relate:INSTITUCION.Close
    Relate:SOCIOS.Close
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCV',QuickWindow)                  ! Save window data to non-volatile store
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
      SelectINSTITUCION
      SelectTIPO_CURSO
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
    OF ?CV:IDSOCIO
      SOC:IDSOCIO = CV:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CV:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CV:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CV.TryValidateField(3)                     ! Attempt to validate CV:IDSOCIO in CV
        SELECT(?CV:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CV:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CV:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = CV:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CV:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CV:IDINSTITUCION
      INS2:IDINSTITUCION = CV:IDINSTITUCION
      IF Access:INSTITUCION.TryFetch(INS2:PK_INSTITUCION)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CV:IDINSTITUCION = INS2:IDINSTITUCION
        ELSE
          SELECT(?CV:IDINSTITUCION)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CV.TryValidateField(4)                     ! Attempt to validate CV:IDINSTITUCION in CV
        SELECT(?CV:IDINSTITUCION)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CV:IDINSTITUCION
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CV:IDINSTITUCION{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      INS2:IDINSTITUCION = CV:IDINSTITUCION
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CV:IDINSTITUCION = INS2:IDINSTITUCION
      END
      ThisWindow.Reset(1)
    OF ?CV:ID_TIPO_CURSO
      TIP2:ID_TIPO_CURSO = CV:ID_TIPO_CURSO
      IF Access:TIPO_CURSO.TryFetch(TIP2:PK_T_CURSO)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          CV:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
        ELSE
          SELECT(?CV:ID_TIPO_CURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CV.TryValidateField(5)                     ! Attempt to validate CV:ID_TIPO_CURSO in CV
        SELECT(?CV:ID_TIPO_CURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CV:ID_TIPO_CURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CV:ID_TIPO_CURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      TIP2:ID_TIPO_CURSO = CV:ID_TIPO_CURSO
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        CV:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CV file
!!! </summary>
BrowseCV PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CV)
                       PROJECT(CV:IDCV)
                       PROJECT(CV:DESCRIPCION)
                       PROJECT(CV:IDSOCIO)
                       PROJECT(CV:IDINSTITUCION)
                       PROJECT(CV:ID_TIPO_CURSO)
                       PROJECT(CV:ANO_EGRESO)
                       PROJECT(CV:CANTIDAD_HORAS)
                       JOIN(TIP2:PK_T_CURSO,CV:ID_TIPO_CURSO)
                         PROJECT(TIP2:DESCRIPCION)
                         PROJECT(TIP2:ID_TIPO_CURSO)
                       END
                       JOIN(INS2:PK_INSTITUCION,CV:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                         PROJECT(INS2:IDINSTITUCION)
                       END
                       JOIN(SOC:PK_SOCIOS,CV:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CV:IDCV                LIKE(CV:IDCV)                  !List box control field - type derived from field
CV:DESCRIPCION         LIKE(CV:DESCRIPCION)           !List box control field - type derived from field
CV:IDSOCIO             LIKE(CV:IDSOCIO)               !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CV:IDINSTITUCION       LIKE(CV:IDINSTITUCION)         !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
CV:ID_TIPO_CURSO       LIKE(CV:ID_TIPO_CURSO)         !List box control field - type derived from field
TIP2:DESCRIPCION       LIKE(TIP2:DESCRIPCION)         !List box control field - type derived from field
CV:ANO_EGRESO          LIKE(CV:ANO_EGRESO)            !List box control field - type derived from field
CV:CANTIDAD_HORAS      LIKE(CV:CANTIDAD_HORAS)        !List box control field - type derived from field
TIP2:ID_TIPO_CURSO     LIKE(TIP2:ID_TIPO_CURSO)       !Related join file key field - type derived from field
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CV file'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCV'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDCV~C(0)@n-14@80L(2)|M~' & |
  'DESCRIPCION~@s50@[34L(2)|M~IDSOCIO~C(0)@n-7@45L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M~NO' & |
  'MBRE~C(0)@s30@]|M~COLEGIADO~[25L(2)|M~IDINS~L(0)@n-5@200L(2)|M~NOMBRE~C(0)@s30@](151' & |
  ')|M~INTITUCION~[25L(2)|M~ID TC~L(0)@n-5@200L(2)|M~DESCRIPCION~L(0)@s30@](151)|M~TIPO' & |
  ' CURSO~53L(2)|M~ANO EGRESO~@s4@80L(2)|M~CANTIDAD HORAS~@s20@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de CV')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('CV'),USE(?Tab:2)
                         END
                         TAB('INSTITUCION'),USE(?Tab:3)
                           BUTTON('Select INSTITUCION'),AT(8,158,118,14),USE(?SelectINSTITUCION),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           BUTTON('Select SOCIOS'),AT(8,158,118,14),USE(?SelectSOCIOS),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('TIPO CURSO'),USE(?Tab:5)
                           BUTTON('Select TIPO_CURSO'),AT(8,158,118,14),USE(?SelectTIPO_CURSO),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('DESCRIPCION'),USE(?Tab:6)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
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
  GlobalErrors.SetProcedureName('BrowseCV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CV:IDCV',CV:IDCV)                                  ! Added by: BrowseBox(ABC)
  BIND('CV:ID_TIPO_CURSO',CV:ID_TIPO_CURSO)                ! Added by: BrowseBox(ABC)
  BIND('CV:ANO_EGRESO',CV:ANO_EGRESO)                      ! Added by: BrowseBox(ABC)
  BIND('CV:CANTIDAD_HORAS',CV:CANTIDAD_HORAS)              ! Added by: BrowseBox(ABC)
  BIND('TIP2:ID_TIPO_CURSO',TIP2:ID_TIPO_CURSO)            ! Added by: BrowseBox(ABC)
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CV.Open                                           ! File CV used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CV,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:6{PROP:TEXT},1,1)='&',SUB(?Tab:6{PROP:TEXT},2,LEN(?Tab:6{PROP:TEXT})-1),?Tab:6{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CV:FK_CV_INSTITUCION)                 ! Add the sort order for CV:FK_CV_INSTITUCION for sort order 1
  BRW1.AddRange(CV:IDINSTITUCION,Relate:CV,Relate:INSTITUCION) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,CV:FK_CV_SOCIOS)                      ! Add the sort order for CV:FK_CV_SOCIOS for sort order 2
  BRW1.AddRange(CV:IDSOCIO,Relate:CV,Relate:SOCIOS)        ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,CV:FK_CV_T_CURSO)                     ! Add the sort order for CV:FK_CV_T_CURSO for sort order 3
  BRW1.AddRange(CV:ID_TIPO_CURSO,Relate:CV,Relate:TIPO_CURSO) ! Add file relationship range limit for sort order 3
  BRW1.AddSortOrder(,CV:IDX_CV_DESCRIPCION)                ! Add the sort order for CV:IDX_CV_DESCRIPCION for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,CV:DESCRIPCION,,BRW1)          ! Initialize the browse locator using  using key: CV:IDX_CV_DESCRIPCION , CV:DESCRIPCION
  BRW1.AddSortOrder(,CV:PK_CV)                             ! Add the sort order for CV:PK_CV for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,CV:IDCV,,BRW1)                 ! Initialize the browse locator using  using key: CV:PK_CV , CV:IDCV
  BRW1.AddField(CV:IDCV,BRW1.Q.CV:IDCV)                    ! Field CV:IDCV is a hot field or requires assignment from browse
  BRW1.AddField(CV:DESCRIPCION,BRW1.Q.CV:DESCRIPCION)      ! Field CV:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CV:IDSOCIO,BRW1.Q.CV:IDSOCIO)              ! Field CV:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CV:IDINSTITUCION,BRW1.Q.CV:IDINSTITUCION)  ! Field CV:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CV:ID_TIPO_CURSO,BRW1.Q.CV:ID_TIPO_CURSO)  ! Field CV:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:DESCRIPCION,BRW1.Q.TIP2:DESCRIPCION)  ! Field TIP2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CV:ANO_EGRESO,BRW1.Q.CV:ANO_EGRESO)        ! Field CV:ANO_EGRESO is a hot field or requires assignment from browse
  BRW1.AddField(CV:CANTIDAD_HORAS,BRW1.Q.CV:CANTIDAD_HORAS) ! Field CV:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:ID_TIPO_CURSO,BRW1.Q.TIP2:ID_TIPO_CURSO) ! Field TIP2:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCV',QuickWindow)                     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCV
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
                                                 
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CV.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCV',QuickWindow)                  ! Save window data to non-volatile store
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
    UpdateCV
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
    OF ?SelectINSTITUCION
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectINSTITUCION()
      ThisWindow.Reset
    OF ?SelectSOCIOS
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSOCIOS()
      ThisWindow.Reset
    OF ?SelectTIPO_CURSO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectTIPO_CURSO()
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
       SELECT(?Tab:6)
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
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CONVENIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONVENIO)
                       PROJECT(CON4:ACTA)
                       PROJECT(CON4:CANTIDAD_CUOTAS)
                       PROJECT(CON4:FECHA)
                       PROJECT(CON4:FOLIO)
                       PROJECT(CON4:GASTOS_ADMINISTRATIVOS)
                       PROJECT(CON4:IDSOCIO)
                       PROJECT(CON4:IDSOLICITUD)
                       PROJECT(CON4:IDTIPO_CONVENIO)
                       PROJECT(CON4:LIBRO)
                       PROJECT(CON4:MONTO_CUOTA)
                       PROJECT(CON4:MONTO_TOTAL)
                       JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                         PROJECT(TIP:DESCRIPCION)
                       END
                       JOIN(SOC:PK_SOCIOS,CON4:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(CON5:FK_CONVENIO_DETALLE,CON4:IDSOLICITUD)
                         PROJECT(CON5:ANO)
                         PROJECT(CON5:CANCELADO)
                         PROJECT(CON5:DEUDA_INICIAL)
                         PROJECT(CON5:MES)
                         PROJECT(CON5:MONTO_CUOTA)
                         PROJECT(CON5:NRO_CUOTA)
                         PROJECT(CON5:OBSERVACION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         STRING('Nro.: '),AT(4688,31),USE(?String2),TRN
                         STRING(@n-14),AT(5125,42),USE(CON4:IDSOLICITUD)
                         IMAGE('Logo.JPG'),AT(10,52,1365,906),USE(?Image1)
                         STRING('CONVENIO DE PAGO '),AT(2521,823),USE(?String1),FONT(,,,FONT:bold+FONT:underline),TRN
                         STRING('Fecha:'),AT(4708,240),USE(?String4),TRN
                         STRING(@d17),AT(5458,250),USE(CON4:FECHA)
                       END
break1                 BREAK(CON5:IDSOLICITUD),USE(?BREAK1)
                         HEADER,AT(0,0,,1802),USE(?GROUPHEADER1)
                           LINE,AT(10,10,6229,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING('Nro Socio:'),AT(21,63),USE(?String22),TRN
                           STRING(@n-7),AT(656,63),USE(CON4:IDSOCIO)
                           STRING(@s30),AT(1240,63,2302,188),USE(SOC:NOMBRE)
                           STRING(@n-7),AT(4198,63),USE(SOC:MATRICULA)
                           STRING('Matricula:'),AT(3573,63),USE(?String25),TRN
                           STRING(@n$-10.2),AT(1573,500),USE(CON4:MONTO_TOTAL),FONT(,,,FONT:bold)
                           STRING('Cantidad de Cuotas:'),AT(2344,500),USE(?String29),FONT(,,,FONT:bold),TRN
                           STRING(@n-7.2),AT(5531,823),USE(CON4:GASTOS_ADMINISTRATIVOS)
                           STRING('Detalle del Convenio'),AT(2438,1219),USE(?String40),FONT(,10,,FONT:bold+FONT:underline), |
  TRN
                           LINE,AT(10,1437,6229,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('Mes'),AT(740,1521),USE(?String35),TRN
                           STRING('Año'),AT(1271,1521),USE(?String36),TRN
                           STRING('Nro. Cuota'),AT(10,1521),USE(?String37),TRN
                           STRING('Monto Cuota'),AT(1781,1521),USE(?String38),TRN
                           STRING('Deuda Inicial'),AT(2677,1521),USE(?String39),TRN
                           STRING('Facturado'),AT(5656,1542),USE(?String45),TRN
                           LINE,AT(21,1781,6229,0),USE(?Line5),COLOR(COLOR:Black)
                           STRING('Folio:'),AT(1313,823),USE(?String32),TRN
                           STRING('Acta:'),AT(2573,823),USE(?String33),TRN
                           STRING('Gtos. Adm.:'),AT(4813,823),USE(?String34),TRN
                           STRING('Libro: '),AT(10,823),USE(?String31),TRN
                           STRING('Tipo Convenio:'),AT(21,240),USE(?String26),TRN
                           LINE,AT(10,458,6229,0),USE(?Line1),COLOR(COLOR:Black)
                           STRING('Monto Total Adeudado:'),AT(31,500),USE(?String28),FONT(,,,FONT:bold),TRN
                           STRING(@n-7),AT(927,229),USE(CON4:IDTIPO_CONVENIO)
                           STRING(@s50),AT(1469,229),USE(TIP:DESCRIPCION)
                           STRING(@n$-10.2),AT(5552,500),USE(CON4:MONTO_CUOTA),FONT(,,,FONT:bold)
                           LINE,AT(10,740,6229,0),USE(?Line3),COLOR(COLOR:Black)
                           STRING(@n-7),AT(1646,823),USE(CON4:FOLIO)
                           STRING(@n-7),AT(385,823),USE(CON4:LIBRO)
                           STRING(@s20),AT(2906,823),USE(CON4:ACTA)
                           STRING(@n-7),AT(3573,500),USE(CON4:CANTIDAD_CUOTAS),FONT(,,,FONT:bold)
                           STRING('Monto de la Cuota:'),AT(4396,500),USE(?String30),FONT(,,,FONT:bold),TRN
                         END
detail1                  DETAIL,AT(0,0,,229),USE(?DETAIL1)
                           STRING(@s4),AT(1208,10),USE(CON5:ANO)
                           STRING(@s2),AT(760,10),USE(CON5:MES)
                           STRING(@n-7),AT(21,10),USE(CON5:NRO_CUOTA)
                           STRING(@n$-10.2),AT(1802,10),USE(CON5:MONTO_CUOTA)
                           STRING(@n$-10.2),AT(2719,10),USE(CON5:DEUDA_INICIAL)
                           STRING(@s50),AT(3635,10),USE(CON5:OBSERVACION)
                           STRING(@s2),AT(5854,10),USE(CON5:CANCELADO)
                           LINE,AT(10,208,6229,0),USE(?Line6),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,2271),USE(?GROUPFOOTER1)
                           BOX,AT(21,10,6323,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                           LINE,AT(21,1917,2417,0),USE(?Line9),COLOR(COLOR:Black)
                           STRING('Firma Responsable Colegio'),AT(292,2000),USE(?String44),TRN
                           LINE,AT(3990,1906,2240,0),USE(?Line8),COLOR(COLOR:Black)
                           STRING('Firma y Aclaración  del Colegiado '),AT(4198,2000),USE(?String43),TRN
                         END
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(10,31,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,63),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2667,115),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5292,52),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
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

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CONVENIO',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONVENIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON4:IDSOLICITUD)
  ThisReport.AddSortOrder(CON4:PK_CONVENIO)
  ThisReport.AddRange(CON4:IDSOLICITUD,GLO:IDSOLICITUD)
  ThisReport.AppendOrder('CON5:PERIODO')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONVENIO.SetQuickScan(1,Propagate:OneMany)
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
    Relate:CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CONVENIO',ProgressWindow)      ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:IDSOLICITUD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:IDSOLICITUD,RepGen:XML,TargetAttr:TagName,'CON4:IDSOLICITUD')
  SELF.Attribute.Set(?CON4:IDSOLICITUD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagName,'String4')
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:FECHA,RepGen:XML,TargetAttr:TagName,'CON4:FECHA')
  SELF.Attribute.Set(?CON4:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:IDSOCIO,RepGen:XML,TargetAttr:TagName,'CON4:IDSOCIO')
  SELF.Attribute.Set(?CON4:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:MONTO_TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:MONTO_TOTAL,RepGen:XML,TargetAttr:TagName,'CON4:MONTO_TOTAL')
  SELF.Attribute.Set(?CON4:MONTO_TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:GASTOS_ADMINISTRATIVOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:GASTOS_ADMINISTRATIVOS,RepGen:XML,TargetAttr:TagName,'CON4:GASTOS_ADMINISTRATIVOS')
  SELF.Attribute.Set(?CON4:GASTOS_ADMINISTRATIVOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagName,'CON4:IDTIPO_CONVENIO')
  SELF.Attribute.Set(?CON4:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP:DESCRIPCION')
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:MONTO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:MONTO_CUOTA,RepGen:XML,TargetAttr:TagName,'CON4:MONTO_CUOTA')
  SELF.Attribute.Set(?CON4:MONTO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:FOLIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:FOLIO,RepGen:XML,TargetAttr:TagName,'CON4:FOLIO')
  SELF.Attribute.Set(?CON4:FOLIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:LIBRO,RepGen:XML,TargetAttr:TagName,'CON4:LIBRO')
  SELF.Attribute.Set(?CON4:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:ACTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:ACTA,RepGen:XML,TargetAttr:TagName,'CON4:ACTA')
  SELF.Attribute.Set(?CON4:ACTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:CANTIDAD_CUOTAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:CANTIDAD_CUOTAS,RepGen:XML,TargetAttr:TagName,'CON4:CANTIDAD_CUOTAS')
  SELF.Attribute.Set(?CON4:CANTIDAD_CUOTAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:ANO,RepGen:XML,TargetAttr:TagName,'CON5:ANO')
  SELF.Attribute.Set(?CON5:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:MES,RepGen:XML,TargetAttr:TagName,'CON5:MES')
  SELF.Attribute.Set(?CON5:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:NRO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:NRO_CUOTA,RepGen:XML,TargetAttr:TagName,'CON5:NRO_CUOTA')
  SELF.Attribute.Set(?CON5:NRO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:MONTO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:MONTO_CUOTA,RepGen:XML,TargetAttr:TagName,'CON5:MONTO_CUOTA')
  SELF.Attribute.Set(?CON5:MONTO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:DEUDA_INICIAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:DEUDA_INICIAL,RepGen:XML,TargetAttr:TagName,'CON5:DEUDA_INICIAL')
  SELF.Attribute.Set(?CON5:DEUDA_INICIAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:OBSERVACION,RepGen:XML,TargetAttr:TagName,'CON5:OBSERVACION')
  SELF.Attribute.Set(?CON5:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:CANCELADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:CANCELADO,RepGen:XML,TargetAttr:TagName,'CON5:CANCELADO')
  SELF.Attribute.Set(?CON5:CANCELADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagName,'String44')
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagName,'String43')
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  PRINT(RPT:detail1)
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


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CONVENIO','IMPRIMIR_CONVENIO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONVENIO
!!! </summary>
UpdateCONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON4:Record LIKE(CON4:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CONVENIO'),AT(,,356,226),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateCONVENIO'),SYSTEM
                       GROUP('CONVENIO'),AT(1,0,355,68),USE(?Group3),BOXED
                         PROMPT('IDSOCIO:'),AT(3,9),USE(?CON4:IDSOCIO:Prompt),TRN
                         ENTRY(@n-14),AT(72,9,43,10),USE(CON4:IDSOCIO)
                         BUTTON('...'),AT(116,8,12,12),USE(?CallLookup)
                         STRING(@s30),AT(132,9),USE(SOC:NOMBRE)
                         PROMPT('MATRICULA:'),AT(256,9),USE(?Prompt10)
                         STRING(@n-14),AT(302,9),USE(SOC:MATRICULA)
                         PROMPT('IDTIPO CONVENIO:'),AT(3,27),USE(?CON4:IDTIPO_CONVENIO:Prompt),TRN
                         ENTRY(@n-14),AT(71,27,43,10),USE(CON4:IDTIPO_CONVENIO)
                         BUTTON('...'),AT(117,26,12,12),USE(?CallLookup:2)
                         STRING(@s50),AT(132,27,95,10),USE(TIP:DESCRIPCION)
                         PROMPT('GTO. ADM:'),AT(230,27),USE(?Prompt12)
                         STRING(@n-7.2),AT(270,27),USE(TIP:GASTO_ADMINISTRATIVO)
                         PROMPT('INT.'),AT(302,27),USE(?Prompt13)
                         BUTTON('CALCULAR DEUDA'),AT(98,48,153,15),USE(?Button3)
                         STRING(@n-7.2),AT(319,27),USE(TIP:INTERES)
                       END
                       GROUP('APROBACION'),AT(1,72,354,46),USE(?Group1),BOXED
                         PROMPT('LIBRO:'),AT(4,82),USE(?CON4:LIBRO:Prompt),TRN
                         ENTRY(@n-14),AT(41,82,64,10),USE(CON4:LIBRO)
                         PROMPT('FOLIO:'),AT(120,82),USE(?CON4:FOLIO:Prompt),TRN
                         ENTRY(@n-14),AT(146,82,64,10),USE(CON4:FOLIO)
                         PROMPT('ACTA:'),AT(231,82),USE(?CON4:ACTA:Prompt),TRN
                         ENTRY(@s20),AT(261,82,84,10),USE(CON4:ACTA)
                         PROMPT('OBSERVACION:'),AT(4,102),USE(?CON4:OBSERVACION:Prompt),TRN
                         ENTRY(@s100),AT(70,102,246,10),USE(CON4:OBSERVACION)
                       END
                       GROUP('CARGAR CONVENIO'),AT(0,122,356,79),USE(?Group2),BOXED
                         PROMPT('MONTO TOTAL ADEUDADO:'),AT(4,132),USE(?Prompt11)
                         ENTRY(@n$-10.2),AT(101,131,43,10),USE(GLO:TOTAL,,?GLO:TOTAL:2)
                         STRING(@n$-10.2),AT(153,131),USE(GLO:TOTAL),FONT(,,,FONT:bold+FONT:underline)
                         PROMPT('FECHA:'),AT(221,131),USE(?FECHA_DESDE:Prompt)
                         ENTRY(@D6),AT(249,131,43,10),USE(FECHA_DESDE),RIGHT(1),DISABLE
                         PROMPT('CANTIDAD CUOTAS:'),AT(4,151),USE(?CON4:CANTIDAD_CUOTAS:Prompt),TRN
                         ENTRY(@n-14),AT(107,151,42,10),USE(CON4:CANTIDAD_CUOTAS)
                         BUTTON('CALCULAR MONTO CUOTA'),AT(93,167,170,15),USE(?Button4),DISABLE
                         PROMPT('MONTO CUOTA:'),AT(4,188),USE(?Prompt9)
                         STRING(@n$-10.2),AT(67,188,33,10),USE(CON4:MONTO_CUOTA)
                       END
                       BUTTON('&Aceptar'),AT(47,204,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(247,203,55,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('UpdateCONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON4:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON4:Record,History::CON4:Record)
  SELF.AddHistoryField(?CON4:IDSOCIO,2)
  SELF.AddHistoryField(?CON4:IDTIPO_CONVENIO,3)
  SELF.AddHistoryField(?CON4:LIBRO,19)
  SELF.AddHistoryField(?CON4:FOLIO,20)
  SELF.AddHistoryField(?CON4:ACTA,21)
  SELF.AddHistoryField(?CON4:OBSERVACION,22)
  SELF.AddHistoryField(?CON4:CANTIDAD_CUOTAS,5)
  SELF.AddHistoryField(?CON4:MONTO_CUOTA,6)
  SELF.AddUpdateFile(Access:CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONVENIO
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
    ?CON4:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CON4:IDTIPO_CONVENIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    DISABLE(?Button3)
    ?CON4:LIBRO{PROP:ReadOnly} = True
    ?CON4:FOLIO{PROP:ReadOnly} = True
    ?CON4:ACTA{PROP:ReadOnly} = True
    ?CON4:OBSERVACION{PROP:ReadOnly} = True
    ?GLO:TOTAL:2{PROP:ReadOnly} = True
    ?FECHA_DESDE{PROP:ReadOnly} = True
    ?CON4:CANTIDAD_CUOTAS{PROP:ReadOnly} = True
    DISABLE(?Button4)
    ?CON4:MONTO_CUOTA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCONVENIO',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  !! CARGO VARIABLE FECHA CON LA FECHA ACTUAL
  FECHA_DESDE = TODAY()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONVENIO',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  CON5:IDSOLICITUD = CON4:IDSOLICITUD                      ! Assign linking field value
  Access:CONVENIO_DETALLE.Fetch(CON5:FK_CONVENIO_DETALLE)
  TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO               ! Assign linking field value
  Access:TIPO_CONVENIO.Fetch(TIP:PK_T_CONVENIO)
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
      SelectTIPO_CONVENIO
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
      GLO:CANCELA_CUOTA = TIP:CANCELA_CUOTA
      GLO:CALCULA_DEUDA = TIP:CALCULA_DEUDA
      GLO:IDSOCIO = CON4:IDSOCIO
      GLO:TOTAL = 0
      ENABLE(?Button4)
      
      CALCULAR_CUOTA()
      !!! SACA INTERES Y GASTO ADMINISTRATIVO
      GASTOS_ADMINISTRATIVOS$ = ((GLO:TOTAL * TIP:GASTO_ADMINISTRATIVO)/100)
      INTERESES$ = ((GLO:TOTAL * TIP:INTERES)/100)
      GLO:TOTAL = GLO:TOTAL + GASTOS_ADMINISTRATIVOS$ + INTERESES$
      
      !! CARGA LAS VARIABLES EN LA TABLA
      CON4:INTERES =   INTERESES$
      CON4:GASTOS_ADMINISTRATIVOS =  GASTOS_ADMINISTRATIVOS$ 
      ENABLE(?OK)
      DISABLE(?Group3)
      
      IF TIP:IDTIPO_CONVENIO = 3 THEN
          ENABLE(?FECHA_DESDE)
      END
    OF ?Button4
      CON4:MONTO_CUOTA = GLO:TOTAL / CON4:CANTIDAD_CUOTAS
      
      
    OF ?OK
      CON4:MONTO_TOTAL = GLO:TOTAL
      CON4:GASTOS_ADMINISTRATIVOS = TIP:GASTO_ADMINISTRATIVO
      IF CON4:LIBRO <> 0 THEN
          CON4:APROBADO = 'SI'
      END
      CON4:FECHA  =  FECHA_DESDE
      CON4:HORA   =  CLOCK()
      CON4:MES    =  MONTH(FECHA_DESDE)
      CON4:ANO    =  YEAR(FECHA_DESDE)
      IF CON4:MES = 12 THEN
             CON4:MES = 1
             CON4:ANO = CON4:ANO + 1
      ELSE
             CON4:MES = CON4:MES + 1
      END
      CON4:PERIODO =   FORMAT(CON4:ANO,@N04)&FORMAT(CON4:MES,@N02)
      
      
      
      !!! CARGA EL NRO DE LA SOLICITUD POR STRORE PROCEDURE
      RANKING{PROP:SQL} = 'CALL SP_GEN_CONVENIO_ID'
      NEXT(RANKING)
      CON4:IDSOLICITUD = RAN:C1
      GLO:IDSOLICITUD = RAN:C1
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CON4:IDSOCIO
      SOC:IDSOCIO = CON4:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON4:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CON4:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONVENIO.TryValidateField(2)               ! Attempt to validate CON4:IDSOCIO in CONVENIO
        SELECT(?CON4:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = CON4:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CON4:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CON4:IDTIPO_CONVENIO
      TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO
      IF Access:TIPO_CONVENIO.TryFetch(TIP:PK_T_CONVENIO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON4:IDTIPO_CONVENIO = TIP:IDTIPO_CONVENIO
        ELSE
          SELECT(?CON4:IDTIPO_CONVENIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONVENIO.TryValidateField(3)               ! Attempt to validate CON4:IDTIPO_CONVENIO in CONVENIO
        SELECT(?CON4:IDTIPO_CONVENIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDTIPO_CONVENIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDTIPO_CONVENIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CON4:IDTIPO_CONVENIO = TIP:IDTIPO_CONVENIO
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
  !!! GRABA DETALLE
  IF  Self.Request = InsertRecord THEN
      MES#     = CON4:MES
      ANO#     = CON4:ANO
      PERIODO# = CON4:PERIODO
      CON5:DEUDA_INICIAL =  CON4:MONTO_TOTAL
      LOOP I# = 1 TO CON4:CANTIDAD_CUOTAS
          CON5:IDSOLICITUD    = GLO:IDSOLICITUD
          CON5:MES            = MES#
          CON5:ANO            = ANO#
          CON5:PERIODO        = PERIODO#
          CON5:IDSOCIO        = CON4:IDSOCIO
          CON5:NRO_CUOTA      = I# 
          CON5:MONTO_CUOTA    = CON4:MONTO_CUOTA
          CON5:MONTO_TOTAL    = CON4:MONTO_TOTAL
          CON5:DEUDA_INICIAL  = CON5:DEUDA_INICIAL - CON4:MONTO_CUOTA
          CON5:FECHA          = CON4:FECHA
          CON5:HORA           = CON4:HORA
          CON5:OBSERVACION    = 'CUOTA '&I#&'/'&CON4:CANTIDAD_CUOTAS
          ADD(CONVENIO_DETALLE)
          IF ERRORCODE() THEN MESSAGE (ERROR()).
  
          !!! AUMETA EL MES Y AÑO
          IF CON5:MES = 12 THEN
             MES# = 1
             ANO#= ANO# + 1
          ELSE
              MES# = MES# + 1
          END
          PERIODO# =   FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
  
      END !! LOOP
      IMPRIMIR_CONVENIO
      !!! IMPRIME BONOS
   END
  
  
  CANCELAR_CUOTA()
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
!!! Generated from procedure template - Process
!!! Process the FACTURA File
!!! </summary>
CANCELAR_CUOTA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                     END
ProgressWindow       WINDOW('Proceso de FACTURA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(82,42,58,15),USE(?Progress:Cancel),LEFT,ICON('cancelar.ICO'),FLAT,MSG('Cancelar'), |
  TIP('Cancelar')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('CANCELAR_CUOTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:CANCELA_CUOTA',GLO:CANCELA_CUOTA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA_CONVENIO.Open                             ! File FACTURA_CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CANCELAR_CUOTA',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDSOCIO)
  ThisProcess.AddSortOrder(FAC:FK_FACTURA_SOCIO)
  ThisProcess.AddRange(FAC:IDSOCIO,GLO:IDSOCIO)
  ThisProcess.SetFilter('FAC:ESTADO = '''' AND GLO:CANCELA_CUOTA = ''SI''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:FACTURA_CONVENIO.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CANCELAR_CUOTA',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!! CAMBIO EL ESTADO DE LA FACTURA
  FAC:ESTADO = 'CONVENIO'
  PUT (FACTURA)
  !! CARGA CONVENIO POR CUOTA
  FACXCONV:IDFACTURA  =  FAC:IDFACTURA
  FACXCONV:IDCONVENIO =  GLO:IDSOLICITUD
  ACCESS:FACTURA_CONVENIO.INSERT()
  
  !!! BAJO LA CANTIDAD DE CUOTAS
  SOC:IDSOCIO = FAC:IDSOCIO
  GET (SOCIOS,SOC:PK_SOCIOS)
  IF ERRORCODE() = 35 THEN
      MESSAGE ('NO ENCONTRO SOCIO')
  ELSE
      SOC:CANTIDAD = SOC:CANTIDAD - 1
      PUT(SOCIOS)
      !! CARGA TABLA CONVEBIO_CUOTA
    
   END
  
  
  
  
  
  
  
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! Process the FACTURA File
!!! </summary>
CALCULAR_CUOTA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                     END
ProgressWindow       WINDOW('Proceso de FACTURA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(82,42,58,15),USE(?Progress:Cancel),LEFT,ICON('cancelar.ICO'),FLAT,MSG('Cancelar'), |
  TIP('Cancelar')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('CALCULAR_CUOTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:CALCULA_DEUDA',GLO:CALCULA_DEUDA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CALCULAR_CUOTA',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDSOCIO)
  ThisProcess.AddSortOrder(FAC:FK_FACTURA_SOCIO)
  ThisProcess.AddRange(FAC:IDSOCIO,GLO:IDSOCIO)
  ThisProcess.SetFilter('FAC:ESTADO = '''' AND GLO:CALCULA_DEUDA = ''SI''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('CALCULAR_CUOTA',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!! SACO PERIODO MENOS A 3 MESES
  FECHA# = DATE(MONTH(TODAY()),1,YEAR(TODAY()))
  FECHA# = FECHA# - 120
  MES# = MONTH (FECHA#)
  ANO# = YEAR(FECHA#)
  PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
  
  
  IF FAC:PERIODO > PERIODO$ THEN
      GLO:TOTAL = GLO:TOTAL + (FAC:TOTAL  - FAC:DESCUENTOCOBERTURA)
  ELSE
      GLO:TOTAL = GLO:TOTAL + FAC:TOTAL
  END
  
  
  
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TIPO_CONVENIO Record
!!! </summary>
SelectTIPO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_CONVENIO)
                       PROJECT(TIP:IDTIPO_CONVENIO)
                       PROJECT(TIP:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TIPO_CONVENIO Record'),AT(,,158,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_CONVENIO'),SYSTEM
                       LIST,AT(8,30,142,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDTIPO CONVENIO~C(0)@n-1' & |
  '4@80L(2)|M~DESCRIPCION~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de TI' & |
  'PO_CONVENIO')
                       BUTTON('&Elegir'),AT(101,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(105,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectTIPO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP:IDX_TIPO_CONVENIO_DESCRIPCION)    ! Add the sort order for TIP:IDX_TIPO_CONVENIO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: TIP:IDX_TIPO_CONVENIO_DESCRIPCION , TIP:DESCRIPCION
  BRW1.AddSortOrder(,TIP:PK_T_CONVENIO)                    ! Add the sort order for TIP:PK_T_CONVENIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP:IDTIPO_CONVENIO,,BRW1)     ! Initialize the browse locator using  using key: TIP:PK_T_CONVENIO , TIP:IDTIPO_CONVENIO
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_CONVENIO',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_CONVENIO',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONVENIO File
!!! </summary>
BrowseCONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONVENIO)
                       PROJECT(CON4:IDSOLICITUD)
                       PROJECT(CON4:IDSOCIO)
                       PROJECT(CON4:IDTIPO_CONVENIO)
                       PROJECT(CON4:MONTO_TOTAL)
                       PROJECT(CON4:CANTIDAD_CUOTAS)
                       PROJECT(CON4:MONTO_CUOTA)
                       PROJECT(CON4:GASTOS_ADMINISTRATIVOS)
                       PROJECT(CON4:FECHA)
                       PROJECT(CON4:CANCELADO)
                       PROJECT(CON4:PERIODO)
                       JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                         PROJECT(TIP:DESCRIPCION)
                         PROJECT(TIP:IDTIPO_CONVENIO)
                       END
                       JOIN(SOC:PK_SOCIOS,CON4:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !List box control field - type derived from field
CON4:IDSOCIO           LIKE(CON4:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
CON4:IDTIPO_CONVENIO   LIKE(CON4:IDTIPO_CONVENIO)     !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
CON4:MONTO_TOTAL       LIKE(CON4:MONTO_TOTAL)         !List box control field - type derived from field
CON4:CANTIDAD_CUOTAS   LIKE(CON4:CANTIDAD_CUOTAS)     !List box control field - type derived from field
CON4:MONTO_CUOTA       LIKE(CON4:MONTO_CUOTA)         !List box control field - type derived from field
CON4:GASTOS_ADMINISTRATIVOS LIKE(CON4:GASTOS_ADMINISTRATIVOS) !List box control field - type derived from field
CON4:FECHA             LIKE(CON4:FECHA)               !List box control field - type derived from field
CON4:CANCELADO         LIKE(CON4:CANCELADO)           !List box control field - type derived from field
CON4:PERIODO           LIKE(CON4:PERIODO)             !Browse key field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CONVENIO File'),AT(,,529,198),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCONVENIO'),SYSTEM
                       LIST,AT(8,30,516,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOLICITUD~C(0)@n-14@[3' & |
  '4L(2)|M~IDSOCIO~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@56L(2)|M~MATRI~C(0)@n-5@](184)|M~' & |
  'COLEGIADO~[25L(2)|M~IDTC~C(0)@n-5@200L(2)|M~DESCRIPCION~C(0)@s30@](150)|M~TIPO~56L(2' & |
  ')|M~MONTO DEUDA~C(0)@n$-10.2@64L(2)|M~CANT CUOTAS~C(0)@n-3@57L(2)|M~MONTO CUOTA~C(0)' & |
  '@n$-10.2@56L(2)|M~GASTOS ADM~C(0)@n$-10.2@80L(2)|M~FECHA~C(0)@d17@8L(2)|M~CANCELADO~C(0)@s2@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de CONVENIO'),VCR
                       BUTTON('&Ver'),AT(423,159,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(476,159,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,524,172),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                         END
                         TAB('SOCIOS'),USE(?Tab:3)
                         END
                         TAB('TIPO'),USE(?Tab:4)
                         END
                         TAB('PERIODO'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Salir'),AT(478,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(5,182,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(58,181,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Imprimir Convenio'),AT(117,181,79,14),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Cuotas Canceladas en Convenio'),AT(190,179,113,17),USE(?Button9),LEFT,ICON(ICON:Hand), |
  FLAT
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

Loc::QHlist9 QUEUE,PRE(QHL9)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar9 QUEUE,PRE(Q9)
FieldPar                 CSTRING(800)
                         END
QPar29 QUEUE,PRE(Qp29)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado9          STRING(100)
Loc::Titulo9          STRING(100)
SavPath9          STRING(2000)
Evo::Group9  GROUP,PRE()
Evo::Procedure9          STRING(100)
Evo::App9          STRING(100)
Evo::NroPage          LONG
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
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_9  SHORT
Gol_woI_9 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_9),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_9),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_9),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_9),TRN
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
PrintExBrowse9 ROUTINE

 OPEN(Gol_woI_9)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_9 = BRW1.FileLoaded
 IF Not  EC::LoadI_9
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_9)
 SETCURSOR()
  Evo::App9          = 'Gestion'
  Evo::Procedure9          = GlobalErrors.GetProcedureName()& 9
 
  FREE(QPar9)
  Q9:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
  ADD(QPar9)  !!1
  Q9:FieldPar  = ';'
  ADD(QPar9)  !!2
  Q9:FieldPar  = 'Spanish'
  ADD(QPar9)  !!3
  Q9:FieldPar  = ''
  ADD(QPar9)  !!4
  Q9:FieldPar  = true
  ADD(QPar9)  !!5
  Q9:FieldPar  = ''
  ADD(QPar9)  !!6
  Q9:FieldPar  = true
  ADD(QPar9)  !!7
 !!!! Exportaciones
  Q9:FieldPar  = 'HTML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
  Q9:FieldPar  = CLIP( Q9:FieldPar)&'ASCII|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'XML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'PRT|'
  ADD(QPar9)  !!8
  Q9:FieldPar  = 'All'
  ADD(QPar9)   !.9.
  Q9:FieldPar  = ' 0'
  ADD(QPar9)   !.10
  Q9:FieldPar  = 0
  ADD(QPar9)   !.11
  Q9:FieldPar  = '1'
  ADD(QPar9)   !.12
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.13
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.14
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.15
 
   Q9:FieldPar  = '16'
  ADD(QPar9)   !.16
 
   Q9:FieldPar  = 1
  ADD(QPar9)   !.17
   Q9:FieldPar  = 2
  ADD(QPar9)   !.18
   Q9:FieldPar  = '2'
  ADD(QPar9)   !.19
   Q9:FieldPar  = 12
  ADD(QPar9)   !.20
 
   Q9:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar9)   !.21
 
   Q9:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar9)   !.22
 
   CLEAR(Q9:FieldPar)
  ADD(QPar9)   ! 23 Caracteres Encoding para xml
 
  Q9:FieldPar  = '0'
  ADD(QPar9)   ! 24 Use Open Office
 
   Q9:FieldPar  = 'golmedo'
  ADD(QPar9) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q9:FieldPar  = ' BrowseExport'
  ADD(QPar9)   ! 26  BrowseExport
  Q9:FieldPar  = ' '
  ADD(QPar9)   ! 27  
  Q9:FieldPar  = ' ' 
  ADD(QPar9)   ! 28  
  Q9:FieldPar  = 'BEXPORT' 
  ADD(QPar9)   ! 29 Gestion033.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'IDSOLICITUD'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MATRI'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDTC'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DESCRIPCION'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO TOTAL'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CANTIDAD CUOTAS'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO CUOTA'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'GASTOS ADMINISTRATIVOS'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CANCELADO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
  SysRec# = false
  FREE(Loc::QHlist9)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar29,SysRec#)
         QHL9:Id      = SysRec#
         QHL9:Nombre  = Qp29:F2N
         QHL9:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL9:Pict    = Qp29:F2P
         QHL9:Tot    = Qp29:F2T
         ADD(Loc::QHlist9)
      Else
        break
     END
  END
  Loc::Titulo9 ='CONVENIO'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseCONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON4:IDTIPO_CONVENIO',CON4:IDTIPO_CONVENIO)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_TOTAL',CON4:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CON4:CANTIDAD_CUOTAS',CON4:CANTIDAD_CUOTAS)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_CUOTA',CON4:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('CON4:GASTOS_ADMINISTRATIVOS',CON4:GASTOS_ADMINISTRATIVOS) ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'BrowseCONVENIO', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_SOCIOS)              ! Add the sort order for CON4:FK_CONVENIO_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_SOCIOS , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_TIPO)                ! Add the sort order for CON4:FK_CONVENIO_TIPO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON4:IDTIPO_CONVENIO,,BRW1)    ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_TIPO , CON4:IDTIPO_CONVENIO
  BRW1.AddSortOrder(,CON4:IDX_CONVENCIO_PERIODO)           ! Add the sort order for CON4:IDX_CONVENCIO_PERIODO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:IDX_CONVENCIO_PERIODO , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:PK_CONVENIO)                     ! Add the sort order for CON4:PK_CONVENIO for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CON4:IDSOLICITUD,,BRW1)        ! Initialize the browse locator using  using key: CON4:PK_CONVENIO , CON4:IDSOLICITUD
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOCIO,BRW1.Q.CON4:IDSOCIO)          ! Field CON4:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDTIPO_CONVENIO,BRW1.Q.CON4:IDTIPO_CONVENIO) ! Field CON4:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_TOTAL,BRW1.Q.CON4:MONTO_TOTAL)  ! Field CON4:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANTIDAD_CUOTAS,BRW1.Q.CON4:CANTIDAD_CUOTAS) ! Field CON4:CANTIDAD_CUOTAS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_CUOTA,BRW1.Q.CON4:MONTO_CUOTA)  ! Field CON4:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:GASTOS_ADMINISTRATIVOS,BRW1.Q.CON4:GASTOS_ADMINISTRATIVOS) ! Field CON4:GASTOS_ADMINISTRATIVOS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA,BRW1.Q.CON4:FECHA)              ! Field CON4:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANCELADO,BRW1.Q.CON4:CANCELADO)      ! Field CON4:CANCELADO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:PERIODO,BRW1.Q.CON4:PERIODO)          ! Field CON4:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCONVENIO',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCONVENIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCONVENIO',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateCONVENIO
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
    OF ?Button8
      GLO:IDSOLICITUD = CON4:IDSOLICITUD
    OF ?Button9
      GLO:IDSOLICITUD = CON4:IDSOLICITUD
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    OF ?Button8
      ThisWindow.Update()
      IMPRIMIR_CONVENIO()
    OF ?Button9
      ThisWindow.Update()
      START(Cuotas_canceladas, 25000)
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
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
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
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
!!! Administrador de FACTURA_CONVENIO
!!! </summary>
Cuotas_canceladas PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD         LONG                                  ! 
LOC:TOTAL            REAL                                  ! 
BRW1::View:Browse    VIEW(FACTURA_CONVENIO)
                       PROJECT(FACXCONV:IDCONVENIO)
                       PROJECT(FACXCONV:IDFACTURA)
                       JOIN(CON4:PK_CONVENIO,FACXCONV:IDCONVENIO)
                         PROJECT(CON4:FECHA)
                         PROJECT(CON4:IDSOLICITUD)
                       END
                       JOIN(FAC:PK_FACTURA,FACXCONV:IDFACTURA)
                         PROJECT(FAC:MES)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:TOTAL)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:IDSOCIO)
                         JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                           PROJECT(SOC:MATRICULA)
                           PROJECT(SOC:NOMBRE)
                           PROJECT(SOC:IDSOCIO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FACXCONV:IDCONVENIO    LIKE(FACXCONV:IDCONVENIO)      !List box control field - type derived from field
CON4:FECHA             LIKE(CON4:FECHA)               !List box control field - type derived from field
FACXCONV:IDFACTURA     LIKE(FACXCONV:IDFACTURA)       !List box control field - type derived from field
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !Related join file key field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de FACTURA_CONVENIO'),AT(,,340,207),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Cuotas_canceladas'),SYSTEM
                       LIST,AT(8,30,322,121),USE(?Browse:1),HVSCROLL,FORMAT('49L(2)|M~MATRICULA~C(0)@n-5@166L(' & |
  '2)|M~NOMBRE~C(0)@s40@29L(2)|M~MES~C(0)@n-3@25L(2)|M~AÑO~C(0)@n-5@52L(1)|M~TOTAL~C(0)' & |
  '@n$-12.2@35L(2)|M~Nº CONV~C(0)@n-7@40L(2)|M~FECHA CON~C(0)@d17@64L(2)|M~IDFACTURA~C(0)@n-7@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de FACTURA_CONVENIO')
                       BUTTON('E&xportar'),AT(6,191,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,331,186),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                           PROMPT('CANTIDAD:'),AT(11,159),USE(?LOC:CANTIDAD:Prompt)
                           ENTRY(@n-14),AT(61,158,60,10),USE(LOC:CANTIDAD),RIGHT(1),DISABLE,TRN
                           PROMPT('TOTAL:'),AT(12,173),USE(?LOC:TOTAL:Prompt)
                           ENTRY(@n$-12.2),AT(62,172,60,10),USE(LOC:TOTAL),DISABLE,TRN
                         END
                       END
                       BUTTON('&Salir'),AT(162,191,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist5 QUEUE,PRE(QHL5)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar5 QUEUE,PRE(Q5)
FieldPar                 CSTRING(800)
                         END
QPar25 QUEUE,PRE(Qp25)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado5          STRING(100)
Loc::Titulo5          STRING(100)
SavPath5          STRING(2000)
Evo::Group5  GROUP,PRE()
Evo::Procedure5          STRING(100)
Evo::App5          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_5  SHORT
Gol_woI_5 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_5),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_5),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_5),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_5),TRN
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
PrintExBrowse5 ROUTINE

 OPEN(Gol_woI_5)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_5 = BRW1.FileLoaded
 IF Not  EC::LoadI_5
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_5)
 SETCURSOR()
  Evo::App5          = 'Gestion'
  Evo::Procedure5          = GlobalErrors.GetProcedureName()& 5
 
  FREE(QPar5)
  Q5:FieldPar  = '1,2,3,4,5,6,7,8,'
  ADD(QPar5)  !!1
  Q5:FieldPar  = ';'
  ADD(QPar5)  !!2
  Q5:FieldPar  = 'Spanish'
  ADD(QPar5)  !!3
  Q5:FieldPar  = ''
  ADD(QPar5)  !!4
  Q5:FieldPar  = true
  ADD(QPar5)  !!5
  Q5:FieldPar  = ''
  ADD(QPar5)  !!6
  Q5:FieldPar  = true
  ADD(QPar5)  !!7
 !!!! Exportaciones
  Q5:FieldPar  = 'HTML|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'EXCEL|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'WORD|'
  Q5:FieldPar  = CLIP( Q5:FieldPar)&'ASCII|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'XML|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'PRT|'
  ADD(QPar5)  !!8
  Q5:FieldPar  = 'All'
  ADD(QPar5)   !.9.
  Q5:FieldPar  = ' 0'
  ADD(QPar5)   !.10
  Q5:FieldPar  = 0
  ADD(QPar5)   !.11
  Q5:FieldPar  = '1'
  ADD(QPar5)   !.12
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.13
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.14
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.15
 
   Q5:FieldPar  = '16'
  ADD(QPar5)   !.16
 
   Q5:FieldPar  = 1
  ADD(QPar5)   !.17
   Q5:FieldPar  = 2
  ADD(QPar5)   !.18
   Q5:FieldPar  = '2'
  ADD(QPar5)   !.19
   Q5:FieldPar  = 12
  ADD(QPar5)   !.20
 
   Q5:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar5)   !.21
 
   Q5:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar5)   !.22
 
   CLEAR(Q5:FieldPar)
  ADD(QPar5)   ! 23 Caracteres Encoding para xml
 
  Q5:FieldPar  = '0'
  ADD(QPar5)   ! 24 Use Open Office
 
   Q5:FieldPar  = 'golmedo'
  ADD(QPar5) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q5:FieldPar  = ' BrowseExport'
  ADD(QPar5)   ! 26  BrowseExport
  Q5:FieldPar  = ' '
  ADD(QPar5)   ! 27  
  Q5:FieldPar  = ' ' 
  ADD(QPar5)   ! 28  
  Q5:FieldPar  = 'BEXPORT' 
  ADD(QPar5)   ! 29 Gestion033.clw
 !!!!!
 
 
  FREE(QPar25)
       Qp25:F2N  = 'MATRICULA'
  Qp25:F2P  = '@n-5'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'NOMBRE'
  Qp25:F2P  = '@s40'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'MES'
  Qp25:F2P  = '@n-3'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'AÑO'
  Qp25:F2P  = '@n-5'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'TOTAL'
  Qp25:F2P  = '@n$-12.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'IDCONV'
  Qp25:F2P  = '@n-7'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'FECHA CON'
  Qp25:F2P  = '@d17'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'IDFACTURA'
  Qp25:F2P  = '@n-7'
  Qp25:F2T  = '0'
  ADD(QPar25)
  SysRec# = false
  FREE(Loc::QHlist5)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar25,SysRec#)
         QHL5:Id      = SysRec#
         QHL5:Nombre  = Qp25:F2N
         QHL5:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL5:Pict    = Qp25:F2P
         QHL5:Tot    = Qp25:F2T
         ADD(Loc::QHlist5)
      Else
        break
     END
  END
  Loc::Titulo5 ='Facturas con Convenio'
 
 SavPath5 = PATH()
  Exportar(Loc::QHlist5,BRW1.Q,QPar5,0,Loc::Titulo5,Evo::Group5)
 IF Not EC::LoadI_5 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath5)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Cuotas_canceladas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:FACTURA_CONVENIO.Open                             ! File FACTURA_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FACTURA_CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FACXCONV:PK_FACTURA_CONVENIO)         ! Add the sort order for FACXCONV:PK_FACTURA_CONVENIO for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,FACXCONV:IDFACTURA,,BRW1)      ! Initialize the browse locator using  using key: FACXCONV:PK_FACTURA_CONVENIO , FACXCONV:IDFACTURA
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FACXCONV:IDCONVENIO,BRW1.Q.FACXCONV:IDCONVENIO) ! Field FACXCONV:IDCONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA,BRW1.Q.CON4:FECHA)              ! Field CON4:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(FACXCONV:IDFACTURA,BRW1.Q.FACXCONV:IDFACTURA) ! Field FACXCONV:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cuotas_canceladas',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cuotas_canceladas',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse5
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


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD:Cnt     LONG                                  ! Count variable for browse totals
LOC:TOTAL:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:FACTURA_CONVENIO.SetQuickScan(1)
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
    LOC:CANTIDAD:Cnt += 1
    LOC:TOTAL:Sum += FAC:TOTAL
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD = LOC:CANTIDAD:Cnt
  LOC:TOTAL = LOC:TOTAL:Sum
  PARENT.ResetFromView
  Relate:FACTURA_CONVENIO.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONSULTORIO
!!! </summary>
UpdateCONSULTORIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON2:Record LIKE(CON2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion EMPRESA'),AT(,,367,132),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateCONSULTORIO'),SYSTEM
                       PROMPT('IDLOCALIDAD:'),AT(5,3),USE(?CON2:IDLOCALIDAD:Prompt),TRN
                       ENTRY(@n-14),AT(60,3,64,10),USE(CON2:IDLOCALIDAD)
                       BUTTON('...'),AT(125,2,12,12),USE(?CallLookup)
                       STRING(@s20),AT(141,4),USE(LOC:DESCRIPCION)
                       PROMPT('IDSOCIO:'),AT(5,17),USE(?CON2:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(60,17,64,10),USE(CON2:IDSOCIO)
                       BUTTON('...'),AT(126,16,12,12),USE(?CallLookup:2)
                       STRING(@n-14),AT(317,17),USE(SOC:MATRICULA)
                       STRING(@s30),AT(145,17),USE(SOC:NOMBRE)
                       PROMPT('MATRICULA:'),AT(271,17),USE(?Prompt9)
                       PROMPT('DIRECCION:'),AT(5,31),USE(?CON2:DIRECCION:Prompt),TRN
                       ENTRY(@s50),AT(60,31,189,10),USE(CON2:DIRECCION)
                       PROMPT('FECHA:'),AT(5,45),USE(?CON2:FECHA:Prompt),TRN
                       ENTRY(@d17),AT(60,45,104,10),USE(CON2:FECHA)
                       PROMPT('LIBRO:'),AT(5,59),USE(?CON2:LIBRO:Prompt),TRN
                       ENTRY(@n-14),AT(60,59,64,10),USE(CON2:LIBRO),REQ
                       PROMPT('FOLIO:'),AT(132,61),USE(?CON2:FOLIO:Prompt),TRN
                       ENTRY(@n-14),AT(166,61,64,10),USE(CON2:FOLIO),REQ
                       PROMPT('ACTA:'),AT(241,61),USE(?CON2:ACTA:Prompt),TRN
                       ENTRY(@s20),AT(273,61,84,10),USE(CON2:ACTA),REQ
                       PROMPT('IDINSPECTOR:'),AT(5,73),USE(?CON2:IDINSPECTOR:Prompt),TRN
                       ENTRY(@n-14),AT(59,73,64,10),USE(CON2:IDINSPECTOR)
                       BUTTON('...'),AT(126,72,12,12),USE(?CallLookup:3)
                       STRING(@n-14),AT(139,73),USE(INS:IDSOCIO)
                       LINE,AT(0,90,367,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('FECHA HABILITACION:'),AT(2,98),USE(?CON2:FECHA_HABILITACION:Prompt)
                       ENTRY(@d17),AT(83,98,64,10),USE(CON2:FECHA_HABILITACION)
                       LINE,AT(-1,113,365,0),USE(?Line2),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(76,118,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(254,118,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('TELEFONO:'),AT(169,44),USE(?CON2:TELEFONO:Prompt)
                       ENTRY(@s40),AT(217,44,140,10),USE(CON2:TELEFONO)
                       OPTION('ACTIVO:'),AT(208,92,68,20),USE(CON2:ACTIVO),BOXED
                         RADIO('SI'),AT(217,99),USE(?CON2:ACTIVO:Radio1)
                         RADIO('NO'),AT(247,99),USE(?CON2:ACTIVO:Radio2)
                       END
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
  GlobalErrors.SetProcedureName('UpdateCONSULTORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON2:IDLOCALIDAD:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON2:Record,History::CON2:Record)
  SELF.AddHistoryField(?CON2:IDLOCALIDAD,2)
  SELF.AddHistoryField(?CON2:IDSOCIO,3)
  SELF.AddHistoryField(?CON2:DIRECCION,4)
  SELF.AddHistoryField(?CON2:FECHA,5)
  SELF.AddHistoryField(?CON2:LIBRO,6)
  SELF.AddHistoryField(?CON2:FOLIO,7)
  SELF.AddHistoryField(?CON2:ACTA,8)
  SELF.AddHistoryField(?CON2:IDINSPECTOR,9)
  SELF.AddHistoryField(?CON2:FECHA_HABILITACION,11)
  SELF.AddHistoryField(?CON2:TELEFONO,13)
  SELF.AddHistoryField(?CON2:ACTIVO,14)
  SELF.AddUpdateFile(Access:CONSULTORIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:INSPECTOR.Open                                    ! File INSPECTOR used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONSULTORIO
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
    ?CON2:IDLOCALIDAD{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CON2:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?CON2:DIRECCION{PROP:ReadOnly} = True
    ?CON2:FECHA{PROP:ReadOnly} = True
    ?CON2:LIBRO{PROP:ReadOnly} = True
    ?CON2:FOLIO{PROP:ReadOnly} = True
    ?CON2:ACTA{PROP:ReadOnly} = True
    ?CON2:IDINSPECTOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?CON2:FECHA_HABILITACION{PROP:ReadOnly} = True
    ?CON2:TELEFONO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCONSULTORIO',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:INSPECTOR.Close
    Relate:LOCALIDAD.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONSULTORIO',QuickWindow)         ! Save window data to non-volatile store
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
      SelectLOCALIDAD
      SelectSOCIOS
      SelectINSPECTOR
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
      IF CON2:FECHA_HABILITACION <> 0 THEN
          CON2:HABILITADO = 'SI'
          CON2:FECHA_VTO = CON2:FECHA_HABILITACION +  1825
      END
      IF CON2:ACTIVO = '' THEN 
          CON2:ACTIVO = 'SI'
      END     
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CON2:IDLOCALIDAD
      LOC:IDLOCALIDAD = CON2:IDLOCALIDAD
      IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON2:IDLOCALIDAD = LOC:IDLOCALIDAD
        ELSE
          SELECT(?CON2:IDLOCALIDAD)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO.TryValidateField(2)            ! Attempt to validate CON2:IDLOCALIDAD in CONSULTORIO
        SELECT(?CON2:IDLOCALIDAD)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON2:IDLOCALIDAD
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON2:IDLOCALIDAD{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      LOC:IDLOCALIDAD = CON2:IDLOCALIDAD
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CON2:IDLOCALIDAD = LOC:IDLOCALIDAD
      END
      ThisWindow.Reset(1)
    OF ?CON2:IDSOCIO
      SOC:IDSOCIO = CON2:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON2:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CON2:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO.TryValidateField(3)            ! Attempt to validate CON2:IDSOCIO in CONSULTORIO
        SELECT(?CON2:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON2:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON2:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      SOC:IDSOCIO = CON2:IDSOCIO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CON2:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CON2:IDINSPECTOR
      INS:IDINSPECTOR = CON2:IDINSPECTOR
      IF Access:INSPECTOR.TryFetch(INS:PK_INSPECTOR)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          CON2:IDINSPECTOR = INS:IDINSPECTOR
        ELSE
          SELECT(?CON2:IDINSPECTOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO.TryValidateField(9)            ! Attempt to validate CON2:IDINSPECTOR in CONSULTORIO
        SELECT(?CON2:IDINSPECTOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON2:IDINSPECTOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON2:IDINSPECTOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      INS:IDINSPECTOR = CON2:IDINSPECTOR
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        CON2:IDINSPECTOR = INS:IDINSPECTOR
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

