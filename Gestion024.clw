

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION024.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION025.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de CURSO_MODULOS
!!! </summary>
Carga_modulos PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CURSO_MODULOS)
                       PROJECT(CUR2:ID_MODULO)
                       PROJECT(CUR2:DESCRIPCION)
                       PROJECT(CUR2:IDCURSO)
                       PROJECT(CUR2:NUMERO_MODULO)
                       PROJECT(CUR2:CANTIDAD_HORAS)
                       PROJECT(CUR2:EXAMEN)
                       PROJECT(CUR2:MONTO)
                       PROJECT(CUR2:FECHA_INICIO)
                       PROJECT(CUR2:FECHA_FIN)
                       JOIN(CUR:PK_CURSO,CUR2:IDCURSO)
                         PROJECT(CUR:DESCRIPCION)
                         PROJECT(CUR:IDCURSO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CUR2:IDCURSO           LIKE(CUR2:IDCURSO)             !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:CANTIDAD_HORAS    LIKE(CUR2:CANTIDAD_HORAS)      !List box control field - type derived from field
CUR2:EXAMEN            LIKE(CUR2:EXAMEN)              !List box control field - type derived from field
CUR2:MONTO             LIKE(CUR2:MONTO)               !List box control field - type derived from field
CUR2:FECHA_INICIO      LIKE(CUR2:FECHA_INICIO)        !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Cargar Módulos '),AT(,,583,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Carga_modulos'),SYSTEM
                       LIST,AT(8,30,566,124),USE(?Browse:1),HVSCROLL,FORMAT('51L(2)|M~ID MODULO~C(0)@n-7@207L(' & |
  '2)|M~DES MODULO~@s50@44L(2)|M~IDCURSO~C(0)@n-3@200L(2)|M~DESC CURSO~C(0)@s50@64R(2)|' & |
  'M~NUMERO MODULO~C(0)@n-14@64R(2)|M~CANTIDAD HORAS~C(0)@n-14@28L(2)|M~EXAMEN~@s2@44D(' & |
  '18)|M~MONTO~C(0)@n10.2@80R(2)|M~FECHA INICIO~C(0)@d17@80R(2)|M~FECHA FIN~C(0)@d17@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CURSO_MODULOS')
                       BUTTON('Inscribir Módulos Faltantes'),AT(6,178,98,19),USE(?Button3)
                       SHEET,AT(4,4,578,172),USE(?CurrentTab)
                         TAB('MODULOS'),USE(?Tab:2)
                         END
                         TAB('CURSO'),USE(?Tab:3)
                           BUTTON('Select CURSO'),AT(8,158,118,14),USE(?SelectCURSO),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('DESCRIPCION'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(529,182,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
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
  GlobalErrors.SetProcedureName('Carga_modulos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CUR2:CANTIDAD_HORAS',CUR2:CANTIDAD_HORAS)          ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_INICIO',CUR2:FECHA_INICIO)              ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_MODULOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUR2:FK_CURSO_MODULOS_CURSO)          ! Add the sort order for CUR2:FK_CURSO_MODULOS_CURSO for sort order 1
  BRW1.AddRange(CUR2:IDCURSO,Relate:CURSO_MODULOS,Relate:CURSO) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,CUR2:CURSO_MODULOS_DESCRIPCION)       ! Add the sort order for CUR2:CURSO_MODULOS_DESCRIPCION for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CUR2:DESCRIPCION,,BRW1)        ! Initialize the browse locator using  using key: CUR2:CURSO_MODULOS_DESCRIPCION , CUR2:DESCRIPCION
  BRW1.AddSortOrder(,CUR2:IDX_MODULO_UNIQUE)               ! Add the sort order for CUR2:IDX_MODULO_UNIQUE for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CUR2:IDCURSO,,BRW1)            ! Initialize the browse locator using  using key: CUR2:IDX_MODULO_UNIQUE , CUR2:IDCURSO
  BRW1.AddSortOrder(,CUR2:IDX_MODULO_NUMERO)               ! Add the sort order for CUR2:IDX_MODULO_NUMERO for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,CUR2:NUMERO_MODULO,,BRW1)      ! Initialize the browse locator using  using key: CUR2:IDX_MODULO_NUMERO , CUR2:NUMERO_MODULO
  BRW1.AddSortOrder(,CUR2:IDX_CONTROL)                     ! Add the sort order for CUR2:IDX_CONTROL for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,CUR2:ID_MODULO,,BRW1)          ! Initialize the browse locator using  using key: CUR2:IDX_CONTROL , CUR2:ID_MODULO
  BRW1.AddSortOrder(,CUR2:PK_CURSO_MODULOS)                ! Add the sort order for CUR2:PK_CURSO_MODULOS for sort order 6
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort0:Locator.Init(,CUR2:ID_MODULO,,BRW1)          ! Initialize the browse locator using  using key: CUR2:PK_CURSO_MODULOS , CUR2:ID_MODULO
  BRW1.AddField(CUR2:ID_MODULO,BRW1.Q.CUR2:ID_MODULO)      ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:DESCRIPCION,BRW1.Q.CUR2:DESCRIPCION)  ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:IDCURSO,BRW1.Q.CUR2:IDCURSO)          ! Field CUR2:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:NUMERO_MODULO,BRW1.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:CANTIDAD_HORAS,BRW1.Q.CUR2:CANTIDAD_HORAS) ! Field CUR2:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:EXAMEN,BRW1.Q.CUR2:EXAMEN)            ! Field CUR2:EXAMEN is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:MONTO,BRW1.Q.CUR2:MONTO)              ! Field CUR2:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_INICIO,BRW1.Q.CUR2:FECHA_INICIO) ! Field CUR2:FECHA_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_FIN,BRW1.Q.CUR2:FECHA_FIN)      ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Carga_modulos',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Carga_modulos',QuickWindow)             ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Button3
      GLO:IDCURSO     = CUR2:IDCURSO
      GLO:ID_MODULO   = CUR2:ID_MODULO
      
      CURI:IDCURSO = GLO:IDCURSO
      set(CURI:FK_CURSO_INSCRIPCION_CURSO,CURI:FK_CURSO_INSCRIPCION_CURSO)
      loop
          IF ACCESS:CURSO_INSCRIPCION.NEXT() THEN BREAK.
          IF CURI:IDCURSO <> GLO:IDCURSO THEN BREAK.
          GLO:IDINSCRIPCION = CURI:IDINSCRIPCION
      
          CURD:IDINSCRIPCION      = GLO:IDINSCRIPCION
          CURD:IDCURSO            = GLO:IDCURSO
          CURD:ID_MODULO          = GLO:ID_MODULO 
          CURD:FECHA_INSCRIPCION  = CURI:FECHA
          ADD(CURSO_INSCRIPCION_DETALLE)
      
          
      END
      MESSAGE('PROCESO TERMINADO')
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SelectCURSO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectCURSO()
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
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSE
    RETURN SELF.SetSort(6,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TIPO_CURSO Record
!!! </summary>
SelectTIPO_CURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_CURSO)
                       PROJECT(TIP2:ID_TIPO_CURSO)
                       PROJECT(TIP2:DESCRIPCION)
                       PROJECT(TIP2:GRADO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP2:ID_TIPO_CURSO     LIKE(TIP2:ID_TIPO_CURSO)       !List box control field - type derived from field
TIP2:DESCRIPCION       LIKE(TIP2:DESCRIPCION)         !List box control field - type derived from field
TIP2:GRADO             LIKE(TIP2:GRADO)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TIPO_CURSO Record'),AT(,,176,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_CURSO'),SYSTEM
                       LIST,AT(8,30,160,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~ID TIPO CURSO~C(0)@n-14@' & |
  '80L(2)|M~DESCRIPCION~L(2)@s50@24L(2)|M~GRADO~L(2)@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de TIPO_CURSO')
                       BUTTON('&Elegir'),AT(119,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,168,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(123,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectTIPO_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP2:ID_TIPO_CURSO',TIP2:ID_TIPO_CURSO)            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_CURSO,SELF) ! Initialize the browse manager
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
  BRW1.AddSortOrder(,TIP2:IDX_DESCRIPCION)                 ! Add the sort order for TIP2:IDX_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP2:DESCRIPCION,,BRW1)        ! Initialize the browse locator using  using key: TIP2:IDX_DESCRIPCION , TIP2:DESCRIPCION
  BRW1.AddSortOrder(,TIP2:PK_T_CURSO)                      ! Add the sort order for TIP2:PK_T_CURSO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP2:ID_TIPO_CURSO,,BRW1)      ! Initialize the browse locator using  using key: TIP2:PK_T_CURSO , TIP2:ID_TIPO_CURSO
  BRW1.AddField(TIP2:ID_TIPO_CURSO,BRW1.Q.TIP2:ID_TIPO_CURSO) ! Field TIP2:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:DESCRIPCION,BRW1.Q.TIP2:DESCRIPCION)  ! Field TIP2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:GRADO,BRW1.Q.TIP2:GRADO)              ! Field TIP2:GRADO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_CURSO',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_CURSO',QuickWindow)          ! Save window data to non-volatile store
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
!!! Actualizacion CURSO
!!! </summary>
UpdateCURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CUR:Record  LIKE(CUR:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CURSO'),AT(,,361,147),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateCURSO'),SYSTEM
                       ENTRY(@s50),AT(69,4,204,10),USE(CUR:DESCRIPCION),UPR
                       ENTRY(@n-10),AT(69,18,40,10),USE(CUR:CANTIDAD_HORAS)
                       ENTRY(@n-10.2),AT(69,33,40,10),USE(CUR:MONTO_TOTAL)
                       ENTRY(@s100),AT(69,47,278,10),USE(CUR:OBSERVACION)
                       ENTRY(@n-14),AT(69,61,43,10),USE(CUR:ID_TIPO_CURSO)
                       OPTION('PRESENCIAL'),AT(2,76,71,23),USE(CUR:PRESENCIAL),BOXED
                         RADIO('SI'),AT(12,86),USE(?CUR:PRESENCIAL:Radio1)
                         RADIO('NO'),AT(40,86),USE(?CUR:PRESENCIAL:Radio2)
                       END
                       ENTRY(@d17),AT(69,105,40,10),USE(CUR:FECHA_INICIO),REQ
                       ENTRY(@d17),AT(177,105,40,10),USE(CUR:FECHA_FIN),REQ
                       BUTTON('&Aceptar'),AT(236,129,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(289,129,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('FECHA INICIO:'),AT(2,105),USE(?CUR:FECHA_INICIO:Prompt)
                       BUTTON,AT(113,104,12,12),USE(?Calendar),LEFT,ICON('CALENDAR.ICO'),FLAT
                       PROMPT('FECHA FIN:'),AT(133,105),USE(?CUR:FECHA_FIN:Prompt)
                       BUTTON,AT(219,104,12,12),USE(?Calendar:2),LEFT,ICON('CALENDAR.ICO'),FLAT
                       PROMPT('DESCRIPCION:'),AT(2,4),USE(?CUR:DESCRIPCION:Prompt),TRN
                       LINE,AT(0,121,361,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('CANTIDAD HORAS:'),AT(2,18),USE(?CUR:CANTIDAD_HORAS:Prompt),TRN
                       PROMPT('MONTO TOTAL:'),AT(2,33),USE(?CUR:MONTO_TOTAL:Prompt),TRN
                       PROMPT('OBSERVACION:'),AT(2,47),USE(?CUR:OBSERVACION:Prompt),TRN
                       PROMPT('ID TIPO CURSO:'),AT(2,61),USE(?CUR:ID_TIPO_CURSO:Prompt),TRN
                       BUTTON('...'),AT(114,60,12,12),USE(?CallLookup),SKIP
                       STRING(@s50),AT(128,62),USE(TIP2:DESCRIPCION)
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

Calendar8            CalendarClass
Calendar9            CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateCURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CUR:Record,History::CUR:Record)
  SELF.AddHistoryField(?CUR:DESCRIPCION,2)
  SELF.AddHistoryField(?CUR:CANTIDAD_HORAS,4)
  SELF.AddHistoryField(?CUR:MONTO_TOTAL,5)
  SELF.AddHistoryField(?CUR:OBSERVACION,6)
  SELF.AddHistoryField(?CUR:ID_TIPO_CURSO,7)
  SELF.AddHistoryField(?CUR:PRESENCIAL,3)
  SELF.AddHistoryField(?CUR:FECHA_INICIO,9)
  SELF.AddHistoryField(?CUR:FECHA_FIN,10)
  SELF.AddUpdateFile(Access:CURSO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CURSO
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
    ?CUR:DESCRIPCION{PROP:ReadOnly} = True
    ?CUR:CANTIDAD_HORAS{PROP:ReadOnly} = True
    ?CUR:MONTO_TOTAL{PROP:ReadOnly} = True
    ?CUR:OBSERVACION{PROP:ReadOnly} = True
    ?CUR:ID_TIPO_CURSO{PROP:ReadOnly} = True
    ?CUR:FECHA_INICIO{PROP:ReadOnly} = True
    ?CUR:FECHA_FIN{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?Calendar:2)
    DISABLE(?CallLookup)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCURSO',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCURSO',QuickWindow)               ! Save window data to non-volatile store
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
    SelectTIPO_CURSO
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
    OF ?CUR:ID_TIPO_CURSO
      TIP2:ID_TIPO_CURSO = CUR:ID_TIPO_CURSO
      IF Access:TIPO_CURSO.TryFetch(TIP2:PK_T_CURSO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CUR:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
        ELSE
          SELECT(?CUR:ID_TIPO_CURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO.TryValidateField(7)                  ! Attempt to validate CUR:ID_TIPO_CURSO in CURSO
        SELECT(?CUR:ID_TIPO_CURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CUR:ID_TIPO_CURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CUR:ID_TIPO_CURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Calendar
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',CUR:FECHA_INICIO)
      IF Calendar8.Response = RequestCompleted THEN
      CUR:FECHA_INICIO=Calendar8.SelectedDate
      DISPLAY(?CUR:FECHA_INICIO)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar9.SelectOnClose = True
      Calendar9.Ask('Select a Date',CUR:FECHA_FIN)
      IF Calendar9.Response = RequestCompleted THEN
      CUR:FECHA_FIN=Calendar9.SelectedDate
      DISPLAY(?CUR:FECHA_FIN)
      END
      ThisWindow.Reset(True)
    OF ?CallLookup
      ThisWindow.Update()
      TIP2:ID_TIPO_CURSO = CUR:ID_TIPO_CURSO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CUR:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
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
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CURSO_MODULOS
!!! </summary>
UpdateCURSO_MODULOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CUR2:Record LIKE(CUR2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion MODULOS'),AT(,,275,224),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateCURSO_MODULOS'),SYSTEM
                       ENTRY(@n-14),AT(67,3,64,10),USE(CUR2:IDCURSO),DISABLE
                       ENTRY(@s50),AT(67,18,204,10),USE(CUR2:DESCRIPCION),UPR
                       ENTRY(@n-14),AT(67,33,64,10),USE(CUR2:NUMERO_MODULO)
                       ENTRY(@n-14),AT(67,46,64,10),USE(CUR2:CANTIDAD_HORAS)
                       ENTRY(@n10.2),AT(66,59,40,10),USE(CUR2:MONTO)
                       ENTRY(@d17),AT(66,74,65,10),USE(CUR2:FECHA_INICIO)
                       ENTRY(@t7),AT(200,76,41,10),USE(CUR2:HORA_INICIO)
                       ENTRY(@d17),AT(66,87,64,10),USE(CUR2:FECHA_FIN)
                       ENTRY(@t7),AT(198,90,43,10),USE(CUR2:HORA_FIN)
                       OPTION('EXAMEN'),AT(4,103,68,23),USE(CUR2:EXAMEN),BOXED
                         RADIO('SI'),AT(6,111),USE(?CUR2:EXAMEN:Radio1)
                         RADIO('NO'),AT(38,111),USE(?CUR2:EXAMEN:Radio2)
                       END
                       TEXT,AT(59,132,213,60),USE(CUR2:OBSERVACION),BOXED
                       BUTTON('&Aceptar'),AT(173,205,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(225,205,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDCURSO:'),AT(3,3),USE(?CUR2:IDCURSO:Prompt),TRN
                       STRING(@s50),AT(135,2),USE(CUR:DESCRIPCION)
                       PROMPT('DESCRIPCION:'),AT(3,18),USE(?CUR2:DESCRIPCION:Prompt),TRN
                       PROMPT('Nº  MODULO:'),AT(3,33),USE(?CUR2:NUMERO_MODULO:Prompt),TRN
                       PROMPT('CANT HORAS:'),AT(3,46),USE(?CUR2:CANTIDAD_HORAS:Prompt),TRN
                       PROMPT('MONTO:'),AT(2,59),USE(?CUR2:MONTO:Prompt),TRN
                       PROMPT('FECHA INICIO:'),AT(2,74),USE(?CUR2:FECHA_INICIO:Prompt),TRN
                       BUTTON('...'),AT(133,73,13,12),USE(?Calendar),LEFT,ICON('CALENDAR.ICO'),SKIP
                       PROMPT('FECHA FIN:'),AT(2,87),USE(?CUR2:FECHA_FIN:Prompt),TRN
                       BUTTON('...'),AT(134,86,12,12),USE(?Calendar:2),LEFT,ICON('calendar.ico'),SKIP
                       PROMPT('HORA INICIO:'),AT(151,76),USE(?CUR2:HORA_INICIO:Prompt),TRN
                       PROMPT('HORA FIN:'),AT(152,88),USE(?CUR2:HORA_FIN:Prompt),TRN
                       LINE,AT(0,201,275,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('OBSERVACION:'),AT(0,132),USE(?CUR2:OBSERVACION:Prompt)
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

Calendar7            CalendarClass
Calendar8            CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateCURSO_MODULOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR2:IDCURSO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CUR2:Record,History::CUR2:Record)
  SELF.AddHistoryField(?CUR2:IDCURSO,2)
  SELF.AddHistoryField(?CUR2:DESCRIPCION,3)
  SELF.AddHistoryField(?CUR2:NUMERO_MODULO,4)
  SELF.AddHistoryField(?CUR2:CANTIDAD_HORAS,5)
  SELF.AddHistoryField(?CUR2:MONTO,7)
  SELF.AddHistoryField(?CUR2:FECHA_INICIO,8)
  SELF.AddHistoryField(?CUR2:HORA_INICIO,10)
  SELF.AddHistoryField(?CUR2:FECHA_FIN,9)
  SELF.AddHistoryField(?CUR2:HORA_FIN,11)
  SELF.AddHistoryField(?CUR2:EXAMEN,6)
  SELF.AddHistoryField(?CUR2:OBSERVACION,12)
  SELF.AddUpdateFile(Access:CURSO_MODULOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CURSO_MODULOS
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
    ?CUR2:IDCURSO{PROP:ReadOnly} = True
    ?CUR2:DESCRIPCION{PROP:ReadOnly} = True
    ?CUR2:NUMERO_MODULO{PROP:ReadOnly} = True
    ?CUR2:CANTIDAD_HORAS{PROP:ReadOnly} = True
    ?CUR2:MONTO{PROP:ReadOnly} = True
    ?CUR2:FECHA_INICIO{PROP:ReadOnly} = True
    ?CUR2:HORA_INICIO{PROP:ReadOnly} = True
    ?CUR2:FECHA_FIN{PROP:ReadOnly} = True
    ?CUR2:HORA_FIN{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?Calendar:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCURSO_MODULOS',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCURSO_MODULOS',QuickWindow)       ! Save window data to non-volatile store
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
    SelectCURSO
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
      IF SELF.REQUEST = INSERTRECORD THEN
          CUR:IDCURSO = CUR2:IDCURSO
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          CUR:CANTIDAD = CUR:CANTIDAD +1
          ACCESS:CURSO.UPDATE()
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CUR2:IDCURSO
      CUR:IDCURSO = CUR2:IDCURSO
      IF Access:CURSO.TryFetch(CUR:PK_CURSO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CUR2:IDCURSO = CUR:IDCURSO
        ELSE
          SELECT(?CUR2:IDCURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO_MODULOS.TryValidateField(2)          ! Attempt to validate CUR2:IDCURSO in CURSO_MODULOS
        SELECT(?CUR2:IDCURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CUR2:IDCURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CUR2:IDCURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Calendar
      ThisWindow.Update()
      Calendar7.SelectOnClose = True
      Calendar7.Ask('Select a Date',CUR2:FECHA_INICIO)
      IF Calendar7.Response = RequestCompleted THEN
      CUR2:FECHA_INICIO=Calendar7.SelectedDate
      DISPLAY(?CUR2:FECHA_INICIO)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',CUR2:FECHA_FIN)
      IF Calendar8.Response = RequestCompleted THEN
      CUR2:FECHA_FIN=Calendar8.SelectedDate
      DISPLAY(?CUR2:FECHA_FIN)
      END
      ThisWindow.Reset(True)
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
!!! Browse the CURSO_MODULOS file by CUR2:FK_CURSO_MODULOS_CURSO
!!! </summary>
BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CURSO_MODULOS)
                       PROJECT(CUR2:NUMERO_MODULO)
                       PROJECT(CUR2:DESCRIPCION)
                       PROJECT(CUR2:FECHA_INICIO)
                       PROJECT(CUR2:FECHA_FIN)
                       PROJECT(CUR2:CANTIDAD_HORAS)
                       PROJECT(CUR2:EXAMEN)
                       PROJECT(CUR2:MONTO)
                       PROJECT(CUR2:IDCURSO)
                       PROJECT(CUR2:ID_MODULO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CUR2:FECHA_INICIO      LIKE(CUR2:FECHA_INICIO)        !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CUR2:CANTIDAD_HORAS    LIKE(CUR2:CANTIDAD_HORAS)      !List box control field - type derived from field
CUR2:EXAMEN            LIKE(CUR2:EXAMEN)              !List box control field - type derived from field
CUR2:MONTO             LIKE(CUR2:MONTO)               !List box control field - type derived from field
CUR2:IDCURSO           LIKE(CUR2:IDCURSO)             !List box control field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Carga Modulo por Curso'),AT(,,423,283),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO'),SYSTEM
                       STRING(@s50),AT(1,2,423,17),USE(CUR:DESCRIPCION),FONT(,14,,FONT:bold),CENTER
                       LIST,AT(5,21,414,202),USE(?Browse:1),HVSCROLL,FORMAT('18L(2)|M~Nº~R@n-3@205L(2)|M~DESCR' & |
  'IPCION~@s50@80R(2)|M~FECHA INICIO~C(0)@d17@52L(2)|M~FECHA FIN~C(0)@d17@37L(2)|M~CANT' & |
  ' HS~C(0)@n-7@28L(2)|M~EXAMEN~@s2@36D(14)|M~MONTO~C(0)@n-7.2@64R(2)|M~IDCURSO~C(0)@n-' & |
  '14@40R(2)|M~MODULO~C(0)@n-7@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de CURSO_MODULOS')
                       BUTTON('&Ver'),AT(207,234,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(261,234,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(313,234,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(367,234,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('&Salir'),AT(374,265,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_INICIO',CUR2:FECHA_INICIO)              ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:CANTIDAD_HORAS',CUR2:CANTIDAD_HORAS)          ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_MODULOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUR2:FK_CURSO_MODULOS_CURSO)          ! Add the sort order for CUR2:FK_CURSO_MODULOS_CURSO for sort order 1
  BRW1.AddRange(CUR2:IDCURSO,Relate:CURSO_MODULOS,Relate:CURSO) ! Add file relationship range limit for sort order 1
  BRW1.AddField(CUR2:NUMERO_MODULO,BRW1.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:DESCRIPCION,BRW1.Q.CUR2:DESCRIPCION)  ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_INICIO,BRW1.Q.CUR2:FECHA_INICIO) ! Field CUR2:FECHA_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_FIN,BRW1.Q.CUR2:FECHA_FIN)      ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:CANTIDAD_HORAS,BRW1.Q.CUR2:CANTIDAD_HORAS) ! Field CUR2:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:EXAMEN,BRW1.Q.CUR2:EXAMEN)            ! Field CUR2:EXAMEN is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:MONTO,BRW1.Q.CUR2:MONTO)              ! Field CUR2:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:IDCURSO,BRW1.Q.CUR2:IDCURSO)          ! Field CUR2:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:ID_MODULO,BRW1.Q.CUR2:ID_MODULO)      ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCURSO_MODULOS
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO',QuickWindow) ! Save window data to non-volatile store
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
    UpdateCURSO_MODULOS
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
!!! Ver Pagos
!!! </summary>
Ver_Pagos PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:MonthYear        STRING(30)                            ! 
LOC:Month            BYTE                                  ! 
LOC:Year             SHORT                                 ! 
LOC:Date             LONG                                  ! 
LOC:Button           SHORT                                 ! 
LOC:Day              SHORT                                 ! 
LOC:FirstDay         SHORT                                 ! 
BRW1::View:Browse    VIEW(PAGOS)
                       PROJECT(PAG:IDPAGOS)
                       PROJECT(PAG:IDSOCIO)
                       PROJECT(PAG:IDFACTURA)
                       PROJECT(PAG:SUCURSAL)
                       PROJECT(PAG:IDRECIBO)
                       PROJECT(PAG:MONTO)
                       PROJECT(PAG:FECHA)
                       PROJECT(PAG:HORA)
                       PROJECT(PAG:MES)
                       PROJECT(PAG:ANO)
                       JOIN(FAC:PK_FACTURA,PAG:IDFACTURA)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:MES)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:ESTADO)
                       END
                       JOIN(SOC:PK_SOCIOS,PAG:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAG:IDPAGOS            LIKE(PAG:IDPAGOS)              !List box control field - type derived from field
PAG:IDSOCIO            LIKE(PAG:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAG:IDFACTURA          LIKE(PAG:IDFACTURA)            !List box control field - type derived from field
PAG:SUCURSAL           LIKE(PAG:SUCURSAL)             !List box control field - type derived from field
PAG:IDRECIBO           LIKE(PAG:IDRECIBO)             !List box control field - type derived from field
PAG:MONTO              LIKE(PAG:MONTO)                !List box control field - type derived from field
PAG:FECHA              LIKE(PAG:FECHA)                !List box control field - type derived from field
PAG:HORA               LIKE(PAG:HORA)                 !List box control field - type derived from field
PAG:MES                LIKE(PAG:MES)                  !List box control field - type derived from field
PAG:ANO                LIKE(PAG:ANO)                  !List box control field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the PAGOS File'),AT(,,508,244),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Ver_Pagos'),SYSTEM
                       LIST,AT(8,47,491,146),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDPAGOS~C(0)@n-14@[34L(2' & |
  ')|M~IDSOCIO~L(0)@n-7@45L(2)|M~MATRICULA~L(0)@n-7@120L(2)|M~NOMBRE~L(0)@s30@]|M~COLEG' & |
  'IADO~64R(2)|M~IDFACTURA~C(0)@n-14@[20L(2)|M~SUC.~@n-4@56L(2)|M~IDRECIBO~C(0)@n-7@](5' & |
  '9)|M~RECIBO~48D(20)|M~MONTO~C(0)@n$-10.2@55L(2)|M~FECHA~C(0)@d17@37L(2)|M~HORA~C(0)@' & |
  't7@16L(2)|M~MES~@s2@20L(2)|M~ANO~@s4@[45L(2)|M~IDFACTURA~@n-7@36L(2)|M~MES FAC~@n-3@' & |
  '37L(2)|M~ANO FAC~@n-5@84L(2)|M~ESTADO FAC~@s21@]|M~DATOS DE LA FACTURA~'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de PAGOS')
                       BUTTON('&Filtro'),AT(9,201,55,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,501,217),USE(?CurrentTab)
                         TAB('PAGOS'),USE(?Tab:2)
                           PROMPT('IDPAGOS:'),AT(74,26),USE(?PAG:IDPAGOS:Prompt)
                           ENTRY(@n-14),AT(124,25,60,10),USE(PAG:IDPAGOS),REQ
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           PROMPT('IDSOCIO:'),AT(74,25),USE(?PAG:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(114,25,60,10),USE(PAG:IDSOCIO)
                           BUTTON('...'),AT(175,25,12,12),USE(?CallLookup)
                         END
                         TAB('FECHA'),USE(?Tab:6)
                           PROMPT('FECHA:'),AT(75,25),USE(?PAG:FECHA:Prompt)
                           ENTRY(@d17),AT(109,24,60,10),USE(PAG:FECHA)
                         END
                       END
                       BUTTON('Ordenar Por...'),AT(9,24,59,18),USE(?SortOrderButton),LEFT,MSG('Select the sort Order'), |
  TIP('Select the sort Order')
                       BUTTON('&Salir'),AT(458,225,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('E&xportar'),AT(59,227,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Imprimir'),AT(7,227,51,14),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&Ver'),AT(433,198,58,18),USE(?View),LEFT,ICON('v.ico'),FLAT
                     END

Loc::QHlist2 QUEUE,PRE(QHL2)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar2 QUEUE,PRE(Q2)
FieldPar                 CSTRING(800)
                         END
QPar22 QUEUE,PRE(Qp22)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado2          STRING(100)
Loc::Titulo2          STRING(100)
SavPath2          STRING(2000)
Evo::Group2  GROUP,PRE()
Evo::Procedure2          STRING(100)
Evo::App2          STRING(100)
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
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_2  SHORT
Gol_woI_2 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_2),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_2),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_2),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_2),TRN
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
PrintExBrowse2 ROUTINE

 OPEN(Gol_woI_2)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_2 = BRW1.FileLoaded
 IF Not  EC::LoadI_2
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_2)
 SETCURSOR()
  Evo::App2          = 'Gestion'
  Evo::Procedure2          = GlobalErrors.GetProcedureName()& 2
 
  FREE(QPar2)
  Q2:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,'
  ADD(QPar2)  !!1
  Q2:FieldPar  = ';'
  ADD(QPar2)  !!2
  Q2:FieldPar  = 'Spanish'
  ADD(QPar2)  !!3
  Q2:FieldPar  = ''
  ADD(QPar2)  !!4
  Q2:FieldPar  = true
  ADD(QPar2)  !!5
  Q2:FieldPar  = ''
  ADD(QPar2)  !!6
  Q2:FieldPar  = true
  ADD(QPar2)  !!7
 !!!! Exportaciones
  Q2:FieldPar  = 'HTML|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'EXCEL|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'WORD|'
  Q2:FieldPar  = CLIP( Q2:FieldPar)&'ASCII|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'XML|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'PRT|'
  ADD(QPar2)  !!8
  Q2:FieldPar  = 'All'
  ADD(QPar2)   !.9.
  Q2:FieldPar  = ' 0'
  ADD(QPar2)   !.10
  Q2:FieldPar  = 0
  ADD(QPar2)   !.11
  Q2:FieldPar  = '1'
  ADD(QPar2)   !.12
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.13
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.14
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.15
 
   Q2:FieldPar  = '16'
  ADD(QPar2)   !.16
 
   Q2:FieldPar  = 1
  ADD(QPar2)   !.17
   Q2:FieldPar  = 2
  ADD(QPar2)   !.18
   Q2:FieldPar  = '2'
  ADD(QPar2)   !.19
   Q2:FieldPar  = 12
  ADD(QPar2)   !.20
 
   Q2:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar2)   !.21
 
   Q2:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar2)   !.22
 
   CLEAR(Q2:FieldPar)
  ADD(QPar2)   ! 23 Caracteres Encoding para xml
 
  Q2:FieldPar  = '0'
  ADD(QPar2)   ! 24 Use Open Office
 
   Q2:FieldPar  = 'golmedo'
  ADD(QPar2) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q2:FieldPar  = ' BrowseExport'
  ADD(QPar2)   ! 26  BrowseExport
  Q2:FieldPar  = ' '
  ADD(QPar2)   ! 27  
  Q2:FieldPar  = ' ' 
  ADD(QPar2)   ! 28  
  Q2:FieldPar  = 'BEXPORT' 
  ADD(QPar2)   ! 29 Gestion024.clw
 !!!!!
 
 
  FREE(QPar22)
       Qp22:F2N  = 'IDPAGOS'
  Qp22:F2P  = '@n-14'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDSOCIO'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MATRICULA'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'NOMBRE'
  Qp22:F2P  = '@s30'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDFACTURA'
  Qp22:F2P  = '@n-14'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = '-'
  Qp22:F2P  = '@n-4'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDRECIBO'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MONTO'
  Qp22:F2P  = '@n$-10.2'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'FECHA'
  Qp22:F2P  = '@d17'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'HORA'
  Qp22:F2P  = '@t7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MES'
  Qp22:F2P  = '@s2'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'ANO'
  Qp22:F2P  = '@s4'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDFACTURA'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MES'
  Qp22:F2P  = '@n-3'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'ANO'
  Qp22:F2P  = '@n-5'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'ESTADO'
  Qp22:F2P  = '@s21'
  Qp22:F2T  = '0'
  ADD(QPar22)
  SysRec# = false
  FREE(Loc::QHlist2)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar22,SysRec#)
         QHL2:Id      = SysRec#
         QHL2:Nombre  = Qp22:F2N
         QHL2:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL2:Pict    = Qp22:F2P
         QHL2:Tot    = Qp22:F2T
         ADD(Loc::QHlist2)
      Else
        break
     END
  END
  Loc::Titulo2 ='Pagos'
 
 SavPath2 = PATH()
  Exportar(Loc::QHlist2,BRW1.Q,QPar2,0,Loc::Titulo2,Evo::Group2)
 IF Not EC::LoadI_2 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath2)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Ver_Pagos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAG:IDPAGOS',PAG:IDPAGOS)                          ! Added by: BrowseBox(ABC)
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
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'Ver_Pagos', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAG:FK_PAGOS_SOCIOS)                  ! Add the sort order for PAG:FK_PAGOS_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PAG:IDSOCIO,PAG:IDSOCIO,,BRW1) ! Initialize the browse locator using ?PAG:IDSOCIO using key: PAG:FK_PAGOS_SOCIOS , PAG:IDSOCIO
  BRW1.AddSortOrder(,PAG:IDX_FECHA)                        ! Add the sort order for PAG:IDX_FECHA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?PAG:FECHA,PAG:FECHA,,BRW1)     ! Initialize the browse locator using ?PAG:FECHA using key: PAG:IDX_FECHA , PAG:FECHA
  BRW1.AddSortOrder(,PAG:PK_PAGOS)                         ! Add the sort order for PAG:PK_PAGOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?PAG:IDPAGOS,PAG:IDPAGOS,,BRW1) ! Initialize the browse locator using ?PAG:IDPAGOS using key: PAG:PK_PAGOS , PAG:IDPAGOS
  BRW1.AddField(PAG:IDPAGOS,BRW1.Q.PAG:IDPAGOS)            ! Field PAG:IDPAGOS is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDSOCIO,BRW1.Q.PAG:IDSOCIO)            ! Field PAG:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDFACTURA,BRW1.Q.PAG:IDFACTURA)        ! Field PAG:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:SUCURSAL,BRW1.Q.PAG:SUCURSAL)          ! Field PAG:SUCURSAL is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDRECIBO,BRW1.Q.PAG:IDRECIBO)          ! Field PAG:IDRECIBO is a hot field or requires assignment from browse
  BRW1.AddField(PAG:MONTO,BRW1.Q.PAG:MONTO)                ! Field PAG:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(PAG:FECHA,BRW1.Q.PAG:FECHA)                ! Field PAG:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:HORA,BRW1.Q.PAG:HORA)                  ! Field PAG:HORA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:MES,BRW1.Q.PAG:MES)                    ! Field PAG:MES is a hot field or requires assignment from browse
  BRW1.AddField(PAG:ANO,BRW1.Q.PAG:ANO)                    ! Field PAG:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Ver_Pagos',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
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
    Relate:PAGOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Ver_Pagos',QuickWindow)                 ! Save window data to non-volatile store
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
    SelectSOCIOS
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
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAG:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SortOrderButton
      ThisWindow.Update()
      EXECUTE POPUP(|
                    CHOOSE(?CurrentTab{PROP:SELECTED}=1,'+','-')&?Tab:2{PROP:TEXT}&|
                    '|'&CHOOSE(?CurrentTab{PROP:SELECTED}=2,'+','-')&?Tab:4{PROP:TEXT}&|
                    '|'&CHOOSE(?CurrentTab{PROP:SELECTED}=3,'+','-')&?Tab:6{PROP:TEXT}&|
                    '')
       SELECT(?Tab:2)
       SELECT(?Tab:4)
       SELECT(?Tab:6)
      END
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse2
    OF ?Button6
      ThisWindow.Update()
      VER_PAGOS3(BRW1.VIEW{PROP:FILTER},BRW1.VIEW{PROP:ORDER})
      ThisWindow.Reset
    OF ?View
      ThisWindow.Update()
      START(Ver_Pagos2, 25000)
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
  SELF.ViewControl = ?View                                 ! Setup the control used to initiate view only mode


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

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a USUARIO Record
!!! </summary>
SelectUSUARIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(USUARIO)
                       PROJECT(USU:IDUSUARIO)
                       PROJECT(USU:DESCRIPCION)
                       PROJECT(USU:CONTRASENA)
                       PROJECT(USU:NIVEL)
                       PROJECT(USU:BAJA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
USU:IDUSUARIO          LIKE(USU:IDUSUARIO)            !List box control field - type derived from field
USU:DESCRIPCION        LIKE(USU:DESCRIPCION)          !List box control field - type derived from field
USU:CONTRASENA         LIKE(USU:CONTRASENA)           !List box control field - type derived from field
USU:NIVEL              LIKE(USU:NIVEL)                !List box control field - type derived from field
USU:BAJA               LIKE(USU:BAJA)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a USUARIO Record'),AT(,,340,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectUSUARIO'),SYSTEM
                       LIST,AT(8,30,324,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDUSUARIO~C(0)@n-14@80L(' & |
  '2)|M~DESCRIPCION~L(2)@s20@44L(2)|M~CONTRASENA~L(2)@s10@64R(2)|M~NIVEL~C(0)@n-14@80R(' & |
  '2)|M~BAJA~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de USUARIO')
                       BUTTON('&Elegir'),AT(283,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,332,172),USE(?CurrentTab)
                         TAB('PK_USUARIO'),USE(?Tab:2)
                         END
                         TAB('USUARIO_IDX1'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(287,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('SelectUSUARIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('USU:IDUSUARIO',USU:IDUSUARIO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:USUARIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,USU:USUARIO_IDX1)                     ! Add the sort order for USU:USUARIO_IDX1 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,USU:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: USU:USUARIO_IDX1 , USU:DESCRIPCION
  BRW1.AddSortOrder(,USU:PK_USUARIO)                       ! Add the sort order for USU:PK_USUARIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,USU:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: USU:PK_USUARIO , USU:IDUSUARIO
  BRW1.AddField(USU:IDUSUARIO,BRW1.Q.USU:IDUSUARIO)        ! Field USU:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(USU:DESCRIPCION,BRW1.Q.USU:DESCRIPCION)    ! Field USU:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(USU:CONTRASENA,BRW1.Q.USU:CONTRASENA)      ! Field USU:CONTRASENA is a hot field or requires assignment from browse
  BRW1.AddField(USU:NIVEL,BRW1.Q.USU:NIVEL)                ! Field USU:NIVEL is a hot field or requires assignment from browse
  BRW1.AddField(USU:BAJA,BRW1.Q.USU:BAJA)                  ! Field USU:BAJA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectUSUARIO',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectUSUARIO',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
!!! Actualizacion PAGOS
!!! </summary>
Ver_Pagos2 PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::PAG:Record  LIKE(PAG:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PAGOS'),AT(,,173,182),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Ver_Pagos2'),SYSTEM
                       SHEET,AT(4,4,165,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('IDPAGOS:'),AT(8,20),USE(?PAG:IDPAGOS:Prompt),TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(PAG:IDPAGOS),REQ
                           PROMPT('IDSOCIO:'),AT(8,34),USE(?PAG:IDSOCIO:Prompt),TRN
                           ENTRY(@n-14),AT(61,34,64,10),USE(PAG:IDSOCIO)
                           PROMPT('SUCURSAL:'),AT(8,48),USE(?PAG:SUCURSAL:Prompt),TRN
                           ENTRY(@n-14),AT(61,48,64,10),USE(PAG:SUCURSAL)
                           PROMPT('IDFACTURA:'),AT(8,62),USE(?PAG:IDFACTURA:Prompt),TRN
                           ENTRY(@n-14),AT(61,62,64,10),USE(PAG:IDFACTURA)
                           PROMPT('MONTO:'),AT(8,76),USE(?PAG:MONTO:Prompt),TRN
                           ENTRY(@n-10.2),AT(61,76,48,10),USE(PAG:MONTO)
                           PROMPT('FECHA:'),AT(8,90),USE(?PAG:FECHA:Prompt),TRN
                           ENTRY(@d17),AT(61,90,104,10),USE(PAG:FECHA)
                           PROMPT('HORA:'),AT(8,104),USE(?PAG:HORA:Prompt),TRN
                           ENTRY(@t7),AT(61,104,104,10),USE(PAG:HORA)
                           PROMPT('MES:'),AT(8,118),USE(?PAG:MES:Prompt),TRN
                           ENTRY(@s2),AT(61,118,40,10),USE(PAG:MES)
                           PROMPT('ANO:'),AT(8,132),USE(?PAG:ANO:Prompt),TRN
                           ENTRY(@s4),AT(61,132,40,10),USE(PAG:ANO)
                           PROMPT('PERIODO:'),AT(8,146),USE(?PAG:PERIODO:Prompt),TRN
                           ENTRY(@n-14),AT(61,146,64,10),USE(PAG:PERIODO)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('IDUSUARIO:'),AT(8,20),USE(?PAG:IDUSUARIO:Prompt),TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(PAG:IDUSUARIO)
                           PROMPT('IDRECIBO:'),AT(8,34),USE(?PAG:IDRECIBO:Prompt),TRN
                           ENTRY(@n-14),AT(61,34,64,10),USE(PAG:IDRECIBO)
                         END
                       END
                       BUTTON('&Aceptar'),AT(67,164,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(120,164,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Ver_Pagos2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAG:IDPAGOS:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAG:Record,History::PAG:Record)
  SELF.AddHistoryField(?PAG:IDPAGOS,1)
  SELF.AddHistoryField(?PAG:IDSOCIO,2)
  SELF.AddHistoryField(?PAG:SUCURSAL,3)
  SELF.AddHistoryField(?PAG:IDFACTURA,4)
  SELF.AddHistoryField(?PAG:MONTO,5)
  SELF.AddHistoryField(?PAG:FECHA,6)
  SELF.AddHistoryField(?PAG:HORA,7)
  SELF.AddHistoryField(?PAG:MES,8)
  SELF.AddHistoryField(?PAG:ANO,9)
  SELF.AddHistoryField(?PAG:PERIODO,10)
  SELF.AddHistoryField(?PAG:IDUSUARIO,11)
  SELF.AddHistoryField(?PAG:IDRECIBO,12)
  SELF.AddUpdateFile(Access:PAGOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAG:IDPAGOS{PROP:ReadOnly} = True
    ?PAG:IDSOCIO{PROP:ReadOnly} = True
    ?PAG:SUCURSAL{PROP:ReadOnly} = True
    ?PAG:IDFACTURA{PROP:ReadOnly} = True
    ?PAG:MONTO{PROP:ReadOnly} = True
    ?PAG:FECHA{PROP:ReadOnly} = True
    ?PAG:HORA{PROP:ReadOnly} = True
    ?PAG:MES{PROP:ReadOnly} = True
    ?PAG:ANO{PROP:ReadOnly} = True
    ?PAG:PERIODO{PROP:ReadOnly} = True
    ?PAG:IDUSUARIO{PROP:ReadOnly} = True
    ?PAG:IDRECIBO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Ver_Pagos2',QuickWindow)                   ! Restore window settings from non-volatile store
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
    Relate:FACTURA.Close
    Relate:PAGOS.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Ver_Pagos2',QuickWindow)                ! Save window data to non-volatile store
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
      SelectFACTURA
      SelectUSUARIO
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
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?PAG:IDFACTURA
      FAC:IDFACTURA = PAG:IDFACTURA
      IF Access:FACTURA.TryFetch(FAC:PK_FACTURA)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG:IDFACTURA = FAC:IDFACTURA
        ELSE
          SELECT(?PAG:IDFACTURA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?PAG:IDUSUARIO
      USU:IDUSUARIO = PAG:IDUSUARIO
      IF Access:USUARIO.TryFetch(USU:PK_USUARIO)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          PAG:IDUSUARIO = USU:IDUSUARIO
        ELSE
          SELECT(?PAG:IDUSUARIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
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
!!! Select a FACTURA Record
!!! </summary>
SelectFACTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(FACTURA)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:IDUSUARIO)
                       PROJECT(FAC:MONTOCOBERTURA)
                       PROJECT(FAC:INTERES)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:PERIODO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:FECHA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
FAC:IDUSUARIO          LIKE(FAC:IDUSUARIO)            !List box control field - type derived from field
FAC:MONTOCOBERTURA     LIKE(FAC:MONTOCOBERTURA)       !List box control field - type derived from field
FAC:INTERES            LIKE(FAC:INTERES)              !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:PERIODO            LIKE(FAC:PERIODO)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !Browse key field - type derived from field
FAC:FECHA              LIKE(FAC:FECHA)                !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a FACTURA Record'),AT(,,358,208),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectFACTURA'),SYSTEM
                       LIST,AT(8,40,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDFACTURA~C(0)@n-14@64R(' & |
  '2)|M~IDSOCIO~C(0)@n-14@64R(2)|M~IDUSUARIO~C(0)@n-14@60D(12)|M~MONTOCOBERTURA~C(0)@n-' & |
  '10.2@48D(16)|M~INTERES~C(0)@n-10.2@48D(20)|M~TOTAL~C(0)@n-10.2@64R(2)|M~MES~C(0)@n-1' & |
  '4@64R(2)|M~ANO~C(0)@n-14@48L(2)|M~PERIODO~L(2)@s11@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de FACTURA')
                       BUTTON('&Elegir'),AT(301,168,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('PK_FACTURA'),USE(?Tab:2)
                         END
                         TAB('FK_FACTURA_SOCIO'),USE(?Tab:3)
                         END
                         TAB('FK_FACTURA_USUARIO'),USE(?Tab:4)
                         END
                         TAB('IDX_FACTURA_ANO'),USE(?Tab:5)
                         END
                         TAB('IDX_FACTURA_ESTADO'),USE(?Tab:6)
                         END
                         TAB('IDX_FACTURA_FECHA'),USE(?Tab:7)
                         END
                         TAB('IDX_FACTURA_MES'),USE(?Tab:8)
                         END
                         TAB('IDX_FACTURA_PERIODO'),USE(?Tab:9)
                         END
                         TAB('IDX_FACTURA_TOTAL'),USE(?Tab:10)
                         END
                       END
                       BUTTON('&Salir'),AT(305,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
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
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
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
  GlobalErrors.SetProcedureName('SelectFACTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FAC:FK_FACTURA_SOCIO)                 ! Add the sort order for FAC:FK_FACTURA_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,FAC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: FAC:FK_FACTURA_SOCIO , FAC:IDSOCIO
  BRW1.AddSortOrder(,FAC:FK_FACTURA_USUARIO)               ! Add the sort order for FAC:FK_FACTURA_USUARIO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,FAC:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: FAC:FK_FACTURA_USUARIO , FAC:IDUSUARIO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ANO)                  ! Add the sort order for FAC:IDX_FACTURA_ANO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,FAC:ANO,,BRW1)                 ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ANO , FAC:ANO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ESTADO)               ! Add the sort order for FAC:IDX_FACTURA_ESTADO for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,FAC:ESTADO,,BRW1)              ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ESTADO , FAC:ESTADO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_FECHA)                ! Add the sort order for FAC:IDX_FACTURA_FECHA for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,FAC:FECHA,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_FECHA , FAC:FECHA
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_MES)                  ! Add the sort order for FAC:IDX_FACTURA_MES for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,FAC:MES,,BRW1)                 ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_MES , FAC:MES
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_PERIODO)              ! Add the sort order for FAC:IDX_FACTURA_PERIODO for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,FAC:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_PERIODO , FAC:PERIODO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_TOTAL)                ! Add the sort order for FAC:IDX_FACTURA_TOTAL for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,FAC:TOTAL,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_TOTAL , FAC:TOTAL
  BRW1.AddSortOrder(,FAC:PK_FACTURA)                       ! Add the sort order for FAC:PK_FACTURA for sort order 9
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort0:Locator.Init(,FAC:IDFACTURA,,BRW1)           ! Initialize the browse locator using  using key: FAC:PK_FACTURA , FAC:IDFACTURA
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDSOCIO,BRW1.Q.FAC:IDSOCIO)            ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDUSUARIO,BRW1.Q.FAC:IDUSUARIO)        ! Field FAC:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MONTOCOBERTURA,BRW1.Q.FAC:MONTOCOBERTURA) ! Field FAC:MONTOCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:INTERES,BRW1.Q.FAC:INTERES)            ! Field FAC:INTERES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:PERIODO,BRW1.Q.FAC:PERIODO)            ! Field FAC:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:FECHA,BRW1.Q.FAC:FECHA)                ! Field FAC:FECHA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectFACTURA',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectFACTURA',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


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
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

