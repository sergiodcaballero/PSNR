

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PADRON024.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a BANCO Record
!!! </summary>
SelectBANCO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(BANCO)
                       PROJECT(BAN2:IDBANCO)
                       PROJECT(BAN2:DESCRIPCION)
                       PROJECT(BAN2:CODIGO_BANCO)
                       PROJECT(BAN2:ID_REGISTRO)
                       PROJECT(BAN2:CBU_BLOQUE_1)
                       PROJECT(BAN2:SUBEMPRESA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
BAN2:IDBANCO           LIKE(BAN2:IDBANCO)             !List box control field - type derived from field
BAN2:DESCRIPCION       LIKE(BAN2:DESCRIPCION)         !List box control field - type derived from field
BAN2:CODIGO_BANCO      LIKE(BAN2:CODIGO_BANCO)        !List box control field - type derived from field
BAN2:ID_REGISTRO       LIKE(BAN2:ID_REGISTRO)         !List box control field - type derived from field
BAN2:CBU_BLOQUE_1      LIKE(BAN2:CBU_BLOQUE_1)        !List box control field - type derived from field
BAN2:SUBEMPRESA        LIKE(BAN2:SUBEMPRESA)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a BANCO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectBANCO'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDBANCO~C(0)@n-14@80L(2)' & |
  '|M~DESCRIPCION~L(2)@s50@64R(2)|M~CODIGO BANCO~C(0)@n-14@64R(2)|M~ID REGISTRO~C(0)@n-' & |
  '14@64R(2)|M~CBU BLOQUE 1~C(0)@n-14@44R(2)|M~SUBEMPRESA~C(0)@n5@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de BANCO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_BANCO'),USE(?Tab:2)
                         END
                         TAB('FK_BANCO_COD_RESGISTRO'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('SelectBANCO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('BAN2:IDBANCO',BAN2:IDBANCO)                        ! Added by: BrowseBox(ABC)
  BIND('BAN2:CODIGO_BANCO',BAN2:CODIGO_BANCO)              ! Added by: BrowseBox(ABC)
  BIND('BAN2:ID_REGISTRO',BAN2:ID_REGISTRO)                ! Added by: BrowseBox(ABC)
  BIND('BAN2:CBU_BLOQUE_1',BAN2:CBU_BLOQUE_1)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:BANCO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,BAN2:FK_BANCO_COD_RESGISTRO)          ! Add the sort order for BAN2:FK_BANCO_COD_RESGISTRO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,BAN2:ID_REGISTRO,,BRW1)        ! Initialize the browse locator using  using key: BAN2:FK_BANCO_COD_RESGISTRO , BAN2:ID_REGISTRO
  BRW1.AddSortOrder(,BAN2:PK_BANCO)                        ! Add the sort order for BAN2:PK_BANCO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,BAN2:IDBANCO,,BRW1)            ! Initialize the browse locator using  using key: BAN2:PK_BANCO , BAN2:IDBANCO
  BRW1.AddField(BAN2:IDBANCO,BRW1.Q.BAN2:IDBANCO)          ! Field BAN2:IDBANCO is a hot field or requires assignment from browse
  BRW1.AddField(BAN2:DESCRIPCION,BRW1.Q.BAN2:DESCRIPCION)  ! Field BAN2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(BAN2:CODIGO_BANCO,BRW1.Q.BAN2:CODIGO_BANCO) ! Field BAN2:CODIGO_BANCO is a hot field or requires assignment from browse
  BRW1.AddField(BAN2:ID_REGISTRO,BRW1.Q.BAN2:ID_REGISTRO)  ! Field BAN2:ID_REGISTRO is a hot field or requires assignment from browse
  BRW1.AddField(BAN2:CBU_BLOQUE_1,BRW1.Q.BAN2:CBU_BLOQUE_1) ! Field BAN2:CBU_BLOQUE_1 is a hot field or requires assignment from browse
  BRW1.AddField(BAN2:SUBEMPRESA,BRW1.Q.BAN2:SUBEMPRESA)    ! Field BAN2:SUBEMPRESA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectBANCO',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:BANCO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectBANCO',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
