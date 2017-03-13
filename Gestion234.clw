

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION234.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION233.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION236.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO File
!!! </summary>
CURSOS_ABM PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CURSO)
                       PROJECT(CUR:IDCURSO)
                       PROJECT(CUR:DESCRIPCION)
                       PROJECT(CUR:PRESENCIAL)
                       PROJECT(CUR:MONTO_TOTAL)
                       PROJECT(CUR:CANTIDAD)
                       PROJECT(CUR:CANTIDAD_HORAS)
                       PROJECT(CUR:ID_TIPO_CURSO)
                       PROJECT(CUR:OBSERVACION)
                       JOIN(TIP2:PK_T_CURSO,CUR:ID_TIPO_CURSO)
                         PROJECT(TIP2:DESCRIPCION)
                         PROJECT(TIP2:ID_TIPO_CURSO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CUR:PRESENCIAL         LIKE(CUR:PRESENCIAL)           !List box control field - type derived from field
CUR:MONTO_TOTAL        LIKE(CUR:MONTO_TOTAL)          !List box control field - type derived from field
CUR:CANTIDAD           LIKE(CUR:CANTIDAD)             !List box control field - type derived from field
CUR:CANTIDAD_HORAS     LIKE(CUR:CANTIDAD_HORAS)       !List box control field - type derived from field
CUR:ID_TIPO_CURSO      LIKE(CUR:ID_TIPO_CURSO)        !List box control field - type derived from field
TIP2:DESCRIPCION       LIKE(TIP2:DESCRIPCION)         !List box control field - type derived from field
CUR:OBSERVACION        LIKE(CUR:OBSERVACION)          !List box control field - type derived from field
TIP2:ID_TIPO_CURSO     LIKE(TIP2:ID_TIPO_CURSO)       !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CURSO File'),AT(,,527,336),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABMCURSOS'),SYSTEM
                       LIST,AT(8,30,506,234),USE(?Browse:1),HVSCROLL,FORMAT('36R(2)|M~IDCURSO~C(0)@n-7@203L(2)' & |
  '|M~DESCRIPCION~@s50@53L(2)|M~PRESENCIAL~@s2@103L(2)|M~MONTO TOTAL~@n$-10.2@64L(2)|M~' & |
  'CANT MODULOS~C(0)@n-5@70L(2)|M~CANTIDAD HORAS~@n-10@64R(2)|M~ID TIPO CURSO~C(0)@n-14' & |
  '@96L(2)|M~TIPO CURSO~L(0)@s50@80L(2)|M~OBSERVACION~@s100@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CURSO')
                       BUTTON('&Elegir'),AT(255,273,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(308,273,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(361,273,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(414,273,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(467,273,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,518,289),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('TIPO CURSO'),USE(?Tab:3)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:4)
                         END
                       END
                       BUTTON('MODULOS'),AT(5,295,101,22),USE(?BrowseCURSO_MODULOS),LEFT,ICON('clipboard.ico'),FLAT, |
  MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('&Salir'),AT(475,317,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('CURSOS_ABM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR:MONTO_TOTAL',CUR:MONTO_TOTAL)                  ! Added by: BrowseBox(ABC)
  BIND('CUR:CANTIDAD_HORAS',CUR:CANTIDAD_HORAS)            ! Added by: BrowseBox(ABC)
  BIND('CUR:ID_TIPO_CURSO',CUR:ID_TIPO_CURSO)              ! Added by: BrowseBox(ABC)
  BIND('TIP2:ID_TIPO_CURSO',TIP2:ID_TIPO_CURSO)            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUR:FK_CURSO_TIPO_CURSO)              ! Add the sort order for CUR:FK_CURSO_TIPO_CURSO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CUR:ID_TIPO_CURSO,,BRW1)       ! Initialize the browse locator using  using key: CUR:FK_CURSO_TIPO_CURSO , CUR:ID_TIPO_CURSO
  BRW1.AddSortOrder(,CUR:IDX_CURSO_DESCRIPCION)            ! Add the sort order for CUR:IDX_CURSO_DESCRIPCION for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CUR:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: CUR:IDX_CURSO_DESCRIPCION , CUR:DESCRIPCION
  BRW1.AddSortOrder(,CUR:PK_CURSO)                         ! Add the sort order for CUR:PK_CURSO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,CUR:IDCURSO,,BRW1)             ! Initialize the browse locator using  using key: CUR:PK_CURSO , CUR:IDCURSO
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:PRESENCIAL,BRW1.Q.CUR:PRESENCIAL)      ! Field CUR:PRESENCIAL is a hot field or requires assignment from browse
  BRW1.AddField(CUR:MONTO_TOTAL,BRW1.Q.CUR:MONTO_TOTAL)    ! Field CUR:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CUR:CANTIDAD,BRW1.Q.CUR:CANTIDAD)          ! Field CUR:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(CUR:CANTIDAD_HORAS,BRW1.Q.CUR:CANTIDAD_HORAS) ! Field CUR:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(CUR:ID_TIPO_CURSO,BRW1.Q.CUR:ID_TIPO_CURSO) ! Field CUR:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:DESCRIPCION,BRW1.Q.TIP2:DESCRIPCION)  ! Field TIP2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:OBSERVACION,BRW1.Q.CUR:OBSERVACION)    ! Field CUR:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:ID_TIPO_CURSO,BRW1.Q.TIP2:ID_TIPO_CURSO) ! Field TIP2:ID_TIPO_CURSO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CURSOS_ABM',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCURSO
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('CURSOS_ABM',QuickWindow)                ! Save window data to non-volatile store
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
    UpdateCURSO
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
    OF ?BrowseCURSO_MODULOS
      ThisWindow.Update()
      BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO()
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

