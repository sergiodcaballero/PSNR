

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PADRON023.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TIPO_TITULO Record
!!! </summary>
SelectTIPO_TITULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_TITULO)
                       PROJECT(TIP6:IDTIPOTITULO)
                       PROJECT(TIP6:DESCRIPCION)
                       PROJECT(TIP6:CORTO)
                       PROJECT(TIP6:IDNIVELFORMACION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP6:IDTIPOTITULO      LIKE(TIP6:IDTIPOTITULO)        !List box control field - type derived from field
TIP6:DESCRIPCION       LIKE(TIP6:DESCRIPCION)         !List box control field - type derived from field
TIP6:CORTO             LIKE(TIP6:CORTO)               !List box control field - type derived from field
TIP6:IDNIVELFORMACION  LIKE(TIP6:IDNIVELFORMACION)    !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TIPO_TITULO Record'),AT(,,264,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_TITULO'),SYSTEM
                       LIST,AT(8,30,248,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDTIPOTITULO~C(0)@n-14@8' & |
  '0L(2)|M~DESCRIPCION~L(2)@s50@44L(2)|M~CORTO~L(2)@s10@68R(2)|M~IDNIVELFORMACION~C(0)@n-14@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de TIPO_TITULO')
                       BUTTON('&Elegir'),AT(207,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,256,172),USE(?CurrentTab)
                         TAB('PK_TIPO_TITULO'),USE(?Tab:2)
                         END
                         TAB('FK_TIPO_TITULO_NIVEL_FORMACION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(211,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectTIPO_TITULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP6:IDTIPOTITULO',TIP6:IDTIPOTITULO)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_TITULO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP6:FK_TIPO_TITULO_NIVEL_FORMACION)  ! Add the sort order for TIP6:FK_TIPO_TITULO_NIVEL_FORMACION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP6:IDNIVELFORMACION,,BRW1)   ! Initialize the browse locator using  using key: TIP6:FK_TIPO_TITULO_NIVEL_FORMACION , TIP6:IDNIVELFORMACION
  BRW1.AddSortOrder(,TIP6:PK_TIPO_TITULO)                  ! Add the sort order for TIP6:PK_TIPO_TITULO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP6:IDTIPOTITULO,,BRW1)       ! Initialize the browse locator using  using key: TIP6:PK_TIPO_TITULO , TIP6:IDTIPOTITULO
  BRW1.AddField(TIP6:IDTIPOTITULO,BRW1.Q.TIP6:IDTIPOTITULO) ! Field TIP6:IDTIPOTITULO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:DESCRIPCION,BRW1.Q.TIP6:DESCRIPCION)  ! Field TIP6:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:CORTO,BRW1.Q.TIP6:CORTO)              ! Field TIP6:CORTO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:IDNIVELFORMACION,BRW1.Q.TIP6:IDNIVELFORMACION) ! Field TIP6:IDNIVELFORMACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_TITULO',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:TIPO_TITULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_TITULO',QuickWindow)         ! Save window data to non-volatile store
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

