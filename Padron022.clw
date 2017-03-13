

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PADRON022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a INSTITUCION Record
!!! </summary>
SelectINSTITUCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(INSTITUCION)
                       PROJECT(INS2:IDINSTITUCION)
                       PROJECT(INS2:IDTIPO_INSTITUCION)
                       PROJECT(INS2:IDLOCALIDAD)
                       PROJECT(INS2:NOMBRE)
                       PROJECT(INS2:DIRECCION)
                       PROJECT(INS2:TELEFONO)
                       PROJECT(INS2:E_MAIL)
                       PROJECT(INS2:NOMBRE_CORTO)
                       PROJECT(INS2:TIPO_ESTADO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !List box control field - type derived from field
INS2:IDTIPO_INSTITUCION LIKE(INS2:IDTIPO_INSTITUCION) !List box control field - type derived from field
INS2:IDLOCALIDAD       LIKE(INS2:IDLOCALIDAD)         !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
INS2:DIRECCION         LIKE(INS2:DIRECCION)           !List box control field - type derived from field
INS2:TELEFONO          LIKE(INS2:TELEFONO)            !List box control field - type derived from field
INS2:E_MAIL            LIKE(INS2:E_MAIL)              !List box control field - type derived from field
INS2:NOMBRE_CORTO      LIKE(INS2:NOMBRE_CORTO)        !List box control field - type derived from field
INS2:TIPO_ESTADO       LIKE(INS2:TIPO_ESTADO)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a INSTITUCION Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectINSTITUCION'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDINSTITUCION~C(0)@n-14@' & |
  '76R(2)|M~IDTIPO INSTITUCION~C(0)@n-14@64R(2)|M~IDLOCALIDAD~C(0)@n-14@80L(2)|M~NOMBRE' & |
  '~L(2)@s50@80L(2)|M~DIRECCION~L(2)@s50@80L(2)|M~TELEFONO~L(2)@s20@80L(2)|M~E MAIL~L(2' & |
  ')@s50@80L(2)|M~NOMBRE CORTO~L(2)@s30@80L(2)|M~TIPO ESTADO~L(2)@s20@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de INSTITUCION')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_INSTITUCION'),USE(?Tab:2)
                         END
                         TAB('IDX_INSTITUCION_NOMBRE'),USE(?Tab:3)
                         END
                         TAB('FK_INSTITUCION_LOCALIDAD'),USE(?Tab:4)
                         END
                         TAB('FK_INSTITUCION_TIPO'),USE(?Tab:5)
                         END
                         TAB('IDX_INSTITUCION_NOMBRECORTO'),USE(?Tab:6)
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
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('SelectINSTITUCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('INS2:IDTIPO_INSTITUCION',INS2:IDTIPO_INSTITUCION)  ! Added by: BrowseBox(ABC)
  BIND('INS2:E_MAIL',INS2:E_MAIL)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INSTITUCION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,INS2:IDX_INSTITUCION_NOMBRE)          ! Add the sort order for INS2:IDX_INSTITUCION_NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,INS2:NOMBRE,,BRW1)             ! Initialize the browse locator using  using key: INS2:IDX_INSTITUCION_NOMBRE , INS2:NOMBRE
  BRW1.AddSortOrder(,INS2:FK_INSTITUCION_LOCALIDAD)        ! Add the sort order for INS2:FK_INSTITUCION_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,INS2:IDLOCALIDAD,,BRW1)        ! Initialize the browse locator using  using key: INS2:FK_INSTITUCION_LOCALIDAD , INS2:IDLOCALIDAD
  BRW1.AddSortOrder(,INS2:FK_INSTITUCION_TIPO)             ! Add the sort order for INS2:FK_INSTITUCION_TIPO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,INS2:IDTIPO_INSTITUCION,,BRW1) ! Initialize the browse locator using  using key: INS2:FK_INSTITUCION_TIPO , INS2:IDTIPO_INSTITUCION
  BRW1.AddSortOrder(,INS2:IDX_INSTITUCION_NOMBRECORTO)     ! Add the sort order for INS2:IDX_INSTITUCION_NOMBRECORTO for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,INS2:NOMBRE_CORTO,1,BRW1)      ! Initialize the browse locator using  using key: INS2:IDX_INSTITUCION_NOMBRECORTO , INS2:NOMBRE_CORTO
  BRW1.AddSortOrder(,INS2:PK_INSTITUCION)                  ! Add the sort order for INS2:PK_INSTITUCION for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,INS2:IDINSTITUCION,,BRW1)      ! Initialize the browse locator using  using key: INS2:PK_INSTITUCION , INS2:IDINSTITUCION
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDTIPO_INSTITUCION,BRW1.Q.INS2:IDTIPO_INSTITUCION) ! Field INS2:IDTIPO_INSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDLOCALIDAD,BRW1.Q.INS2:IDLOCALIDAD)  ! Field INS2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(INS2:DIRECCION,BRW1.Q.INS2:DIRECCION)      ! Field INS2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:TELEFONO,BRW1.Q.INS2:TELEFONO)        ! Field INS2:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(INS2:E_MAIL,BRW1.Q.INS2:E_MAIL)            ! Field INS2:E_MAIL is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE_CORTO,BRW1.Q.INS2:NOMBRE_CORTO) ! Field INS2:NOMBRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(INS2:TIPO_ESTADO,BRW1.Q.INS2:TIPO_ESTADO)  ! Field INS2:TIPO_ESTADO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectINSTITUCION',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectINSTITUCION',QuickWindow)         ! Save window data to non-volatile store
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