!!! Generated from procedure template - Process
!!! </summary>
cargar_padron PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(MATRICULADOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('cargar_padron')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:MATRICULADOS.Open                                 ! File MATRICULADOS used by this procedure, so make sure it's RelationManager is open
  Relate:PADRON.Open                                       ! File PADRON used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cargar_padron',ProgressWindow)             ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:MATRICULADOS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(MATRICULADOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:MATRICULADOS.Close
    Relate:PADRON.Close
  END
  IF SELF.Opened
    INIMgr.Update('cargar_padron',ProgressWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  PAD1:IDSOCIO = MAT:MATRICULA
  PAD1:MATRICULA = MAT:MATRICULA
  PAD1:IDLOCALIDAD = MAT:IDLOCALIDA
  PAD1:NOMBRE = UPPER(CLIP(MAT:NOMBRE))
  PAD1:N_DOCUMENTO = MAT:MATRICULA
  ACCESS:PADRON.INSERT()
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LOCALIDAD file
!!! </summary>
LOCALIDAD PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(LOCALIDAD)
                       PROJECT(LOC:IDLOCALIDAD)
                       PROJECT(LOC:DESCRIPCION)
                       PROJECT(LOC:CP)
                       PROJECT(LOC:CPNUEVO)
                       PROJECT(LOC:IDPAIS)
                       PROJECT(LOC:COD_TELEFONICO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
LOC:CP                 LIKE(LOC:CP)                   !List box control field - type derived from field
LOC:CPNUEVO            LIKE(LOC:CPNUEVO)              !List box control field - type derived from field
LOC:IDPAIS             LIKE(LOC:IDPAIS)               !List box control field - type derived from field
LOC:COD_TELEFONICO     LIKE(LOC:COD_TELEFONICO)       !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the LOCALIDAD file'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('LOCALIDAD'),SYSTEM
                       LIST,AT(8,30,342,146),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDLOCALIDAD~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~L(2)@s50@64R(2)|M~CP~C(0)@n-14@80L(2)|M~CPNUEVO~L(2)@s20@64R(2)|M' & |
  '~IDPAIS~C(0)@n-14@60L(2)|M~COD TELEFONICO~L(2)@s10@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de LOCALIDAD')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_LOCALIDAD'),USE(?Tab:2)
                         END
                         TAB('FK_LOCALIDAD_PAIS'),USE(?Tab:3)
                         END
                         TAB('KEY_CP'),USE(?Tab:4)
                         END
                         TAB('NOMBRE'),USE(?Tab:5)
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
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('LOCALIDAD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LOCALIDAD,SELF) ! Initialize the browse manager
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
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LOC:FK_LOCALIDAD_PAIS)                ! Add the sort order for LOC:FK_LOCALIDAD_PAIS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,LOC:IDPAIS,,BRW1)              ! Initialize the browse locator using  using key: LOC:FK_LOCALIDAD_PAIS , LOC:IDPAIS
  BRW1.AddSortOrder(,LOC:KEY_CP)                           ! Add the sort order for LOC:KEY_CP for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,LOC:CP,,BRW1)                  ! Initialize the browse locator using  using key: LOC:KEY_CP , LOC:CP
  BRW1.AddSortOrder(,LOC:NOMBRE)                           ! Add the sort order for LOC:NOMBRE for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,LOC:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: LOC:NOMBRE , LOC:DESCRIPCION
  BRW1.AddSortOrder(,LOC:PK_LOCALIDAD)                     ! Add the sort order for LOC:PK_LOCALIDAD for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,LOC:IDLOCALIDAD,,BRW1)         ! Initialize the browse locator using  using key: LOC:PK_LOCALIDAD , LOC:IDLOCALIDAD
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:CP,BRW1.Q.LOC:CP)                      ! Field LOC:CP is a hot field or requires assignment from browse
  BRW1.AddField(LOC:CPNUEVO,BRW1.Q.LOC:CPNUEVO)            ! Field LOC:CPNUEVO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDPAIS,BRW1.Q.LOC:IDPAIS)              ! Field LOC:IDPAIS is a hot field or requires assignment from browse
  BRW1.AddField(LOC:COD_TELEFONICO,BRW1.Q.LOC:COD_TELEFONICO) ! Field LOC:COD_TELEFONICO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LOCALIDAD',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LOCALIDAD.Close
  END
  IF SELF.Opened
    INIMgr.Update('LOCALIDAD',QuickWindow)                 ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
       SELECT(?Tab:4)
       SELECT(?Tab:5)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

