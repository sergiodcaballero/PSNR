

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION231.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION218.INC'),ONCE        !Req'd for module callout resolution
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

